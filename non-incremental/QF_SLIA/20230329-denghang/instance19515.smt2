
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
        ;test regex ^-?([0-9]{1,9}|[0-1][0-9]{9}|20[0-9]{8}|21[0-3][0-9]{7}|214[0-6][0-9]{6}|2147[0-3][0-9]{5}|21474[0-7][0-9]{4}|214748[0-2][0-9]{3}|2147483[0-5][0-9]{2}|21474836[0-3][0-9]|214748364[0-7])$|^(-2147483648)$
(declare-const X String)
(assert (str.in_re X (re.union (re.++ (re.++ (str.to_re "") (re.++ (re.opt (str.to_re "-")) (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union (re.union ((_ re.loop 1 9) (re.range "0" "9")) (re.++ (re.range "0" "1") ((_ re.loop 9 9) (re.range "0" "9")))) (re.++ (str.to_re "20") ((_ re.loop 8 8) (re.range "0" "9")))) (re.++ (str.to_re "21") (re.++ (re.range "0" "3") ((_ re.loop 7 7) (re.range "0" "9"))))) (re.++ (str.to_re "214") (re.++ (re.range "0" "6") ((_ re.loop 6 6) (re.range "0" "9"))))) (re.++ (str.to_re "2147") (re.++ (re.range "0" "3") ((_ re.loop 5 5) (re.range "0" "9"))))) (re.++ (str.to_re "21474") (re.++ (re.range "0" "7") ((_ re.loop 4 4) (re.range "0" "9"))))) (re.++ (str.to_re "214748") (re.++ (re.range "0" "2") ((_ re.loop 3 3) (re.range "0" "9"))))) (re.++ (str.to_re "2147483") (re.++ (re.range "0" "5") ((_ re.loop 2 2) (re.range "0" "9"))))) (re.++ (str.to_re "21474836") (re.++ (re.range "0" "3") (re.range "0" "9")))) (re.++ (str.to_re "214748364") (re.range "0" "7"))))) (str.to_re "")) (re.++ (re.++ (str.to_re "") (re.++ (str.to_re "-") (str.to_re "2147483648"))) (str.to_re "")))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)