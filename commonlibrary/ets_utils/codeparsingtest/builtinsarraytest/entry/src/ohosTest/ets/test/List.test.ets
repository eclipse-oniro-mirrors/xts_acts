/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

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
import builtinsArrayToSplicedTest from './array/BuiltinsArrayToSplicedTest.test';
import builtinsArrayToStringTest from './array/BuiltinsArrayToStringTest.test';
import builtinsArrayUnshiftTest from './array/BuiltinsArrayUnshift.test';
import builtinsArrayValuesTest from './array/BuiltinsArrayValues.test';
import builtinsArrayAtTest from './array/BuildinsArrayAtTest.test';
import builtinsArrayConstructorTest from './array/BuildinsArrayConstructorTest.test';
import builtinsArrayKeysTest from './array/BuildinsArrayKeysTest.test';
import builtinsArrayMapTest from './array/BuildinsArrayMapTest.test';
import builtinsArrayLastIndexOfTest from './array/BuildinsArrayLastIndexOfTest.test';
import BuiltinsArrayIndexOfTest from './array/BuiltinsArrayIndexOfTest.test';
import BuiltinsArraySliceTest from './array/BuiltinsArraySliceTest.test';
import BuiltinsArraySomeTest from './array/BuiltinsArraySomeTest.test';
import ArrayConstructor1Test from './array/ArrayCombination1Test.test';
import ArrayConstructor2Test from './array/ArrayCombination2Test.test';
import ArrayConstructorTestErr from './array/ArrayCombinationTestErr.test';

import builtinsArrayBufferByteLengthTest from "./ArrayBuffer/BuildinsArrayBufferByteLengthTest.test";
import builtinsArrayBufferConstructorTest from "./ArrayBuffer/BuildinsArrayBufferConstructorTest.test";
import builtinsArrayBufferIsViewTest from "./ArrayBuffer/BuildinsArrayBufferIsViewTest.test";
import builtinsArrayBufferLikeTest from "./ArrayBuffer/BuildinsArrayBufferLikeTest.test";
import builtinsArrayBufferSliceTest from "./ArrayBuffer/BuildinsArrayBufferSliceTest.test";
import builtinsArrayBufferViewTest from "./ArrayBuffer/BuildinsArrayBufferViewTest.test";
import builtinsArrayLikeIndexTest from "./ArrayBuffer/BuiltinsArrayLikeIndexTest.test";
import builtinsArrayLikeLengthTest from "./ArrayBuffer/BuiltinsArrayLikeLengthTest.test";
import builtinsConcatArrayIndexTest from "./ArrayBuffer/BuiltinsConcatArrayIndexTest.test";
import builtinsConcatArrayJoinTest from "./ArrayBuffer/BuiltinsConcatArrayJoinTest.test";
import builtinsConcatArrayLengthTest from "./ArrayBuffer/BuiltinsConcatArrayLengthTest.test";
import builtinsConcatArraySliceTest from "./ArrayBuffer/BuiltinsConcatArraySliceTest.test";
import builtinsReadonlyArrayKeysTest from "./ReadonlyArray/BuildinsReadonlyArrayKeysTest.test";
import builtinsReadonlyArrayLastIndexOfTest from "./ReadonlyArray/BuildinsReadonlyArrayLastIndexOfTest.test";
import builtinsReadonlyArrayMapTest from "./ReadonlyArray/BuildinsReadonlyArrayMapTest.test";
import builtinsReadonlyArrayForEachTest from "./ReadonlyArray/BuiltinsReadonlyArrayForEachTest.test";
import builtinsReadonlyArrayIncludesTest from "./ReadonlyArray/BuiltinsReadonlyArrayIncludesTest.test";
import builtinsReadonlyArrayIndexOfTest from "./ReadonlyArray/BuiltinsReadonlyArrayIndexOfTest.test";
import builtinsReadonlyArrayJoinTest from "./ReadonlyArray/BuiltinsReadonlyArrayJoinTest.test";
import builtinsReadonlyArrayReduceTest from "./ReadonlyArray/BuiltinsReadonlyArrayReduce.test";
import builtinsReadonlyArrayReduceRightTest from "./ReadonlyArray/BuiltinsReadonlyArrayReduceRight.test";
import builtinsReadonlyArraySliceTest from "./ReadonlyArray/BuiltinsReadonlyArraySliceTest.test";
import builtinsReadonlyArraySomeTest from "./ReadonlyArray/BuiltinsReadonlyArraySomeTest.test";
import builtinsReadonlyArrayToLocaleStringTest from "./ReadonlyArray/BuiltinsReadonlyArrayToLocaleStringTest.test";
import builtinsReadonlyArrayToStringTest from "./ReadonlyArray/BuiltinsReadonlyArrayToStringTest.test";
import builtinsReadonlyArrayValuesTest from "./ReadonlyArray/BuiltinsReadonlyArrayValues.test";
import builtinsReadonlyArrayAtTest from "./ReadonlyArray/ReadonlyArrayAt.test";
import builtinsReadonlyArrayConcatTest from "./ReadonlyArray/ReadonlyArrayConcat.test";
import builtinsReadonlyArrayEntriesTest from "./ReadonlyArray/ReadonlyArrayEntries.test";
import builtinsReadonlyArrayEveryTest from "./ReadonlyArray/ReadonlyArrayEvery.test";
import builtinsRegExpExecArrayGroupsTest from "./RegExpArray/RegExpExecArrayGroups.test";
import builtinsRegExpExecArrayIndexTest from "./RegExpArray/RegExpExecArrayIndex.test";
import builtinsRegExpExecArrayInputTest from "./RegExpArray/RegExpExecArrayInput.test";
import builtinsRegExpExecArrayStringTest from "./RegExpArray/RegExpExecArrayString.test";
import builtinsRegExpMatchArrayGroupsTest from "./RegExpArray/RegExpMatchArrayGroups.test";
import builtinsRegExpMatchArrayIndexTest from "./RegExpArray/RegExpMatchArrayIndex.test";
import builtinsRegExpMatchArrayInputTest from "./RegExpArray/RegExpMatchArrayInput.test";
import builtinsRegExpMatchArrayStringTest from "./RegExpArray/RegExpMatchArrayString.test";
import RegExpCombination1Test from "./RegExpArray/RegExpCombination1Test.test";
import typeArrayBigInt64ArrayTest from './TypeArray/TypeArrayBigInt64Array.test';
import typeArrayBigUint64ArrayTest from './TypeArray/TypeArrayBigUint64Array.test';
import typeArrayFloat32ArrayTest from './TypeArray/TypeArrayFloat32Array.test';
import typeArrayFloat64ArrayTest from './TypeArray/TypeArrayFloat64Array.test';
import typeArrayInt16ArrayTest from './TypeArray/TypeArrayInt16Array.test';
import typeArrayInt32ArrayTest from './TypeArray/TypeArrayInt32Array.test';
import typeArrayInt8ArrayTest from './TypeArray/TypeArrayInt8Array.test';
import typeArrayUint16ArrayTest from './TypeArray/TypeArrayUint16Array.test';
import typeArrayUint32ArrayTest from './TypeArray/TypeArrayUint32Array.test';
import typeArrayUint8ArrayTest from './TypeArray/TypeArrayUint8Array.test';
import typeArrayUint8ClampedArrayTest from './TypeArray/TypeArrayUint8ClampedArray.test';

import indexedCollections01Test from './TypeArray2/IndexedCollections01.test';
import indexedCollections02Test from './TypeArray2/IndexedCollections02.test';
import indexedCollections03Test from './TypeArray2/IndexedCollections03.test';
import indexedCollections04Test from './TypeArray2/IndexedCollections04.test';
import indexedCollections05Test from './TypeArray2/IndexedCollections05.test';
import indexedCollections06Test from './TypeArray2/IndexedCollections06.test';
import indexedCollections07Test from './TypeArray2/IndexedCollections07.test';
import indexedCollections08Test from './TypeArray2/IndexedCollections08.test';
import indexedCollections09Test from './TypeArray2/IndexedCollections09.test';
import indexedCollections10Test from './TypeArray2/IndexedCollections10.test';
import indexedCollections11Test from './TypeArray2/IndexedCollections11.test';
import indexedCollections12Test from './TypeArray2/IndexedCollections12.test';
import indexedCollections13Test from './TypeArray2/IndexedCollections13.test';
import indexedCollections14Test from './TypeArray2/IndexedCollections14.test';
import indexedCollections15Test from './TypeArray2/IndexedCollections15.test';
import indexedCollections16Test from './TypeArray2/IndexedCollections16.test';
import indexedCollections17Test from './TypeArray2/IndexedCollections17.test';
import indexedCollections18Test from './TypeArray2/IndexedCollections18.test';
import indexedCollections19Test from './TypeArray2/IndexedCollections19.test';
import indexedCollections20Test from './TypeArray2/IndexedCollections20.test';


export default function testsuite() {
  typeArrayBigInt64ArrayTest();
  typeArrayBigUint64ArrayTest();
  typeArrayFloat32ArrayTest();
  typeArrayFloat64ArrayTest();
  typeArrayInt8ArrayTest();
  typeArrayInt16ArrayTest();
  typeArrayInt32ArrayTest();
  typeArrayUint8ArrayTest();
  typeArrayUint8ClampedArrayTest();
  typeArrayUint16ArrayTest();
  typeArrayUint32ArrayTest();
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
  builtinsArrayToSplicedTest();
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
  ArrayConstructor1Test();
  ArrayConstructor2Test();
  ArrayConstructorTestErr();
  
  builtinsArrayBufferByteLengthTest();
  builtinsArrayBufferConstructorTest();
  builtinsArrayBufferIsViewTest();
  builtinsArrayBufferLikeTest();
  builtinsArrayBufferSliceTest();
  builtinsArrayBufferViewTest();
  builtinsArrayLikeIndexTest();
  builtinsArrayLikeLengthTest();
  builtinsConcatArrayIndexTest();
  builtinsConcatArrayJoinTest();
  builtinsConcatArrayLengthTest();
  builtinsConcatArraySliceTest();

  builtinsReadonlyArrayKeysTest();
  builtinsReadonlyArrayLastIndexOfTest();
  builtinsReadonlyArrayMapTest();
  builtinsReadonlyArrayForEachTest();
  builtinsReadonlyArrayIncludesTest();
  builtinsReadonlyArrayIndexOfTest();
  builtinsReadonlyArrayJoinTest();
  builtinsReadonlyArrayReduceTest();
  builtinsReadonlyArrayReduceRightTest();
  builtinsReadonlyArraySliceTest();
  builtinsReadonlyArraySomeTest();
  builtinsReadonlyArrayToLocaleStringTest();
  builtinsReadonlyArrayToStringTest();
  builtinsReadonlyArrayValuesTest();
  builtinsReadonlyArrayAtTest();
  builtinsReadonlyArrayConcatTest();
  builtinsReadonlyArrayEntriesTest();
  builtinsReadonlyArrayEveryTest();

  builtinsRegExpExecArrayGroupsTest();
  builtinsRegExpExecArrayIndexTest();
  builtinsRegExpExecArrayInputTest();
  builtinsRegExpExecArrayStringTest();
  builtinsRegExpMatchArrayGroupsTest();
  builtinsRegExpMatchArrayIndexTest();
  builtinsRegExpMatchArrayInputTest();
  builtinsRegExpMatchArrayStringTest();
  RegExpCombination1Test();

  indexedCollections01Test();
  indexedCollections02Test();
  indexedCollections03Test();
  indexedCollections04Test();
  indexedCollections05Test();
  indexedCollections06Test();
  indexedCollections07Test();
  indexedCollections08Test();
  indexedCollections09Test();
  indexedCollections10Test();
  indexedCollections11Test();
  indexedCollections12Test();
  indexedCollections13Test();
  indexedCollections14Test();
  indexedCollections15Test();
  indexedCollections16Test();
  indexedCollections17Test();
  indexedCollections18Test();
  indexedCollections19Test();
  indexedCollections20Test();
}