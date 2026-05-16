/**
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

import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {UiDriver, BY } from '@ohos.UiTest'
import { startAbility, stopApplication } from './Utils.test';

const TestTag = 'testTag';
const OldErrorCode = 5;

export default function uitestEnumTest() {
  describe('UitestUiComponent401ErrorCode', () => {

    /**
     * @tc.name   testApi8_UiComponent_inputText_5
     * @tc.number UiTest_uitest401_016
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiComponent_inputText_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiComponent_inputText_5 start`);
      let driver = UiDriver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input = await driver.findComponent(BY.type('TextInput'))
        if (input == null) {
          let scorll = await driver.findComponent(BY.type('Scroll'))
          input = await scorll.scrollSearch(BY.type('TextInput'))
        }
        await input.inputText(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_inputText_5 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        let input = await driver.findComponent(BY.type('TextInput'))
        if (input == null) {
          let scorll = await driver.findComponent(BY.type('Scroll'))
          input = await scorll.scrollSearch(BY.type('TextInput'))
        }
        await input.inputText(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_inputText_5 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiComponent_inputText_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiComponent_scrollSearch_5
     * @tc.number UiTest_uitest401_017
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiComponent_scrollSearch_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 start`);
      let driver = UiDriver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let scroll = await driver.findComponent(BY.type('Scroll'))
        await scroll.scrollSearch(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        let scroll = await driver.findComponent(BY.type('Scroll'))
        await scroll.scrollSearch(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 END`);
      await stopApplication('com.uitestScene.acts');
    })


  })
}