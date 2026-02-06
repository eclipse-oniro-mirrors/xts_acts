/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function overlayManager() {
  describe('overlayManager', () => {
    beforeEach(async (done: Function) => {
      console.info("overlayManager beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/overlayManager",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get overlayManager state pages: " + JSON.stringify(pages));
        if (!("overlayManager" == pages.name)) {
          console.info("get overlayManager state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push overlayManager success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push overlayManager page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   overlayManager_0100
     * @tc.number overlayManager_0100
     * @tc.desc   set renderRootOverlay: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('overlayManager_0100', Level.LEVEL1, async (done: Function) => {
      console.info('overlayManager_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('set'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('get'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text = getInspectorByKey('text');
      console.info("[overlayManager_0100] attrs is: " + JSON.stringify(JSON.parse(text).$attrs.content));
      expect(JSON.parse(text).$attrs.content).assertEqual('true');
      console.info('[overlayManager_0100] END');
      done();
    });


    /**
     * @tc.name   overlayManager_0200
     * @tc.number overlayManager_0200
     * @tc.desc   set renderRootOverlay: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('overlayManager_0200', Level.LEVEL1, async (done: Function) => {
      console.info('overlayManager_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let btn0: Component = await driver.findComponent(ON.id('fal'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn: Component = await driver.findComponent(ON.id('set'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('get'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text = getInspectorByKey('text');
      console.info("[overlayManager_0200] attrs is: " + JSON.stringify(JSON.parse(text).$attrs.content));
      expect(JSON.parse(text).$attrs.content).assertEqual('true');
      console.info('[overlayManager_0200] END');
      done();
    });
  })
}