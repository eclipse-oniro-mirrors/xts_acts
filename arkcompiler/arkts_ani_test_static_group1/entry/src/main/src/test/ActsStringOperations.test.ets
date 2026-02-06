/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function stringOperationsTest() {

  describe("ActsStringOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    STRING_UTF8_0100
     * @tc.name      test_String_Utf8_0001
     * @tc.desc      new string 'hello world' and get string is ok
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0001 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0001 done');
        done();
        console.log('test_String_Utf8_0001 end');
      });

    /**
     * @tc.number    STRING_UTF8_0200
     * @tc.name      test_String_Utf8_0002
     * @tc.desc      new string and get UTF8 multiByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0002 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_02();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0002 done');
        done();
        console.log('test_String_Utf8_0002 end');
      });

    /**
     * @tc.number    STRING_UTF8_0300
     * @tc.name      test_String_Utf8_0003
     * @tc.desc      new string and get UTF8 basic string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0003 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_03();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0003 done');
        done();
        console.log('test_String_Utf8_0003 end');
      });

    /**
     * @tc.number    STRING_UTF8_0400
     * @tc.name      test_String_Utf8_0004
     * @tc.desc      new string and get UTF8 empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0004 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_04();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0004 done');
        done();
        console.log('test_String_Utf8_0004 end');
      });

    /**
     * @tc.number    STRING_UTF8_0500
     * @tc.name      test_String_Utf8_0005
     * @tc.desc      new string and get UTF8 empty buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0005 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_05();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0005 done');
        done();
        console.log('test_String_Utf8_0005 end');
      });

    /**
     * @tc.number    STRING_UTF8_0600
     * @tc.name      test_String_Utf8_0006
     * @tc.desc      new string and get UTF8 special buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0006 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_06();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0006 done');
        done();
        console.log('test_String_Utf8_0006 end');
      });

    /**
     * @tc.number    STRING_UTF8_0700
     * @tc.name      test_String_Utf8_0007
     * @tc.desc      new string and get UTF8 buffer size 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0007 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_07();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0007 done');
        done();
        console.log('test_String_Utf8_0007 end');
      });

    /**
     * @tc.number    STRING_UTF8_0800
     * @tc.name      test_String_Utf8_0008
     * @tc.desc      new string and get UTF8 null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0008 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_08();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0008 done');
        done();
        console.log('test_String_Utf8_0008 end');
      });

    /**
     * @tc.number    STRING_UTF8_0900
     * @tc.name      test_String_Utf8_0009
     * @tc.desc      new string get UTF8 null string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0009 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_09();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0009 done');
        done();
        console.log('test_String_Utf8_0009 end');
      });

    /**
     * @tc.number    STRING_UTF8_1000
     * @tc.name      test_String_Utf8_0010
     * @tc.desc      new string and get UTF8 null buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0010 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_10();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0010 done');
        done();
        console.log('test_String_Utf8_0010 end');
      });

    /**
     * @tc.number    STRING_UTF8_1100
     * @tc.name      test_String_Utf8_0011
     * @tc.desc      new string and get UTF8 null result pointer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0011 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_11();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0011 done');
        done();
        console.log('test_String_Utf8_0011 end');
      });

    /**
     * @tc.number    STRING_UTF8_1200
     * @tc.name      test_String_Utf8_0012
     * @tc.desc      new string and get UTF8 buffer too small
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0012 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_12();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0012 done');
        done();
        console.log('test_String_Utf8_0012 end');
      });

    /**
     * @tc.number    STRING_UTF8_1300
     * @tc.name      test_String_Utf8_0013
     * @tc.desc      new string and get UTF8 managed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0013 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_13();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0013 done');
        done();
        console.log('test_String_Utf8_0013 end');
      });

    /**
     * @tc.number    STRING_UTF8_1400
     * @tc.name      test_String_Utf8_0014
     * @tc.desc      new string and get UTF8 repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0014 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_14();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0014 done');
        done();
        console.log('test_String_Utf8_0014 end');
      });

    /**
     * @tc.number    STRING_UTF8_1500
     * @tc.name      test_String_Utf8_0015
     * @tc.desc      new string and get UTF8 zero symbol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_0015 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_15();
        expect(result).assertTrue();
        console.log('test_String_Utf8_0015 done');
        done();
        console.log('test_String_Utf8_0015 end');
      });

    /**
     * @tc.number    STRING_UTF8_SIZE_0100
     * @tc.name      test_String_Utf8_Size_0001
     * @tc.desc      new string and get UTF8 size null string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Size_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Size_0001 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Size();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Size_0001 done');
        done();
        console.log('test_String_Utf8_Size_0001 end');
      });

    /**
     * @tc.number    STRING_UTF8_SIZE_0200
     * @tc.name      test_String_Utf8_Size_0002
     * @tc.desc      new string and get UTF8 size null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Size_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Size_0002 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Size_02();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Size_0002 done');
        done();
        console.log('test_String_Utf8_Size_0002 end');
      });

    /**
     * @tc.number    STRING_UTF8_SIZE_0300
     * @tc.name      test_String_Utf8_Size_0003
     * @tc.desc      new string get UTF8 size null result pointer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Size_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Size_0003 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Size_03();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Size_0003 done');
        done();
        console.log('test_String_Utf8_Size_0003 end');
      });

    /**
     * @tc.number    STRING_UTF8_SIZE_0400
     * @tc.name      test_String_Utf8_Size_0004
     * @tc.desc      new string and get UTF8 size valid string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Size_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Size_0004 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Size_04();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Size_0004 done');
        done();
        console.log('test_String_Utf8_Size_0004 end');
      });

    /**
     * @tc.number    STRING_UTF8_SIZE_0500
     * @tc.name      test_String_Utf8_Size_0005
     * @tc.desc      new string and get UTF8 size valid multi byte string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Size_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Size_0005 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Size_05();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Size_0005 done');
        done();
        console.log('test_String_Utf8_Size_0005 end');
      });

    /**
     * @tc.number    STRING_UTF8_SIZE_0600
     * @tc.name      test_String_Utf8_Size_0006
     * @tc.desc      new string and get UTF8 size empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Size_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Size_0006 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Size_06();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Size_0006 done');
        done();
        console.log('test_String_Utf8_Size_0006 end');
      });

    /**
     * @tc.number    STRING_UTF8_SIZE_0700
     * @tc.name      test_String_Utf8_Size_0007
     * @tc.desc      new string and get UTF8 size repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Size_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Size_0007 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Size_07();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Size_0007 done');
        done();
        console.log('test_String_Utf8_Size_0007 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0100
     * @tc.name      test_String_Utf8_Substr_0001
     * @tc.desc      new string and get UTF8 substring, substr size mismatch multibyte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0001 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0001 done');
        done();
        console.log('test_String_Utf8_Substr_0001 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0200
     * @tc.name      test_String_Utf8_Substr_0002
     * @tc.desc      new string and get UTF8 substring substr contain end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0002 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_02();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0002 done');
        done();
        console.log('test_String_Utf8_Substr_0002 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0300
     * @tc.name      test_String_Utf8_Substr_0003
     * @tc.desc      new string and get UTF8 substring special string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0003 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_03();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0003 done');
        done();
        console.log('test_String_Utf8_Substr_0003 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0400
     * @tc.name      test_String_Utf8_Substr_0004
     * @tc.desc      new string and get UTF8 substring empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0004 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_04();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0004 done');
        done();
        console.log('test_String_Utf8_Substr_0004 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0500
     * @tc.name      test_String_Utf8_Substr_0005
     * @tc.desc      new string and get UTF8 substring null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0005 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_05();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0005 done');
        done();
        console.log('test_String_Utf8_Substr_0005 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0600
     * @tc.name      test_String_Utf8_Substr_0006
     * @tc.desc      new string and get UTF8 substring null string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0006 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_06();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0006 done');
        done();
        console.log('test_String_Utf8_Substr_0006 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0700
     * @tc.name      test_String_Utf8_Substr_0007
     * @tc.desc      new string and get UTF8 substring null buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0007 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_07();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0007 done');
        done();
        console.log('test_String_Utf8_Substr_0007 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0800
     * @tc.name      test_String_Utf8_Substr_0008
     * @tc.desc      new string get UTF8 substring null result pointer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0008 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_08();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0008 done');
        done();
        console.log('test_String_Utf8_Substr_0008 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_0900
     * @tc.name      test_String_Utf8_Substr_0009
     * @tc.desc      new string and get UTF8 substring valid substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0009 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_09();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0009 done');
        done();
        console.log('test_String_Utf8_Substr_0009 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1000
     * @tc.name      test_String_Utf8_Substr_0010
     * @tc.desc      new string and get UTF8 substring offset negative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0010 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_10();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0010 done');
        done();
        console.log('test_String_Utf8_Substr_0010 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1100
     * @tc.name      test_String_Utf8_Substr_0011
     * @tc.desc      new string and get UTF8 substring offset out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0011 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_11();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0011 done');
        done();
        console.log('test_String_Utf8_Substr_0011 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1200
     * @tc.name      test_String_Utf8_Substr_0012
     * @tc.desc      new string and get UTF8 substring size out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0012 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_12();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0012 done');
        done();
        console.log('test_String_Utf8_Substr_0012 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1300
     * @tc.name      test_String_Utf8_Substr_0013
     * @tc.desc      new string and get UTF8 substring size out of bounds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0013 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_13();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0013 done');
        done();
        console.log('test_String_Utf8_Substr_0013 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1400
     * @tc.name      test_String_Utf8_Substr_0014
     * @tc.desc      new string and get UTF8 substring empty substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0014 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_14();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0014 done');
        done();
        console.log('test_String_Utf8_Substr_0014 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1500
     * @tc.name      test_String_Utf8_Substr_0015
     * @tc.desc      new string and get UTF8 substring substr size negative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0015 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_15();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0015 done');
        done();
        console.log('test_String_Utf8_Substr_0015 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1600
     * @tc.name      test_String_Utf8_Substr_0016
     * @tc.desc      new string and get UTF8 substring buffer empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0016 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_16();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0016 done');
        done();
        console.log('test_String_Utf8_Substr_0016 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1700
     * @tc.name      test_String_Utf8_Substr_0017
     * @tc.desc      new string and get UTF8 substring buffer special
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0017 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_17();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0017 done');
        done();
        console.log('test_String_Utf8_Substr_0017 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1800
     * @tc.name      test_String_Utf8_Substr_0018
     * @tc.desc      new string and get UTF8 substring buffer size negative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0018 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_18();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0018 done');
        done();
        console.log('test_String_Utf8_Substr_0018 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_1900
     * @tc.name      test_String_Utf8_Substr_0019
     * @tc.desc      new string and get UTF8 substring buffer size 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0019 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_19();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0019 done');
        done();
        console.log('test_String_Utf8_Substr_0019 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_2000
     * @tc.name      test_String_Utf8_Substr_0020
     * @tc.desc      new string and get UTF8 substring buffer too small
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0020 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_20();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0020 done');
        done();
        console.log('test_String_Utf8_Substr_0020 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_2100
     * @tc.name      test_String_Utf8_Substr_0021
     * @tc.desc      new string and get UTF8 substring repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0021 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_21();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0021 done');
        done();
        console.log('test_String_Utf8_Substr_0021 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_2200
     * @tc.name      test_String_Utf8_Substr_0022
     * @tc.desc      new string and get UTF8 substring comUTF8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0022 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_22();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0022 done');
        done();
        console.log('test_String_Utf8_Substr_0022 end');
      });

    /**
     * @tc.number    STRING_UTF8_SUBSTR_2300
     * @tc.name      test_String_Utf8_Substr_0023
     * @tc.desc      new string and get UTF8 substring com get UTF8 substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf8_Substr_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf8_Substr_0023 start');
        let cls = new Foo();
        let result = cls.test_String_UTF8_Substr_23();
        expect(result).assertTrue();
        console.log('test_String_Utf8_Substr_0023 done');
        done();
        console.log('test_String_Utf8_Substr_0023 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0100
     * @tc.name      test_String_New_Utf8_0001
     * @tc.desc      new string new UTF8 null UTF8 string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0001 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0001 done');
        done();
        console.log('test_String_New_Utf8_0001 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0200
     * @tc.name      test_String_New_Utf8_0002
     * @tc.desc      new string new UTF8 empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0002 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_02();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0002 done');
        done();
        console.log('test_String_New_Utf8_0002 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0300
     * @tc.name      test_String_New_Utf8_0003
     * @tc.desc      new string new UTF8 long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0003 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_03();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0003 done');
        done();
        console.log('test_String_New_Utf8_0003 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0400
     * @tc.name      test_String_New_Utf8_0004
     * @tc.desc      new string new UTF8 valid multibyte string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0004 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_04();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0004 done');
        done();
        console.log('test_String_New_Utf8_0004 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0500
     * @tc.name      test_String_New_Utf8_0005
     * @tc.desc      new string new UTF8 null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0005 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_05();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0005 done');
        done();
        console.log('test_String_New_Utf8_0005 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0600
     * @tc.name      test_String_New_Utf8_0006
     * @tc.desc      new string new UTF8 smaller size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0006 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_06();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0006 done');
        done();
        console.log('test_String_New_Utf8_0006 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0700
     * @tc.name      test_String_New_Utf8_0007
     * @tc.desc      new string new UTF8 zero size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0007 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_07();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0007 done');
        done();
        console.log('test_String_New_Utf8_0007 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF8_0800
     * @tc.name      test_String_New_Utf8_0008
     * @tc.desc      new string new UTF8 repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0008 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_08();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0008 done');
        done();
        console.log('test_String_New_Utf8_0008 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_0900
     * @tc.name      test_String_New_Utf8_0009
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0009 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_09();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0009 done');
        done();
        console.log('test_String_New_Utf8_0009 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1000
     * @tc.name      test_String_New_Utf8_0010
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0010 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_10();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0010 done');
        done();
        console.log('test_String_New_Utf8_0010 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1100
     * @tc.name      test_String_New_Utf8_0011
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0011 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_11();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0011 done');
        done();
        console.log('test_String_New_Utf8_0011 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1200
     * @tc.name      test_String_New_Utf8_0012
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0012 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_12();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0012 done');
        done();
        console.log('test_String_New_Utf8_0012 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1300
     * @tc.name      test_String_New_Utf8_0013
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0013 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_12();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0013 done');
        done();
        console.log('test_String_New_Utf8_0013 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1400
     * @tc.name      test_String_New_Utf8_0014
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0014 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_14();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0014 done');
        done();
        console.log('test_String_New_Utf8_0014 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1500
     * @tc.name      test_String_New_Utf8_0015
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0015 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_15();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0015 done');
        done();
        console.log('test_String_New_Utf8_0015 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1600
     * @tc.name      test_String_New_Utf8_0016
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0016 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_16();
        expect(result).assertFalse();
        console.log('test_String_New_Utf8_0016 done');
        done();
        console.log('test_String_New_Utf8_0016 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1700
     * @tc.name      test_String_New_Utf8_0017
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0017 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_17();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0017 done');
        done();
        console.log('test_String_New_Utf8_0017 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1800
     * @tc.name      test_String_New_Utf8_0018
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0018 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_18();
        expect(result).assertFalse();
        console.log('test_String_New_Utf8_0018 done');
        done();
        console.log('test_String_New_Utf8_0018 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_1900
     * @tc.name      test_String_New_Utf8_0019
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0019 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_19();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0019 done');
        done();
        console.log('test_String_New_Utf8_0019 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_2000
     * @tc.name      test_String_New_Utf8_0020
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0020 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_20();
        expect(result).assertFalse();
        console.log('test_String_New_Utf8_0020 done');
        done();
        console.log('test_String_New_Utf8_0020 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_2100
     * @tc.name      test_String_New_Utf8_0021
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0021 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_21();
        expect(result).assertTrue();
        console.log('test_String_New_Utf8_0021 done');
        done();
        console.log('test_String_New_Utf8_0021 end');
      });

    /**
     * @tc.number    STRING_NEW_UTF8_2200
     * @tc.name      test_String_New_Utf8_0022
     * @tc.desc      new string new UTF8 and check char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf8_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf8_0022 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF8_22();
        expect(result).assertFalse();
        console.log('test_String_New_Utf8_0022 done');
        done();
        console.log('test_String_New_Utf8_0022 end');
      });

     /**
     * @tc.number    STRING_UTF16_0100
     * @tc.name      test_String_Utf16_0001
     * @tc.desc      new value num and get result is ok
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0001 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0001 done');
        done();
        console.log('test_String_Utf16_0001 end');
      });

     /**
     * @tc.number    STRING_UTF16_0200
     * @tc.name      test_String_Utf16_0002
     * @tc.desc      new string and get UTF16 null UTF16 string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0002 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_02();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0002 done');
        done();
        console.log('test_String_Utf16_0002 end');
      });

     /**
     * @tc.number    STRING_UTF16_0300
     * @tc.name      test_String_Utf16_0003
     * @tc.desc      new string and get UTF16 null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0003 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_03();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0003 done');
        done();
        console.log('test_String_Utf16_0003 end');
      });

     /**
     * @tc.number    STRING_UTF16_0400
     * @tc.name      test_String_Utf16_0004
     * @tc.desc      new string and get UTF16 empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0004 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_04();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0004 done');
        done();
        console.log('test_String_Utf16_0004 end');
      });

     /**
     * @tc.number    STRING_UTF16_0500
     * @tc.name      test_String_Utf16_0005
     * @tc.desc      new string and get UTF16 special string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0005 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_05();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0005 done');
        done();
        console.log('test_String_Utf16_0005 end');
      });

     /**
     * @tc.number    STRING_UTF16_0600
     * @tc.name      test_String_Utf16_0006
     * @tc.desc      new string and get UTF16 ascii string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0006 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_06();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0006 done');
        done();
        console.log('test_String_Utf16_0006 end');
      });

     /**
     * @tc.number    STRING_UTF16_0700
     * @tc.name      test_String_Utf16_0007
     * @tc.desc      new string and get UTF16 ascii string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0007 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_07();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0007 done');
        done();
        console.log('test_String_Utf16_0007 end');
      });

     /**
     * @tc.number    STRING_UTF16_0800
     * @tc.name      test_String_Utf16_0008
     * @tc.desc      new string and get UTF16 non ascii string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0008 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_08();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0008 done');
        done();
        console.log('test_String_Utf16_0008 end');
      });

     /**
     * @tc.number    STRING_UTF16_0900
     * @tc.name      test_String_Utf16_0009
     * @tc.desc      new string get UTF16 null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0009 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_09();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0009 done');
        done();
        console.log('test_String_Utf16_0009 end');
      });

     /**
     * @tc.number    STRING_UTF16_1000
     * @tc.name      test_String_Utf16_0010
     * @tc.desc      new string get UTF16 buffer empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0010 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_10();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0010 done');
        done();
        console.log('test_String_Utf16_0010 end');
      });

     /**
     * @tc.number    STRING_UTF16_1100
     * @tc.name      test_String_Utf16_0011
     * @tc.desc      new string get UTF16 buffer bound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0011 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_11();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0011 done');
        done();
        console.log('test_String_Utf16_0011 end');
      });

     /**
     * @tc.number    STRING_UTF16_1200
     * @tc.name      test_String_Utf16_0012
     * @tc.desc      new string get UTF16 buffer bound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0012 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_12();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0012 done');
        done();
        console.log('test_String_Utf16_0012 end');
      });

     /**
     * @tc.number    STRING_UTF16_1300
     * @tc.name      test_String_Utf16_0013
     * @tc.desc      new string and get UTF16 buffer too small
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0013 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_13();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0013 done');
        done();
        console.log('test_String_Utf16_0013 end');
      });

     /**
     * @tc.number    STRING_UTF16_1400
     * @tc.name      test_String_Utf16_0014
     * @tc.desc      new string and get UTF16 buffer too small1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0014 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_14();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0014 done');
        done();
        console.log('test_String_Utf16_0014 end');
      });

     /**
     * @tc.number    STRING_UTF16_1500
     * @tc.name      test_String_Utf16_0015
     * @tc.desc      new string get UTF16 buffer too small
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0015 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_15();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0015 done');
        done();
        console.log('test_String_Utf16_0015 end');
      });

     /**
     * @tc.number    STRING_UTF16_1600
     * @tc.name      test_String_Utf16_0016
     * @tc.desc      new string and get UTF16 repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0016 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_16();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0016 done');
        done();
        console.log('test_String_Utf16_0016 end');
      });

    /**
     * @tc.number    STRING_UTF16_1700
     * @tc.name      test_String_Utf16_0017
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0017 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_17();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0017 done');
        done();
        console.log('test_String_Utf16_0017 end');
      });

    /**
     * @tc.number    STRING_UTF16_2100
     * @tc.name      test_String_Utf16_0021
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0021 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_21();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0021 done');
        done();
        console.log('test_String_Utf16_0021 end');
      });

    /**
     * @tc.number    STRING_UTF16_2200
     * @tc.name      test_String_Utf16_0022
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0022 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_22();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0022 done');
        done();
        console.log('test_String_Utf16_0022 end');
      });

    /**
     * @tc.number    STRING_UTF16_2300
     * @tc.name      test_String_Utf16_0023
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0023 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_23();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0023 done');
        done();
        console.log('test_String_Utf16_0023 end');
      });

    /**
     * @tc.number    STRING_UTF16_2400
     * @tc.name      test_String_Utf16_0024
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0024 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_24();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0024 done');
        done();
        console.log('test_String_Utf16_0024 end');
      });

    /**
     * @tc.number    STRING_UTF16_2500
     * @tc.name      test_String_Utf16_0025
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0025 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_25();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0025 done');
        done();
        console.log('test_String_Utf16_0025 end');
      });

    /**
     * @tc.number    STRING_UTF16_2600
     * @tc.name      test_String_Utf16_0026
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0026 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_26();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0026 done');
        done();
        console.log('test_String_Utf16_0026 end');
      });

    /**
     * @tc.number    STRING_UTF16_2700
     * @tc.name      test_String_Utf16_0027
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0027 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_27();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0027 done');
        done();
        console.log('test_String_Utf16_0027 end');
      });

    /**
     * @tc.number    STRING_UTF16_2800
     * @tc.name      test_String_Utf16_0028
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0028 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_28();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0028 done');
        done();
        console.log('test_String_Utf16_0028 end');
      });

    /**
     * @tc.number    STRING_UTF16_2900
     * @tc.name      test_String_Utf16_0029
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0029 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_29();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0029 done');
        done();
        console.log('test_String_Utf16_0029 end');
      });

    /**
     * @tc.number    STRING_UTF16_3000
     * @tc.name      test_String_Utf16_0030
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0030 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_30();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0030 done');
        done();
        console.log('test_String_Utf16_0030 end');
      });

    /**
     * @tc.number    STRING_UTF16_3100
     * @tc.name      test_String_Utf16_0031
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0031 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_31();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0031 done');
        done();
        console.log('test_String_Utf16_0031 end');
      });

    /**
     * @tc.number    STRING_UTF16_3200
     * @tc.name      test_String_Utf16_0032
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0032 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_32();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0032 done');
        done();
        console.log('test_String_Utf16_0032 end');
      });

    /**
     * @tc.number    STRING_UTF16_3300
     * @tc.name      test_String_Utf16_0033
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0033 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_33();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0033 done');
        done();
        console.log('test_String_Utf16_0033 end');
      });

    /**
     * @tc.number    STRING_UTF16_3400
     * @tc.name      test_String_Utf16_0034
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0034 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_34();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0034 done');
        done();
        console.log('test_String_Utf16_0034 end');
      });

    /**
     * @tc.number    STRING_UTF16_3500
     * @tc.name      test_String_Utf16_0035
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0035 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_35();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0035 done');
        done();
        console.log('test_String_Utf16_0035 end');
      });

    /**
     * @tc.number    STRING_UTF16_3600
     * @tc.name      test_String_Utf16_0036
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0036 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_36();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0036 done');
        done();
        console.log('test_String_Utf16_0036 end');
      });

    /**
     * @tc.number    STRING_UTF16_3700
     * @tc.name      test_String_Utf16_0037
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0037 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_37();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0037 done');
        done();
        console.log('test_String_Utf16_0037 end');
      });

    /**
     * @tc.number    STRING_UTF16_3800
     * @tc.name      test_String_Utf16_0038
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0038 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_38();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0038 done');
        done();
        console.log('test_String_Utf16_0038 end');
      });

    /**
     * @tc.number    STRING_UTF16_3900
     * @tc.name      test_String_Utf16_0039
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0039 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_39();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0039 done');
        done();
        console.log('test_String_Utf16_0039 end');
      });

    /**
     * @tc.number    STRING_UTF16_4000
     * @tc.name      test_String_Utf16_0040
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0040 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_40();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0040 done');
        done();
        console.log('test_String_Utf16_0040 end');
      });

    /**
     * @tc.number    STRING_UTF16_4100
     * @tc.name      test_String_Utf16_0041
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0041 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_41();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0041 done');
        done();
        console.log('test_String_Utf16_0041 end');
      });

    /**
     * @tc.number    STRING_UTF16_4200
     * @tc.name      test_String_Utf16_0042
     * @tc.desc      new string and get UTF16 comUTF8 to UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_0042 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_42();
        expect(result).assertTrue();
        console.log('test_String_Utf16_0042 done');
        done();
        console.log('test_String_Utf16_0042 end');
      });

     /**
     * @tc.number    STRING_UTF16_SIZE_0100
     * @tc.name      test_String_Utf16_Size_0001
     * @tc.desc      new string and get UTF16 size null string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Size_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Size_0001 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Size();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Size_0001 done');
        done();
        console.log('test_String_Utf16_Size_0001 end');
      });

     /**
     * @tc.number    STRING_UTF16_SIZE_0200
     * @tc.name      test_String_Utf16_Size_0002
     * @tc.desc      new string and get UTF16 size null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Size_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Size_0002 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Size_02();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Size_0002 done');
        done();
        console.log('test_String_Utf16_Size_0002 end');
      });

     /**
     * @tc.number    STRING_UTF16_SIZE_0300
     * @tc.name      test_String_Utf16_Size_0003
     * @tc.desc      new string get UTF16 size null result pointer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Size_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Size_0003 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Size_03();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Size_0003 done');
        done();
        console.log('test_String_Utf16_Size_0003 end');
      });

     /**
     * @tc.number    STRING_UTF16_SIZE_0400
     * @tc.name      test_String_Utf16_Size_0004
     * @tc.desc      new string and get UTF16 size valid string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Size_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Size_0004 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Size_04();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Size_0004 done');
        done();
        console.log('test_String_Utf16_Size_0004 end');
      });

     /**
     * @tc.number    STRING_UTF16_SIZE_0500
     * @tc.name      test_String_Utf16_Size_0005
     * @tc.desc      new string and get UTF16 size valid multi byte string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Size_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Size_0005 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Size_05();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Size_0005 done');
        done();
        console.log('test_String_Utf16_Size_0005 end');
      });

     /**
     * @tc.number    STRING_UTF16_SIZE_0600
     * @tc.name      test_String_Utf16_Size_0006
     * @tc.desc      new string get UTF16 size empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Size_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Size_0006 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Size_06();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Size_0006 done');
        done();
        console.log('test_String_Utf16_Size_0006 end');
      });

     /**
     * @tc.number    STRING_UTF16_SIZE_0700
     * @tc.name      test_String_Utf16_Size_0007
     * @tc.desc      new string and get UTF16 size repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Size_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Size_0007 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Size_07();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Size_0007 done');
        done();
        console.log('test_String_Utf16_Size_0007 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0100
     * @tc.name      test_String_Utf16_Substr_0001
     * @tc.desc      new string and get UTF16 substring multi byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0001 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0001 done');
        done();
        console.log('test_String_Utf16_Substr_0001 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0200
     * @tc.name      test_String_Utf16_Substr_0002
     * @tc.desc      new string and get UTF16 substring contain end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0002 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_02();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0002 done');
        done();
        console.log('test_String_Utf16_Substr_0002 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0300
     * @tc.name      test_String_Utf16_Substr_0003
     * @tc.desc      new string and get UTF16 substring string size bound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0003 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_03();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0003 done');
        done();
        console.log('test_String_Utf16_Substr_0003 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0400
     * @tc.name      test_String_Utf16_Substr_0004
     * @tc.desc      new string and get UTF16 substring string size bound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0004 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_04();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0004 done');
        done();
        console.log('test_String_Utf16_Substr_0004 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0500
     * @tc.name      test_String_Utf16_Substr_0005
     * @tc.desc      new string get UTF16 substring null string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0005 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_05();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0005 done');
        done();
        console.log('test_String_Utf16_Substr_0005 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0600
     * @tc.name      test_String_Utf16_Substr_0006
     * @tc.desc      new string and get UTF16 substring null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0006 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_06();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0006 done');
        done();
        console.log('test_String_Utf16_Substr_0006 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0700
     * @tc.name      test_String_Utf16_Substr_0007
     * @tc.desc      new string and get UTF16 substring null buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0007 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_07();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0007 done');
        done();
        console.log('test_String_Utf16_Substr_0007 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0800
     * @tc.name      test_String_Utf16_Substr_0008
     * @tc.desc      new string and get UTF16 substring null result pointer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0008 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_08();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0008 done');
        done();
        console.log('test_String_Utf16_Substr_0008 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_0900
     * @tc.name      test_String_Utf16_Substr_0009
     * @tc.desc      new string and get UTF16 substring empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0009 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_09();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0009 done');
        done();
        console.log('test_String_Utf16_Substr_0009 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_1000
     * @tc.name      test_String_Utf16_Substr_0010
     * @tc.desc      new string and get UTF16 substring special string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0010 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_10();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0010 done');
        done();
        console.log('test_String_Utf16_Substr_0010 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_1100
     * @tc.name      test_String_Utf16_Substr_0011
     * @tc.desc      new string and get UTF16 substring get partial string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0011 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_11();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0011 done');
        done();
        console.log('test_String_Utf16_Substr_0011 end');
      });

    /**
     * @tc.number    STRING_UTF16_SUBSTR_1200
     * @tc.name      test_String_Utf16_Substr_0012
     * @tc.desc      new string and get UTF16 substring off set negative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0012 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_12();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0012 done');
        done();
        console.log('test_String_Utf16_Substr_0012 end');
      });

    /**
     * @tc.number    STRING_UTF16_SUBSTR_1300
     * @tc.name      test_String_Utf16_Substr_0013
     * @tc.desc      new string and get UTF16 substring offset out of range1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0013 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_13();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0013 done');
        done();
        console.log('test_String_Utf16_Substr_0013 end');
      });

    /**
     * @tc.number    STRING_UTF16_SUBSTR_1400
     * @tc.name      test_String_Utf16_Substr_0014
     * @tc.desc      new string and get UTF16 substring offset out of range2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0014 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_14();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0014 done');
        done();
        console.log('test_String_Utf16_Substr_0014 end');
      });

    /**
     * @tc.number    STRING_UTF16_SUBSTR_1500
     * @tc.name      test_String_Utf16_Substr_0015
     * @tc.desc      new string and get UTF16 substring size negative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0015 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_15();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0015 done');
        done();
        console.log('test_String_Utf16_Substr_0015 end');
      });

    /**
     * @tc.number    STRING_UTF16_SUBSTR_1600
     * @tc.name      test_String_Utf16_Substr_0016
     * @tc.desc      new string and get UTF16 substring empty substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0016 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_16();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0016 done');
        done();
        console.log('test_String_Utf16_Substr_0016 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_1700
     * @tc.name      test_String_Utf16_Substr_0017
     * @tc.desc      new string and get UTF16 substring buffer size 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0017 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_17();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0017 done');
        done();
        console.log('test_String_Utf16_Substr_0017 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_1800
     * @tc.name      test_String_Utf16_Substr_0018
     * @tc.desc      new string and get UTF16 substring buffer too small1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0018 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_18();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0018 done');
        done();
        console.log('test_String_Utf16_Substr_0018 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_1900
     * @tc.name      test_String_Utf16_Substr_0019
     * @tc.desc      new string and get UTF16 substring buffer too small2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0019 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_19();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0019 done');
        done();
        console.log('test_String_Utf16_Substr_0019 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_2000
     * @tc.name      test_String_Utf16_Substr_0020
     * @tc.desc      new string and get UTF16 substring repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0020 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_20();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0020 done');
        done();
        console.log('test_String_Utf16_Substr_0020 end');
      });

     /**
     * @tc.number    STRING_UTF16_SUBSTR_2100
     * @tc.name      test_String_Utf16_Substr_0021
     * @tc.desc      new string and get UTF16 substring com UTF16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Utf16_Substr_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_Utf16_Substr_0021 start');
        let cls = new Foo();
        let result = cls.test_String_UTF16_Substr_21();
        expect(result).assertTrue();
        console.log('test_String_Utf16_Substr_0021 done');
        done();
        console.log('test_String_Utf16_Substr_0021 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0100
     * @tc.name      test_String_New_Utf16_0001
     * @tc.desc      new string new UTF16 null UTF16 string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0001 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0001 done');
        done();
        console.log('test_String_New_Utf16_0001 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0200
     * @tc.name      test_String_New_Utf16_0002
     * @tc.desc      new string new UTF16 empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0002 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_02();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0002 done');
        done();
        console.log('test_String_New_Utf16_0002 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0300
     * @tc.name      test_String_New_Utf16_0003
     * @tc.desc      new string new UTF16 null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0003 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_03();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0003 done');
        done();
        console.log('test_String_New_Utf16_0003 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0400
     * @tc.name      test_String_New_Utf16_0004
     * @tc.desc      new string new UTF16 ascii string1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0004 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_04();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0004 done');
        done();
        console.log('test_String_New_Utf16_0004 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0500
     * @tc.name      test_String_New_Utf16_0005
     * @tc.desc      new string new UTF16 ascii string2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0005 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_05();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0005 done');
        done();
        console.log('test_String_New_Utf16_0005 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0600
     * @tc.name      test_String_New_Utf16_0006
     * @tc.desc      new string new UTF16 non ascii string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0006 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_06();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0006 done');
        done();
        console.log('test_String_New_Utf16_0006 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0700
     * @tc.name      test_String_New_Utf16_0007
     * @tc.desc      new string new UTF16 mixed string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0007 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_07();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0007 done');
        done();
        console.log('test_String_New_Utf16_0007 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0800
     * @tc.name      test_String_New_Utf16_0008
     * @tc.desc      new string new UTF16 too long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0008 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_08();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0008 done');
        done();
        console.log('test_String_New_Utf16_0008 end');
      });

     /**
     * @tc.number    STRING_NEW_UTF16_0900
     * @tc.name      test_String_New_Utf16_0009
     * @tc.desc      new string new UTF16 repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_New_Utf16_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_String_New_Utf16_0009 start');
        let cls = new Foo();
        let result = cls.test_String_New_UTF16_09();
        expect(result).assertTrue();
        console.log('test_String_New_Utf16_0009 done');
        done();
        console.log('test_String_New_Utf16_0009 end');
      });
  })
}