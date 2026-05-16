/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import ExpressionsIndexingArrayTest from "./expressions/indexing_expression/array_indexing_expression/ExpressionsIndexingArray.test";
import ExpressionsIndexingRecordTest from "./expressions/indexing_expression/record_indexing_expression/ExpressionsIndexingRecord.test";
import ExpressionsIndexingStringTest from "./expressions/indexing_expression/string_indexing_expression/ExpressionsIndexingString.test";
import ExpressionsInstanceTest from "./expressions/instanceof_expression/ExpressionsInstance.test";
import ExpressionsInstanceOneTest from "./expressions/instanceof_expression/ExpressionsInstanceOne.test";
import ExpressionsInstanceThreeTest from "./expressions/instanceof_expression/ExpressionsInstanceThree.test";
import ExpressionsInstanceTwoTest from "./expressions/instanceof_expression/ExpressionsInstanceTwo.test";
import LambdaExpressionTest from "./expressions/lambda_expression/LambdaExpression.test";
import LambdaBodyTest from "./expressions/lambda_expression/lambda_body/LambdaBody.test";
import LambdaExpressionTypeTest from "./expressions/lambda_expression/lambda_expression_type/LambdaExpressionType.test";
import RuntimeEvaluationOfLambdaExpressionsTest from "./expressions/lambda_expression/runtime_evaluation_of_lambda_expressions/RuntimeEvaluationOfLambdaExpressions.test";
import ExpressionsMethodCallTest from "./expressions/method_call_expression/ExpressionsMethodCall.test";
import ExpressionsMethodStepTwoTest from "./expressions/method_call_expression/step_checking_method_modifiers/ExpressionsMethodStepTwo.test";
import ExpressionsMethodStepOneTest from "./expressions/method_call_expression/step_selection_of_method/ExpressionsMethodStepOne.test";
import ExpressionsMethodStepTest from "./expressions/method_call_expression/step_selection_of_type_to_use/ExpressionsMethodStep.test";
import ExpressionsMethodTypeTest from "./expressions/method_call_expression/type_of_method_call_expression/ExpressionsMethodType.test";
import ExpressionsMultiplicativeDivisionTest from "./expressions/multiplicative_expressions/division/ExpressionsMultiplicativeDivision.test";
import ExpressionsMultiplicativeExpressionTest from "./expressions/multiplicative_expressions/ExpressionsMultiplicativeExpression.test";
import ExpressionsMultiplicationTest from "./expressions/multiplicative_expressions/multiplication/ExpressionsMultiplication.test";
import MultiplicationIntResultTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResult.test";
import MultiplicationIntResultFiveTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultFive.test";
import MultiplicationIntResultFourTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultFour.test";
import MultiplicationIntResultOneTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultOne.test";
import MultiplicationIntResultThreeTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultThree.test";
import MultiplicationIntResultTwoTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultTwo.test";
import MultiplicationLongResultTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResult.test";
import MultiplicationLongResultOneTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResultOne.test";
import MultiplicationLongResultThreeTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResultThree.test";
import MultiplicationLongResultTwoTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResultTwo.test";
import ExpressionsMultiplicativeRemainderTest from "./expressions/multiplicative_expressions/remainder/ExpressionsMultiplicativeRemainder.test";
import ExpressionsNamedReferenceTest from "./expressions/named_reference/ExpressionsNamedReference.test";
import ExpressionsFunctionReferenceTest from "./expressions/named_reference/function_reference/ExpressionsFunctionReference.test";
import ExpressionsMethodReferenceTest from "./expressions/named_reference/method_reference/ExpressionsMethodReference.test";
import ExpressionsNewTest from "./expressions/new_expressions/ExpressionsNew.test";
import ExpressionsNullishCoalescingTest from "./expressions/nullish_coalescing_expression/ExpressionsNullishCoalescing.test";
import ExpressionsObjectLiteralTest from "./expressions/object_literal/ExpressionsObjectLiteral.test";
import ExpressionsObjectEvaluationTest from "./expressions/object_literal/object_literal_evaluation/ExpressionsObjectEvaluation.test";
import ExpressionsObjectClassTest from "./expressions/object_literal/object_literal_of_class_type/ExpressionsObjectClass.test";
import ExpressionsObjectInterfaceTest from "./expressions/object_literal/object_literal_of_interface_type/ExpressionsObjectInterface.test";
import ExpressionsObjectRecordTest from "./expressions/object_literal/object_literal_of_record_type/ExpressionsObjectRecord.test";
import OperatorPrecedenceTest from "./expressions/operators/operator_precedence/OperatorPrecedence.test";
import ExpressionsParenthesizedTest from "./expressions/parenthesized_expression/ExpressionsParenthesized.test";
import BooleanRelationalOperatorsTest from "./expressions/relational_expressions/boolean_relational_operators/BooleanRelationalOperators.test";
import NumericBigintRelationalTest from "./expressions/relational_expressions/numeric_relational_operators/bigint_relational_operators/NumericBigintRelational.test";
import NumericBigintRelationalOneTest from "./expressions/relational_expressions/numeric_relational_operators/bigint_relational_operators/NumericBigintRelationalOne.test";
import NumericRelationalOperatorsTest from "./expressions/relational_expressions/numeric_relational_operators/NumericRelationalOperators.test";
import NumericRelationalOperatorsOneTest from "./expressions/relational_expressions/numeric_relational_operators/NumericRelationalOperatorsOne.test";
import StringRelationalOperatorsTest from "./expressions/relational_expressions/string_relational_operators/StringRelationalOperators.test";
import StringRelationalOperatorsOneTest from "./expressions/relational_expressions/string_relational_operators/StringRelationalOperatorsOne.test";
import ExpressionsSpreadTest from "./expressions/spread_expression/ExpressionsSpread.test";
import ExpressionsSpreadOneTest from "./expressions/spread_expression/ExpressionsSpreadOne.test";
import ExpressionsSpreadTwoTest from "./expressions/spread_expression/ExpressionsSpreadTwo.test";
import StringInterpolationExpressionsTest from "./expressions/string_interpolation_expressions/StringInterpolationExpressions.test";
import TernaryConditionalExpressionsTest from "./expressions/ternary_conditional_expressions/TernaryConditionalExpressions.test";
import ExpressionsThisTest from "./expressions/this_expression/ExpressionsThis.test";
import ExpressionsTypeTest from "./expressions/typeof_expression/ExpressionsType.test";
import ExpressionsTypeOneTest from "./expressions/typeof_expression/ExpressionsTypeOne.test";
import ExpressionsTypeTwoTest from "./expressions/typeof_expression/ExpressionsTypeTwo.test";
import ExpressionsBitwiseComplementTest from "./expressions/unary_expressions/bitwise_complement/ExpressionsBitwiseComplement.test";
import ExpressionsUnaryTest from "./expressions/unary_expressions/ExpressionsUnary.test";
import ExpressionsLogicalComplementTest from "./expressions/unary_expressions/logical_complement/ExpressionsLogicalComplement.test";
import ExpressionsUnaryDecrementTest from "./expressions/unary_expressions/postfix_decrement/ExpressionsUnaryDecrement.test";
import ExpressionUnaryPostfixTest from "./expressions/unary_expressions/postfix_increment/ExpressionUnaryPostfix.test";
import ExpressionsPrefixDecrementTest from "./expressions/unary_expressions/prefix_decrement/ExpressionsPrefixDecrement.test";
import ExpressionsPrefixIncrementTest from "./expressions/unary_expressions/prefix_increment/ExpressionsPrefixIncrement.test";
import ExpressionsUnaryMinusTest from "./expressions/unary_expressions/unary_minus/ExpressionsUnaryMinus.test";
import ExpressionsUnaryPlusTest from "./expressions/unary_expressions/unary_plus/ExpressionsUnaryPlus.test";

export default function testsuite(): void {
  ExpressionsIndexingArrayTest();
  ExpressionsIndexingRecordTest();
  ExpressionsIndexingStringTest();
  ExpressionsInstanceTest();
  ExpressionsInstanceOneTest();
  ExpressionsInstanceThreeTest();
  ExpressionsInstanceTwoTest();
  LambdaExpressionTest();
  LambdaBodyTest();
  LambdaExpressionTypeTest();
  RuntimeEvaluationOfLambdaExpressionsTest();
  ExpressionsMethodCallTest();
  ExpressionsMethodStepTwoTest();
  ExpressionsMethodStepOneTest();
  ExpressionsMethodStepTest();
  ExpressionsMethodTypeTest();
  ExpressionsMultiplicativeDivisionTest();
  ExpressionsMultiplicativeExpressionTest();
  ExpressionsMultiplicationTest();
  MultiplicationIntResultTest();
  MultiplicationIntResultFiveTest();
  MultiplicationIntResultFourTest();
  MultiplicationIntResultOneTest();
  MultiplicationIntResultThreeTest();
  MultiplicationIntResultTwoTest();
  MultiplicationLongResultTest();
  MultiplicationLongResultOneTest();
  MultiplicationLongResultThreeTest();
  MultiplicationLongResultTwoTest();
  ExpressionsMultiplicativeRemainderTest();
  ExpressionsNamedReferenceTest();
  ExpressionsFunctionReferenceTest();
  ExpressionsMethodReferenceTest();
  ExpressionsNewTest();
  ExpressionsNullishCoalescingTest();
  ExpressionsObjectLiteralTest();
  ExpressionsObjectEvaluationTest();
  ExpressionsObjectClassTest();
  ExpressionsObjectInterfaceTest();
  ExpressionsObjectRecordTest();
  OperatorPrecedenceTest();
  ExpressionsParenthesizedTest();
  BooleanRelationalOperatorsTest();
  NumericBigintRelationalTest();
  NumericBigintRelationalOneTest();
  NumericRelationalOperatorsTest();
  NumericRelationalOperatorsOneTest();
  StringRelationalOperatorsTest();
  StringRelationalOperatorsOneTest();
  ExpressionsSpreadTest();
  ExpressionsSpreadOneTest();
  ExpressionsSpreadTwoTest();
  StringInterpolationExpressionsTest();
  TernaryConditionalExpressionsTest();
  ExpressionsThisTest();
  ExpressionsTypeTest();
  ExpressionsTypeOneTest();
  ExpressionsTypeTwoTest();
  ExpressionsBitwiseComplementTest();
  ExpressionsUnaryTest();
  ExpressionsLogicalComplementTest();
  ExpressionsUnaryDecrementTest();
  ExpressionUnaryPostfixTest();
  ExpressionsPrefixDecrementTest();
  ExpressionsPrefixIncrementTest();
  ExpressionsUnaryMinusTest();
  ExpressionsUnaryPlusTest();
}