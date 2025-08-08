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

export default function DrawModifier() {
  describe('DrawModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("DrawModifier beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DrawModifier state pages:" + JSON.stringify(pages));
        if (!("DrawModifier" == pages.name)) {
          console.info("get  DrawModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/DrawModifier/DrawModifier"})
          await CommonFunc.sleep(2000);
          console.info("push DrawModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DrawModifier page error:" + err);
      }
      console.info("DrawModifier foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DrawModifier after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_DrawModifier_001
     * @tc.desc      DrawModifier test
     * @tc.level     Level 3
     * @tc.type
     */

    it('DrawModifier_001', 0, async (done: Function) => {
      console.info('[DrawModifier_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('DrawModifierBt'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('DrawModifier');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DrawModifier_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(JSON.parse(strJson).$attrs.content).assertEqual('drawBehind');
      console.info('[DrawModifier_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_DrawModifier_002
     * @tc.desc      DrawModifier test
     * @tc.level     Level 3
     * @tc.type
     */

    it('DrawModifier_002', 0, async (done: Function) => {
      console.info('[DrawModifier_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('DrawModifierBt'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('DrawModifier2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DrawModifier_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(JSON.parse(strJson).$attrs.content).assertEqual('drawContent');
      console.info('[DrawModifier_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_DrawModifier_003
     * @tc.desc      DrawModifier test
     * @tc.level     Level 3
     * @tc.type
     */

    it('DrawModifier_003', 0, async (done: Function) => {
      console.info('[DrawModifier_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('DrawModifierBt'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('DrawModifier3');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DrawModifier_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(JSON.parse(strJson).$attrs.content).assertEqual('drawFront');
      console.info('[DrawModifier_003] END');
      done();
    });




  })
}
