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

export default function globalAndLocalReferencesTest() {

  describe("ActsGlobalAndLocalReferencesTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number      GlobalReference_Create_0100
     * @tc.name        GlobalReference_Create_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("GlobalReference_Create_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('GlobalReference_Create_0100 start');
        let cls = new Foo();
        let result = cls.test_GlobalReference_Create();
        expect(result).assertTrue();
        console.log('GlobalReference_Create_0100 done');
        done();
        console.log('GlobalReference_Create_0100 end');
      })

    /**
     * @tc.number      Reference_StrictEquals_0100
     * @tc.name        Reference_StrictEquals_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Reference_StrictEquals_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Reference_StrictEquals_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_StrictEquals();
        expect(result).assertTrue();
        console.log('Reference_StrictEquals_0100 done');
        done();
        console.log('Reference_StrictEquals_0100 end');
      })

    /**
     * @tc.number      GlobalReference_Delete_0100
     * @tc.name        GlobalReference_Delete_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("GlobalReference_Delete_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('GlobalReference_Delete_0100 start');
        let cls = new Foo();
        let result = cls.test_GlobalReference_Delete();
        expect(result).assertTrue();
        console.log('GlobalReference_Delete_0100 done');
        done();
        console.log('GlobalReference_Delete_0100 end');
      })

    /**
     * @tc.number      Reference_Delete_0100
     * @tc.name        Reference_Delete_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Reference_Delete_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Reference_Delete_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_Delete();
        expect(result).assertTrue();
        console.log('Reference_Delete_0100 done');
        done();
        console.log('Reference_Delete_0100 end');
      })

    /**
     * @tc.number      EnsureEnoughReferences_0100
     * @tc.name        EnsureEnoughReferences_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("EnsureEnoughReferences_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('EnsureEnoughReferences_0100 start');
        let cls = new Foo();
        let result = cls.test_EnsureEnoughReferences();
        expect(result).assertTrue();
        console.log('EnsureEnoughReferences_0100 done');
        done();
        console.log('EnsureEnoughReferences_0100 end');
      })
  })
}