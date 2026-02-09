'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Rect } from '@ohos.UiTest'


export default function popupDirectionTest() {
  describe('popupDirectionTest', () => {

    beforeAll(() => {
      console.info("popupDirectionTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.nowear.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("popupDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get popupDirectionTest state pages:" + JSON.stringify(pages));
        if (!("PopupDirection" == pages.name)) {
          console.info("get popupDirectionTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push popupDirectionTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push popupDirectionTest page error:" + err);
      }
      console.info("popupDirectionTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('popupDirectionTest after each called');
    });

    
    
    
    /**
     * @tc.number   testPopupDirectionTest_static_0100
     * @tc.name     testPopupDirectionTest_static_0100
     * @tc.desc     testPopupDirectionTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('testPopupDirectionTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("testPopupDirectionTest_static_0100 ", "START");
      const driver = Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await (buttonAuto?.click() as Promise<void>);
      await driver.delayMs(1000);
      console.log("testPopupDirectionTest_static_0100 ", "click Auto");
      const title1 = await driver.findComponent(ON.text("Title"));
      const rect1 = await title1!.getBounds();
      console.log("testPopupDirectionTest_static_0100 ", " title1 rect:" + JSON.stringify(rect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await (buttonRtl?.click() as Promise<void>);
      console.log("testPopupDirectionTest_static_0100 ", "click Rtl");
      await driver.delayMs(1000);
      let title2 = await driver.findComponent(ON.text("Title"));
      const rect2 = await title2!.getBounds();
      console.log("testPopupDirectionTest_static_0100 ", " title2: rect" + JSON.stringify(rect2));
      expect(rect1.left == rect2.left).assertFalse();
      console.log("testPopupDirectionTest_static_0100 ", "END");
      done();
    });

    
    
    
    /**
     * @tc.number   testPopupDirectionTest_static_0200
     * @tc.name     testPopupDirectionTest_static_0200
     * @tc.desc     testPopupDirectionTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('testPopupDirectionTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("testPopupDirectionTest_static_0200 ", "START");
      const driver = Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await (buttonAuto?.click() as Promise<void>);
      await driver.delayMs(1000);
      console.log("testPopupDirectionTest_static_0200 ", "click Auto");
      const confirm1 = await driver.findComponent(ON.text("confirm"));
      const confirmRect1 = await confirm1!.getBounds();
      console.log("testPopupDirectionTest_static_0200 ", " confirm1 rect:" + JSON.stringify(confirmRect1));
      const cancel1 = await driver.findComponent(ON.text("cancel"));
      const cancelRect1 = await cancel1!.getBounds();
      console.log("testPopupDirectionTest_static_0200 ", " cancelRect1 rect:" + JSON.stringify(cancelRect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await (buttonRtl?.click() as Promise<void>);
      console.log("testPopupDirectionTest_static_0200 ", "click Rtl");
      await driver.delayMs(1000);
      const confirm2 = await driver.findComponent(ON.text("confirm"));
      const confirmRect2 = await confirm2!.getBounds();
      console.log("testPopupDirectionTest_static_0200 ", " confirmRect2 rect:" + JSON.stringify(confirmRect2));
      const cancel2 = await driver.findComponent(ON.text("cancel"));
      const cancelRect2 = await cancel2!.getBounds();
      console.log("testPopupDirectionTest_static_0200 ", " cancelRect2 rect:" + JSON.stringify(cancelRect2));
      expect(confirmRect1.left == confirmRect2.left).assertFalse();
      expect(cancelRect1.left == cancelRect2.left).assertFalse();
      console.log("testPopupDirectionTest_static_0200 ", "END");
      done();
    });
  })
}