(import zmq)
(import [zmq [Context REQ REP PUB SUB]])

(def context (Context))

; Socket to talk to server
(print "Connecting to hello world server…")
(def socket (context.socket REQ))
(socket.connect "tcp://localhost:5555")

; Do 10 requests, waiting each time for a response
(for [request (range 10)]
    (print (% "Sending request %s …" request))
    (socket.send (bytes "Hello"))

    ; Get the reply.
    (let [[message (socket.recv)]]
      (print (% "Received reply %s [ %s ]" request message))))
