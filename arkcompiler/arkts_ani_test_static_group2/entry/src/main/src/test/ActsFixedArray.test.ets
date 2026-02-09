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

export default function fixedArrayTest() {

  describe("ActsFixedArrayTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GETLENGTH_0100
     * @tc.name      test_FixedArray_GetLength_0001
     * @tc.desc      get length error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_GetLength_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_GetLength_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength();
        expect(result).assertTrue();
        console.log('test_FixedArray_GetLength_0001 done');
        done();
        console.log('test_FixedArray_GetLength_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GETLENGTH_0200
     * @tc.name      test_FixedArray_GetLength_0002
     * @tc.desc      get length ok tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_GetLength_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_GetLength_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_GetLength_0002 done');
        done();
        console.log('test_FixedArray_GetLength_0002 end');
      })


    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GETLENGTH_0300
     * @tc.name      test_FixedArray_GetLength_0003
     * @tc.desc      get length types tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_GetLength_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_GetLength_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_GetLength_0003 done');
        done();
        console.log('test_FixedArray_GetLength_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BOOLEAN_0100
     * @tc.name      test_FixedArray_Boolean_0001
     * @tc.desc      get length error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Boolean_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean();
        expect(result).assertTrue();
        console.log('test_FixedArray_Boolean_0001 done');
        done();
        console.log('test_FixedArray_Boolean_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BOOLEAN_0200
     * @tc.name      test_FixedArray_Boolean_0002
     * @tc.desc      get boolean array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Boolean_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean_01();
        expect(result).assertFalse();
        console.log('test_FixedArray_Boolean_0002 done');
        done();
        console.log('test_FixedArray_Boolean_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BOOLEAN_0300
     * @tc.name      test_FixedArray_Boolean_0003
     * @tc.desc      check change from managed region boolean test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Boolean_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean_02();
        expect(result).assertFalse();
        console.log('test_FixedArray_Boolean_0003 done');
        done();
        console.log('test_FixedArray_Boolean_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BOOLEAN_0400
     * @tc.name      test_FixedArray_Boolean_0004
     * @tc.desc      check change from api region boolean test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Boolean_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean_03();
        expect(result).assertFalse();
        console.log('test_FixedArray_Boolean_0004 done');
        done();
        console.log('test_FixedArray_Boolean_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BOOLEAN_0500
     * @tc.name      test_FixedArray_Boolean_0005
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Boolean_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_Boolean_0005 done');
        done();
        console.log('test_FixedArray_Boolean_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BOOLEAN_0600
     * @tc.name      test_FixedArray_Boolean_0006
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Boolean_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Boolean_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Boolean_0006 done');
        done();
        console.log('test_FixedArray_Boolean_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BYTE_0100
     * @tc.name      test_FixedArray_Byte_0001
     * @tc.desc      set byte array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Byte_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte();
        expect(result).assertTrue();
        console.log('test_FixedArray_Byte_0001 done');
        done();
        console.log('test_FixedArray_Byte_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BYTE_0200
     * @tc.name      test_FixedArray_Byte_0002
     * @tc.desc      get byte array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Byte_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Byte_0002 done');
        done();
        console.log('test_FixedArray_Byte_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BYTE_0300
     * @tc.name      test_FixedArray_Byte_0003
     * @tc.desc      check change from managed region byte test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Byte_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte_02();
        expect(result).assertFalse();
        console.log('test_FixedArray_Byte_0003 done');
        done();
        console.log('test_FixedArray_Byte_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BYTE_0400
     * @tc.name      test_FixedArray_Byte_0004
     * @tc.desc      check change from api region byte test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Byte_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte_03();
        expect(result).assertFalse();
        console.log('test_FixedArray_Byte_0004 done');
        done();
        console.log('test_FixedArray_Byte_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BYTE_0500
     * @tc.name      test_FixedArray_Byte_0005
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Byte_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_Byte_0005 done');
        done();
        console.log('test_FixedArray_Byte_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BYTE_0600
     * @tc.name      test_FixedArray_Byte_0006
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Byte_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Byte_0006 done');
        done();
        console.log('test_FixedArray_Byte_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_BYTE_0700
     * @tc.name      test_FixedArray_Byte_0007
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Byte_0007 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte_06();
        expect(result).assertTrue();
        console.log('test_FixedArray_Byte_0007 done');
        done();
        console.log('test_FixedArray_Byte_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_CHAR_0100
     * @tc.name      test_FixedArray_Char_0001
     * @tc.desc      set char array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Char_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Char();
        expect(result).assertTrue();
        console.log('test_FixedArray_Char_0001 done');
        done();
        console.log('test_FixedArray_Char_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_CHAR_0200
     * @tc.name      test_FixedArray_Char_0002
     * @tc.desc      get char array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Char_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Char_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Char_0002 done');
        done();
        console.log('test_FixedArray_Char_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_CHAR_0300
     * @tc.name      test_FixedArray_Char_0003
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Char_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Char_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Char_0003 done');
        done();
        console.log('test_FixedArray_Char_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_CHAR_0400
     * @tc.name      test_FixedArray_Char_0004
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Char_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Char_03();
        expect(result).assertTrue();
        console.log('test_FixedArray_Char_0004 done');
        done();
        console.log('test_FixedArray_Char_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_CHAR_0500
     * @tc.name      test_FixedArray_Char_0005
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Char_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Char_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_Char_0005 done');
        done();
        console.log('test_FixedArray_Char_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_SHORT_0100
     * @tc.name      test_FixedArray_Short_0001
     * @tc.desc      set short array region error test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Short_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short();
        expect(result).assertTrue();
        console.log('test_FixedArray_Short_0001 done');
        done();
        console.log('test_FixedArray_Short_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_SHORT_0200
     * @tc.name      test_FixedArray_Short_0002
     * @tc.desc      get short array region error test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Short_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Short_0002 done');
        done();
        console.log('test_FixedArray_Short_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_SHORT_0300
     * @tc.name      test_FixedArray_Short_0003
     * @tc.desc      check change from managed region short test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Short_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short_02();
        expect(result).assertFalse();
        console.log('test_FixedArray_Short_0003 done');
        done();
        console.log('test_FixedArray_Short_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_SHORT_0400
     * @tc.name      test_FixedArray_Short_0004
     * @tc.desc      check change from api region short test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Short_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short_03();
        expect(result).assertFalse();
        console.log('test_FixedArray_Short_0004 done');
        done();
        console.log('test_FixedArray_Short_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_SHORT_0500
     * @tc.name      test_FixedArray_Short_0005
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Short_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_Short_0005 done');
        done();
        console.log('test_FixedArray_Short_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_SHORT_0600
     * @tc.name      test_FixedArray_Short_0006
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Short_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Short_0006 done');
        done();
        console.log('test_FixedArray_Short_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_SHORT_0700
     * @tc.name      test_FixedArray_Short_0007
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Short_0007 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short_06();
        expect(result).assertTrue();
        console.log('test_FixedArray_Short_0007 done');
        done();
        console.log('test_FixedArray_Short_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0100
     * @tc.name      test_FixedArray_Int_0001
     * @tc.desc      set int array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int();
        expect(result).assertTrue();
        console.log('test_FixedArray_Int_0001 done');
        done();
        console.log('test_FixedArray_Int_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0200
     * @tc.name      test_FixedArray_Int_0002
     * @tc.desc      set int array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Int_0002 done');
        done();
        console.log('test_FixedArray_Int_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0300
     * @tc.name      test_FixedArray_Int_0003
     * @tc.desc      get int array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Int_0003 done');
        done();
        console.log('test_FixedArray_Int_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0400
     * @tc.name      test_FixedArray_Int_0004
     * @tc.desc      check change from managed region int test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int_03();
        expect(result).assertFalse();
        console.log('test_FixedArray_Int_0004 done');
        done();
        console.log('test_FixedArray_Int_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0500
     * @tc.name      test_FixedArray_Int_0005
     * @tc.desc      check change from api region int test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int_04();
        expect(result).assertFalse();
        console.log('test_FixedArray_Int_0005 done');
        done();
        console.log('test_FixedArray_Int_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0600
     * @tc.name      test_FixedArray_Int_0006
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Int_0006 done');
        done();
        console.log('test_FixedArray_Int_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0700
     * @tc.name      test_FixedArray_Int_0007
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0007 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int_06();
        expect(result).assertTrue();
        console.log('test_FixedArray_Int_0007 done');
        done();
        console.log('test_FixedArray_Int_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_INT_0800
     * @tc.name      test_FixedArray_Int_0008
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Int_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Int_0008 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int_07();
        expect(result).assertTrue();
        console.log('test_FixedArray_Int_0008 done');
        done();
        console.log('test_FixedArray_Int_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0100
     * @tc.name      test_FixedArray_Long_0001
     * @tc.desc      set long array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long();
        expect(result).assertTrue();
        console.log('test_FixedArray_Long_0001 done');
        done();
        console.log('test_FixedArray_Long_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0200
     * @tc.name      test_FixedArray_Long_0002
     * @tc.desc      set long array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Long_0002 done');
        done();
        console.log('test_FixedArray_Long_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0300
     * @tc.name      test_FixedArray_Long_0003
     * @tc.desc      get long array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Long_0003 done');
        done();
        console.log('test_FixedArray_Long_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0400
     * @tc.name      test_FixedArray_Long_0004
     * @tc.desc      check change from managed region long test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long_03();
        expect(result).assertFalse();
        console.log('test_FixedArray_Long_0004 done');
        done();
        console.log('test_FixedArray_Long_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0500
     * @tc.name      test_FixedArray_Long_0005
     * @tc.desc      check change from api region long test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long_04();
        expect(result).assertFalse();
        console.log('test_FixedArray_Long_0005 done');
        done();
        console.log('test_FixedArray_Long_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0600
     * @tc.name      test_FixedArray_Long_0006
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Long_0006 done');
        done();
        console.log('test_FixedArray_Long_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0700
     * @tc.name      test_FixedArray_Long_0007
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0007 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long_06();
        expect(result).assertTrue();
        console.log('test_FixedArray_Long_0007 done');
        done();
        console.log('test_FixedArray_Long_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_LONG_0800
     * @tc.name      test_FixedArray_Long_0008
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Long_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Long_0008 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long_07();
        expect(result).assertTrue();
        console.log('test_FixedArray_Long_0008 done');
        done();
        console.log('test_FixedArray_Long_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0100
     * @tc.name      test_FixedArray_Float_0001
     * @tc.desc      set float array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float();
        expect(result).assertTrue();
        console.log('test_FixedArray_Float_0001 done');
        done();
        console.log('test_FixedArray_Float_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0200
     * @tc.name      test_FixedArray_Float_0002
     * @tc.desc      set float array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Float_0002 done');
        done();
        console.log('test_FixedArray_Float_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0300
     * @tc.name      test_FixedArray_Float_0003
     * @tc.desc      get float array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Float_0003 done');
        done();
        console.log('test_FixedArray_Float_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0400
     * @tc.name      test_FixedArray_Float_0004
     * @tc.desc      check change from managed region float test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float_03();
        expect(result).assertFalse();
        console.log('test_FixedArray_Float_0004 done');
        done();
        console.log('test_FixedArray_Float_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0500
     * @tc.name      test_FixedArray_Float_0005
     * @tc.desc      check change from api region float test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float_04();
        expect(result).assertFalse();
        console.log('test_FixedArray_Float_0005 done');
        done();
        console.log('test_FixedArray_Float_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0600
     * @tc.name      test_FixedArray_Float_0006
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Float_0006 done');
        done();
        console.log('test_FixedArray_Float_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0700
     * @tc.name      test_FixedArray_Float_0007
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0007 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float_06();
        expect(result).assertTrue();
        console.log('test_FixedArray_Float_0007 done');
        done();
        console.log('test_FixedArray_Float_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_FLOAT_0800
     * @tc.name      test_FixedArray_Float_0008
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Float_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Float_0008 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float_07();
        expect(result).assertTrue();
        console.log('test_FixedArray_Float_0008 done');
        done();
        console.log('test_FixedArray_Float_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0100
     * @tc.name      test_FixedArray_Double_0001
     * @tc.desc      set double array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double();
        expect(result).assertTrue();
        console.log('test_FixedArray_Double_0001 done');
        done();
        console.log('test_FixedArray_Double_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0200
     * @tc.name      test_FixedArray_Double_0002
     * @tc.desc      set double array region error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Double_0002 done');
        done();
        console.log('test_FixedArray_Double_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0300
     * @tc.name      test_FixedArray_Double_0003
     * @tc.desc      check change from managed region double test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Double_0003 done');
        done();
        console.log('test_FixedArray_Double_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0400
     * @tc.name      test_FixedArray_Double_0004
     * @tc.desc      check change from api region double test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double_03();
        expect(result).assertFalse();
        console.log('test_FixedArray_Double_0004 done');
        done();
        console.log('test_FixedArray_Double_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0500
     * @tc.name      test_FixedArray_Double_0005
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double_04();
        expect(result).assertFalse();
        console.log('test_FixedArray_Double_0005 done');
        done();
        console.log('test_FixedArray_Double_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0600
     * @tc.name      test_FixedArray_Double_0006
     * @tc.desc      set special value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Double_0006 done');
        done();
        console.log('test_FixedArray_Double_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0700
     * @tc.name      test_FixedArray_Double_0007
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0007 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double_06();
        expect(result).assertTrue();
        console.log('test_FixedArray_Double_0007 done');
        done();
        console.log('test_FixedArray_Double_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_REGION_DOUBLE_0800
     * @tc.name      test_FixedArray_Double_0008
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Double_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Double_0008 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double_07();
        expect(result).assertTrue();
        console.log('test_FixedArray_Double_0008 done');
        done();
        console.log('test_FixedArray_Double_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GET_REF_0100
     * @tc.name      test_FixedArray_Get_Ref_0001
     * @tc.desc      get ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Get_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Get_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get_Ref();
        expect(result).assertTrue();
        console.log('test_FixedArray_Get_Ref_0001 done');
        done();
        console.log('test_FixedArray_Get_Ref_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GET_REF_0200
     * @tc.name      test_FixedArray_Get_Ref_0002
     * @tc.desc      get ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Get_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Get_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get_Ref_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Get_Ref_0002 done');
        done();
        console.log('test_FixedArray_Get_Ref_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GET_REF_0300
     * @tc.name      test_FixedArray_Get_Ref_0003
     * @tc.desc      get ref ok tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Get_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Get_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get_Ref_02();
        expect(result).assertFalse();
        console.log('test_FixedArray_Get_Ref_0003 done');
        done();
        console.log('test_FixedArray_Get_Ref_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_REF_0100
     * @tc.name      test_FixedArray_New_Ref_0001
     * @tc.desc      new ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_Ref_0001 done');
        done();
        console.log('test_FixedArray_New_Ref_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_REF_0200
     * @tc.name      test_FixedArray_New_Ref_0002
     * @tc.desc      new ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_Ref_0002 done');
        done();
        console.log('test_FixedArray_New_Ref_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_REF_0300
     * @tc.name      test_FixedArray_New_Ref_0003
     * @tc.desc      new object array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref_02();
        expect(result).assertFalse();
        console.log('test_FixedArray_New_Ref_0003 done');
        done();
        console.log('test_FixedArray_New_Ref_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_REF_0400
     * @tc.name      test_FixedArray_New_Ref_0004
     * @tc.desc      new object array test 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_Ref_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref_03();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_Ref_0004 done');
        done();
        console.log('test_FixedArray_New_Ref_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_REF_0500
     * @tc.name      test_FixedArray_New_Ref_0005
     * @tc.desc      new object array test 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_Ref_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_Ref_0005 done');
        done();
        console.log('test_FixedArray_New_Ref_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_REF_0700
     * @tc.name      test_FixedArray_New_Ref_0007
     * @tc.desc      new large array types test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_Ref_0007 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref_06();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_Ref_0007 done');
        done();
        console.log('test_FixedArray_New_Ref_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_REF_0100
     * @tc.name      test_FixedArray_Set_Ref_0001
     * @tc.desc      set ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_Ref_0001 done');
        done();
        console.log('test_FixedArray_Set_Ref_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_REF_0200
     * @tc.name      test_FixedArray_Set_Ref_0002
     * @tc.desc      set ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_Ref_0002 done');
        done();
        console.log('test_FixedArray_Set_Ref_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_REF_0300
     * @tc.name      test_FixedArray_Set_Ref_0003
     * @tc.desc      set ref ok tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_Ref_0003 done');
        done();
        console.log('test_FixedArray_Set_Ref_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_REF_0400
     * @tc.name      test_FixedArray_Set_Ref_0004
     * @tc.desc      set ref error value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Set_Ref_0400 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref_03();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_Ref_0004 done');
        done();
        console.log('test_FixedArray_Set_Ref_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_REF_0500
     * @tc.name      test_FixedArray_Set_Ref_0005
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_Ref_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_Ref_0005 done');
        done();
        console.log('test_FixedArray_Set_Ref_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_REF_0600
     * @tc.name      test_FixedArray_Set_Ref_0006
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_Ref_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_Ref_0006 done');
        done();
        console.log('test_FixedArray_Set_Ref_0006 end');
      })
  })
}