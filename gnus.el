;; Shamelessly stolen from http://www.mostlymaths.net/2010/12/emacs-30-day-challenge-using-gnus-to.html

(setq gnus-ignored-newsgroups "")
(setq gnus-select-method '(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)))
(setq mm-discouraged-alternatives '("text/html" 
                                    "text/richtext"))
(defvar smtp-accounts '(
                        (ssl "charles.samuel.boling@gmail.com" 
                             "smtp.gmail.com"
                             587
                             "charles.samuel.boling@gmail.com"
                             nil)
                        (ssl "bolingc1@egr.msu.edu"
                             "mail.egr.msu.edu"
                             465
                             "bolingc1"
                             nil)
                       ))
(require 'smtpmail)
(setq 
  send-mail-function         'smtpmail-send-it
  message-send-mail-function 'smtpmail-send-it
  mail-from-style            nil
  user-full-name             "Sam Boling"
  smtpmail-debug-info        t
  smtpmail-debug-verb        t
)

(defun set-smtp (mech server port user password)
  (setq 
    smtpmail-smtp-server          server
    smtpmail-smtp-service         port
    smtpmail-auth-credentials     (list (list server port user password))
    smtpmail-auth-supported       (list mech)
    smtpmail-starttls-credentials nil
  )
  (message 
    "Setting SMTP server to `%s:%s' for user `%s'."
    server port user
  )
)

(defun set-smtp-ssl (server port user password &optional key cert)
  "Set related SMTP and SSL variables for supplied parameters."
  (setq 
    starttls-use-gnutls t
    starttls-gnutls-program "gnutls-cli"
    starttls-extra-arguments nil 
    smtpmail-smtp-server server
    smtpmail-smtp-service port
    smtpmail-auth-credentials (list (list server port user password))
    smtpmail-starttls-credentials (list (list server port key cert))
  )
  (message
    "Setting SMTP server to `%s:%s' for user `%s'. (SSL enabled.)" 
    server port user
  )
)

(defun change-smtp ()
  "Change the SMTP server according to the current from line."
  (save-excursion
    (loop with from = (save-restriction
                        (message-narrow-to-headers)
                        (message-fetch-field "from")
                      )
          for (auth-mech address . auth-spec) in smtp-accounts
            when (string-match address from) 
            do   (cond
                   ((memq auth-mech '(cram-md5 plain login))
                    (return (apply 'set-smtp (cons auth-mech auth-spec))))
                   ((eql auth-mech 'ssl)
                    (return (apply 'set-smtp-ssl auth-spec)))
                   (t (error "Unrecognized SMTP auth. mechanism: `%s'." auth-mech))
                 ) 
            finally (error "Cannot infer SMTP information.")
    )
  )
)

;; The previous function will complain if you fill the from field with
;; an account not present in smtp-accounts.
(defvar %smtpmail-via-smtp (symbol-function 'smtpmail-via-smtp))

(defun smtpmail-via-smtp (recipient smtpmail-text-buffer)
  (with-current-buffer smtpmail-text-buffer
    (change-smtp))
  (funcall (symbol-value '%smtpmail-via-smtp) recipient smtpmail-text-buffer)
)
