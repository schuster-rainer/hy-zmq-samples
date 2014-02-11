#!/usr/bin/env hy
(import zmq random sys time)


(def ports ["5556"])
(if (> (len sys.argv) 1)
  (setv ports (rest sys.argv)))

(def context (zmq.Context))
(def socket (context.socket zmq.REQ))

(for [port ports]
  (socket.connect (% "tcp://localhost:%s" port)))


(for [request (range 1 10)]
  (print "Sending request " request "...")
  (socket.send (bytes "Hello"))
    (let [[msg  (socket.recv)]]
      (print "Received reply " request "[" msg "]")))
