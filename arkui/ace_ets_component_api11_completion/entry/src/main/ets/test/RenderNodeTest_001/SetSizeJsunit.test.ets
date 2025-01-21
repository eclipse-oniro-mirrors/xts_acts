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
export default function SetSizeJsunit() {
  describe('SetSizeJsunit', function () {
    beforeEach(async function (done) {
      console.info("SetSizeJsunit beforeEach start");
      let options = {
        url: "MainAbility/pages/renderNode001/SetSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetSizeJsunit state pages:" + JSON.stringify(pages));
        if (!("SetSize" == pages.name)) {
          console.info("get SetSizeJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SetSizeJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetSizeJsunit page error:" + err);
      }
      console.info("SetSizeJsunit beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("SetSizeJsunit after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_SetSizeJsunit_001
     * @tc.name      SetSizeJsunit
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('SetSizeJsunit_001', 0, async function (done) {
      console.info('[SetSizeJsunit_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('setSize'));
      await set.click()
      let strJson1 = getInspectorByKey('Width_status');
      let strJson2 = getInspectorByKey('Height_status');
      let obj1 = JSON.parse(strJson1);
      let obj2 = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[SetSizeJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SetSizeJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SetSizeJsunit_001] component content1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[SetSizeJsunit_001] component content2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("setSize_WidthStatus:300");
      expect(obj2.$attrs.content).assertEqual("setSize_HeightStatus:300");
      console.info('[SetSizeJsunit_001] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
