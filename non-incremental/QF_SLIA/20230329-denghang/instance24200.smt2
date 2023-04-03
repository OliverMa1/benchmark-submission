
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
        ;test regex REGEXP  'a{2}|b{2}|c{2}|d{2}|e{2}|f{2}|g{2}|h{2}|i{2}|j{2}|k{2}|l{2}|m{2}|n{2}|o{2}|p{2}|q{2}|r{2}|s{2}|t{2}|u{2}|v{2}|w{2}|x{2}|y{2}|z{2}'
(declare-const X String)
(assert (str.in_re X (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.++ (str.to_re "R") (re.++ (str.to_re "E") (re.++ (str.to_re "G") (re.++ (str.to_re "E") (re.++ (str.to_re "X") (re.++ (str.to_re "P") (re.++ (str.to_re " ") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{27}") ((_ re.loop 2 2) (str.to_re "a"))))))))))) ((_ re.loop 2 2) (str.to_re "b"))) ((_ re.loop 2 2) (str.to_re "c"))) ((_ re.loop 2 2) (str.to_re "d"))) ((_ re.loop 2 2) (str.to_re "e"))) ((_ re.loop 2 2) (str.to_re "f"))) ((_ re.loop 2 2) (str.to_re "g"))) ((_ re.loop 2 2) (str.to_re "h"))) ((_ re.loop 2 2) (str.to_re "i"))) ((_ re.loop 2 2) (str.to_re "j"))) ((_ re.loop 2 2) (str.to_re "k"))) ((_ re.loop 2 2) (str.to_re "l"))) ((_ re.loop 2 2) (str.to_re "m"))) ((_ re.loop 2 2) (str.to_re "n"))) ((_ re.loop 2 2) (str.to_re "o"))) ((_ re.loop 2 2) (str.to_re "p"))) ((_ re.loop 2 2) (str.to_re "q"))) ((_ re.loop 2 2) (str.to_re "r"))) ((_ re.loop 2 2) (str.to_re "s"))) ((_ re.loop 2 2) (str.to_re "t"))) ((_ re.loop 2 2) (str.to_re "u"))) ((_ re.loop 2 2) (str.to_re "v"))) ((_ re.loop 2 2) (str.to_re "w"))) ((_ re.loop 2 2) (str.to_re "x"))) ((_ re.loop 2 2) (str.to_re "y"))) (re.++ ((_ re.loop 2 2) (str.to_re "z")) (str.to_re "\u{27}")))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)