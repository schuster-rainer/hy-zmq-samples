#!/usr/bin/env hy
(import zmq random sys time)

(def port "5556")
(def context (zmq.Context))
(def socket (context.socket zmq.PAIR))
(socket.connect (% "tcp://localhost:%s" port))

(while True
  (setv msg (socket.recv))
  (print msg)
  (socket.send (bytes "client message to server1"))
  (socket.send (bytes "client message to server2"))
  (time.sleep 1))
