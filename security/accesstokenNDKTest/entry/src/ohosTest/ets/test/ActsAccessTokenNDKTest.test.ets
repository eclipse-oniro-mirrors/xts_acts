/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { On, Driver, ON, Component} from "@ohos.UiTest";

export default function ActsAccessTokenNDKTest() {
  describe('ActsAccessTokenNDKTest', () => {
    
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      
    })
    beforeEach(() => {
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
     * @tc.number SUB_Access_Token_CheckPermission_0100.
     * @tc.name test OH_AT_CheckSelfPermission Test Normal Scene.
     * @tc.desc Checks whether this application has been granted the given permission.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Access_Token_CheckPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      demo();
      
      try{
        console.info("=======> SUB_Access_Token_CheckPermission_0100 start ==========");
        let result: boolean = await testNapi.osCheckSelfPermissionA('ohos.permission.CAMERA');
        console.info("=======>SUB_Access_Token_CheckPermission_0100 result：" + result);
        expect(result).assertFalse();
        done();
      } catch (error) {
        console.info("=======>SUB_Access_Token_CheckPermission_0100 catch error：" + error);
        expect(false).assertTrue();
        done();
      }
    })
  })
}

async function demo(): Promise<void> {
  let on: On = ON.text('不允许');
  let driver: Driver = Driver.create();
  let button: Component = await driver.findComponent(ON.type('on'));
  await button.click();
}