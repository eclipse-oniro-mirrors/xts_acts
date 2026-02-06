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


export default function ActionSheetJsunit() {
  describe('ActionSheetJsunit', () => {
    beforeAll(() => {
      console.info("ActionSheetJsunit beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("ActionSheetJsunit  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ActionSheetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/actionSheet/ActionSheetOptions',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ActionSheetJsunit state pages: " + JSON.stringify(pages));
        if (!("ActionSheetJsunit" == pages.name)) {
          console.info("get ActionSheetJsunit state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ActionSheetJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ActionSheetJsunit page error: " + err);
        expect().assertFail();
      }
      // done()
    });


    
    
/**
     * @tc.number   ActionSheetJsunit_static_0100
     * @tc.name     ActionSheetJsunit_static_0100
     * @tc.desc     ActionSheetJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActionSheetJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {


      console.info('ActionSheetJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('ActionSheet'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ActionSheet');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ActionSheetJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("Click to Show ActionSheet");
      console.info('[ActionSheetJsunit_static_0100] END');
      await driver.pressBack();
      done();
    });

  })
}
