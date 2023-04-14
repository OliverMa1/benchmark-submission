(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generator: Stranger
Generated on: 2023-04-03
Application: Real Web Applications
Target solver: SLENT
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
(declare-fun sigmaStar_safe_50 () String)
(declare-fun b_sigmaStar_safe_50 () Bool)
(declare-fun sigmaStar_safe_51 () String)
(declare-fun b_sigmaStar_safe_51 () Bool)
(declare-fun sigmaStar_152 () String)
(declare-fun b_sigmaStar_152 () Bool)
(declare-fun literal_10 () String)
(declare-fun b_literal_10 () Bool)
(declare-fun sigmaStar_057 () String)
(declare-fun b_sigmaStar_057 () Bool)
(declare-fun literal_15 () String)
(declare-fun b_literal_15 () Bool)
(declare-fun literal_20 () String)
(declare-fun b_literal_20 () Bool)
(declare-fun sigmaStar_263 () String)
(declare-fun b_sigmaStar_263 () Bool)
(declare-fun literal_23 () String)
(declare-fun b_literal_23 () Bool)
(declare-fun atkPtn () String)
(declare-fun b_atkPtn () Bool)
(declare-fun x_4 () String)
(declare-fun b_x_4 () Bool)
(declare-fun x_5 () String)
(declare-fun b_x_5 () Bool)
(declare-fun x_9 () String)
(declare-fun b_x_9 () Bool)
(declare-fun x_11 () String)
(declare-fun b_x_11 () Bool)
(declare-fun x_12 () String)
(declare-fun b_x_12 () Bool)
(declare-fun x_17 () String)
(declare-fun b_x_17 () Bool)
(declare-fun x_18 () String)
(declare-fun b_x_18 () Bool)
(declare-fun x_19 () String)
(declare-fun b_x_19 () Bool)
(declare-fun x_21 () String)
(declare-fun b_x_21 () Bool)
(declare-fun x_22 () String)
(declare-fun b_x_22 () Bool)
(declare-fun x_24 () String)
(declare-fun b_x_24 () Bool)
(declare-fun sink () String)
(declare-fun b_sink () Bool)
(declare-fun atk_sigmaStar_1 () String)
(declare-fun atk_sigmaStar_2 () String)
(declare-fun atk_sink () String)
(declare-fun sigmaStar_n0 () String)
(declare-fun b_sigmaStar_n0 () Bool)

(assert (= b_sigmaStar_safe_50 (str.in_re sigmaStar_safe_50 (re.* (re.union (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")))))))
(assert (= b_sigmaStar_safe_51 (str.in_re sigmaStar_safe_51 (re.* (re.union (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")))))))
(assert (and b_literal_10 (= literal_10 "\x5b\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x6d\x61\x69\x6c\x74\x6f\x3a")))
(assert (and b_literal_15 (= literal_15 "\x27\x20\x74\x69\x74\x6c\x65\x3d\x27")))
(assert (and b_literal_20 (= literal_20 "\x27\x3e")))
(assert (and b_literal_23 (= literal_23 "\x3c\x2f\x61\x3e\x5d\x5c\x6e")))
(assert (str.in_re atkPtn (str.to_re "livescript:")))
(assert (= atk_sink (str.++ atk_sigmaStar_1 (str.++ atkPtn atk_sigmaStar_2))))
(assert (= b_x_4 (or (and (= x_4 sigmaStar_safe_50) b_sigmaStar_safe_50) (and (= x_4 sigmaStar_safe_51) b_sigmaStar_safe_51) ) ))
(assert (= b_x_5 (or (and (= x_5 x_4) b_x_4) (and (= x_5 sigmaStar_152) b_sigmaStar_152) ) ))
(assert (= b_x_9 (and (= x_9 (str.replace_all x_5 "@" "&#64;") ) b_x_5) ))
(assert (= b_x_11 (and (= x_11 (str.++ literal_10 x_9) ) b_literal_10 b_x_9) ))
(assert (= b_x_12 (or (and (= x_12 sigmaStar_n0) b_sigmaStar_n0) (and (= x_12 sigmaStar_057) b_sigmaStar_057) ) ))
(assert (= b_x_17 (and (= x_17 (str.replace_all x_12 "@" "&#64;") ) b_x_12) ))
(assert (= b_x_18 (and (= x_18 (str.++ x_11 literal_15) ) b_x_11 b_literal_15) ))
(assert (= b_x_19 (and (= x_19 (str.++ x_18 x_17) ) b_x_18 b_x_17) ))
(assert (= b_x_21 (and (= x_21 (str.++ x_19 literal_20) ) b_x_19 b_literal_20) ))
(assert (= b_x_22 (and (= x_22 (str.++ x_21 sigmaStar_263) ) b_x_21 b_sigmaStar_263) ))
(assert (= b_x_24 (and (= x_24 (str.++ x_22 literal_23) ) b_x_22 b_literal_23) ))
(assert (and (= sink x_24) (= sink atk_sink) b_x_24))
(assert (= 10 (+ (str.len x_5) (str.len sink)) ) )
(check-sat)
(exit)