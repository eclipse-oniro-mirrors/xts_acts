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
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import bundle from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext()
let winLeft: number = 0
let winTop: number = 0
AppStorage.setOrCreate<number>("winLeft", winLeft);
AppStorage.setOrCreate<number>("winLeft", winTop);


export default function sheetSize1Jsunit() {
  describe('sheetSize1Jsunit', () => {
    beforeAll(async (): Promise<void> => {
      console.info("sheetSize1Jsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("sheetSize1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/sheetSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sheetSize1Jsunit state pages:" + JSON.stringify(pages));
        if (!("sheetSize" == pages.name)) {
          console.info("get sheetSize1Jsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sheetSize1Jsunit page error:" + err);
      }
      console.info("sheetSize1Jsunit beforeEach end");
    });

    
    
/**
     * @tc.number   sheetSize1Jsunit_static_0100
     * @tc.name     sheetSize1Jsunit_static_0100
     * @tc.desc     sheetSize1Jsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('sheetSize1Jsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the sheetSize of the bindSheet
      await CommonFunc.sleep(1000);
      console.info('[sheetSize1Jsunit_0100] START');
      let strJson = inspector.getInspectorByKey('detents');
      await CommonFunc.sleep(1000);
      console.info("[sheetSize1Jsunit_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[sheetSize1Jsunit_0100] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual("0,1,2");
      console.info('[sheetSize1Jsunit_0100] END');
      done();
    });
    
    
    
// /**
//      * @tc.number   sheetSize1Jsunit_static_0200
//      * @tc.name     sheetSize1Jsunit_static_0200
//      * @tc.desc     sheetSize1Jsunit_static_0200
//      * @tc.level    Level.LEVEL2
//      */
// it('sheetSize1Jsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       // Get the sheetSize of the bindSheet
//       console.info('[sheetSize1Jsunit_0200] START');
//       let driver = Driver.create();
//       await CommonFunc.sleep(500);
//       let button = (await driver.findComponent(ON.id('bindSheet_SheetSize1')));
//       await CommonFunc.sleep(1000);
//       await (button?.click() as Promise<void>);
//       await (driver.click(Math.round(AppStorage.get<number>("winLeft") ?? 0 + 50).toInt(),
//         Math.round(AppStorage.get<number>("winTop") ?? 0 + 50).toInt()) as Promise<void>)
//       await CommonFunc.sleep(2000);
//       let strJson = inspector.getInspectorByKey('bindSheet_dismiss1');
//       await CommonFunc.sleep(1000);
//       console.info("[sheetSize1Jsunit_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
//       expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("dismiss succ");
//       console.info('[sheetSize1Jsunit_0200] END');
//       done();
//     });
  })
}
