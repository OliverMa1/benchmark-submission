(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Oliver Markgraf,
Generator: Stranger
Generated on: 2023-04-03
Application: Real Web Applications
Target solver: SLENT
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
(declare-fun sigmaStar_048 () String)
(declare-fun b_sigmaStar_048 () Bool)
(declare-fun literal_9 () String)
(declare-fun b_literal_9 () Bool)
(declare-fun literal_11 () String)
(declare-fun b_literal_11 () Bool)
(declare-fun atkPtn () String)
(declare-fun b_atkPtn () Bool)
(declare-fun x_7 () String)
(declare-fun b_x_7 () Bool)
(declare-fun x_10 () String)
(declare-fun b_x_10 () Bool)
(declare-fun x_12 () String)
(declare-fun b_x_12 () Bool)
(declare-fun sink () String)
(declare-fun b_sink () Bool)
(declare-fun atk_sigmaStar_1 () String)
(declare-fun atk_sigmaStar_2 () String)
(declare-fun atk_sink () String)

(assert (and b_literal_9 (= literal_9 "\x3c\x74\x64\x3e\x55\x52\x4c\x3a\x20")))
(assert (and b_literal_11 (= literal_11 "\x3c\x2f\x74\x64\x3e")))
(assert (str.in_re atkPtn (re.++ (str.to_re "\\"";") (re.++ (re.* re.allchar) (str.to_re "//")))))
(assert (= atk_sink (str.++ atk_sigmaStar_1 (str.++ atkPtn atk_sigmaStar_2))))
(assert (= b_x_7 (and (= x_7 (str.replace_re_all sigmaStar_048 (re.inter re.allchar (re.* re.allchar) ) "") ) b_sigmaStar_048) ))
(assert (= b_x_10 (and (= x_10 (str.++ literal_9 x_7) ) b_literal_9 b_x_7) ))
(assert (= b_x_12 (and (= x_12 (str.++ x_10 literal_11) ) b_x_10 b_literal_11) ))
(assert (and (= sink x_12) (= sink atk_sink) b_x_12))
(assert (= 20 (+ (str.len sigmaStar_048) (str.len sink)) ) )
(check-sat)
(exit)