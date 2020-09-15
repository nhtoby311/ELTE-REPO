// Method 1
class C extends Thread{
    public void run(){
        //...
    }
}

C c = new C();
c.start();

//Method 2 :
class C implements Runnable {
    public void run(){
        //...
    }
}

C c = new C();
Thread t = new Thread(c);
t.start();