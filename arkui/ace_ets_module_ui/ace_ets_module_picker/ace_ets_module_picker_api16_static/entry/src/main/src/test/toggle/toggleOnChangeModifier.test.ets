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
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function toggleOnChangeModifierTest() {
  describe('toggleOnChangeModifierTest', () => {
    beforeAll(() => {
      console.info("toggleOnChangeModifierTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("toggleOnChangeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/toggle/toggleOnChangeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get toggleOnChangeModifierTest state pages:" + JSON.stringify(pages));
        if (!("toggleOnChangeModifier" == pages.name)) {
          console.info("get toggleOnChangeModifierTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push toggleOnChangeModifierTest page error:" + err);
      }
      console.info("toggleOnChangeModifierTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('toggleOnChangeModifier after each called');
    })
   
    
    


/**
     * @tc.number   ArkUX_Modifier_Toggle_OnChange_static1001
     * @tc.name     ArkUX_Modifier_Toggle_OnChange_static1001
     * @tc.desc     ArkUX_Modifier_Toggle_OnChange_static1001
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Modifier_Toggle_OnChange_static1001', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('ArkUX_Modifier_Toggle_OnChange_static1001 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('ToggleOne'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = inspector.getInspectorByKey('mToggleOneKey');
        console.info("ArkUX_Modifier_Toggle_OnChange_static1001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('false');
        console.info('ArkUX_Modifier_Toggle_OnChange_static1001 END');
        done();
      });
  
      
      


/**
     * @tc.number   ArkUX_Modifier_Toggle_OnChange_static1002
     * @tc.name     ArkUX_Modifier_Toggle_OnChange_static1002
     * @tc.desc     ArkUX_Modifier_Toggle_OnChange_static1002
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Modifier_Toggle_OnChange_static1002', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('ArkUX_Modifier_Toggle_OnChange_static1002 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('ToggleTwo'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = inspector.getInspectorByKey('mToggleTwoKey');
        console.info("ArkUX_Modifier_Toggle_OnChange_static1002 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('false');
        console.info('ArkUX_Modifier_Toggle_OnChange_static1002 END');
        done();
      });
  
      
      


/**
     * @tc.number   ArkUX_Modifier_Toggle_OnChange_static1003
     * @tc.name     ArkUX_Modifier_Toggle_OnChange_static1003
     * @tc.desc     ArkUX_Modifier_Toggle_OnChange_static1003
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Modifier_Toggle_OnChange_static1003', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('ArkUX_Modifier_Toggle_OnChange_static1003 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('ToggleThree'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = inspector.getInspectorByKey('mToggleThreeKey');
        console.info("ArkUX_Modifier_Toggle_OnChange_static1003 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('false');
        console.info('ArkUX_Modifier_Toggle_OnChange_static1003 END');
        done();
      });

  })
}
