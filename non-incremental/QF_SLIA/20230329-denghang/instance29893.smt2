
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
        ;test regex regexChecker("\\s[A-Za-z]{2,20}", longString);
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (str.to_re "C") (re.++ (str.to_re "h") (re.++ (str.to_re "e") (re.++ (str.to_re "c") (re.++ (str.to_re "k") (re.++ (str.to_re "e") (re.++ (str.to_re "r") (re.++ (re.++ (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "\\") (re.++ (str.to_re "s") (re.++ ((_ re.loop 2 20) (re.union (re.range "A" "Z") (re.range "a" "z"))) (str.to_re "\u{22}"))))) (re.++ (str.to_re ",") (re.++ (str.to_re " ") (re.++ (str.to_re "l") (re.++ (str.to_re "o") (re.++ (str.to_re "n") (re.++ (str.to_re "g") (re.++ (str.to_re "S") (re.++ (str.to_re "t") (re.++ (str.to_re "r") (re.++ (str.to_re "i") (re.++ (str.to_re "n") (str.to_re "g"))))))))))))) (str.to_re ";"))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)