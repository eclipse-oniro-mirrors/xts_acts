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
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function DismissReasonTest() {
  describe('DismissReasonTest', () => {
    beforeAll(() => {
      console.info("DismissReasonTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info("DismissReasonTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Popup/DismissReason",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DismissReasonTest state pages: " + JSON.stringify(pages));
        if (!("DismissReason" == pages.name)) {
          console.info("get DismissReasonTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DismissReasonTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DismissReasonTest page error: " + err);
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   DismissReasonTest_static_0010
     * @tc.name     DismissReasonTest_static_0010
     * @tc.desc     DismissReasonTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('DismissReasonTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DismissReasonTest_static_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('DismissReason_Button')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      await driver.pressBack()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DismissReason_Button');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DismissReasonTest_static_0010] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('DismissReason succ');
      console.info('[DismissReasonTest_static_0010] END');
      done();
    });
  })
}

