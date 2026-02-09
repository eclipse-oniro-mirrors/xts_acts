import builtinsArrayConcatTest from './array/BuiltinsArrayConcatTest.test';
import builtinsArrayCopyWithinTest from './array/BuiltinsArrayCopyWithinTest.test';
import builtinsArrayEntriesTest from './array/BuiltinsArrayEntriesTest.test';
import builtinsArrayEveryTest from './array/BuiltinsArrayEveryTest.test';
import builtinsArrayFillTest from './array/BuiltinsArrayFillsTest.test';
import builtinsArrayFilterTest from './array/BuiltinsArrayFiltersTest.test';
import builtinsArrayFindIndexTest from './array/BuiltinsArrayFindsIndexTest.test';
import builtinsArrayFindTest from './array/BuiltinsArrayFindsTest.test';
import builtinsArrayFlatMapTest from './array/BuiltinsArrayFlatMapTest.test';
import builtinsArrayFlatTest from './array/BuiltinsArrayFlatTest.test';
import builtinsArrayForEachTest from './array/BuiltinsArrayForEachTest.test';
import builtinsArrayFromTest from './array/BuiltinsArraysFromTest.test';
import builtinsArrayIncludesTest from './array/BuiltinsArrayIncludesTest.test';
import builtinsArrayIsArrayTest from './array/BuiltinsArrayIsArray.test';
import builtinsArrayJoinTest from './array/BuiltinsArrayJoinTest.test';
import builtinsArrayOfTest from './array/BuiltinsArrayOf.test';
import builtinsArrayPopTest from './array/BuiltinsArrayPop.test';
import builtinsArrayPushTest from './array/BuiltinsArrayPush.test';
import builtinsArrayReduceRightTest from './array/BuiltinsArrayReduceRightTest.test';
import builtinsArrayReduceTest from './array/BuiltinsArrayReduceTest.test';
import builtinsArrayReverseTest from './array/BuiltinsArrayReverseTest.test';
import builtinsArrayShiftTest from './array/BuiltinsArrayShift.test';
import builtinsArraySortTest from './array/BuiltinsArraySortsTest.test';
import builtinsArraySpliceTest from './array/BuiltinsArraySplicesTest.test';
import builtinsArrayToLocaleStringTest from './array/BuiltinsArrayToLocaleStringTest.test';
import builtinsArrayToReversedTest from './array/BuiltinsArrayToReversedTest.test';
import builtinsArrayToSortedTest from './array/BuiltinsArrayToSortedTest.test';
import builtinsArrayToStringTest from './array/BuiltinsArrayToStringTest.test';
import builtinsArrayUnshiftTest from './array/BuiltinsArrayUnshift.test';
import builtinsArrayValuesTest from './array/BuiltinsArrayValues.test';
import builtinsArrayAtTest from './array/BuiltinsArrayAtTest.test';
import builtinsArrayConstructorTest from './array/BuiltinsArrayConstructorTest.test';
import builtinsArrayKeysTest from './array/BuiltinsArrayKeysTest.test';
import builtinsArrayMapTest from './array/BuiltinsArrayMapTest.test';
import builtinsArrayLastIndexOfTest from './array/BuiltinsArrayLastIndexOfTest.test';
import BuiltinsArrayIndexOfTest from './array/BuiltinsArrayIndexOfTest.test';
import BuiltinsArraySliceTest from './array/BuiltinsArraySliceTest.test';
import BuiltinsArraySomeTest from './array/BuiltinsArraySomeTest.test';
import builtinsArrayConstructor1Test from './array/BuiltinsArrayCombination1Test.test';
import builtinsArrayConstructor2Test from './array/BuiltinsArrayCombination2Test.test';
import builtinsArrayConstructorTestErr from './array/BuiltinsArrayCombinationTestErr.test';


import builtinsArrayBufferByteLengthTest from "./ArrayBuffer/BuiltinsArrayBufferByteLengthTest.test";
import builtinsArrayBufferConstructorTest from "./ArrayBuffer/BuiltinsArrayBufferConstructorTest.test";
import builtinsArrayBufferIsViewTest from "./ArrayBuffer/BuiltinsArrayBufferIsViewTest.test";
import builtinsArrayBufferLikeTest from "./ArrayBuffer/BuiltinsArrayBufferLikeTest.test";
import builtinsArrayBufferSliceTest from "./ArrayBuffer/BuiltinsArrayBufferSliceTest.test";
import builtinsArrayBufferViewTest from "./ArrayBuffer/BuiltinsArrayBufferViewTest.test";
import builtinsConcatArrayIndexTest from "./ArrayBuffer/BuiltinsConcatArrayIndexTest.test";
import builtinsConcatArrayJoinTest from "./ArrayBuffer/BuiltinsConcatArrayJoinTest.test";
import builtinsConcatArrayLengthTest from "./ArrayBuffer/BuiltinsConcatArrayLengthTest.test";
import builtinsConcatArraySliceTest from "./ArrayBuffer/BuiltinsConcatArraySliceTest.test";

import typeArrayFloat32ArrayTest from './TypeArray/TypeArrayFloat32Array.test';
import typeArrayInt16ArrayTest from './TypeArray/TypeArrayInt16Array.test';
import typeArrayInt32ArrayTest from './TypeArray/TypeArrayInt32Array.test';
import typeArrayInt8ArrayTest from './TypeArray/TypeArrayInt8Array.test';
import typeArrayUint16ArrayTest from './TypeArray/TypeArrayUint16Array.test';
import typeArrayUint32ArrayTest from './TypeArray/TypeArrayUint32Array.test';
import typeArrayUint8ArrayTest from './TypeArray/TypeArrayUint8Array.test';
import typeArrayUint8ClampedArrayTest from './TypeArray/TypeArrayUint8ClampedArray.test';






export default function testsuite() {

  builtinsArrayConcatTest();
  builtinsArrayEntriesTest();
  builtinsArrayCopyWithinTest();
  builtinsArrayEveryTest();
  builtinsArrayIsArrayTest();
  builtinsArrayOfTest();
  builtinsArrayPopTest();
  builtinsArrayPushTest();
  builtinsArrayShiftTest();
  builtinsArrayUnshiftTest();
  builtinsArrayValuesTest();
  builtinsArrayReverseTest();
  builtinsArrayJoinTest();
  builtinsArrayReduceRightTest();
  builtinsArrayReduceTest();
  builtinsArrayFlatMapTest();
  builtinsArrayFlatTest();
  builtinsArrayForEachTest();
  builtinsArrayIncludesTest();
  builtinsArrayToLocaleStringTest();
  builtinsArrayToReversedTest();
  builtinsArrayToSortedTest();
  builtinsArrayToStringTest();
  builtinsArraySortTest();
  builtinsArraySpliceTest();
  builtinsArrayFillTest();
  builtinsArrayFilterTest();
  builtinsArrayFindIndexTest();
  builtinsArrayFindTest();
  builtinsArrayFromTest();
  builtinsArrayAtTest();
  builtinsArrayConstructorTest();
  builtinsArrayKeysTest();
  builtinsArrayLastIndexOfTest();
  builtinsArrayMapTest();
  BuiltinsArrayIndexOfTest();
  BuiltinsArraySliceTest();
  BuiltinsArraySomeTest();
  builtinsArrayConstructor1Test();
  builtinsArrayConstructor2Test();
  builtinsArrayConstructorTestErr();

  builtinsArrayBufferByteLengthTest();
  builtinsArrayBufferConstructorTest();
  builtinsArrayBufferIsViewTest();
  builtinsArrayBufferLikeTest();
  builtinsArrayBufferSliceTest();
  builtinsArrayBufferViewTest();
  builtinsConcatArrayIndexTest();
  builtinsConcatArrayJoinTest();
  builtinsConcatArrayLengthTest();
  builtinsConcatArraySliceTest();

  typeArrayFloat32ArrayTest();
  typeArrayInt8ArrayTest();
  typeArrayInt16ArrayTest();
  typeArrayInt32ArrayTest();
  typeArrayUint8ArrayTest();
  typeArrayUint8ClampedArrayTest();
  typeArrayUint16ArrayTest();
  typeArrayUint32ArrayTest();

}
