package lanshiqi.Thread;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2018-04-06-13:15
 */

public class ThreadJoin2 {
    public static void main(String [] args) throws InterruptedException {
        ThreadJoinNei threadJoinNei=new ThreadJoinNei("A");
        ThreadJoinNei threadJoinNei1=new ThreadJoinNei("B");
        ThreadJoinNei threadJoinNei2=new ThreadJoinNei("C");

        threadJoinNei.start();
        threadJoinNei.join();
        threadJoinNei1.start();
        threadJoinNei1.join();
        threadJoinNei2.start();
        threadJoinNei2.join();
    }

}

class ThreadJoinNei extends Thread{

    private String name;

    public ThreadJoinNei(String name) {
        super(name);
        this.name=name;
    }

    @Override
    public void run() {
        super.run();
        for(int i=0;i<5;i++){
            System.out.println(Thread.currentThread().getName()+"running");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
