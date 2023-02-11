(defun BFS (s K rules delta)
   "Breadth first search"
   (let ((lstop #'(lambda (lst1 lst2)
                    (append lst1 lst2)))
         )
     (search-init K rules delta lstop)
     (search-start (list s) nil)))