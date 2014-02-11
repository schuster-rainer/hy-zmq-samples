#!/usr/bin/env hy
(import zmq sys)


(def ports ["5556"])
(if (> (len sys.argv) 1)
  (setv ports (rest sys.argv)))

(def context (zmq.Context))
(def socket (context.socket zmq.SUB))

(for [port ports]
  (socket.connect (% "tcp://localhost:%s" port)))

;Subscribe to zipcode, default is NYC, 10001
(def topicfilter (bytes "10001"))
(socket.setsockopt zmq.SUBSCRIBE topicfilter)

(def total-value 0)
(for [update-nbr (range 5)]
  (let [[msg (.recv socket)]
        [(, topic messagedata) (.split msg)]]
    (setv total-value messagedata)
    (print topic messagedata)))

(print (% "Average messagedata value for topic '%s' was %dF" (, topicfilter (/ total-value update-nbr))))
