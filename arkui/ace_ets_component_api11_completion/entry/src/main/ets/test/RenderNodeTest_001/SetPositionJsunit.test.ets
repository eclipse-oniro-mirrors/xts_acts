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
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, UiDirection, MouseButton, UIElementInfo, UIEventObserver} from '@ohos.UiTest';
export default function SetPositionJsunit() {
  describe('SetPositionJsunit', function () {
    beforeEach(async function (done) {
      console.info("SetPositionJsunit beforeEach start");
      let options = {
        url: "MainAbility/pages/renderNode001/SetPosition",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetPositionJsunit state pages:" + JSON.stringify(pages));
        if (!("SetPosition" == pages.name)) {
          console.info("get getClipToFrame pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SetPositionJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetPositionJsunit page error:" + err);
      }
      console.info("SetPositionJsunit beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("SetPositionJsunit after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_SetPositionJsunit_001
     * @tc.name      SetPositionJsunit
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('SetPositionJsunit_001', 0, async function (done) {
      console.info('[SetPositionJsunit_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('setPosition'));
      await set.click()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('x_status');
      let strJson2 = getInspectorByKey('y_status');
      let obj1 = JSON.parse(strJson1);
      let obj2 = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[SetPositionJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SetPositionJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SetPositionJsunit_001] component content1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[SetPositionJsunit_001] component content2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("setPositionXStatus:100");
      expect(obj2.$attrs.content).assertEqual("setPositionYStatus:100");
      console.info('[SetPositionJsunit_001] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
