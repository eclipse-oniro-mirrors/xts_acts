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
import {MessageManager,Callback} from '../../../../ets/MainAbility/common/MessageManager';
let tag: string = 'testTag';

export default function TextPickerDialog_Accept_Test() {
  describe('TextPickerDialog_Accept_Test', () => {

    beforeAll(() => {
      console.info("TextPickerDialog_Accept_Test beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info("TextPickerDialog_Accept_Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextPickerDialog/ButtonStyle/Text_accept",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerDialog_Accept_Test state pages:" + JSON.stringify(pages));
        if (!("Text_accept" == pages.name)) {
          console.info("get TextPickerDialog_Accept_Test pages.name:" + JSON.stringify(pages.name));
          //let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push TextPickerDialog_Accept_Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPickerDialog_Accept_Test page error:" + err);
      }
      console.info("TextPickerDialog_Accept_Test beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextPickerDialog_Accept_Test after each called");
    });

    
    
    
/**
     * @tc.number   TextPickerDialog_Accept_Test_static_001
     * @tc.name     TextPickerDialog_Accept_Test_static_001
     * @tc.desc     TextPickerDialog_Accept_Test_static_001
     * @tc.level    Level.LEVEL3
     */
it('TextPickerDialog_Accept_Test_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[TextPickerDialog_Accept_Test_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn')) as Component;
      await btn!.click();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.text('确定')) as Component;
      await row!.click();
      await CommonFunc.sleep(2000);
      let acceptButtonStyle_Text = inspector.getInspectorByKey('acceptButtonStyle_Text');
      console.info('acceptButtonStyle_Text attrs-----' + JSON.parseJsonElement(acceptButtonStyle_Text).getElement('$attrs'));
      expect(JSON.parseJsonElement(acceptButtonStyle_Text).getElement('$attrs').getString('content')).assertEqual('acceptButtonStyle_Text');
      console.info('[TextPickerDialog_Accept_Test_static_001] END');
      done();
    });
  })
}
