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

export default function exceptionsTest() {

  describe("ActsExceptionsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_EXISTUNHANDLEDERROR_0100
     * @tc.name      test_ExistUnhandledError_0001
     * @tc.desc      MediumTest
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_ExistUnhandledError_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ExistUnhandledError_0001 start');
        let cls = new Foo();
        let result = cls.test_ExistUnhandledError();
        expect(result).assertTrue();
        console.log('test_ExistUnhandledError_0001 done');
        done();
        console.log('test_ExistUnhandledError_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_RESETEROR_0100
     * @tc.name      test_ResetError_0001
     * @tc.desc      MediumTest
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_ResetError_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ResetError_0001 start');
        let cls = new Foo();
        let result = cls.test_ResetError();
        expect(result).assertTrue();
        console.log('test_ResetError_0001 done');
        done();
        console.log('test_ResetError_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0100
     * @tc.name      test_Handling_Error_0001
     * @tc.desc      exist unhandled error test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0001 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_01();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0001 done');
        done();
        console.log('test_Handling_Error_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0200
     * @tc.name      test_Handling_Error_0002
     * @tc.desc      exist unhandled error invalid env test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0002 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_02();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0002 done');
        done();
        console.log('test_Handling_Error_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0300
     * @tc.name      test_Handling_Error_0003
     * @tc.desc      reset error test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0003 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_03();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0003 done');
        done();
        console.log('test_Handling_Error_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0400
     * @tc.name      test_Handling_Error_0004
     * @tc.desc      get unhandled error test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0004 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_04();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0004 done');
        done();
        console.log('test_Handling_Error_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0500
     * @tc.name      test_Handling_Error_0005
     * @tc.desc      throw error test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0005 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_05();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0005 done');
        done();
        console.log('test_Handling_Error_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_Test_0100
     * @tc.name      test_Handling_Error_Test_0001
     * @tc.desc      describe error test one frame
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_Test_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_Test_0001 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_Test1();
        expect(result).assertTrue();
        console.log('test_Handling_Error_Test_0001 done');
        done();
        console.log('test_Handling_Error_Test_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_Test_0200
     * @tc.name      test_Handling_Error_Test_0002
     * @tc.desc      describe error test nested
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_Test_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_Test_0002 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_Test2();
        expect(result).assertTrue();
        console.log('test_Handling_Error_Test_0002 done');
        done();
        console.log('test_Handling_Error_Test_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_Test_0300
     * @tc.name      test_Handling_Error_Test_0003
     * @tc.desc      describe error thrown through native
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_Test_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_Test_0003 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_Test3();
        expect(result).assertTrue();
        console.log('test_Handling_Error_Test_0003 done');
        done();
        console.log('test_Handling_Error_Test_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0600
     * @tc.name      test_Handling_Error_0006
     * @tc.desc      exist invalid args test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0006 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_06();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0006 done');
        done();
        console.log('test_Handling_Error_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0700
     * @tc.name      test_Handling_Error_0007
     * @tc.desc      exist multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0007 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_07();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0007 done');
        done();
        console.log('test_Handling_Error_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0800
     * @tc.name      test_Handling_Error_0008
     * @tc.desc      exist multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0008 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_08();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0008 done');
        done();
        console.log('test_Handling_Error_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_0900
     * @tc.name      test_Handling_Error_0009
     * @tc.desc      exist multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0009 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_09();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0009 done');
        done();
        console.log('test_Handling_Error_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1000
     * @tc.name      test_Handling_Error_0010
     * @tc.desc      exist multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0010 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_10();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0010 done');
        done();
        console.log('test_Handling_Error_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1100
     * @tc.name      test_Handling_Error_0011
     * @tc.desc      reset multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0011 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_11();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0011 done');
        done();
        console.log('test_Handling_Error_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1200
     * @tc.name      test_Handling_Error_0012
     * @tc.desc      reset multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0012 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_12();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0012 done');
        done();
        console.log('test_Handling_Error_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1300
     * @tc.name      test_Handling_Error_0013
     * @tc.desc      reset multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0013 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_13();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0013 done');
        done();
        console.log('test_Handling_Error_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1400
     * @tc.name      test_Handling_Error_0014
     * @tc.desc      reset multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0014 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_14();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0014 done');
        done();
        console.log('test_Handling_Error_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1500
     * @tc.name      test_Handling_Error_0015
     * @tc.desc      reset envinvalid test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0015 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_15();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0015 done');
        done();
        console.log('test_Handling_Error_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1600
     * @tc.name      test_Handling_Error_0016
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0016 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_16();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0016 done');
        done();
        console.log('test_Handling_Error_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1700
     * @tc.name      test_Handling_Error_0017
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0017 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_17();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0017 done');
        done();
        console.log('test_Handling_Error_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1800
     * @tc.name      test_Handling_Error_0018
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0018 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_18();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0018 done');
        done();
        console.log('test_Handling_Error_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_1900
     * @tc.name      test_Handling_Error_0019
     * @tc.desc      reset multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0019 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_19();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0019 done');
        done();
        console.log('test_Handling_Error_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2000
     * @tc.name      test_Handling_Error_0020
     * @tc.desc      reset env invalid test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0020 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_20();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0020 done');
        done();
        console.log('test_Handling_Error_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2100
     * @tc.name      test_Handling_Error_0021
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0021 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_21();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0021 done');
        done();
        console.log('test_Handling_Error_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2200
     * @tc.name      test_Handling_Error_0022
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0022 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_22();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0022 done');
        done();
        console.log('test_Handling_Error_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2300
     * @tc.name      test_Handling_Error_0023
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0023 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_23();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0023 done');
        done();
        console.log('test_Handling_Error_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2400
     * @tc.name      test_Handling_Error_0024
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0024 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_24();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0024 done');
        done();
        console.log('test_Handling_Error_0024 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2500
     * @tc.name      test_Handling_Error_0025
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0025 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_25();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0025 done');
        done();
        console.log('test_Handling_Error_0025 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2600
     * @tc.name      test_Handling_Error_0026
     * @tc.desc      describe multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0026 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_26();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0026 done');
        done();
        console.log('test_Handling_Error_0026 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2700
     * @tc.name      test_Handling_Error_0027
     * @tc.desc      throw multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0027 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_27();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0027 done');
        done();
        console.log('test_Handling_Error_0027 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_2800
     * @tc.name      test_Handling_Error_0028
     * @tc.desc      manual create and throw error test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0028 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_28();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0028 done');
        done();
        console.log('test_Handling_Error_0028 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3000
     * @tc.name      test_Handling_Error_0030
     * @tc.desc      get unhandled invalid args test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0030 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_30();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0030 done');
        done();
        console.log('test_Handling_Error_0030 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3100
     * @tc.name      test_Handling_Error_0031
     * @tc.desc      get unhandled multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0031 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_31();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0031 done');
        done();
        console.log('test_Handling_Error_0031 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3200
     * @tc.name      test_Handling_Error_0032
     * @tc.desc      get unhandled multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0032 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_32();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0032 done');
        done();
        console.log('test_Handling_Error_0032 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3300
     * @tc.name      test_Handling_Error_0033
     * @tc.desc      get unhandled multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0033 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_33();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0033 done');
        done();
        console.log('test_Handling_Error_0033 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3500
     * @tc.name      test_Handling_Error_0035
     * @tc.desc      get unhandled multiple call test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0035 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_35();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0035 done');
        done();
        console.log('test_Handling_Error_0035 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3600
     * @tc.name      test_Handling_Error_0036
     * @tc.desc      combined scenes test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0036 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_36();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0036 done');
        done();
        console.log('test_Handling_Error_0036 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3700
     * @tc.name      test_Handling_Error_0037
     * @tc.desc      combined scenes test
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0037 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_37();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0037 done');
        done();
        console.log('test_Handling_Error_0037 end');
      })

    /**
     * @tc.number    SUB_ANI_HANDING_ERROR_3800
     * @tc.name      test_Handling_Error_0038
     * @tc.desc      call error stack
     * @tc.size      Function
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_Handling_Error_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Handling_Error_0038 start');
        let cls = new Foo();
        let result = cls.test_Handling_Error_38();
        expect(result).assertTrue();
        console.log('test_Handling_Error_0038 done');
        done();
        console.log('test_Handling_Error_0038 end');
      })
  })
}
