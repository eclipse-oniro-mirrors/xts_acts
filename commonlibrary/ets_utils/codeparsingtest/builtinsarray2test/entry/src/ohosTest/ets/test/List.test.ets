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