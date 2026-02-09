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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function SheetTransition() {
  describe('SheetTransition', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SheetTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/SheetTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SheetTransition state pages:" + JSON.stringify(pages));
        if (!("SheetTransition" == pages.name)) {
          console.info("get SheetTransition pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SheetTransition page error:" + err);
      }
      console.info("SheetTransition beforeEach end");
    });

    
    
    /**
     * @tc.number   SheetTransition_static_0100
     * @tc.name     SheetTransition_static_0100
     * @tc.desc     SheetTransition_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SheetTransition_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SheetTransition_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('SheetTransition'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('SheetTypeValue');
      await CommonFunc.sleep(2000);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SheetTransition_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SheetTransition_0100] title: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("value SheetType:0");

      let size = await driver.getDisplaySize();
      let sizeX = size.x;
      console.info("[SheetTransition_0100] size x is: " + JSON.stringify(sizeX));
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('WidthValue');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SheetTransition_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SheetTransition_0100] title: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));


      expect(obj2.getElement('$attrs').getString('content')).assertEqual("value Width:" + sizeX);

      console.info('[SheetTransition_0100] END');
      done();
    });


  })
}

