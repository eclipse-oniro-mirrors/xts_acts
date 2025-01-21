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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getPosition() {
  describe('getPosition', function () {
    beforeEach(async function (done) {
      console.info("getPosition beforeEach start");
      let options = {
        uri: "MainAbility/pages/FrameNode/getPosition",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getPosition state pages: " + JSON.stringify(pages));
        if (!("getPosition" == pages.name)) {
          console.info("get getPosition state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getPosition success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getPosition page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    getPosition_0100
     * @tc.name      getPosition_0100
     * @tc.desc      frameNode: getPositionToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getPosition_0100', 0, async function (done) {
      console.info('getPosition_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToScreen'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getPositionToScreenValue');
      let obj = JSON.parse(strJson);
      console.info("[getPosition_0100] component obj is: " + JSON.stringify(obj));
      expect(Math.floor(obj.$attrs.content)).assertEqual(0);
      console.info('[getPosition_0100] END');
      done();
    });

    /**
     * @tc.number    getPosition_0200
     * @tc.name      getPosition_0200
     * @tc.desc      frameNode: getPositionToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getPosition_0200', 0, async function (done) {
      console.info('getPosition_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToParentWithTransform'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getPositionToParentWithTransformValue');
      let obj = JSON.parse(strJson);
      console.info("[getPosition_0200] component obj is: " + JSON.stringify(obj));
      expect(Math.floor(obj.$attrs.content)).assertEqual(0);
      console.info('[getPosition_0200] END');
      done();
    });

    /**
     * @tc.number    getPosition_0300
     * @tc.name      getPosition_0300
     * @tc.desc      frameNode: getPositionToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getPosition_0300', 0, async function (done) {
      console.info('getPosition_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToWindowWithTransform'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getPositionToWindowWithTransformValue');
      let obj = JSON.parse(strJson);
      console.info("[getPosition_0300] component obj is: " + JSON.stringify(obj));
      expect(Math.floor(obj.$attrs.content)).assertEqual(0);
      console.info('[getPosition_0300] END');
      done();
    });

    /**
     * @tc.number    getPosition_0400
     * @tc.name      getPosition_0400
     * @tc.desc      frameNode: getPositionToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getPosition_0400', 0, async function (done) {
      console.info('getPosition_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToScreenWithTransform'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getPositionToScreenWithTransformValue');
      let obj = JSON.parse(strJson);
      console.info("[getPosition_0400] component obj is: " + JSON.stringify(obj));
      expect(Math.floor(obj.$attrs.content)).assertEqual(0);
      console.info('[getPosition_0400] END');
      done();
    });


  })
}

