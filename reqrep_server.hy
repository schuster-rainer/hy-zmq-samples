#!/usr/bin/env hy
(import zmq random sys time)

(def port "5556")
(if (> (len sys.argv) 1)
    (setv port (get sys.argv 1)))
(def context (zmq.Context))
(def socket (context.socket zmq.REP))
(socket.bind (% "tcp://*:%s" port))


(while True
    (let [[msg  (socket.recv)]]
      (print "Received Message: " msg)
      (time.sleep 1)
      (socket.send (bytes (% "World from: %s" port)))))
