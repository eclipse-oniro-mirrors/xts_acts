/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import abilityTest from './Ability.test';
import collectionsAddTest from './Array/CollectionsAdd.test';
import collectionsConcurrentModifyTest from './Array/CollectionsConcurrentModify.test';
import AsyncLocktest from './AsyncLock/AsyncLocktest.test';
import BitVectortest from './BitVector/BitVector.test';
import collectionsSecondtest from './CollectionsSecondtest.test';
import collectionstest from './Collectionstest.test';
import sendableLruCachetest from './SendableLruCache/SendableLruCachetest.test';
import Uint8ClampedArraytest from './TypeArray/ClampedArrayTest.test';
import ColectiontInt16Array from './TypeArray/ColectiontInt16Array.test';
import ColectiontInt32Array from './TypeArray/ColectiontInt32Array.test';
import ColectiontTypeArray from './TypeArray/ColectiontTypeArray.test';
import collectionsConcurrentInt8Array from './TypeArray/CollectionsConcurrentInt8Array.test';
import collectionsConcurrentUint8ClampedArray from './TypeArray/CollectionsConcurrentUint8ClampedArray.test';
import collectionsFifthtest from './TypeArray/CollectionsFifithTest.test';
import CollectionsFloattest from './TypeArray/CollectionsFloattest.test';
import collectionsForthtest from './TypeArray/CollectionsForthTest.test';
import collectionsInttest from './TypeArray/CollectionsInttest.test';
import collectionsSixtest from './TypeArray/CollectionsSixTest.test';
import collectionsThirdtest from './TypeArray/CollectionsThirdtest.test';

export default function testsuite() {
  abilityTest();
  collectionstest();
  collectionsSecondtest();
  collectionsThirdtest();
  collectionsForthtest();
  collectionsFifthtest();
  collectionsSixtest();
  sendableLruCachetest();
  CollectionsFloattest();
  collectionsInttest();
  Uint8ClampedArraytest();
  BitVectortest();
  AsyncLocktest();
  collectionsAddTest();
  ColectiontTypeArray();
  ColectiontInt32Array();
  ColectiontInt16Array();
  collectionsConcurrentModifyTest();
  collectionsConcurrentInt8Array();
  collectionsConcurrentUint8ClampedArray();
  
}