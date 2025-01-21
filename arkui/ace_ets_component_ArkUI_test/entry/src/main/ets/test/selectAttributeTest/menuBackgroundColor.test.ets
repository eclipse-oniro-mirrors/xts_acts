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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function menuBackgroundColor() {
  describe('menuBackgroundColor', function () {
    beforeEach(async function (done) {
      console.info("menuBackgroundColor beforeEach start");
      let options = {
        uri: 'MainAbility/pages/selectAttribute/menuBackgroundColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuBackgroundColor state pages: " + JSON.stringify(pages));
        if (!("menuBackgroundColor" == pages.name)) {
          console.info("get menuBackgroundColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push menuBackgroundColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuBackgroundColor page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_menuBackgroundColor_0100
     * @tc.name      menuBackgroundColor_0100
     * @tc.desc      To test that the menuBackgroundColor decorator.
     * @tc.level     Level 2
     */
    it('menuBackgroundColor_0100', 0, async function (done) {
      console.info('menuBackgroundColor_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let Select = await driver.findComponent(ON.id('menuBackgroundColor'));
      await Select.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuBackgroundColor');
      let obj = JSON.parse(strJson);
      console.info("[menuBackgroundColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[menuBackgroundColor_0100] title: " + JSON.stringify(obj.$attrs.menuBackgroundColor));
      expect(obj.$attrs.menuBackgroundColor).assertEqual('#FF808080');
      console.info('[menuBackgroundColor_0100] END');
      done();
    });


  })
}

