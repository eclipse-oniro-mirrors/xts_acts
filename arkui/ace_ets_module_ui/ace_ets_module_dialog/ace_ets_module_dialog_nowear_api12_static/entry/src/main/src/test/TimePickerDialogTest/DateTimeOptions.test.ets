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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
let tag: string = 'testTag';

export default function DateTimeOptions() {
  describe('DateTimeOptions', () => {

    beforeAll(() => {
      console.info("DateTimeOptions beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info("DateTimeOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TimePickerDialog/DateTimeOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DateTimeOptions state pages: " + JSON.stringify(pages));
        if (!("DateTimeOptions" == pages.name)) {
          console.info("get DateTimeOptions state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DateTimeOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DateTimeOptions page error: " + err);
        expect().assertFail();
      }
    });
    
    
    
/**
     * @tc.number   DateTimeOptions_static_0100
     * @tc.name     DateTimeOptions_static_0100
     * @tc.desc     DateTimeOptions_static_0100
     * @tc.level    Level.LEVEL2
     */
it('DateTimeOptions_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DateTimeOptions_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('DateTimeOptions')) as Component;
      await Column!.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('DateTimeOptionsValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DateTimeOptions_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[DateTimeOptions_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{"hour":"numeric","minute":"2-digit"} / false');
      console.info('[DateTimeOptions_static_0100] END');
      done();
    });


  })
}

