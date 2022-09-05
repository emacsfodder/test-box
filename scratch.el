
(require 'ert)

;;; Test helpers...
(defun hex-to-srgb (hex)
  "Convert HEX to `(r g b)'.
`r', `g', `b' will be values `0.0..1.0'"
  (let ((rgb (string-to-number (substring hex 1) 16)))
    (list
     (/ (ash (logand #xFF0000 rgb) -16) 255.0)
     (/ (ash (logand #xFF00 rgb) -8) 255.0)
     (/ (logand #xFF rgb) 255.0))))

(defun hex-cie-de2000 (hex-a hex-b) 
  (let ((lab-1 (apply 'color-srgb-to-lab (hex-to-srgb hex-a)))
        (lab-2 (apply 'color-srgb-to-lab (hex-to-srgb hex-b))))
     (color-cie-de2000 lab-1 lab-2)))
        
(ert-deftest test-cie-de2000 ()
  "Test CIE-DE2000"
  (should (eql (hex-cie-de2000 "#000000" "#000000") 0.0)))
