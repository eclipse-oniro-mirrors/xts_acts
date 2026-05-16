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
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function AlertDialogJsunit() {
  describe('AlertDialogJsunit', () => {
    beforeAll(() => {
      console.info("AlertDialogJsunit beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("AlertDialogJsunit  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("AlertDialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/AlertDialogParam',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get AlertDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("AlertDialogParam" == pages.name)) {
          console.info("get AlertDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AlertDialogJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlertDialogJsunit page error: " + err);
        expect().assertFail();
      }
      // done()
    });


    
    
/**
     * @tc.number   AlertDialogJsunit_static_0100
     * @tc.name     AlertDialogJsunit_static_0100
     * @tc.desc     AlertDialogJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('AlertDialogJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('AlertDialogJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('AlertDialogJsunit_0100'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('AlertDialogJsunit_0100');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[AlertDialogJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("one button dialog");
      await driver.pressBack();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('AlertDialog2'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('AlertDialog2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[AlertDialogJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('label')).assertEqual("two button dialog");
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[AlertDialogJsunit_static_0100] END');
      done();
    });

  })
}
