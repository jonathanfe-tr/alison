from .alison_logger import logger
from .listeners import TCPListener, UDPListener
from prometheus_client import start_http_server

class Alison:
    def __init__(self, addr='127.0.0.1', port=8888):
        self.addr = addr
        self.port = port
        logger.info('Starting ALISON...')

    def start_tcp(self):
        instance = TCPListener(self.addr, self.port)
        instance.start()

    def start_udp(self):
        instance = UDPListener(self.addr, self.port)
        instance.start()

