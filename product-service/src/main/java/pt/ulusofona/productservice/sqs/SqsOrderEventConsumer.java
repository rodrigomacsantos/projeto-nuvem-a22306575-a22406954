package pt.ulusofona.productservice.sqs;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.sqs.SqsClient;
import software.amazon.awssdk.services.sqs.model.DeleteMessageRequest;
import software.amazon.awssdk.services.sqs.model.Message;
import software.amazon.awssdk.services.sqs.model.ReceiveMessageRequest;

import java.util.List;

@Slf4j
@Service
public class SqsOrderEventConsumer {

    private final SqsClient sqsClient;

    @Value("${aws.sqs.order-created-queue-url}")
    private String orderCreatedQueueUrl;

    public SqsOrderEventConsumer(SqsClient sqsClient) {
        this.sqsClient = sqsClient;
    }

    @Scheduled(fixedDelay = 5000)
    public void consumeOrderCreatedEvents() {
        ReceiveMessageRequest request = ReceiveMessageRequest.builder()
                .queueUrl(orderCreatedQueueUrl)
                .maxNumberOfMessages(5)
                .waitTimeSeconds(2)
                .build();

        List<Message> messages = sqsClient.receiveMessage(request).messages();

        for (Message message : messages) {
            log.info("Received ORDER_CREATED event from SQS: {}", message.body());

            DeleteMessageRequest deleteRequest = DeleteMessageRequest.builder()
                    .queueUrl(orderCreatedQueueUrl)
                    .receiptHandle(message.receiptHandle())
                    .build();

            sqsClient.deleteMessage(deleteRequest);

            log.info("Deleted processed SQS message: {}", message.messageId());
        }
    }
}