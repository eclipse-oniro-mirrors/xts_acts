'use static';
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

import { beforeAll, beforeEach, afterAll, describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@kit.TestKit'
import hilog from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000;
let tag: string = 'uitestTag';
const TestTag = 'uitestTag';
const waitUiReadyMs: int = 1000;

export default function uitestOnApi26Test(): void {
  describe('UitestOnApi26Test', (): void => {
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterAll(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testOnIsBeforeComponentValid_static
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0100
     * @tc.desc   Test On.isBefore(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsBeforeComponentValid_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testOnIsBeforeComponentValid_static start');
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let text2 = await driver.findComponent(ON.text('dialog'));
      expect(text2 != null).assertTrue();
      if (text2 != null) {
        let text = await driver.findComponent(ON.text('toast').isBefore(text2));
        expect(text != null).assertTrue();
        if (text != null) {
          let msg = await text.getText();
          expect(msg).assertEqual('toast');
        }
        let text3 = await driver.findComponent(ON.text('toastNot').isBefore(text2));
        expect(text3).assertNull();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, 'testOnIsBeforeComponentValid_static over');
    });

    /**
     * @tc.name   testOnIsAfterComponentValid_static
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0200
     * @tc.desc   Test On.isAfter(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsAfterComponentValid_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testOnIsAfterComponentValid_static start');
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let text2 = await driver.findComponent(ON.text('toast'));
      expect(text2 != null).assertTrue();
      if (text2 != null) {
        let text = await driver.findComponent(ON.text('dialog').isAfter(text2));
        expect(text != null).assertTrue();
        if (text != null) {
          let msg = await text.getText();
          expect(msg).assertEqual('dialog');
        }
        let text3 = await driver.findComponent(ON.text('dialogNot').isBefore(text2));
        expect(text3).assertNull();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, 'testOnIsAfterComponentValid_static over');
    });

    /**
     * @tc.name   testOnWithinComponentValid_static
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0300
     * @tc.desc   Test On.within(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWithinComponentValid_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testOnWithinComponentValid_static start');
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let scroller = await driver.findComponent(ON.type('Scroll'));
      expect(scroller != null).assertTrue();
      if (scroller != null) {
        let text = await driver.findComponent(ON.within(scroller).text('next page'));
        expect(text != null).assertTrue();
        if (text != null) {
          let msg = await text.getText();
          expect(msg).assertEqual('next page');
        }
        let text3 = await driver.findComponent(ON.within(scroller).text('next pageNot'));
        expect(text3).assertNull();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, 'testOnWithinComponentValid_static over');
    });

  })
}