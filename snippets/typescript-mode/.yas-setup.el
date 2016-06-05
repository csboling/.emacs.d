(defun spinal-to-pascal-case ()
  "Convert spinal-case-text into PascalCaseText"
  (mapconcat 'capitalize
    (split-string yas-text "[[:blank:]]*-[[:blank:]]*" t)
    ""))

(ert-deftest test-spinal-to-pascal-case ()
  (should (equal
    ""
    (let ((yas-text "")) (spinal-to-pascal-case))))
  (should (equal
    "SomeTestText"
    (let ((yas-text "some-test-text")) (spinal-to-pascal-case)))))

(defun ng2-dependency-injection ()
  "Given a comma-separated list of Providers, generate a set of
constructor arguments for Angular 2 dependency injection."
  (mapconcat
    (lambda (provider)
      (if (> (length provider) 0)
        (concat
          "private "
          (let ((first-letter (substring provider 0 1))
                (rest-letters (substring provider 1)))
            (concat (downcase first-letter) rest-letters))
          ": "
          provider)
        ""))
    (mapcar 's-trim
      (split-string yas-text
        (concat "," split-string-default-separators)))
    ", "))

(ert-deftest test-ng2-dependency-injection ()
  (should (equal
    ""
    (let ((yas-text "")) (ng2-dependency-injection))))
  (should (equal
    "private http: Http"
    (let ((yas-text "Http")) (ng2-dependency-injection))))
  (should (equal
    "private http: Http"
    (let ((yas-text "Http,")) (ng2-dependency-injection))))
  (should (equal
    "private http: Http, private routeSegment: RouteSegment"
    (let ((yas-text "    Http,\n  RouteSegment")) (ng2-dependency-injection)))))
