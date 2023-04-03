
(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Denghang Hu,
Generated on: 20230329,
Application: Evaluate string solvers
Description: The instance consists of:
(1) a regular membership predicate from the real world
(2) a regular membership predicate to sanitize danger letters in javascript such as <,>,&,",'
(3) a lower bound for string length
Target solver: Ostrich, Z3str3, CVC5
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
        ;test regex sed -i "/^1/ s/(.{10})/ 123456789/4" $DEST/$FILE_NAME$DATE.txt
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "s") (re.++ (str.to_re "e") (re.++ (str.to_re "d") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "i") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{22}") (str.to_re "/"))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "1") (re.++ (str.to_re "/") (re.++ (str.to_re " ") (re.++ (str.to_re "s") (re.++ (str.to_re "/") (re.++ ((_ re.loop 10 10) (re.diff re.allchar (str.to_re "\n"))) (re.++ (str.to_re "/") (re.++ (str.to_re " ") (re.++ (str.to_re "123456789") (re.++ (str.to_re "/") (re.++ (str.to_re "4") (re.++ (str.to_re "\u{22}") (str.to_re " "))))))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "D") (re.++ (str.to_re "E") (re.++ (str.to_re "S") (re.++ (str.to_re "T") (str.to_re "/"))))))) (re.++ (str.to_re "") (re.++ (str.to_re "F") (re.++ (str.to_re "I") (re.++ (str.to_re "L") (re.++ (str.to_re "E") (re.++ (str.to_re "_") (re.++ (str.to_re "N") (re.++ (str.to_re "A") (re.++ (str.to_re "M") (str.to_re "E"))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "D") (re.++ (str.to_re "A") (re.++ (str.to_re "T") (re.++ (str.to_re "E") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "t") (re.++ (str.to_re "x") (str.to_re "t"))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)