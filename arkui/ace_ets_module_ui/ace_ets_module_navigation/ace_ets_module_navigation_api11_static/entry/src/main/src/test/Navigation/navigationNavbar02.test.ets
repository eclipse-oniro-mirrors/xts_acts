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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function navigationNavbar02() {
  describe('navigationNavbar02',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigationNavbar02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationNavbar02',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigationNavbar02 state pages: " + JSON.stringify(pages));
        if (!("navigationNavbar02" == pages.name)) {
          console.info("get navigationNavbar02 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationNavbar02 page result: ");
        }
      } catch (err) {
        console.error("push navigationNavbar02 page error: " + err);
        expect().assertFail();
      }
    });


    
/**
     * @tc.number   navigationNavbar02_static_001
     * @tc.name     navigationNavbar02_static_001
     * @tc.desc     navigationNavbar02_static_001
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationNavbar02_static_001] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'navBarWidth', value: -2 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_001] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual('240.00vp');
      console.info('[navigationNavbar02_static_001] END');
      done();
    });


    
/**
     * @tc.number   navigationNavbar02_static_002
     * @tc.name     navigationNavbar02_static_002
     * @tc.desc     navigationNavbar02_static_002
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationNavbar02_static_002] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'navBarWidth', value: 0 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_002] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual('240.00vp');

      console.info('[navigationNavbar02_static_002] END');
      done();
    });

    
/**
     * @tc.number   navigationNavbar02_static_003
     * @tc.name     navigationNavbar02_static_003
     * @tc.desc     navigationNavbar02_static_003
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationNavbar02_static_003] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'navBarWidth', value: 260 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_003] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual('260.00vp');

      console.info('[navigationNavbar02_static_003] END');
      done();
    });

    
/**
     * @tc.number   navigationNavbar02_static_004
     * @tc.name     navigationNavbar02_static_004
     * @tc.desc     navigationNavbar02_static_004
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationNavbar02_static_004] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'navModeIndex', value: 1 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_004] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual('NavigationMode.STACK');

      console.info('[navigationNavbar02_static_004] END');
      done();
    });

    
/**
     * @tc.number   navigationNavbar02_static_005
     * @tc.name     navigationNavbar02_static_005
     * @tc.desc     navigationNavbar02_static_005
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationNavbar02_static_005] START');
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideNavBar', value: true });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_005] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('hideNavBar')).assertEqual(true);

      console.info('[navigationNavbar02_static_005] END');
      done();
    });

    
/**
     * @tc.number   navigationNavbar02_static_006
     * @tc.name     navigationNavbar02_static_006
     * @tc.desc     navigationNavbar02_static_006
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationNavbar02_static_006] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'minContentWidth', value: -2 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_006] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual('360.00vp');

      console.info('[navigationNavbar02_static_006] END');
      done();
    });


    
/**
     * @tc.number   navigationNavbar02_static_008
     * @tc.name     navigationNavbar02_static_008
     * @tc.desc     navigationNavbar02_static_008
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationNavbar02_static_008] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'minContentWidth', value: 360 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_008] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual('360.00vp');

      console.info('[navigationNavbar02_static_008] END');
      done();
    });


    
/**
     * @tc.number   navigationNavbar02_static_009
     * @tc.name     navigationNavbar02_static_009
     * @tc.desc     navigationNavbar02_static_009
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationNavbar02_static_011] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'navModeIndex', value: 0 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_011] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual('NavigationMode.SPLIT');

      console.info('[navigationNavbar02_static_011] END');
      done();
    });


    
/**
     * @tc.number   navigationNavbar02_static_010
     * @tc.name     navigationNavbar02_static_010
     * @tc.desc     navigationNavbar02_static_010
     * @tc.level    Level.LEVEL0
     */
it('navigationNavbar02_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[navigationNavbar02_static_012] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'navModeIndex', value: 2 });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationNavbar');

      console.info("[navigationNavbar02_static_012] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual('NavigationMode.AUTO');

      console.info('[navigationNavbar02_static_012] END');
      done();
    });
  })
}
