(require 'ert) ;; Always require ert to run the test.

;; In this example we are running compatibilty 
;; tests on CIE DE2000 from the color library.
(require 'color)

;; A helper to generate an sRGB triplet from a more recognizable RGB hex string.
(defun hex-to-srgb (hex)
  "Convert HEX to `(r g b)'.
`r', `g', `b' will be values `0.0..1.0'"
  (let ((rgb (string-to-number (substring hex 1) 16)))
    (list
     (/ (ash (logand #xFF0000 rgb) -16) 255.0)
     (/ (ash (logand #xFF00 rgb) -8) 255.0)
     (/ (logand #xFF rgb) 255.0))))

;; Wrap up CIE DE2000 with color conversion from hex colors.
(defun hex-cie-de2000 (hex-a hex-b) 
  (let ((lab-1 (apply 'color-srgb-to-lab (hex-to-srgb hex-a)))
        (lab-2 (apply 'color-srgb-to-lab (hex-to-srgb hex-b))))
     (color-cie-de2000 lab-1 lab-2)))

;; We always need at least one test for 
;; the github workflow to pass/fail.

(ert-deftest test-cie-de2000 ()
  "Test CIE-DE2000"
  (should (eql (hex-cie-de2000 "#000000" "#000000") 0.0))) 

;; We can exercise the test subject more than this,
;; but one test that expects the correct result is enough for an initial compatibility test.
