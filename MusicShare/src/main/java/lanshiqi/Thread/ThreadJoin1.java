package lanshiqi.Thread;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2018-04-06-13:03
 * 现在有T1、T2、T3三个线程，你怎样保证T2在T1执行完后执行，T3在T2执行完后执行？
 */

public class ThreadJoin1 {

    public static void main(String [] args){
        final Thread thread=new Thread(new Runnable() {
            public void run() {
                for(int i=0;i<5;i++){

                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Thread1 running");
                }
            }
        });

        final Thread thread1=new Thread(new Runnable() {
            public void run() {
                for(int i=0;i<5;i++){

                    try {
                        Thread.sleep(1000);
                        thread.join();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Thread2 Running");
                }
            }
        });

        Thread thread2=new Thread(new Runnable() {
            public void run() {
                for(int i=0;i<5;i++){

                    try {
                        Thread.sleep(1000);
                        thread1.join();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Thread3 Running");
                }
            }
        });

        thread.start();
        thread1.start();
        thread2.start();
    }

}
