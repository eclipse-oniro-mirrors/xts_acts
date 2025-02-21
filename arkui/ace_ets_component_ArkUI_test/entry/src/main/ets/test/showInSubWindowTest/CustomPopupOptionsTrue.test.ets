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
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';



export default function CustomPopupOptionsTrue() {
  describe('CustomPopupOptionsTrue', function () {
    beforeEach(async function (done) {
      console.info("CustomPopupOptionsTrue beforeEach start");
      let options = {
        uri: 'MainAbility/pages/showInSubWindow/CustomPopupOptionsTrue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomPopupOptionsTrue state pages: " + JSON.stringify(pages));
        if (!("CustomPopupOptionsTrue" == pages.name)) {
          console.info("get CustomPopupOptionsTrue state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomPopupOptionsTrue success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomPopupOptionsTrue page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_CustomPopupOptionsTrue_0100
     * @tc.name      CustomPopupOptionsTrue_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CustomPopupOptionsTrue_0100', 0, async function (done) {
      console.info('CustomPopupOptionsTrue_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('CustomPopupOptionsTrue'));
      await button.click();
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[CustomPopupOptionsTrue_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)//0表示应用子窗口TYPE_APP

      await CommonFunc.sleep(1000);
      await driver.click(200,200);
      await CommonFunc.sleep(1000);
      console.info('[CustomPopupOptionsTrue_0100] END');
      done();
    });


  })
}

