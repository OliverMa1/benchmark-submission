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
(declare-fun sigmaStar_safe_48 () String)
(declare-fun b_sigmaStar_safe_48 () Bool)
(declare-fun atkPtn () String)
(declare-fun b_atkPtn () Bool)
(declare-fun x_3 () String)
(declare-fun b_x_3 () Bool)
(declare-fun sink () String)
(declare-fun b_sink () Bool)
(declare-fun atk_sigmaStar_1 () String)
(declare-fun atk_sigmaStar_2 () String)
(declare-fun atk_sink () String)

(assert (= b_sigmaStar_safe_48 (str.in_re sigmaStar_safe_48 (re.* (re.union (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")))))))
(assert (str.in_re atkPtn (str.to_re "/evil")))
(assert (= atk_sink (str.++ atk_sigmaStar_1 (str.++ atkPtn atk_sigmaStar_2))))
(assert (= b_x_3 (and (= x_3 (str.replace sigmaStar_safe_48 "http://" "https://") ) b_sigmaStar_safe_48) ))
(assert (and (= sink x_3) (= sink atk_sink) b_x_3))
(assert (> 20 (+ (str.len sigmaStar_safe_48) (str.len sink)) ) )
(check-sat)
(exit)