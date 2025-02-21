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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import events_emitter from '@ohos.events.emitter'

export default function RenderNodeInvalidateJsSuit() {
  describe('RenderNodeInvalidateJsSuit', function () {
    beforeEach(async function (done) {
      console.info("RenderNodeInvalidateJsSuit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/RenderNodeInvalidate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeInvalidateJsSuit state pages: " + JSON.stringify(pages));
        if (!("RenderNodeInvalidate" == pages.name)) {
          console.info("get RenderNodeInvalidateJsSuit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeInvalidateJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeInvalidateJsSuit page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    /**
     * @tc.number: SUB_ACE_COMPONENT_RenderNodeInvalidateJsSuit_0100
     * @tc.name : RenderNodeInvalidateJsSuit_0100
     * @tc.desc : set api
     * @tc.level : Level 2
     * @tc.type :
     * @tc.size :
     */

    it('RenderNodeInvalidateJsSuit_0100', 0, async function (done) {
      console.info('[RenderNodeInvalidateJsSuit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('invalidate_Opacity'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Opacity_reset');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeInvalidateJsSuit_0100] obj is: " + JSON.stringify(obj));
      console.info("[RenderNodeInvalidateJsSuit_0100] obj content is: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.content=='statusOpacity:0.5').assertTrue();
      console.info('[RenderNodeInvalidateJsSuit_0100] END');
      done();
    });
  })
}