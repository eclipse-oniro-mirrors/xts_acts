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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../../Util.test';


export default function TimePickerDialog_Cancel_Test() {

  beforeAll(() => {
    console.info("TimePickerDialog_Cancel_Test beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

  });

  describe('TimePickerDialog_Cancel_Test', () => {
    beforeEach(async () => {
      console.info("TimePickerDialog_Cancel_Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TimePickerDialog/ButtonStyle/Time_cancel",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TimePickerDialog_Cancel_Test state pages:" + JSON.stringify(pages));
        if (!("Time_cancel" == pages.name)) {
          console.info("get TimePickerDialog_Cancel_Test pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TimePickerDialog_Cancel_Test page error:" + err);
      }
      console.info("TimePickerDialog_Cancel_Test beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TimePickerDialog_Cancel_Test after each called");
    });

    
    
    
/**
     * @tc.number   TimePickerDialog_Cancel_Test_static_001
     * @tc.name     TimePickerDialog_Cancel_Test_static_001
     * @tc.desc     TimePickerDialog_Cancel_Test_static_001
     * @tc.level    Level.LEVEL3
     */
it('TimePickerDialog_Cancel_Test_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[TimePickerDialog_Cancel_Test_001] START');
      try {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn: Component | null = await driver.findComponent(ON.id('btn'));
        await btn!.click();
        await CommonFunc.sleep(1000);
        let row: Component | null = await driver.findComponent(ON.text('确定'))
        await row!.click();
        await CommonFunc.sleep(2000);
        let cancelButtonStyle_Text = inspector.getInspectorByKey('cancelButtonStyle_Text');
        console.info('cancelButtonStyle_Text attrs-----' +
        JSON.parseJsonElement(cancelButtonStyle_Text).getElement('$attrs'));
        expect(JSON.parseJsonElement(cancelButtonStyle_Text).getElement('$attrs').getString('content'))
          .assertEqual('cancelButtonStyle_Text');
        console.info('[TimePickerDialog_Cancel_Test_001] END');
        done();
      }catch(error){
        expect().assertFail();
      }
    });
  })
}
