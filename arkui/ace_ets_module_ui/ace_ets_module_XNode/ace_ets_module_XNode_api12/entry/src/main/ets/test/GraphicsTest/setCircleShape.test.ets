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


export default function setCircleShapeTest() {
  describe('setCircleShapeTest', function () {
    beforeEach(async function (done) {
      console.info("setCircleShapeTest beforeEach start");
      let options = {
        uri: "MainAbility/pages/Graphics/setCircleShape",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setCircleShapeTest state pages: " + JSON.stringify(pages));
        if (!("setCircleShape" == pages.name)) {
          console.info("get setCircleShapeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push setCircleShapeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setCircleShapeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    setCircleShapeTest_0010
     * @tc.name      setCircleShapeTest_0010
     * @tc.desc      graphic: setCircleShape
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setCircleShapeTest_0010', 0, async function (done) {
      console.info('setCircleShapeTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('setCircleShape_text'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setCircleShape_text');
      let obj = JSON.parse(strJson);
      console.info("[setCircleShapeTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('setCircleShape succ');
      console.info('[setCircleShapeTest_0010] END');
      done();
    });
  })
}

