;shift char a specific amount and handle overflow/wraparound
(defun shiftChar(char shiftAmount)
    ;don't do anything for spaces
    (if (= (char-code char) 32) (code-char 32)
        (code-char (+ (mod (+ (- (char-code char) 65) shiftAmount) 26) 65)))
)

;encrypt a string
(defun encryptStr(str shiftAmount)
    ;map each character of a string to a shifted character using shiftChar function
	(map 'string #' (lambda (letter) (shiftChar letter shiftAmount)) (string-upcase str))
)

;decrypt a string
(defun decryptStr(str shiftAmount)
    ;call encryptstr and pass in a negative shiftamount
	(encryptStr str (* shiftAmount -1))
)

;solve for all cases maxShiftAmount -> 0 for a string using a loop
(defun solve(str maxShiftAmount)
    (setq i maxShiftAmount)
    (loop 
       (write i)
       (write ": ")
       (write (encryptStr str i))
       (terpri)
       (setq i (- i 1))
       (when (= i 0) (return i))
    )
)

;print results
(let* ((original "LISP is annoying")
       (shiftAmount 4)
       (encrypted (encryptStr original shiftAmount))
       (decrypted (decryptStr encrypted shiftAmount)))
  (format t " Original: ~a ~%" original)
  (format t "Encrypted: ~a ~%" encrypted)
  (format t "Decrypted: ~a ~%" decrypted))
(solve "LISP" 26)