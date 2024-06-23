import pika
import ssl

ssl_opts = {
    "ca_certificate": "ca_certificate.pem", # Path to your certificate retrieved from RabbitMQ secrets
    "cert_reqs": ssl.CERT_REQUIRED,
    "ssl_version": ssl.PROTOCOL_TLSv1_2
}

rabbit_opts = {
    "host": "rabbitmq-dev",
    "port": 5671,
    "user": "admin",
    "password": "UBsP5abFQ19OcGPX6u6ngg7jSxlMI0",
    "vhost": "Dev" 
}

rabbit_queue_opts = {
    "queue": "Streaming",
    "message": "Hello SSL World over Streaming queue:)"
}

context = ssl.create_default_context(cafile=ssl_opts["ca_certificate"])
# context.load_cert_chain(ssl_opts["client_certificate"], ssl_opts["client_key"])
ssl_options = pika.SSLOptions(context, rabbit_opts["host"])
parameters = pika.ConnectionParameters(host=rabbit_opts["host"],
                                       port=rabbit_opts["port"],
                                       virtual_host=rabbit_opts["vhost"],
                                       credentials=pika.PlainCredentials(rabbit_opts["user"], rabbit_opts["password"]),
                                       ssl_options=ssl_options)