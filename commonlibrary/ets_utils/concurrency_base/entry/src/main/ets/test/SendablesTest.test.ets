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
import { describe, afterAll, it, expect } from '@ohos/hypium'
import { testSendableSimpleDate, testSendableSimpleString, testSendableSimpleNumber, testSendableSimpleBoolean,
  testSendableSimpleSharedArrayBuffer, testSendableSimpleSharedArrayBufferAndUndefined,
  testSendableSimpleSharedArrayBufferAndNull, testSendableSimpleCombined0, testSendableSimpleCombined1,
  testSendableSimpleCombined2, testSendableSimpleCombinedAsType1, testSendableSimpleCombinedAsType2,
  testSendableContainerWithString, testSendableContainerWithNumber, testSendableContainerWithNested,
  testSendableContainerWithNullableString, testSendableContainerWithNullableNullField, testSendableContainerWithUndefinedString,
  testSendableContainerWithUndefinedField,testSendableWithGenericSendableField, testSendableContainerWithNullableNested,
  testSendableImportedInitializer }
  from './SendablesTest'

export default function SendablesTestWithAlloc() {
  let printLog = 'SendablesTestWithAlloc:';
  describe('SendablesTestWithAlloc', () => {

    afterAll(() => {
      console.info(printLog + 'total case over');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_001
     * @tc.name: testSendableSimpleDate
     * @tc.desc: checks sendable Date
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleDate', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleDate();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_002
     * @tc.name: testSendableSimpleString
     * @tc.desc: checks sendable String
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleString', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_003
     * @tc.name: testSendableSimpleNumber
     * @tc.desc: checks sendable number
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleNumber', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_004
     * @tc.name: testSendableSimpleBoolean
     * @tc.desc: checks sendable boolean
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleBoolean', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleBoolean();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_005
     * @tc.name: testSendableSimpleSharedArrayBuffer
     * @tc.desc: checks sendable SharedArrayBuffer
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleSharedArrayBuffer', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBuffer();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_006
     * @tc.name: testSendableSimpleSharedArrayBufferAndUndefined
     * @tc.desc: checks sendable SharedArrayBuffer|undefined
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleSharedArrayBufferAndUndefined', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndUndefined();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_007
     * @tc.name: testSendableSimpleSharedArrayBufferAndNull
     * @tc.desc: checks sendable SharedArrayBuffer|null
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleSharedArrayBufferAndNull', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndNull();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_008
     * @tc.name: testSendableSimpleCombined0
     * @tc.desc: checks sendable SharedArrayBuffer|null|undefined
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombined0', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined0();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_009
     * @tc.name: testSendableSimpleCombined1
     * @tc.desc: checks sendable SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombined1', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_010
     * @tc.name: testSendableSimpleCombined2
     * @tc.desc: checks sendable String as SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombined2', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_011
     * @tc.name: testSendableSimpleCombinedAsType1
     * @tc.desc: checks sendable String as type CombinedType = SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombinedAsType1', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_012
     * @tc.name: testSendableSimpleCombinedAsType2
     * @tc.desc: checks sendable SharedArrayBuffer as type CombinedType = SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableSimpleCombinedAsType2', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_013
     * @tc.name: testSendableContainerWithString
     * @tc.desc: checks sendable class containing String field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithString', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_014
     * @tc.name: testSendableContainerWithNumber
     * @tc.desc: checks sendable class containing number field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNumber', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_015
     * @tc.name: testSendableContainerWithNested
     * @tc.desc: checks sendable class containing nested sendable class with number field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNested', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_016
     * @tc.name: testSendableContainerWithNullableString
     * @tc.desc: checks sendable class containing string|null field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNullableString', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_017
     * @tc.name: testSendableContainerWithNullableNullField
     * @tc.desc: checks sendable class containing null in string|null field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNullableNullField', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableNullField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_018
     * @tc.name: testSendableContainerWithUndefinedString
     * @tc.desc: checks sendable class containing string|undefined field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithUndefinedString', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithUndefinedString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_019
     * @tc.name: testSendableContainerWithUndefinedField
     * @tc.desc: checks sendable class containing string|undefined field with undefined value
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithUndefinedField', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithUndefinedField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_020
     * @tc.name: testSendableWithGenericSendableField
     * @tc.desc: checks generic<T> sendable class containing T|undefined field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableWithGenericSendableField', 0, async (done: Function) => {
      let result: Object = await testSendableWithGenericSendableField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_021
     * @tc.name: testSendableContainerWithNullableNested
     * @tc.desc: checks sendable class containing nested sendable class with string|null|undefined field
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableContainerWithNullableNested', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_022
     * @tc.name: testSendableImportedInitializer
     * @tc.desc: checks sendable class containing number field with outer initializer
     * @tc.author: maxim-khramov
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableImportedInitializer', 0, async (done: Function) => {
      let result: Object = await testSendableImportedInitializer();
      expect(result).assertEqual("PASSED");
      done();
    })

  })
}
