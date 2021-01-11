import java.util.Random;

//The implementations are explained in detail in the exam assignment
class GeminiExecutor{
	private final Entity first, second;
	private int runCounter = 0;
	private int step = 0;
	
	GeminiExecutor(int s){
		first = new Entity(s, this);
		second = new Entity(s, this);
	}
	
	public void activate() {
		first.start();
		second.start();
		
		try{
			first.join();
			second.join();
			System.out.println("Time 1: " + first.getTotTime() + "ms");
			System.out.println("Time 2: " + second.getTotTime() + "ms");
		}catch(InterruptedException e){}
	}
	
	public synchronized void incrRunCounter(){
		if (!first.isAlive() && !second.isAlive()) {
			runCounter++;
			step++;
			first.interrupt();
			second.interrupt();
		}
	}
	
	public int getStep(){
		return step;
	}	
}

class Entity extends Thread{
	private final int size;
	private final Task[] queue;
	private GeminiExecutor ge;
	private boolean started = false;
	private boolean finished = false;
	private int counter = 0;
	private int localStep = 0;
	private int totalTime = 0;
	
	Entity(int s, GeminiExecutor ge){
		size = s;
		queue = new Task[size];
		this.ge = ge;	
	}
	
	public void pushTask(Task t){
		if (counter == size) return;
		if (!started) {
			queue[counter] = t;
			counter++;
		} else {
			throw new IllegalStateException("The Entity is running");
		}
	}
	
	public void run(){
		try{
			for(int i = 0; i < size; i++){
				queue[i] = new Task(ge.getStep());
				queue[i].run();
				totalTime += queue[i].getTime();
				if (localStep != ge.getStep()) {
					queue[i].wait();
				}
				ge.incrRunCounter();				
			}
		}catch(InterruptedException e){return;}
	}
	
	public int getTotTime(){
		if (!finished) {
			synchronized(this){
            	finished = true;
        	}
		}
		return totalTime;
	}
}

class Task implements Runnable{
	private int n, time;
	private static final Random randomGenerator = new Random();
	
	Task(int n){
		this.n = n;
	}
	
	private static synchronized int getRandomNumber() {
        return Math.abs(randomGenerator.nextInt());
    }
	
	@Override
	public void run() {
		try {
			time = getRandomNumber() % 100;
			System.out.println(Thread.currentThread().getName() + " running task " + n);
			Thread.sleep(time);
		} catch (InterruptedException e) {
		}
	}
	
	public int getTime() {
		return time;
	}
}

// The code must compile with the provided main method
public class Exam_2{
	public static void main(String[] args){
		GeminiExecutor ge = new GeminiExecutor(4);
		ge.activate();
	}
}
