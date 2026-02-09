'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';

export default function radioOnChangeModifierTest() {
  describe('radioOnChangeModifierTest', () => {
    beforeAll(() => {
      console.info("radioOnChangeModifierTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("radioOnChangeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/radio/radioOnChangeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get radioOnChangeModifierTest state pages:" + JSON.stringify(pages));
        if (!("radioOnChangeModifier" == pages.name)) {
          console.info("get radioOnChangeModifierTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push radioOnChangeModifierTest page error:" + err);
      }
      console.info("radioOnChangeModifierTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('radioOnChangeModifierTest after each called');
    })
   
    
    


/**
     * @tc.number   ArkUX_Modifier_Radio_OnChange_static_1001
     * @tc.name     ArkUX_Modifier_Radio_OnChange_static_1001
     * @tc.desc     ArkUX_Modifier_Radio_OnChange_static_1001
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Modifier_Radio_OnChange_static_1001', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('ArkUX_Modifier_CheckboxGroup_OnChange_1001 START');
        let driver = Driver.create();
        let checkbox = await driver.findComponent(ON.id('mRadio1'));
        await (checkbox?.click() as Promise<void>);
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = inspector.getInspectorByKey('mRadio1Value');
        console.info("ArkUX_Modifier_CheckboxGroup_OnChange_1001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('true');
        console.info('ArkUX_Modifier_CheckboxGroup_OnChange_1001 END');
        done();
      });
  
      
      


/**
     * @tc.number   ArkUX_Modifier_Radio_OnChange_static_1002
     * @tc.name     ArkUX_Modifier_Radio_OnChange_static_1002
     * @tc.desc     ArkUX_Modifier_Radio_OnChange_static_1002
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Modifier_Radio_OnChange_static_1002', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('ArkUX_Modifier_Radio_OnChange_static_1002 START');
        let driver = Driver.create();
        let checkbox = await driver.findComponent(ON.id('mRadio1'));
        await (checkbox?.click() as Promise<void>);
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = inspector.getInspectorByKey('mRadio1Value1');
        console.info("ArkUX_Modifier_Radio_OnChange_static_1002 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('false');
        console.info('ArkUX_Modifier_Radio_OnChange_static_1002 END');
        done();
      });

  })
}
