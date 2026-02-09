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

export default function PopupOptionsTest() {
  describe('PopupOptionsTest', () => {

    beforeAll(() => {
      console.info("DatePickerDialog beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info("PopupOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Popup/PopupApi/PopupApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PopupOptionsTest state pages:" + JSON.stringify(pages));
        if (!("PopupOptions" == pages.name)) {
          console.info("get PopupOptionsTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PopupOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PopupOptionsTest page error:" + err);
      }
      console.info("PopupOptionsTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PopupOptionsTest after each called");
    });

    
    
    
/**
     * @tc.number   PopupOptionsTest_static_001
     * @tc.name     PopupOptionsTest_static_001
     * @tc.desc     PopupOptionsTest_static_001
     * @tc.level    Level.LEVEL3
     */
it('PopupOptionsTest_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[PopupOptionsTest_static_001] START');
      try {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn: Component | null = await driver.findComponent(ON.id("btn"));
        await btn!.click();
        await CommonFunc.sleep(1000);
        let message = inspector.getInspectorByKey('message');
        await CommonFunc.sleep(1000);
        expect(JSON.parseJsonElement(message).getElement('$attrs').getString('content')).assertEqual('message');
        console.info('[PopupOptionsTest_static_001] END');
        done();
      }catch(error){
        expect().assertFail();
      }
    });
  })
}
