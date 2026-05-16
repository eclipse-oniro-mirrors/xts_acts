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

import { describe, it, expect, TestType, Level, Size, beforeAll, beforeEach, afterAll } from '@ohos/hypium'
import { Driver, ON, Component } from '@kit.TestKit'
import { startAbility, stopApplication } from './Util.test'

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_TAG';

export default function uitestOnApi26Test() {
  describe('UitestOnApi26Test', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create()
      await driver.delayMs(1000)
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterAll(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testOnIsBeforeComponentValid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0100
     * @tc.desc   Test On.isBefore(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsBeforeComponentValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(TestTag + 'testOnIsBeforeComponentValid start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let text2 = await driver.findComponent(ON.text('dialog'));
      let text = await driver.findComponent(ON.text('toast').isBefore(text2));
      let msg = await text.getText();
      expect(msg).assertEqual('toast')
      let text3 = await driver.findComponent(ON.text('toastNot').isBefore(text2));
      expect(text3).assertNull();
      await stopApplication('com.uitestScene.acts');
      console.info(TestTag + 'testOnIsBeforeComponentValid over');
    });

    /**
     * @tc.name   testOnIsAfterComponentValid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0200
     * @tc.desc   Test On.isAfter(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsAfterComponentValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(TestTag + 'testOnIsAfterComponentValid start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let text2 = await driver.findComponent(ON.text('toast'));
      let text = await driver.findComponent(ON.text('dialog').isAfter(text2));
      let msg = await text.getText();
      expect(msg).assertEqual('dialog')
      let text3 = await driver.findComponent(ON.text('dialogNot').isBefore(text2));
      expect(text3).assertNull();
      await stopApplication('com.uitestScene.acts');
      console.info(TestTag + 'testOnIsAfterComponentValid over');
    });

    /**
     * @tc.name   testOnWithinComponentValid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0300
     * @tc.desc   Test On.within(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWithinComponentValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(TestTag + 'testOnWithinComponentValid start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let scroller = await driver.findComponent(ON.type('Scroll'));
      let text = await driver.findComponent(ON.within(scroller).text('next page'));
      let msg = await text.getText();
      expect(msg).assertEqual('next page')
      let text3 = await driver.findComponent(ON.within(scroller).text('next pageNot'));
      expect(text3).assertNull();
      await stopApplication('com.uitestScene.acts');
      console.info(TestTag + 'testOnWithinComponentValid over');
    });

  })
}