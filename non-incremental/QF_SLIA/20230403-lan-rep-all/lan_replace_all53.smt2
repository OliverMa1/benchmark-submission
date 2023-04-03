
(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Stranger,
Generated on: 20230403,
Application: Real Web Applications
Target solver: SLENT
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
        (declare-fun sigmaStar_safe_48 () String)
(declare-fun b_sigmaStar_safe_48 () Bool)
(declare-fun literal_11 () String)
(declare-fun b_literal_11 () Bool)
(declare-fun literal_13 () String)
(declare-fun b_literal_13 () Bool)
(declare-fun atkPtn () String)
(declare-fun b_atkPtn () Bool)
(declare-fun x_8 () String)
(declare-fun b_x_8 () Bool)
(declare-fun x_12 () String)
(declare-fun b_x_12 () Bool)
(declare-fun x_14 () String)
(declare-fun b_x_14 () Bool)
(declare-fun sink () String)
(declare-fun b_sink () Bool)
(declare-fun atk_sigmaStar_1 () String)
(declare-fun atk_sigmaStar_2 () String)
(declare-fun atk_sink () String)

(assert (and b_sigmaStar_safe_48 (str.in_re sigmaStar_safe_48 (re.* (re.union (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")))))))
(assert (and b_literal_11 (= literal_11 "\x3c\x63\x65\x6e\x74\x65\x72\x3e\x3c\x66\x6f\x6e\x74\x20\x63\x6f\x6c\x6f\x72\x3d\x22\x72\x65\x64\x22\x3e\x6e\x6f\x6e\x75\x6d\x65\x72\x69\x63\x77\x65\x69\x67\x68\x74\x3a\x20\x22")))
(assert (and b_literal_13 (= literal_13 "\x22\x3c\x2f\x66\x6f\x6e\x74\x3e\x3c\x2f\x63\x65\x6e\x74\x65\x72\x3e\x3c\x62\x72\x20\x2f\x3e")))
(assert (= atk_sink (str.++ atk_sigmaStar_1 (str.++ atkPtn atk_sigmaStar_2))))
(assert (= b_x_8 (and (= x_8 (str.replace_re_all sigmaStar_safe_48 (re.union (re.union (str.to_re "." ) (str.to_re "|" ) ) (str.to_re " " ) ) "_") ) b_sigmaStar_safe_48) ))
(assert (= b_x_12 (and (= x_12 (str.++ literal_11 x_8) ) b_literal_11 b_x_8) ))
(assert (= b_x_14 (and (= x_14 (str.++ x_12 literal_13) ) b_x_12 b_literal_13) ))
(assert (and (= sink x_14) (= sink atk_sink) b_x_14))
(assert (> 30 (+ (str.len sigmaStar_safe_48) (str.len sink)) ) )
(check-sat)
(exit)