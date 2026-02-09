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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';



export default function showToast() {
  describe('showToast', () => {
    beforeEach(async (done: Function) => {
      console.info("showToast beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showToast',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showToast state pages: " + JSON.stringify(pages));
        if (!("showToast" == pages.name)) {
          console.info("get showToast state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push showToast success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showToast page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   showToast_0100
     * @tc.number SUB_ACE_showToast_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('showToast_0100', Level.LEVEL2, async (done: Function) => {
      console.info('showToast_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('showToastExample_showToast'));
      await button.click();
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[showToast_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)//1表示系统告警窗口TYPE_SYSTEM_ALERT

      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[showToast_0100] END');
      done();
    });

    /**
     * @tc.name   showToast_0200
     * @tc.number SUB_ACE_showToast_0200
     * @tc.desc   test error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('showToast_0200', Level.LEVEL2, async (done: Function) => {
      console.info('showToast_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('showToastExample_ErrorCode'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info("[showToast_0200] AppStorage.get('showToastExample_ErrorCode'): " + AppStorage.get('showToastExample_ErrorCode'));
      expect(AppStorage.get('showToastExample_ErrorCode')).assertEqual('401');
      AppStorage.delete('showToastExample_ErrorCode');

      console.info('[showToast_0200] END');
      done();
    });
  })
}

