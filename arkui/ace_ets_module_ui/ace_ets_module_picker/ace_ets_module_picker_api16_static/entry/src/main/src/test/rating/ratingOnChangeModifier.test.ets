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

export default function ratingOnChangeModifierTest() {
  describe('ratingOnChangeModifierTest', () => {
    beforeAll(() => {
      console.info("ratingOnChangeModifierTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ratingOnChangeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/rating/ratingOnChangeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ratingOnChangeModifierTest state pages:" + JSON.stringify(pages));
        if (!("ratingOnChangeModifier" == pages.name)) {
          console.info("get ratingOnChangeModifierTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push ratingOnChangeModifierTest page error:" + err);
      }
      console.info("ratingOnChangeModifierTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url:'MainAbility/pages/index/index',
      }
      routerInstance.pushUrl(options);
      console.info('ratingOnChangeModifier after each called');
    })
   
    
    


/**
     * @tc.number   ArkUX_Modifier_Rating_OnChange_static_1001
     * @tc.name     ArkUX_Modifier_Rating_OnChange_static_1001
     * @tc.desc     ArkUX_Modifier_Rating_OnChange_static_1001
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Modifier_Rating_OnChange_static_1001', Level.LEVEL1, async (done: () => void): Promise<void> => {

        console.info('ArkUX_Modifier_Rating_OnChange_static_1001 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('ratingButton'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = inspector.getInspectorByKey('ratingModifierKey');
        console.info("ArkUX_Modifier_Rating_OnChange_static_1001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('5');
        console.info('ArkUX_Modifier_Rating_OnChange_static_1001 END');
        done();
      });

  })
}
