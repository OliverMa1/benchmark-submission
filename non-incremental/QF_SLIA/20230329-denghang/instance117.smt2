
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
        ;test regex .* [rR][eE][nN][aA][mM][eE] [^\u{0a}]{1024}
(declare-const X String)
(assert (str.in_re X (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ (str.to_re " ") (re.++ (re.union (str.to_re "r") (str.to_re "R")) (re.++ (re.union (str.to_re "e") (str.to_re "E")) (re.++ (re.union (str.to_re "n") (str.to_re "N")) (re.++ (re.union (str.to_re "a") (str.to_re "A")) (re.++ (re.union (str.to_re "m") (str.to_re "M")) (re.++ (re.union (str.to_re "e") (str.to_re "E")) (re.++ (str.to_re " ") ((_ re.loop 1024 1024) (re.diff re.allchar (str.to_re "\u{0a}"))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 50 (str.len X)))
(check-sat)
(get-model)(exit)