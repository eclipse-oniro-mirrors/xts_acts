/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import booleanTest from './Boolean/Boolean.test';
import dataViewTest from './DataView/DataView.test';
import arrayTest from './Array/Array.test';
import numberTest from './Number/Number.test';
import stringTest from './String/String.test';
import weakMapTest from './WeakMap/WeakMap.test';
import nativeJSONTest from './NativeJSON/NativeJSON.test';
import bigIntTest from './BigInt/BigInt.test';
import reflectTest from './Reflect/Reflect.test';
import localeTest from './Locale/Locale.test';
import objectTest from './Object/Object.test';
import intlTest from './Intl/Intl.test';
import promiseTest from './Promise/Promise.test';
import mapTest from './Map/Map.test';
import regExpTest from './RegExp/RegExp.test';
import setTest from './Set/Set.test';
import typedArrayTest from './TypedArray/TypedArray.test';
import errorTest from './Error/Error.test';
import weakRefTest from './WeakRef/WeakRef.test';
import weakSetTest from './WeakSet/WeakSet.test';
import Int8ArrayTest from './Array/TypeArray/Int8Array.test';
import Int16ArrayTest from './Array/TypeArray/Int16Array.test';
import Int32ArrayTest from './Array/TypeArray/Int32Array.test';
import BigInt64ArrayTest from './Array/TypeArray/BigInt64Array.test';
import BigUint64ArrayTest from './Array/TypeArray/BigUint64Array.test';
import Float32ArrayTest from './Array/TypeArray/Float32Array.test';
import Uint8ArrayTest from './Array/TypeArray/Uint8Array.test';
import Uint8ClampedArrayTest from './Array/TypeArray/Uint8ClampedArray.test';
import Uint16ArrayTest from './Array/TypeArray/Uint16Array.test';
import Uint32ArrayTest from './Array/TypeArray/Uint32Array.test';
import Float64ArrayTest from './Array/TypeArray/Float64Array.test';

export default function testsuite() {
  booleanTest();
  dataViewTest();
  arrayTest();
  numberTest();
  stringTest();
  weakMapTest();
  nativeJSONTest();
  bigIntTest();
  reflectTest();
  localeTest();
  objectTest();
  intlTest();
  promiseTest();
  mapTest();
  regExpTest();
  setTest();
  typedArrayTest();
  errorTest();
  weakRefTest();
  weakSetTest();
  Int8ArrayTest();
  Int16ArrayTest();
  Int32ArrayTest();
  BigInt64ArrayTest();
  BigUint64ArrayTest();
  Float32ArrayTest();
  Uint8ArrayTest();
  Uint8ClampedArrayTest();
  Uint16ArrayTest();
  Uint32ArrayTest();
  Float64ArrayTest();
}