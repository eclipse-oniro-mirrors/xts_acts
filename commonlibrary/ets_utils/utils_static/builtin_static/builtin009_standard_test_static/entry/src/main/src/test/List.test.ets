import builtinsStringBuilderTestToString from './stringBuilder/BuiltinsStringBuilderTestToString.test';
import builtinsStringBuilderTestAppend from './stringBuilder/BuiltinsStringBuilderTestAppend.test';
import builtinsStringBuilderTestConstructor from './stringBuilder/BuiltinsStringBuilderTestConstructor.test';


import builtinsBootRuntimeLinkerTest from './bootRuntimeLinker/BuiltinsBootRuntimeLinkerTest.test';



import builtinsGetHashCodeTest from './runtime/BuiltinsGetHashCodeTest.test';
import builtinsGetHashCodeByValueTest from './runtime/BuiltinsGetHashCodeByValueTest.test';
import builtinsRuntimeTest from './runtime/BuiltinsRuntimeTest.test';

import builtinsCharConversionTest from './Char/BuiltinsCharConversionTest.test';
import builtinsValueConversionTest from './Char/BuiltinsValueConversionTest.test';
import builtinsComparisonAndEqualityTest from './Char/BuiltinsComparisonAndEqualityTest.test';
import builtinsPlanTest from './Char/BuiltinsPlanTest.test';
import builtinsSurrogateTest from './Char/BuiltinsSurrogateTest.test';
import builtinsDigitTest from './Char/BuiltinsDigitTest.test';
import builtinsCharCharsToCodePointTest from './Char/BuiltinsCharCharsToCodePointTest.test'
import builtinsCharIsBinDigitTest from './Char/BuiltinsCharIsBinDigitTest.test'
import builtinsCharIsDecDigitTest from './Char/BuiltinsCharIsDecDigitTest.test'
import builtinsCharIsHexDigitTest from './Char/BuiltinsCharIsHexDigitTest.test'
import builtinsCharIsLetterTest from './Char/BuiltinsCharIsLetterTest.test'
import builtinsCharIsUpperCaseTest from './Char/BuiltinsCharIsUpperCaseTest.test'
import builtinsCharIsLowerCaseTest from './Char/BuiltinsCharIsLowerCaseTest.test'
import builtinsCharToUpperCaseTest from './Char/BuiltinsCharToUpperCaseTest.test'
import builtinsCharToLowerCaseTest from './Char/BuiltinsCharToLowerCaseTest.test'
import builtinsCharIsWhiteSpaceTest from './Char/BuiltinsCharIsWhiteSpaceTest.test'
import builtinsIsLowerConversionTest from './Char/BuiltinsIsLowerConversionTest.test'
import builtinsIsBinDigitTest from './Char/BuiltinsIsBinDigitTest.test';
import builtinsIsDecDigitTest from './Char/BuiltinsIsDecDigitTest.test';
import builtinsIsHexDigitTest from './Char/BuiltinsIsHexDigitTest.test';
import builtinsIsLetterTest from './Char/BuiltinsIsLetterTest.test';
import builtinsIsUpperCaseTest from './Char/BuiltinsIsUpperCaseTest.test';
import builtinsToUpperCaseTest from './Char/BuiltinsToUpperCaseTest.test';
import builtinsToLowerCaseTest from './Char/BuiltinsToLowerCaseTest.test';
import builtinsIsWhiteSpaceTest from './Char/BuiltinsIsWhiteSpaceTest.test';

import builtinsRuntimeLinkerLoadLibraryTest from './runtimeLinker/BuiltinsRuntimeLinkerLoadLibraryTest.test'
import builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest from './runtimeLinker/BuiltinsRuntimeLinkerLoadLibraryWithPermissionCheckTest.test'
import builtinsRuntimeLinkerGetTypeTest from './runtimeLinker/BuiltinsRuntimeLinkerGetTypeTest.test'
import builtinsRuntimeLinkerFindLoadedClassTest from './runtimeLinker/BuiltinsRuntimeLinkerFindLoadedClassTest.test';
import builtinsRuntimeLinkerLoadClassTest from './runtimeLinker/BuiltinsRuntimeLinkerLoadClassTest.test';





export default function testsuite() {
  builtinsStringBuilderTestToString();
  builtinsStringBuilderTestAppend();
  builtinsStringBuilderTestConstructor();
  
  builtinsBootRuntimeLinkerTest();
  
  builtinsGetHashCodeTest();
  builtinsGetHashCodeByValueTest();
  builtinsRuntimeTest();
  
  builtinsCharConversionTest();
  builtinsValueConversionTest();
  builtinsComparisonAndEqualityTest();
  builtinsPlanTest();
  builtinsSurrogateTest();
  builtinsDigitTest();
  builtinsCharCharsToCodePointTest();
  builtinsCharIsBinDigitTest();
  builtinsCharIsDecDigitTest();
  builtinsCharIsHexDigitTest();
  builtinsCharIsLetterTest();
  builtinsCharIsUpperCaseTest();
  builtinsCharIsLowerCaseTest();
  builtinsCharToUpperCaseTest();
  builtinsCharToLowerCaseTest();
  builtinsCharIsWhiteSpaceTest();
  builtinsIsLowerConversionTest();
  builtinsIsBinDigitTest();
  builtinsIsDecDigitTest();
  builtinsIsHexDigitTest();
  builtinsIsLetterTest();
  builtinsIsUpperCaseTest();
  builtinsToUpperCaseTest();
  builtinsToLowerCaseTest();
  builtinsIsWhiteSpaceTest();
  
  builtinsRuntimeLinkerLoadLibraryTest();
  builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest();
  builtinsRuntimeLinkerGetTypeTest();
  builtinsRuntimeLinkerFindLoadedClassTest();
  builtinsRuntimeLinkerLoadClassTest();
}