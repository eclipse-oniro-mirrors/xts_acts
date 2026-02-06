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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;



export default function TimePickerDialog() {
  describe('TimePickerDialog', () => {
    beforeAll(() => {
      console.info("TimePickerDialog beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api11.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("TimePickerDialog beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/TimePickerDialog',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TimePickerDialog state pages: " + JSON.stringify(pages));
        if (!("TimePickerDialog" == pages.name)) {
          console.info("get TimePickerDialog state pages.name: " + JSON.stringify(pages.name));
          // let result = await TimePickerDialog.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TimePickerDialog success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push TimePickerDialog page error: " + err);
        expect().assertFail();
      }
    });






    /**
     * @tc.number   TimePickerDialog_static_0100
     * @tc.name     TimePickerDialog_static_0100
     * @tc.desc     TimePickerDialog_static_0100
     * @tc.level    Level.LEVEL2
     */
it('TimePickerDialog_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('TimePickerDialog_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TimePickerDialog'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[TimePickerDialog_static_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)//1表示系统告警窗口TYPE_SYSTEM_ALERT

      // await CommonFunc.sleep(1000);
      // let winLeft = AppStorage.get<number>("winLeft");
      // let winTop = AppStorage.get<number>("winTop");
      // if (winLeft && winTop){
      //   await (driver?.click(Math.round(winLeft + vp2px(100)),Math.round(winTop + vp2px(100))) as Promise<void>) ;
      // }
      // await CommonFunc.sleep(1000);
      console.info('[TimePickerDialog_static_0100] END');
      done();
    });


  })
}

