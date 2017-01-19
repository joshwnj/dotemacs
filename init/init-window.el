(defun resize-window-h (percent)
  "Resize a window horizontally, given a percentage"
  (interactive "N%% width: ")
  (let ((current-width (window-width))
         (new-width (floor (* (/ (float percent) 100) (frame-width)))))
    (enlarge-window-horizontally (- new-width current-width))))

(defun resize-window-v (percent)
  "Resize a window vertically, given a percentage"
  (interactive "N%% height: ")
  (let ((current-height (window-height))
         (new-height (floor (* (/ (float percent) 100) (frame-height)))))
    (enlarge-window (- new-height current-height))))

(provide 'init-window)
