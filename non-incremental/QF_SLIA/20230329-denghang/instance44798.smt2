
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
        ;test regex (?:ax|by)[cd]*(ef|g[hi](?:j{2,}|klm))
(declare-const X String)
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "a") (str.to_re "x")) (re.++ (str.to_re "b") (str.to_re "y"))) (re.++ (re.* (re.union (str.to_re "c") (str.to_re "d"))) (re.union (re.++ (str.to_re "e") (str.to_re "f")) (re.++ (str.to_re "g") (re.++ (re.union (str.to_re "h") (str.to_re "i")) (re.union (re.++ (re.* (str.to_re "j")) ((_ re.loop 2 2) (str.to_re "j"))) (re.++ (str.to_re "k") (re.++ (str.to_re "l") (str.to_re "m")))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)