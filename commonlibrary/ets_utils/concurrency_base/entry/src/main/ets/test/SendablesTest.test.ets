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
     * @tc.name: testSendableSimpleDate
     * @tc.desc: checks sendable Date
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleDate', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleDate();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleString
     * @tc.desc: checks sendable String
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleString', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleNumber
     * @tc.desc: checks sendable number
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleNumber', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleBoolean
     * @tc.desc: checks sendable boolean
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleBoolean', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleBoolean();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleSharedArrayBuffer
     * @tc.desc: checks sendable SharedArrayBuffer
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleSharedArrayBuffer', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBuffer();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleSharedArrayBufferAndUndefined
     * @tc.desc: checks sendable SharedArrayBuffer|undefined
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleSharedArrayBufferAndUndefined', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndUndefined();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleSharedArrayBufferAndNull
     * @tc.desc: checks sendable SharedArrayBuffer|null
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleSharedArrayBufferAndNull', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndNull();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleCombined0
     * @tc.desc: checks sendable SharedArrayBuffer|null|undefined
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleCombined0', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined0();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleCombined1
     * @tc.desc: checks sendable SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleCombined1', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleCombined2
     * @tc.desc: checks sendable String as SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleCombined2', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleCombinedAsType1
     * @tc.desc: checks sendable String as type CombinedType = SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleCombinedAsType1', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableSimpleCombinedAsType2
     * @tc.desc: checks sendable SharedArrayBuffer as type CombinedType = SharedArrayBuffer|String
     * @tc.author: maxim-khramov
     */
    it('testSendableSimpleCombinedAsType2', 0, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithString
     * @tc.desc: checks sendable class containing String field
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithString', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithNumber
     * @tc.desc: checks sendable class containing number field
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithNumber', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithNested
     * @tc.desc: checks sendable class containing nested sendable class with number field
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithNested', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithNullableString
     * @tc.desc: checks sendable class containing string|null field
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithNullableString', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithNullableNullField
     * @tc.desc: checks sendable class containing null in string|null field
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithNullableNullField', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableNullField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithUndefinedString
     * @tc.desc: checks sendable class containing string|undefined field
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithUndefinedString', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithUndefinedString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithUndefinedField
     * @tc.desc: checks sendable class containing string|undefined field with undefined value
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithUndefinedField', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithUndefinedField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableWithGenericSendableField
     * @tc.desc: checks generic<T> sendable class containing T|undefined field
     * @tc.author: maxim-khramov
     */
    it('testSendableWithGenericSendableField', 0, async (done: Function) => {
      let result: Object = await testSendableWithGenericSendableField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableContainerWithNullableNested
     * @tc.desc: checks sendable class containing nested sendable class with string|null|undefined field
     * @tc.author: maxim-khramov
     */
    it('testSendableContainerWithNullableNested', 0, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: testSendableImportedInitializer
     * @tc.desc: checks sendable class containing number field with outer initializer
     * @tc.author: maxim-khramov
     */
    it('testSendableImportedInitializer', 0, async (done: Function) => {
      let result: Object = await testSendableImportedInitializer();
      expect(result).assertEqual("PASSED");
      done();
    })

  })
}
