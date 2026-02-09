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

export default function ArrayOperationsTest() {

  describe("ActsArrayOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number      SUB_ANI_ARRAY_GETLENGTH_0100
     * @tc.name        test_array_getLength_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_array_getLength_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_array_getLength_0100 start');
        let cls = new Foo();
        let result = cls.test_array_getLength();
        expect(result).assertTrue();
        console.log('test_array_getLength_0100 done');
        done();
        console.log('test_array_getLength_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_ARRAY_CREATEBUFFER_0100
     * @tc.name        test_array_CreateBuffer_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_array_CreateBuffer_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_array_CreateBuffer_0100 start');
        let cls = new Foo();
        let result = cls.test_array_CreateBuffer();
        expect(result).assertTrue();
        console.log('test_array_CreateBuffer_0100 done');
        done();
        console.log('test_array_CreateBuffer_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_ARRAY_NEW_SET_GET_0100
     * @tc.name        test_Array_New_Set_Get_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Array_New_Set_Get_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_New_Set_Get_0100 start');
        let cls = new Foo();
        let result = cls.test_Array_New_Set_Get();
        expect(result).assertTrue();
        console.log('test_Array_New_Set_Get_0100 done');
        done();
        console.log('test_Array_New_Set_Get_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_ARRAY_PUSH_POP_0100
     * @tc.name        test_Array_Push_Pop_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Array_Push_Pop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_Push_Pop_0100 start');
        let cls = new Foo();
        let result = cls.test_Array_Push_Pop();
        expect(result).assertTrue();
        console.log('test_Array_Push_Pop_0100 done');
        done();
        console.log('test_Array_Push_Pop_0100 end');
      })
  })
}