/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function DrawModifierTwoTest() {
  describe('DrawModifierTwoTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DrawModifierTwoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Draw/DrawModifierTwoTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DrawModifierTwoTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get DrawModifierTwoTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push DrawModifierTwoTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DrawModifierTwoTest page error:" + err);
      }
      console.info("DrawModifierTwoTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("DrawModifierTwoTest after each called");
    });

    /**
     * @tc.name   DrawModifierTwoTest_0100
     * @tc.number DrawModifierTwoTest_0100
     * @tc.desc   DrawModifier Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DrawModifierTwoTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('DrawModifierTwoTest_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_changeModifier'));
      await button1.click();
      await Utils.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_drawCount'));
      await button2.click();
      await Utils.sleep(1000);

      let strJson1: string = getInspectorByKey('text_drawCount');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[DrawModifierTwoTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[DrawModifierTwoTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));

      expect(obj1.$attrs.content).assertEqual('1');
      console.info('[DrawModifierTwoTest_0100] END');
      done();
    });

  })
}