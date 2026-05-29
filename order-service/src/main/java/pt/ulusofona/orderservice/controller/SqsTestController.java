package pt.ulusofona.orderservice.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import pt.ulusofona.orderservice.sqs.SqsOrderEventProducer;

@RestController
@RequestMapping("/sqs")
@RequiredArgsConstructor
public class SqsTestController {

    private final SqsOrderEventProducer sqsOrderEventProducer;

    @PostMapping("/test-order-created/{orderId}")
    public String publishTestOrderCreated(@PathVariable Long orderId) {
        sqsOrderEventProducer.sendOrderCreatedEvent(orderId);
        return "Sent ORDER_CREATED event to SQS for orderId=" + orderId;
    }
}