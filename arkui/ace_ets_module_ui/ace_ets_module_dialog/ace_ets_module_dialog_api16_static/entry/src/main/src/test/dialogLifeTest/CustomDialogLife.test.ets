'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function CustomDialogLifeTest() {
  describe('CustomDialogLifeTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("CustomDialogLifeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogLife/CustomDialogLife',
      }
      try {
        const CustomDialogLifeTest = AppStorage.get<Router>("router") as Router
        CustomDialogLifeTest.clear();
        let pages: router.RouterState = CustomDialogLifeTest.getState();
        console.info("get CustomDialogLifeTest state pages: " + JSON.stringify(pages));
        if (!("CustomDialogLife" == pages.name)) {
          console.info("get CustomDialogLifeTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await CustomDialogLifeTest.pushUrl(options);
          CustomDialogLifeTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CustomDialogLifeTest success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push CustomDialogLifeTest page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   CustomDialogLife_static_0001
     * @tc.name     CustomDialogLife_static_0001
     * @tc.desc     CustomDialogLife_static_0001
     * @tc.level    Level.LEVEL2
     */
it('CustomDialogLife_static_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomDialogLife_static_0101 START');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('CustomDialog', 10, "")
      await CommonFunc.sleep(1000);
      console.info('CustomDialogLife_static_0101 click after')
      let customDialogFlag1 = inspector.getInspectorByKey('customDialogFlag1');
      expect(JSON.parseJsonElement(customDialogFlag1).getElement('$attrs').getString('content')).assertEqual('true');
      let customDialogFlag2 = inspector.getInspectorByKey('customDialogFlag2');
      expect(JSON.parseJsonElement(customDialogFlag2).getElement('$attrs').getString('content')).assertEqual('true');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.text('button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let customDialogFlag3 = inspector.getInspectorByKey('customDialogFlag3');
      expect(JSON.parseJsonElement(customDialogFlag3).getElement('$attrs').getString('content')).assertEqual('true');
      let customDialogFlag4 = inspector.getInspectorByKey('customDialogFlag4');
      expect(JSON.parseJsonElement(customDialogFlag4).getElement('$attrs').getString('content')).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('CustomDialogLife_static_0100 END');
      done();
    });
  })
}