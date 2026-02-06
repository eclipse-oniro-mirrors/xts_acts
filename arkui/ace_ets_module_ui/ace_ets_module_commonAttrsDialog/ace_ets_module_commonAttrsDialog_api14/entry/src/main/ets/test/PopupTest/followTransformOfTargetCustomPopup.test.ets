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
import CommonFunc from '../../MainAbility/common/Common';


export default function followTransformOfTargetCustomPopup() {
  describe('followTransformOfTargetCustomPopup', () => {
    beforeEach(async (done: Function) => {
      console.info("followTransformOfTargetCustomPopup beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Popup/followTransformOfTargetCustomPopup",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get followTransformOfTargetCustomPopup state pages: " + JSON.stringify(pages));
        if (!("followTransformOfTargetCustomPopup" == pages.name)) {
          console.info("get followTransformOfTargetCustomPopup state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push followTransformOfTargetCustomPopup success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push followTransformOfTargetCustomPopup page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   followTransformOfTargetCustomPopup_0010
     * @tc.number followTransformOfTargetCustomPopup_0010
     * @tc.desc   customPopup: followTransformOfTargetCustomPopup: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('followTransformOfTargetCustomPopup_0010', Level.LEVEL0, async (done: Function) => {
      console.info('followTransformOfTargetCustomPopup_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('popup'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('animationBtn'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('followTransformOfTarget');
      console.info("[followTransformOfTargetCustomPopup_0010] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[followTransformOfTargetCustomPopup_0010] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('followTransformOfTarget: false');
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[followTransformOfTargetCustomPopup_0010] END');
      done();
    });

    /**
     * @tc.name   followTransformOfTargetCustomPopup_0020
     * @tc.number followTransformOfTargetCustomPopup_0020
     * @tc.desc   customPopup: followTransformOfTargetCustomPopup: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('followTransformOfTargetCustomPopup_0020', Level.LEVEL0, async (done: Function) => {
      console.info('followTransformOfTargetCustomPopup_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button0 = await driver.findComponent(ON.id('followId'));
      await button0.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('animationBtn'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('followTransformOfTarget');
      console.info("[followTransformOfTargetCustomPopup_0020] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[followTransformOfTargetCustomPopup_0020] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('followTransformOfTarget: true');
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[followTransformOfTargetCustomPopup_0020] END');
      done();
    });
  })
}

