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
import { Driver, ON, MatchPattern, Component, UiWindow, Rect } from '@ohos.UiTest'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function inputMethodListJSUnit() {
  describe('inputMethodListJSUnitTest', () => {
    let driver: Driver;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((done: Function) => {
      try {
        driver = Driver.create();
        console.info('====>beforeAll Driver.create success');
        done();
      } catch (err) {
        console.info('====>beforeAll Driver.create err:'+JSON.stringify(err));
        done();
      }

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
     * @tc.name   SUB_InputMethod_IME_inputMethodList_001
     * @tc.number SUB_InputMethod_IME_inputMethodList_001
     * @tc.desc   the list of inputMethod test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethod_IME_inputMethodList_001', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_InputMethod_IME_inputMethodList_001 start");
        await driver.delayMs(2000);
        let dialogComponent1: Component = await driver.findComponent(ON.type('Dialog'));
        console.info("====>SUB_InputMethod_IME_inputMethodList_001 dialogComponent1: " + JSON.stringify(dialogComponent1));
        expect(dialogComponent1 === null).assertTrue();
        let testComponent: Component = await driver.findComponent(ON.id('input1'));
        console.info("====>SUB_InputMethod_IME_inputMethodList_001 testComponent: " + JSON.stringify(testComponent));
        await testComponent.click();
        console.info("====>SUB_InputMethod_IME_inputMethodList_001 click success");
        await driver.delayMs(4000);
        let dialogComponent2: Component = await driver.findComponent(ON.type('Dialog'));
        console.info("====>SUB_InputMethod_IME_inputMethodList_001 dialogComponent2: " + JSON.stringify(dialogComponent2));
        expect(dialogComponent2 !== null).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_InputMethod_IME_inputMethodList_001 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  })
}