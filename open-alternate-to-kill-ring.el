;; Copyright (c) 2011 Chris Flöß

;; Author: Chris Flöß <skeptikos@gmail.com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; A copy of the GNU General Public License can be obtained from the
;; Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;;; Commentary:

;; This function was written so that changes introduced by
;; "find-alternate-file" can be undone. It does this by saving the
;; current state of the buffer to the kill ring.

;; Installation
;; ============

;; Put this file in your load path and put:
;;
;;   (require 'open-alternate-to-kill-ring)
;;
;; This makes the funtion available. At this point you can re-bind
;; C-x, C-v to call "open-alternative-to-kill-ring" by putting
;;
;; (global-set-key (kbd "C-x C-v") 'open-alternate-to-kill-ring)
;;
;; into your init file.
;;
;; TODO: this is temporary functionality. Ideally, changes introduced
;; by C-x, C-v should be able to be undone by a simple C-/
;;
(defun open-alternate-to-kill-ring ()
  "When using \"find-alternate-file\", it may be desireable to undo the
the changes that were introduced, much like other changes in emacs that
write to the kill ring. This function does exactly that. When
\"find-alternate-file\" is invoked, it saves the entire current
contents of the buffer to the kill ring to that changes can be
recovered"
  (interactive)
  (setq prior-point (point))
  (kill-ring-save (point-min) (point-max))
  (goto-char prior-point)
  (find-alternate-file (buffer-file-name(current-buffer))))

(provide 'open-alternate-to-kill-ring)

;;; open-alternate-to-kill-ring.el ends here
