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
     * @tc.name   testSendableSimpleDate
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_001
     * @tc.desc   checks sendable Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSimpleDate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleDate();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleString
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_002
     * @tc.desc   checks sendable String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSimpleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleNumber
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_003
     * @tc.desc   checks sendable number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSimpleNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleBoolean
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_004
     * @tc.desc   checks sendable boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSimpleBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleBoolean();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleSharedArrayBuffer
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_005
     * @tc.desc   checks sendable SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSimpleSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBuffer();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleSharedArrayBufferAndUndefined
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_006
     * @tc.desc   checks sendable SharedArrayBuffer|undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSimpleSharedArrayBufferAndUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndUndefined();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleSharedArrayBufferAndNull
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_007
     * @tc.desc   checks sendable SharedArrayBuffer|null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSimpleSharedArrayBufferAndNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleSharedArrayBufferAndNull();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleCombined0
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_008
     * @tc.desc   checks sendable SharedArrayBuffer|null|undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSimpleCombined0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined0();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleCombined1
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_009
     * @tc.desc   checks sendable SharedArrayBuffer|String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSimpleCombined1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleCombined2
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_010
     * @tc.desc   checks sendable String as SharedArrayBuffer|String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSimpleCombined2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombined2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleCombinedAsType1
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_011
     * @tc.desc   checks sendable String as type CombinedType = SharedArrayBuffer|String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSimpleCombinedAsType1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableSimpleCombinedAsType2
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_012
     * @tc.desc   checks sendable SharedArrayBuffer as type CombinedType = SharedArrayBuffer|String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSimpleCombinedAsType2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableSimpleCombinedAsType2();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithString
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_013
     * @tc.desc   checks sendable class containing String field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithNumber
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_014
     * @tc.desc   checks sendable class containing number field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNumber();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithNested
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_015
     * @tc.desc   checks sendable class containing nested sendable class with number field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithNullableString
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_016
     * @tc.desc   checks sendable class containing string|null field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithNullableString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithNullableNullField
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_017
     * @tc.desc   checks sendable class containing null in string|null field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithNullableNullField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableNullField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithUndefinedString
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_018
     * @tc.desc   checks sendable class containing string|undefined field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithUndefinedString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithUndefinedString();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithUndefinedField
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_019
     * @tc.desc   checks sendable class containing string|undefined field with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithUndefinedField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithUndefinedField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableWithGenericSendableField
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_020
     * @tc.desc   checks generic<T> sendable class containing T|undefined field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableWithGenericSendableField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableWithGenericSendableField();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableContainerWithNullableNested
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_021
     * @tc.desc   checks sendable class containing nested sendable class with string|null|undefined field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableContainerWithNullableNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableContainerWithNullableNested();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testSendableImportedInitializer
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_SENDABLE_022
     * @tc.desc   checks sendable class containing number field with outer initializer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableImportedInitializer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await testSendableImportedInitializer();
      expect(result).assertEqual("PASSED");
      done();
    })

  })
}
