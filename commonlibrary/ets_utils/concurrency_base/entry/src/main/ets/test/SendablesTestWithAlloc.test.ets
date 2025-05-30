/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { testSendableSimpleDate, testSendableSimpleString, testSendableSimpleNumber, testSendableSimpleBoolean,
  testSendableSimpleSharedArrayBuffer, testSendableSimpleSharedArrayBufferAndUndefined,
  testSendableSimpleSharedArrayBufferAndNull, testSendableSimpleCombined0, testSendableSimpleCombined1,
  testSendableSimpleCombined2, testSendableSimpleCombinedAsType1, testSendableSimpleCombinedAsType2,
  testSendableContainerWithString, testSendableContainerWithNumber, testSendableContainerWithNested,
  testSendableContainerWithNullableString, testSendableContainerWithUndefinedString,
  testSendableWithGenericSendableField, testSendableContainerWithNullableNested, testSendableImportedInitializer }
  from './SendablesTestWithAlloc'

export default function SendablesTestWithAlloc() {
  let printLog = 'SendablesTestWithAlloc:';
  describe('SendablesTestWithAlloc', () => {

    afterAll(() => {
      console.info(printLog + 'total case over');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_001
     * @tc.name: testSendableSimpleDate
     * @tc.desc: checks sendable Date with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableSimpleDate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleDate();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_002
     * @tc.name: testSendableSimpleString
     * @tc.desc: checks sendable String with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableSimpleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_003
     * @tc.name: testSendableSimpleNumber
     * @tc.desc: checks sendable number with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableSimpleNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_004
     * @tc.name: testSendableSimpleBoolean
     * @tc.desc: checks sendable boolean with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableSimpleBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleBoolean();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_005
     * @tc.name: testSendableSimpleSharedArrayBuffer
     * @tc.desc: checks sendable SharedArrayBuffer with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableSimpleSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBuffer();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_006
     * @tc.name: testSendableSimpleSharedArrayBufferAndUndefined
     * @tc.desc: checks sendable SharedArrayBuffer|undefined with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableSimpleSharedArrayBufferAndUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndUndefined();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_007
     * @tc.name: testSendableSimpleSharedArrayBufferAndNull
     * @tc.desc: checks sendable SharedArrayBuffer|null with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleSharedArrayBufferAndNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndNull();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_008
     * @tc.name: testSendableSimpleCombined0
     * @tc.desc: checks sendable SharedArrayBuffer|null|undefined with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombined0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined0();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_009
     * @tc.name: testSendableSimpleCombined1
     * @tc.desc: checks sendable SharedArrayBuffer|String with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombined1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_010
     * @tc.name: testSendableSimpleCombined2
     * @tc.desc: checks sendable String as SharedArrayBuffer|String with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombined2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_011
     * @tc.name: testSendableSimpleCombinedAsType1
     * @tc.desc: checks sendable String as type CombinedType = SharedArrayBuffer|String with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombinedAsType1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_012
     * @tc.name: testSendableSimpleCombinedAsType2
     * @tc.desc: checks sendable SharedArrayBuffer as type CombinedType = SharedArrayBuffer|String with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombinedAsType2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_013
     * @tc.name: testSendableContainerWithString
     * @tc.desc: checks sendable class containing String field with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_014
     * @tc.name: testSendableContainerWithNumber
     * @tc.desc: checks sendable class containing number field with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_015
     * @tc.name: testSendableContainerWithNested
     * @tc.desc: checks sendable class containing nested sendable class with number field with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_016
     * @tc.name: testSendableContainerWithNullableString
     * @tc.desc: checks sendable class containing string|null field with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNullableString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_017
     * @tc.name: testSendableContainerWithUndefinedString
     * @tc.desc: checks sendable class containing string|undefined field with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithUndefinedString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithUndefinedString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_018
     * @tc.name: testSendableWithGenericSendableField
     * @tc.desc: checks generic<T> sendable class containing T|undefined field with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableWithGenericSendableField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableWithGenericSendableField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_019
     * @tc.name: testSendableContainerWithNullableNested
     * @tc.desc: checks sendable class containing nested sendable class with string|null|undefined field with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNullableNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLEWITHALLOC_020
     * @tc.name: testSendableImportedInitializer
     * @tc.desc: checks sendable class containing number field with outer initializer with allocation
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableImportedInitializer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableImportedInitializer();
      expect(result).assertEqual("PASSED");
      done();
    })

  })
}
