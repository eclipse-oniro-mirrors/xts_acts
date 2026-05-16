import StringLastIndexOfBasicTest from "./StringLastIndexOfBasic.test";
import StringLocaleCompareBasicTest from "./StringLocaleCompareBasic.test";
import StringMatchBasicTest from "./StringMatchBasic.test";
import StringMatchAllBasicTest from "./StringMatchAllBasic.test";
import StringNormalizeBoundaryTest from "./StringNormalizeBoundary.test";
import StringNormalizeExceptionTest from "./StringNormalizeException.test";
import StringPadEndBasicTest from "./StringPadEndBasic.test";
import StringPadStartBasicTest from "./StringPadStartBasic.test";
import StringToWellFormedBasicTest from "./StringToWellFormedBasic.test";
import StringLengthTest from "./StringLengthTest.test";
import StringToLocaleLowerCaseTest from "./StringToLocaleLowerCaseTest.test";
import StringRepeatTest from "./StringRepeatTest.test";
import StringReplaceTest from "./StringReplaceTest.test";
import StringReplaceAllTest from "./StringReplaceAllTest.test";
import StringSearchTest from "./StringSearchTest.test";
import StringStartsWithTest from "./StringStartsWithTest.test";

import stringAtTest from './String_At/StringAtTest';
import StringBasicTest from './String_Basic/StringBasicTest';
import StringCharAtTest from './String_CharAt/StringCharAtTest';
import StringCharCodeAtTest from './String_CharCodeAt/StringCharCodeAtBasicTest'
import stringCodePointAtTest from './String_CodePointAt/StringCodePointAtTest';
import StringConcatTest from './String_Concat/StringConcatTest';
import StringEndsWithTest from './String_EndsWith/StringEndsWithBasicTest'
import stringFromCharCodeTest from './String_FromCharCode/StringFromCharCodeTest';
import StringFromCodePointTest from './String_FromCodePoint/StringFromCodePointTest';
import stringIncludesTest from './String_Includes/StringIncludesTest';
import StringIndexOfTest from './String_IndexOf/StringIndexOfTest';
import StringSliceTest from './String_Slice/StringSliceTest';
import StringSplitTest from './String_Split/StringSplitTest';
import StringSubstringTest from './String_Substring/StringSubstringTest';
import StringToLocaleUpperCaseBasicTest from './String_ToLocaleUpperCase/StringToLocaleUpperCaseBasicTest'
import StringToLowerCaseTest from './String_ToLowerCase/StringToLowerCaseTest';
import StringToStringBasicTest from './String_ToString/StringToStringBasicTest'
import StringToUpperCaseTest from './String_ToUpperCase/StringToUpperCaseTest';
import StringTrimTest from './String_Trim/StringTrimTest.test';
import StringTrimEndTest from './String_trimEnd/StringTrimEndTest.test';
import StringTrimStartTest from './String_trimStart/StringTrimStartTest.test';
import String_ValueOf from './String_ValueOf/StringValueOfTest.test';

export default function testsuite() {
  StringLastIndexOfBasicTest();
  StringLocaleCompareBasicTest();
  StringMatchBasicTest();
  StringMatchAllBasicTest();
  StringNormalizeBoundaryTest();
  StringNormalizeExceptionTest();
  StringPadEndBasicTest();
  StringPadStartBasicTest();
  StringToWellFormedBasicTest();
  StringLengthTest();
  StringToLocaleLowerCaseTest();
  StringRepeatTest();
  StringReplaceTest();
  StringReplaceAllTest();
  StringSearchTest();
  StringStartsWithTest();

  stringAtTest();
  StringBasicTest();
  StringCharAtTest();
  StringCharCodeAtTest();
  stringCodePointAtTest();
  StringConcatTest();
  StringEndsWithTest();
  stringFromCharCodeTest();
  StringFromCodePointTest();
  stringIncludesTest();
  StringIndexOfTest();
  StringSliceTest();
  StringSplitTest();
  StringSubstringTest();
  StringToLowerCaseTest();
  StringToUpperCaseTest();
  StringToLocaleUpperCaseBasicTest();
  StringToStringBasicTest();
  StringTrimTest();
  String_ValueOf();
  StringTrimEndTest();
  StringTrimStartTest();
}