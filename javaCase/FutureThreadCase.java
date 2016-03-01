
import java.util.*;
import java.util.concurrent.*;



class FutureTest {
    //缓存操作数据集
    private static final Map<Integer, List<Student>> sutdenMap = new ConcurrentHashMap<Integer, List<Student>>();
    //初始化操作数据
    static {
        List<Student> stuList = null;
        Student stu;
        for (int i = 0; i < 10; i++) {
            stuList = new ArrayList<Student>();
            int rnd = (int) (Math.random() * 20);
            for (int j = 0; j < rnd; j++) {
                stu = new Student(j, "zld_" + i + "." + j, i);
                stuList.add(stu);
            }
            sutdenMap.put(i, stuList);
        }
    }

    public static class Student {
        private int id;
        private String name;
        private int classID;

        public Student(int id, String name, int classID) {
            this.id = id;
            this.name = name;
            this.classID = classID;
        }

        public String toString() {
            return Student.class.getName() + "(id:" + this.id + ",name:"
                    + this.name + ")";
        }

    }

    /**
     * @filename: SearchTask
     * @description: 查询任务
     * @author lida
     * @date 2013-4-1 下午3:02:29
     */
    public static class SearchTask implements Callable<List<Student>> {

        public int classID;
        public long sleepTime;

        /**
         * <p>Title: </p>
         * <p>Description: </p>
         * @param classID  班级编号
         * @param sleepTime  模拟操作所用的时间数（毫秒）
         */
        SearchTask(int classID, long sleepTime) {
            this.classID = classID;
            this.sleepTime = sleepTime;
        }

        @Override
        public List<Student> call() throws Exception {
            //模拟操作所用的时间数（毫秒）
            System.out.println("in " + Thread.currentThread().getName() + " classID: " +classID + " students number: " + sutdenMap.get(classID).size());
            List<Student> nowNum = sutdenMap.get(classID);
            Thread.sleep(sleepTime);
            List<Student> stuList = sutdenMap.get(classID);
            return stuList;
        }

    }

    public static void main(String[] args) {
        FutureTest ft = new FutureTest();
        ExecutorService exec = Executors.newCachedThreadPool();
        List<SearchTask> searchTasks = new ArrayList<SearchTask>();
        SearchTask st;
        for (int i = 0; i < 10; i++) {
            st = new SearchTask(i, 201);//指定2001 毫米为最大执行时间
            searchTasks.add(st);
        }

        try {
            //要求认为在2000毫秒内返回结果，否则取消执行。
            List<Future<List<Student>>> futures = exec.invokeAll(searchTasks,
                    3000, TimeUnit.MILLISECONDS);//invokeAll 第一个参数是任务列表；第二个参数是过期时间；第三个是过期时间单位
            for (Future<List<Student>> future : futures) {
                List<Student> students = future.get();
//                for (Student student : students) {
//                    System.out.println(student.toString());
//                }
            }
            exec.shutdown();
        } catch (InterruptedException e) {
            e.printStackTrace();
            Thread.interrupted();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
    }
}


