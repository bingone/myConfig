
import com.alibaba.rocketmq.client.consumer.DefaultMQPushConsumer;
import com.alibaba.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import com.alibaba.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import com.alibaba.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import com.alibaba.rocketmq.client.producer.DefaultMQProducer;
import com.alibaba.rocketmq.client.producer.SendResult;
import com.alibaba.rocketmq.common.consumer.ConsumeFromWhere;
import com.alibaba.rocketmq.common.message.Message;
import com.alibaba.rocketmq.common.message.MessageExt;

import java.util.List;

/**
 * Created by bingone on 15/11/30.
 */
public class RocketMQ {
}

class Producer {
    public static void main(String[] args){
        DefaultMQProducer producer = new DefaultMQProducer("Producer");
        producer.setNamesrvAddr("127.0.0.1:9876");
        try {
            producer.start();

            Message msg = new Message("PushTopic",
                "push",
                "1",
                "Just for test.".getBytes());

            SendResult result = producer.send(msg);
            System.out.println("id:" + result.getMsgId() +
                " result:" + result.getSendStatus());

            msg = new Message("PushTopic",
                "push",
                "2",
                "Just for test.".getBytes());

            result = producer.send(msg);
            System.out.println("id:" + result.getMsgId() +
                " result:" + result.getSendStatus());

            msg = new Message("PullTopic",
                "pull",
                "1",
                "Just for test.".getBytes());

            result = producer.send(msg);
            System.out.println("id:" + result.getMsgId() +
                " result:" + result.getSendStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            producer.shutdown();
        }
    }
}
class Consumer {
    public static void main(String[] args){
        DefaultMQPushConsumer consumer =
            new DefaultMQPushConsumer("PushConsumer");
        consumer.setNamesrvAddr("127.0.0.1:9876");
        try {
            //订阅PushTopic下Tag为push的消息
            consumer.subscribe("sms-submit-market", null);
            //程序第一次启动从消息队列头取数据
            consumer.setConsumeFromWhere(
                ConsumeFromWhere.CONSUME_FROM_FIRST_OFFSET);
            consumer.registerMessageListener(
                new MessageListenerConcurrently() {
                    public ConsumeConcurrentlyStatus consumeMessage(
                        List<MessageExt> list,
                        ConsumeConcurrentlyContext Context) {
                        Message msg = list.get(0);
//                        System.out.println(msg.toString());
                        return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
                    }
                }
            );
            consumer.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
