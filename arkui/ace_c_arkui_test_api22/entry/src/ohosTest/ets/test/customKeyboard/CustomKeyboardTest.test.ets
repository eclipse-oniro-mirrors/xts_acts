/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';

export default function customKeyboardTest() {

  describe('CustomKeyboardTest', () => {

    let PAGE_TAG = 'CustomKeyboardTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customKeyboard/${PAGE_TAG}`, done);
    });

    /**
     * @tc.number    customKeyboardTest_001
     * @tc.name      customKeyboardTest_001
     * @tc.desc      The TextArea component supports custom keyboards. Expected: The button's text content is 'get'.
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('customKeyboardTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[customKeyboardTest_001] START');

      await Utils.sleep(100);
      let driver:Driver = Driver.create();
      let textArea: Component = await driver.findComponent(ON.id('TextArea'));
      let point = await textArea.getBoundsCenter();
      console.info('[customKeyboardTest_001] Point X: ' + point.x);
      console.info('[customKeyboardTest_001] Point Y: ' + point.y);
      await driver.click(point.x, point.y);

      await Utils.sleep(500);

      let buttonText: Component = await driver.findComponent(ON.id('ButtonText'));
      let text = await buttonText.getText();

      console.info('[customKeyboardTest_001] Text: ' + text);
      expect(text).assertEqual('get');

      console.info('[customKeyboardTest_001] END');
      done();
    })
  })
}