
public class PingPong extends Thread {
    private String word;
    private int delay;

    public PingPong(String w, int d) {
        word = w;
        delay = d;
    }

    public void run(){
        try{
            for(int i=0;i<20;i++){
                System.out.println(word);
                Thread.sleep(delay);
            }
        } catch (InterruptedException e){return;};
    }
    public static void main(String[] args){
        Thread t1 = new PingPong ("Ping",30);
        t1.start();

        Thread t2 = new PingPong("Pong",30);
        t2.start();
    }
}


