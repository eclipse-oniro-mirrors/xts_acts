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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function RichEditor7() {
  describe('RichEditor7', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor7',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor7 state pages:" + JSON.stringify(pages));
        if (!("RichEditor7" == pages.name)) {
          console.info("get RichEditor7 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor7 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor7 page error:" + err);
      }
      console.info("RichEditor7 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor7 after each called");
    });
    /**
     * @tc.number    RichEditor7_0100
     * @tc.name      RichEditor7_0100
     * @tc.desc      Test stop edinting function in RichEditor.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor7_0100', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor7_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditor01"));
      await RichEditorGetAttribute.inputText('456')
      let GetStopEditing = await driver.findComponent(ON.id("StopEditing"));
      await GetStopEditing.click()
      await driver.delayMs(1000)
      let OnEditingChange = await driver.findComponent(ON.id("OnEditingChange1"));
      let IsEditing = await driver.findComponent(ON.id("IsEditing1"));
      let OnEditingChangeText = await OnEditingChange.getText()
      let IsEditingText = await IsEditing.getText()
      expect(OnEditingChangeText).assertContain("false")
      expect(IsEditingText).assertContain("false")

      console.info('[RichEditor7_0100] END');
      done();
    });
    /**
     * @tc.number    RichEditor7_0200
     * @tc.name      RichEditor7_0200
     * @tc.desc      Test onSubmit callback return EnterKeyType when keepEditableState is false.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor7_0200', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor7_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditor02"));
      await RichEditorGetAttribute.inputText('1')
      await driver.triggerKey(2054)
      let OnSubmitEnterKey = await driver.findComponent(ON.id("EnterKey"));
      let EnterKeyResult = await OnSubmitEnterKey.getText()
      console.log("EnterKeyResult:"+EnterKeyResult)
      let OnEditingChange = await driver.findComponent(ON.id("OnEditingChange2"));
      let IsEditing = await driver.findComponent(ON.id("IsEditing2"));
      let OnEditingChangeText = await OnEditingChange.getText()
      let IsEditingText = await IsEditing.getText()
      expect(OnEditingChangeText).assertContain("false")
      expect(IsEditingText).assertContain("false")
      expect(EnterKeyResult).assertContain("6")

      console.info('[RichEditor7_0200] END');
      done();
    });
    /**
     * @tc.number    RichEditor7_0300
     * @tc.name      RichEditor7_0300
     * @tc.desc       Test onSubmit callback return EnterKeyType when keepEditableState is true.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor7_0300', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor7_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let SetEnterType = await driver.findComponent(ON.id('EnterType'));
      await SetEnterType.click()
      let SeIsCallKeepEditableState = await driver.findComponent(ON.id('IsCallKeepEditableState'));
      await SeIsCallKeepEditableState.click()
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditor02"));
      await RichEditorGetAttribute.inputText('1')
      await driver.triggerKey(2054)
      let OnSubmitEnterKey = await driver.findComponent(ON.id("EnterKey"));
      let EnterKeyResult = await OnSubmitEnterKey.getText()
      let OnEditingChange = await driver.findComponent(ON.id("OnEditingChange2"));
      let IsEditing = await driver.findComponent(ON.id("IsEditing2"));
      let OnEditingChangeText = await OnEditingChange.getText()
      let IsEditingText = await IsEditing.getText()
      expect(OnEditingChangeText).assertContain("true")
      expect(IsEditingText).assertContain("true")
      expect(EnterKeyResult).assertContain("2")

      console.info('[RichEditor7_0300] END');
      done();
    });
  })
}
