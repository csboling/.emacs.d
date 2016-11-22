(defun react-prop-types ()
  "Convert a comma-separated list of props into PropTypes declarations."
  (mapconcat 'identity
             (split-string yas-text ",")
             ": PropTypes.object.isRequired,\n"))
