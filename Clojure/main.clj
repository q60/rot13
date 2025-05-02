#!/usr/bin/env boot
(require '[clojure.string :as string])

(defn rotate [[k v]]
  (cond (<= 65 v 77) (+ k 13)
        (<= 78 v 90) (- k 13)
        :else k))

(defn -main [& _]
  (println "Enter string to encode:")
  (let [to-encode (read-line)
        zipped (map #(vector (int %1) (int %2))
                    to-encode
                    (string/upper-case to-encode))]
    (printf "Encoded string:\n%s\n"
            (apply str (map char
                            (map rotate zipped))))))
