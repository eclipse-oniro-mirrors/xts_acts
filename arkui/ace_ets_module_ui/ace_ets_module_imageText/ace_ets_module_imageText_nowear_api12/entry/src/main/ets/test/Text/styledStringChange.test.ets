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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"

export default function styledStringChange() {
  describe('styledStringChange', () => {
    beforeEach(async (done: Function) => {
      console.info("styledStringChange beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get styledStringChange state pages:" + JSON.stringify(pages));
        if (!("styledStringChange" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Text/styledStringChange"})
          await CommonFunc.sleep(2000);
          console.info("push styledStringChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push styledStringChange page error:" + err);
      }
      console.info("styledStringChange foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("styledStringChange after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_StyledString_0010
     * @tc.name       : styledStringChange_001
     * @tc.desc       : onChange Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('styledStringChange_001', 0, async (done: Function) => {
      console.info('[styledStringChange_001] START');
      await CommonFunc.sleep(200);
      let driver: Driver = Driver.create();
      let text: Component = await driver.findComponent(ON.id('styledStringText'));
      let input: Component = await driver.findComponent(ON.id('styledStringInput'));
      await text.longClick();
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('全选'));
      await text1.click();
      await CommonFunc.sleep(1000);

      await text.dragTo(input);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('changeText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[styledStringChange_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('change');
      console.info('[styledStringChange_001] END');
      done();
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_StyledString_0020
     * @tc.name       : styledStringChange_002
     * @tc.desc       : onPaste Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('styledStringChange_002', 0, async (done: Function) => {
      console.info('[styledStringChange_002] START');
      await CommonFunc.sleep(200);
      let driver: Driver = Driver.create();
      let text: Component = await driver.findComponent(ON.id('styledStringText'));
      let input: Component = await driver.findComponent(ON.id('styledStringInput'));
      await text.longClick();
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('全选'));
      await text1.click();
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('复制'));
      await text2.click();
      await CommonFunc.sleep(1000);
      await input.click()
      await CommonFunc.sleep(1000);
      await input.click();
      await CommonFunc.sleep(1000);

      let paste = await driver.findComponent(ON.text('粘贴'));
      await paste.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('changeText2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[styledStringChange_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('paste');
      console.info('[styledStringChange_002] END');
      done();
    });






  })
}
