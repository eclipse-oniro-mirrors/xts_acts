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

export default function ScopeSupportTest() {

  describe("ActsScopeSupportTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number     SUB_ANI_CREATE_LOCAL_SCOPE_0100
     * @tc.name       test_Create_Local_Scope_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Local_Scope_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Local_Scope_0001 start');
        let cls = new Foo();
        let result = cls.test_Create_Local_Scope();
        expect(result).assertTrue();
        console.log('test_Create_Local_Scope_0001 done');
        done();
        console.log('test_Create_Local_Scope_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0100
     * @tc.name       test_Create_Escape_Local_Scope_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0001 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0001 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0200
     * @tc.name       test_Create_Escape_Local_Scope_0002
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0002 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_02();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0002 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0002 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0300
     * @tc.name       test_Create_Escape_Local_Scope_0003
     * @tc.desc       create escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0003 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_03();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0003 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0003 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0400
     * @tc.name       test_Create_Escape_Local_Scope_0004
     * @tc.desc       destroy local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0004 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_04();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0004 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0004 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0500
     * @tc.name       test_Create_Escape_Local_Scope_0005
     * @tc.desc       destroy escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0005 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_05();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0005 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0005 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0600
     * @tc.name       test_Create_Escape_Local_Scope_0006
     * @tc.desc       destroy escape local scope null
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0006 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_06();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0006 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0006 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0700
     * @tc.name       test_Create_Escape_Local_Scope_0007
     * @tc.desc       destroy escape local scope undefinde
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0007 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_07();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0007 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0007 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0800
     * @tc.name       test_Create_Escape_Local_Scope_0008
     * @tc.desc       test HugeNrRefs
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0008 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_08();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0008 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0008 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_0900
     * @tc.name       test_Create_Escape_Local_Scope_0009
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0009 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_09();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0009 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0009 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1000
     * @tc.name       test_Create_Escape_Local_Scope_0010
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0010 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_10();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0010 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0010 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1100
     * @tc.name       test_Create_Escape_Local_Scope_0011
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0011 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_11();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0011 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0011 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1200
     * @tc.name       test_Create_Escape_Local_Scope_0012
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0012 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_12();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0012 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0012 end');
      })
 
    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1300
     * @tc.name       test_Create_Escape_Local_Scope_0013
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0013 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_13();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0013 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0013 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1400
     * @tc.name       test_Create_Escape_Local_Scope_0014
     * @tc.desc       destroy local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0014 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_14();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0014 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0014 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1500
     * @tc.name       test_Create_Escape_Local_Scope_0015
     * @tc.desc       destroy local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0015 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_15();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0015 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0015 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1600
     * @tc.name       test_Create_Escape_Local_Scope_0016
     * @tc.desc       create escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0016 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_16();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0016 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0016 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1700
     * @tc.name       test_Create_Escape_Local_Scope_0017
     * @tc.desc       create escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0017 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_17();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0017 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0017 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1800
     * @tc.name       test_Create_Escape_Local_Scope_0018
     * @tc.desc       create escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0018 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_18();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0018 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0018 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_1900
     * @tc.name       test_Create_Escape_Local_Scope_0019
     * @tc.desc       create escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0019 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_19();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0019 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0019 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2000
     * @tc.name       test_Create_Escape_Local_Scope_0020
     * @tc.desc       create escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0020 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_20();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0020 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0020 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2100
     * @tc.name       test_Create_Escape_Local_Scope_0021
     * @tc.desc       destroy escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0021 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_21();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0021 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0021 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2200
     * @tc.name       test_Create_Escape_Local_Scope_0022
     * @tc.desc       destroy escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0022 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_22();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0022 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0022 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2300
     * @tc.name       test_Create_Escape_Local_Scope_0023
     * @tc.desc       destroy escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0023 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_23();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0023 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0023 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2400
     * @tc.name       test_Create_Escape_Local_Scope_0024
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0024 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_24();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0024 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0024 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2500
     * @tc.name       test_Create_Escape_Local_Scope_0025
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0025 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_25();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0025 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0025 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2600
     * @tc.name       test_Create_Escape_Local_Scope_0026
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0026 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_26();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0026 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0026 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2700
     * @tc.name       test_Create_Escape_Local_Scope_0027
     * @tc.desc       create local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0027 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_27();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0027 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0027 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2800
     * @tc.name       test_Create_Escape_Local_Scope_0028
     * @tc.desc       destroy escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0028 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_28();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0028 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0028 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_2900
     * @tc.name       test_Create_Escape_Local_Scope_0029
     * @tc.desc       destroy escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0029 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_29();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0029 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0029 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_3000
     * @tc.name       test_Create_Escape_Local_Scope_0030
     * @tc.desc       destroy escape local scope
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0030 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_30();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0030 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0030 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_3100
     * @tc.name       test_Create_Escape_Local_Scope_0031
     * @tc.desc       create local scope invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0031 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_31();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0031 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0031 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_3200
     * @tc.name       test_Create_Escape_Local_Scope_0032
     * @tc.desc       destroy local scope invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0032 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_32();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0032 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0032 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_3300
     * @tc.name       test_Create_Escape_Local_Scope_0033
     * @tc.desc       create escape local scope invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0033 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_33();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0033 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0033 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_3400
     * @tc.name       test_Create_Escape_Local_Scope_0034
     * @tc.desc       destroy escape local scope invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0034 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_34();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0034 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0034 end');
      })

    /**
     * @tc.number     SUB_ANI_CREATE_ESCAPE_LOCAL_SCOPE_3500
     * @tc.name       test_Create_Escape_Local_Scope_0035
     * @tc.desc       destroy escape local scope invalid result
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Create_Escape_Local_Scope_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Create_Escape_Local_Scope_0035 start');
        let cls = new Foo();
        let result = cls.test_Create_Escape_Local_Scope_35();
        expect(result).assertTrue();
        console.log('test_Create_Escape_Local_Scope_0035 done');
        done();
        console.log('test_Create_Escape_Local_Scope_0035 end');
      })

    /**
     * @tc.number     SUB_ANI_ENSURE_ENOUGH_REFERENCES_0100
     * @tc.name       test_Ensure_Enough_References_0001
     * @tc.desc       ensure enough references
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Ensure_Enough_References_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Ensure_Enough_References_0001 start');
        let cls = new Foo();
        let result = cls.test_Ensure_Enough_References_01();
        expect(result).assertTrue();
        console.log('test_Ensure_Enough_References_0001 done');
        done();
        console.log('test_Ensure_Enough_References_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_ENSURE_ENOUGH_REFERENCES_0200
     * @tc.name       test_Ensure_Enough_References_0002
     * @tc.desc       ensure enough references invalid args
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Ensure_Enough_References_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Ensure_Enough_References_0002 start');
        let cls = new Foo();
        let result = cls.test_Ensure_Enough_References_02();
        expect(result).assertTrue();
        console.log('test_Ensure_Enough_References_0002 done');
        done();
        console.log('test_Ensure_Enough_References_0002 end');
      })

    /**
     * @tc.number     SUB_ANI_ENSURE_ENOUGH_REFERENCES_0300
     * @tc.name       test_Ensure_Enough_References_0003
     * @tc.desc       ensure references
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Ensure_Enough_References_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Ensure_Enough_References_0003 start');
        let cls = new Foo();
        let result = cls.test_Ensure_Enough_References_03();
        expect(result).assertTrue();
        console.log('test_Ensure_Enough_References_0003 done');
        done();
        console.log('test_Ensure_Enough_References_0003 end');
      })

    /**
     * @tc.number     SUB_ANI_ENSURE_ENOUGH_REFERENCES_0400
     * @tc.name       test_Ensure_Enough_References_0004
     * @tc.desc       test Huge NrRefs
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Ensure_Enough_References_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Ensure_Enough_References_0004 start');
        let cls = new Foo();
        let result = cls.test_Ensure_Enough_References_04();
        expect(result).assertTrue();
        console.log('test_Ensure_Enough_References_0004 done');
        done();
        console.log('test_Ensure_Enough_References_0004 end');
      })

    /**
     * @tc.number     SUB_ANI_ENSURE_ENOUGH_REFERENCES_0500
     * @tc.name       test_Ensure_Enough_References_0005
     * @tc.desc       ensure enough references invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Ensure_Enough_References_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Ensure_Enough_References_0005 start');
        let cls = new Foo();
        let result = cls.test_Ensure_Enough_References_05();
        expect(result).assertTrue();
        console.log('test_Ensure_Enough_References_0005 done');
        done();
        console.log('test_Ensure_Enough_References_0005 end');
      })

  })
}