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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function followTransformOfTargetPopup() {
  describe('followTransformOfTargetPopup', () => {
    beforeEach(async (done: Function) => {
      console.info("followTransformOfTargetPopup beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Popup/followTransformOfTargetPopup",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get followTransformOfTargetPopup state pages: " + JSON.stringify(pages));
        if (!("followTransformOfTargetPopup" == pages.name)) {
          console.info("get followTransformOfTargetPopup state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push followTransformOfTargetPopup success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push followTransformOfTargetPopup page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    followTransformOfTargetPopup_0010
     * @tc.name      followTransformOfTargetPopup_0010
     * @tc.desc      popup: followTransformOfTargetPopup: false
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('followTransformOfTargetPopup_0010', 0, async (done: Function) => {
      console.info('followTransformOfTargetPopup_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('popup'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('animationBtn'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('followTransformOfTarget');
      console.info("[followTransformOfTargetPopup_0010] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[followTransformOfTargetPopup_0010] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('followTransformOfTarget: false');
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[followTransformOfTargetPopup_0010] END');
      done();
    });

    /**
     * @tc.number    followTransformOfTargetPopup_0020
     * @tc.name      followTransformOfTargetPopup_0020
     * @tc.desc      popup: followTransformOfTargetPopup: true
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('followTransformOfTargetPopup_0020', 0, async (done: Function) => {
      console.info('followTransformOfTargetPopup_0020 START');
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
      console.info("[followTransformOfTargetPopup_0020] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[followTransformOfTargetPopup_0020] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('followTransformOfTarget: true');
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[followTransformOfTargetPopup_0020] END');
      done();
    });
  })
}

