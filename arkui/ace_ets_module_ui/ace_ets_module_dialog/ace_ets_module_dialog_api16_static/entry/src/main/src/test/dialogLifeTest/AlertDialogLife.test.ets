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

export default function AlertDialogLifeTest() {
  describe('AlertDialogLifeTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info('AlertDialogLifeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogLife/AlertDialogLife',
      }
      try {
        const CustomDialogLifeTest = AppStorage.get<Router>("router") as Router
        CustomDialogLifeTest.clear();
        let pages = CustomDialogLifeTest.getState();
        console.info('get AlertDialogLifeTest state pages:' + JSON.stringify(pages));
        if (!('AlertDialogLife' == pages.name)) {
          console.info('get AlertDialogLifeTest pages.name:' + JSON.stringify(pages.name));
          CustomDialogLifeTest.pushUrl(options);
          await UtilsTest.msSleep(2500);
        }
      } catch (err) {
        console.error('push AlertDialogLifeTest page error:' + err);
      }
      console.info('AlertDialogLifeTest beforeEach end');
    });


    
    /**
     * @tc.number   AlertDialogLife_static_0001
     * @tc.name     AlertDialogLife_static_0001
     * @tc.desc     AlertDialogLife_static_0001
     * @tc.level    Level.LEVEL2
     */
it('AlertDialogLife_static_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('AlertDialogLife_static_0001 START');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('AlertDialog', 10, "")
      await CommonFunc.sleep(1000);
      console.info('AlertDialogLife_0101 click after')
      let actionSheetFlag1 = inspector.getInspectorByKey('actionSheetFlag1');
      expect(JSON.parseJsonElement(actionSheetFlag1).getElement('$attrs').getString('content')).assertEqual('true');
      let actionSheetFlag2 = inspector.getInspectorByKey('actionSheetFlag2');
      expect(JSON.parseJsonElement(actionSheetFlag2).getElement('$attrs').getString('content')).assertEqual('true');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let actionSheetFlag3 = inspector.getInspectorByKey('actionSheetFlag3');
      expect(JSON.parseJsonElement(actionSheetFlag3).getElement('$attrs').getString('content')).assertEqual('true');
      let actionSheetFlag4 = inspector.getInspectorByKey('actionSheetFlag4');
      expect(JSON.parseJsonElement(actionSheetFlag4).getElement('$attrs').getString('content')).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('AlertDialogLife_static_0001 END');
      done();
    });
  })
}