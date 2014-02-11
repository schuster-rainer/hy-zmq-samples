#!/usr/bin/env hy
(import zmq random sys time)

(def port "5556")
(if (> (len sys.argv) 1)
    (setv port (get sys.argv 1)))
(def context (zmq.Context))
(def socket (context.socket zmq.PAIR))
(socket.bind (% "tcp://*:%s" port))

(while True
    (socket.send (bytes "Server message to client3"))
    (let [[msg  (socket.recv)]]
      (print msg)
      (time.sleep 1)))
