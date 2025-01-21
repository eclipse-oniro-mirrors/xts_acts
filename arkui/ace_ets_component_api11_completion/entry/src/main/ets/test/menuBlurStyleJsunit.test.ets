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

export default function menuBlurStyleJsunit() {
  describe('menuBlurStyleJsunit', function () {
    beforeEach(async function (done) {
      console.info("menuBlurStyleJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/menuBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuBlurStyleJsunit state pages: " + JSON.stringify(pages));
        if (!("menuBlurStyle" == pages.name)) {
          console.info("get menuBlurStyleJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push menuBlurStyleJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuBlurStyleJsunit page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("menuBlurStyle after each called");
    });

    /**
     * @tc.number: SUB_ACE_CONTEXTMENU_backgroundBlurStyle_0100
     * @tc.name  : menuBlurStyleJsunit_0100
     * @tc.desc  : Defines menu background blur Style
     * @tc.level : Level 2
     * @tc.type :
     * @tc.size :
     */
    it('menuBlurStyleJsunit_0100', 0, async function (done) {
      console.info('[menuBlurStyleJsunit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('menu_blurStyle'));
      await button.longClick();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menu_blurStyle');
      let obj = JSON.parse(strJson);
      console.info("[menuBlurStyleJsunit_0100] obj is: " + JSON.stringify(obj));
      console.info("[menuBlurStyleJsunit_0100] menuText is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("menuBlurStyle");

      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[menuBlurStyleJsunit_0100] END');
      done();
    });
  })
}