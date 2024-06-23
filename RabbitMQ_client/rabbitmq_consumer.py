# ----------- rabbitmq_consumer.py ------------------
import pika
from configuration import rabbit_queue_opts, parameters

try:
    with pika.BlockingConnection(parameters) as connection:
        channel = connection.channel()
        channel.queue_declare(queue=rabbit_queue_opts["queue"])

        def callback(ch, method, properties, body):
            print(" [x] Received %r" % body)

        channel.basic_consume(on_message_callback=callback,
                              queue=rabbit_queue_opts["queue"],
                              auto_ack=True)

        print(' [*] Waiting for messages. To exit press CTRL+C')
        channel.start_consuming()
except Exception as e:
    print(str(e), e.__class__.__name__)