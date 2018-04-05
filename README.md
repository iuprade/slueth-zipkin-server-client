# Zipkin server, client, Eureka server and sample service
This is Sample project illustrating the usage zipkin server to trace the spans across the calls. It has below four micro services (modules) 

## Eureka Server
running on port 8082

## Sample service
running on port 8081

sample endpoint http://localhost:8081/hi

## zipkin client calling Sample services endpoint
running on port 8080

## Zipkin Server
running on port 9400

Dashboard url - http://localhost:9400/
#### Please run above all services using below command
> mvn spring-boot:run

