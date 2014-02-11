#!/usr/bin/env hy
(import zmq random sys time)

(def port "5556")
(if (> (len sys.argv) 1)
    (setv port (get sys.argv 1)))
(def context (zmq.Context))
(def socket (context.socket zmq.PUB))
(socket.bind (% "tcp://*:%s" port))

(while True
    (let [[topic (random.randrange 9999 10005)]
          [messagedata (- (random.randrange 1 215) 80)]
          [payload (% "%d %d" (, topic messagedata))]]
      (print payload)
      (socket.send (bytes payload))
      (time.sleep 1)))

