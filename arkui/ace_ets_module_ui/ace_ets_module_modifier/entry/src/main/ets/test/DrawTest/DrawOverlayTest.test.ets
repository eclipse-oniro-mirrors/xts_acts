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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function DrawOverlayTest() {
  describe('DrawOverlayTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DrawOverlayTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Draw/DrawOverlayTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DrawOverlayTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get DrawOverlayTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push DrawOverlayTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DrawOverlayTest page error:" + err);
      }
      console.info("DrawOverlayTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("DrawOverlayTest after each called");
    });

    /**
     * @tc.name   DrawOverlayTest_0100
     * @tc.number DrawOverlayTest_0100
     * @tc.desc   drawForeground test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DrawOverlayTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('DrawOverlayTest_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('DrawModifierDrawOverlay'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('DrawModifierDrawOverlay');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[DrawOverlayTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[DrawOverlayTest_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('drawOverlay');
      console.info('[DrawOverlayTest_0100] END');
      done();
    });

  })
}