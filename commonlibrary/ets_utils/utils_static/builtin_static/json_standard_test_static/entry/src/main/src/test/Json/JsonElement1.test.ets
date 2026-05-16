/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function JsonElement1Test() {
  describe('JsonElement1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   JsonElementTest001
     * @tc.number SUB_BUILTINS_JsonElement1_TEST_0100
     * @tc.desc   test JsonElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsonElementTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const longElem = new jsonx.JsonElement();
        longElem.setLong(123456789);
        expect(longElem.asLong()).assertEqual(123456789);
        const bigintElem = new jsonx.JsonElement();
        bigintElem.setBigInt(123456789123456789n);
        expect(bigintElem.asBigInt()).assertEqual(123456789123456789n)
    });

    /**
     * @tc.name   JsonElementTest002
     * @tc.number SUB_BUILTINS_JsonElement1_TEST_0200
     * @tc.desc   test JsonElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsonElementTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const longElem = jsonx.JsonElement.createLong(42);
        expect(longElem.asLong()).assertEqual(42);
        const bigintElem = jsonx.JsonElement.createBigInt(1000000000000000000000000n);
        expect(bigintElem.asBigInt()).assertEqual(1000000000000000000000000n)
    });

    /**
     * @tc.name   JsonElementTest003
     * @tc.number SUB_BUILTINS_JsonElement1_TEST_0300
     * @tc.desc   test JsonElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsonElementTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const intElem = jsonx.JsonElement.createInteger(30)
        let longValue = intElem.asLong()
        expect(longValue).assertEqual(30);

        const doubleElem = jsonx.JsonElement.createDouble(1234.5)
        let maybeLong = doubleElem.tryAsLong()
        expect(maybeLong).assertEqual(undefined);
    });

    /**
     * @tc.name   JsonElementTest004
     * @tc.number SUB_BUILTINS_JsonElement1_TEST_0400
     * @tc.desc   test JsonElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsonElementTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const objectElem = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
        objectElem.setElement("name", jsonx.JsonElement.createString("John Doe"));
        objectElem.setElement("age", jsonx.JsonElement.createLong(30));
        objectElem.setElement("isActive", jsonx.JsonElement.createBoolean(true));
        objectElem.setElement("money", jsonx.JsonElement.createBigInt(1000000000000n));
        expect(objectElem.getLong("age")).assertEqual(30);
        expect(objectElem.tryGetLong("name")).assertEqual(0);
        expect(objectElem.tryGetLong("name",1000)).assertEqual(1000);
        expect(objectElem.getBigInt("money")).assertEqual(1000000000000n);
        expect(objectElem.tryGetBigInt("name",123456789n)).assertEqual(123456789n);
    });

    /**
     * @tc.name   JsonElementTest005
     * @tc.number SUB_BUILTINS_JsonElement1_TEST_0500
     * @tc.desc   test JsonElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsonElementTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        let str = '9007199254740991'  // Double.MAX_SAFE_INTEGER
        let opt: jsonx.ParseOptions = {bigIntMode: jsonx.BigIntMode.PARSE_AS_BIGINT} as jsonx.ParseOptions;
        let elem = JSON.parseJsonElement(str, opt)
        expect(elem.asLong()).assertEqual(9007199254740991);
        expect(elem.asDouble()).assertEqual(9007199254740991);
        expect(elem.tryAsBigInt()).assertEqual(9007199254740991n);
        expect(elem.asBigInt()).assertEqual(9007199254740991n);

        str = '9007199254740992'
        elem = JSON.parseJsonElement(str, opt)
        expect(elem.asLong()).assertEqual(9007199254740992);
        expect(elem.asBigInt()).assertEqual(9007199254740992n);
        try{
            elem.asDouble()
            expect().assertFail()
        }catch(err){
            err = err as RangeError;
            expect(err instanceof RangeError).assertEqual(true);
            expect(err.message).assertEqual(`'9007199254740992' is not a double`);
        }

        str = '1000000000000000000000000'  // 10^24
        elem = JSON.parseJsonElement(str, opt)
        try{
            elem.asLong()
            expect().assertFail()
        }catch(err){
            err = err as jsonx.JsonTypeError;
            expect(err instanceof jsonx.JsonTypeError).assertEqual(true);
            expect(err.message).assertEqual(`Expected long, but element stores different value type.`);
        }
        expect(elem.tryAsLong()).assertEqual(undefined);
    });

    /**
     * @tc.name   JsonElementTest006
     * @tc.number SUB_BUILTINS_JsonElement1_TEST_0600
     * @tc.desc   test JsonElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsonElementTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        let str = '9223372036854775807'  // Double.MAX_SAFE_INTEGER
        let opt: jsonx.ParseOptions = {bigIntMode: jsonx.BigIntMode.ALWAYS_PARSE_AS_BIGINT} as jsonx.ParseOptions;
        let elem = JSON.parseJsonElement(str, opt)
        expect(elem.asBigInt()).assertEqual(9223372036854775807n);
        try{
            elem.asLong()
            expect().assertFail()
        }catch(err){
            err = err as jsonx.JsonTypeError;
            expect(err instanceof jsonx.JsonTypeError).assertEqual(true);
            expect(err.message).assertEqual(`Expected long, but element stores different value type.`);
        }

        str = '-9223372036854775808'
        elem = JSON.parseJsonElement(str, opt)
        expect(elem.asBigInt()).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   JsonElementTest007
     * @tc.number SUB_BUILTINS_JsonElement1_TEST_0700
     * @tc.desc   test JsonElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsonElementTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        let str = '9007199254740991'  // Double.MAX_SAFE_INTEGER
        let opt: jsonx.ParseOptions = {bigIntMode: jsonx.BigIntMode.DEFAULT} as jsonx.ParseOptions;
        let elem = JSON.parseJsonElement(str, opt)
        expect(elem.asLong()).assertEqual(9007199254740991);
        expect(elem.asDouble()).assertEqual(9007199254740991);
        expect(elem.asBigInt()).assertEqual(9007199254740991n);

        str = '-9007199254740992'
        elem = JSON.parseJsonElement(str, opt)
        expect(elem.asLong()).assertEqual(-9007199254740992);
        try{
            elem.asDouble()
            expect().assertFail()
        }catch (err) {
            err = err as RangeError;
            expect(err instanceof RangeError).assertEqual(true);
            expect(err.message).assertEqual(`'-9007199254740992' is not a double`);
        }
        expect(elem.asBigInt()).assertEqual(-9007199254740992n);

        str = '9223372036854775808'  // Long.MAX_VALUE + 1
        try{
            JSON.parseJsonElement(str, opt)
            expect().assertFail()
        }catch (err) {
            err = err as FormatError;
            expect(err instanceof FormatError).assertEqual(true);
            expect(err.message).assertEqual('Value exceeds integer limits');
        }

        try{
            JSON.parseJsonElement(str)
            expect().assertFail()
        }catch (err) {
            err = err as FormatError;
            expect(err instanceof FormatError).assertEqual(true);
            expect(err.message).assertEqual('Value exceeds integer limits');
        }
    });

})

}