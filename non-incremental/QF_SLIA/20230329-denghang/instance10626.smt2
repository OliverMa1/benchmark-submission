
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
        ;test regex words=$(grep -iE '(['"$text"']{4,})' /usr/dict/words)
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "w") (re.++ (str.to_re "o") (re.++ (str.to_re "r") (re.++ (str.to_re "d") (re.++ (str.to_re "s") (str.to_re "=")))))) (re.++ (str.to_re "") (re.++ (str.to_re "g") (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "p") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "i") (re.++ (str.to_re "E") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{27}") (re.++ (re.++ (re.* (re.union (str.to_re "\u{27}") (re.union (str.to_re "\u{22}") (re.union (str.to_re "$") (re.union (str.to_re "t") (re.union (str.to_re "e") (re.union (str.to_re "x") (re.union (str.to_re "t") (re.union (str.to_re "\u{22}") (str.to_re "\u{27}")))))))))) ((_ re.loop 4 4) (re.union (str.to_re "\u{27}") (re.union (str.to_re "\u{22}") (re.union (str.to_re "$") (re.union (str.to_re "t") (re.union (str.to_re "e") (re.union (str.to_re "x") (re.union (str.to_re "t") (re.union (str.to_re "\u{22}") (str.to_re "\u{27}"))))))))))) (re.++ (str.to_re "\u{27}") (re.++ (str.to_re " ") (re.++ (str.to_re "/") (re.++ (str.to_re "u") (re.++ (str.to_re "s") (re.++ (str.to_re "r") (re.++ (str.to_re "/") (re.++ (str.to_re "d") (re.++ (str.to_re "i") (re.++ (str.to_re "c") (re.++ (str.to_re "t") (re.++ (str.to_re "/") (re.++ (str.to_re "w") (re.++ (str.to_re "o") (re.++ (str.to_re "r") (re.++ (str.to_re "d") (str.to_re "s"))))))))))))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)