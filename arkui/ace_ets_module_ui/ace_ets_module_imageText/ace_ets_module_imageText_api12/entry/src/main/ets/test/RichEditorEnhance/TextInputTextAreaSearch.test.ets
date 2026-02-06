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


export default function TextInputTextAreaSearch() {
  describe('TextInputTextAreaSearch', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputTextAreaSearch beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/TextInputTextAreaSearch',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputTextAreaSearch state pages:" + JSON.stringify(pages));
        if (!("TextInputTextAreaSearch" == pages.name)) {
          console.info("get TextInputTextAreaSearch pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push TextInputTextAreaSearch page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputTextAreaSearch page error:" + err);
      }
      console.info("TextInputTextAreaSearch beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("TextInputTextAreaSearch after each called");
    });
    /**
     * @tc.number TextInputTextAreaSearch_0100
     * @tc.name   TextInputTextAreaSearch_0100
     * @tc.desc   Test custom keyboard avoidance.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TextInputTextAreaSearch_0100',  Level.LEVEL0, async (done: Function) => {
      // Test stop
      console.info('[TextInputTextAreaSearch_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      
      let TextInput_supportAvoidance = await driver.findComponent(ON.id("TextInput_supportAvoidance"));
      let point1 = await TextInput_supportAvoidance.getBoundsCenter();
      await TextInput_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await TextInput_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      let supportAvoidance_stopEditing = await driver.findComponent(ON.id("supportAvoidance_stopEditing"));
      await supportAvoidance_stopEditing.click()
      console.info('[TextInputTextAreaSearch_0100] END');
      done();
    });

    /**
     * @tc.number TextInputTextAreaSearch_0200
     * @tc.name   TextInputTextAreaSearch_0200
     * @tc.desc   Test custom keyboard avoidance.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TextInputTextAreaSearch_0200',  Level.LEVEL0, async (done: Function) => {
      // Test stop
      console.info('[TextInputTextAreaSearch_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let TextArea_supportAvoidance = await driver.findComponent(ON.id("TextArea_supportAvoidance"));
      let point1 = await TextArea_supportAvoidance.getBoundsCenter();
      await TextArea_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await TextArea_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      let supportAvoidance_stopEditing = await driver.findComponent(ON.id("supportAvoidance_stopEditing"));
      await supportAvoidance_stopEditing.click()
      console.info('[TextInputTextAreaSearch_0200] END');
      done();
    });

    /**
     * @tc.number TextInputTextAreaSearch_0300
     * @tc.name   TextInputTextAreaSearch_0300
     * @tc.desc   Test custom keyboard avoidance.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TextInputTextAreaSearch_0300',  Level.LEVEL0, async (done: Function) => {
      // Test stop
      console.info('[TextInputTextAreaSearch_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let Search_supportAvoidance = await driver.findComponent(ON.id("Search_supportAvoidance"));
      let point1 = await Search_supportAvoidance.getBoundsCenter();
      await Search_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await Search_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      console.info('[TextInputTextAreaSearch_0300] END');
      done();
    });
    
  })
}
