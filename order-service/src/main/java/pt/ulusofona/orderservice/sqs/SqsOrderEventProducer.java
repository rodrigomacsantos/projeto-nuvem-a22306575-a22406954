package pt.ulusofona.orderservice.sqs;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.sqs.SqsClient;
import software.amazon.awssdk.services.sqs.model.SendMessageRequest;

@Service
public class SqsOrderEventProducer {

    private final SqsClient sqsClient;

    @Value("${aws.sqs.order-created-queue-url}")
    private String orderCreatedQueueUrl;

    public SqsOrderEventProducer(SqsClient sqsClient) {
        this.sqsClient = sqsClient;
    }

    public void sendOrderCreatedEvent(Long orderId) {
        String messageBody = """
                {
                  "eventType": "ORDER_CREATED",
                  "orderId": "%s"
                }
                """.formatted(orderId);

        SendMessageRequest request = SendMessageRequest.builder()
                .queueUrl(orderCreatedQueueUrl)
                .messageBody(messageBody)
                .build();

        sqsClient.sendMessage(request);

        System.out.println("Sent ORDER_CREATED event to SQS for orderId=" + orderId);
    }
}