/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function RichEditor6() {
  describe('RichEditor6', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor6 state pages:" + JSON.stringify(pages));
        if (!("RichEditor6" == pages.name)) {
          console.info("get RichEditor6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor6 page error:" + err);
      }
      console.info("RichEditor6 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor6 after each called");
    });
    /**
     * @tc.number    RichEditor6_0100
     * @tc.name      RichEditor6_0100
     * @tc.desc      Test OnEditingChange callback return true when RichEditor in editing status.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor6_0100', 0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor6_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditor01"));
      await RichEditorGetAttribute.inputText('123')
      let OnEditingChange = await driver.findComponent(ON.id("OnEditingChange"));
      let IsEditing = await driver.findComponent(ON.id("IsEditing"));
      let OnEditingChangeText = await OnEditingChange.getText()
      let IsEditingText = await IsEditing.getText()

      expect(OnEditingChangeText).assertContain("true")
      expect(IsEditingText).assertContain("true")
      await RichEditorGetAttribute.clearText()

      console.info('[RichEditor6_0100] END');
      done();
    });
    
    /**
     * @tc.number    RichEditor6_0200
     * @tc.name      RichEditor6_0200
     * @tc.desc      Test OnEditingChange callback return false when RichEditor in non editing status.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor6_0200', 0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor6_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditor01"));
      await RichEditorGetAttribute.inputText('abc')
      let GetStopEditing = await driver.findComponent(ON.id("StopEditing"));
      await GetStopEditing.click()
      let OnEditingChange = await driver.findComponent(ON.id("OnEditingChange"));
      let IsEditing = await driver.findComponent(ON.id("IsEditing"));
      let OnEditingChangeText = await OnEditingChange.getText()
      let IsEditingText = await IsEditing.getText()
      expect(OnEditingChangeText).assertContain("false")
      expect(IsEditingText).assertContain("false")

      console.info('[RichEditor6_0200] END');
      done();
    });
    
  })
}
