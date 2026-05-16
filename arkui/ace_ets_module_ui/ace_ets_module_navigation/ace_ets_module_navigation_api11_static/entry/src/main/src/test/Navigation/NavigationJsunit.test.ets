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
import {SharedTransitionEffectType,Color,NavBarPosition,NavigationTitleMode,NavigationMode} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function NavigationJsunit() {
  describe('NavigationJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationJsunit state pages: " + JSON.stringify(pages));
        if (!("NavigationPage" == pages.name)) {
          console.info("get NavigationJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationJsunit success: ");
        }
      } catch (err) {
        console.error("push NavigationJsunit page error: " + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   NavigationJsunit_static_0100
     * @tc.name     NavigationJsunit_static_0100
     * @tc.desc     NavigationJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Navigation component
      console.info('[NavigationJsunit_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigation');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[NavigationJsunit_static_0100] titleMode: " + obj.getElement('$attrs').getString('titleMode'));
      console.info("[NavigationJsunit_static_0100] hideToolBar: " + obj.getElement('$attrs').getBoolean('hideToolBar'));
      console.info("[NavigationJsunit_static_0100] hideTitleBar: " + obj.getElement('$attrs').getBoolean('hideTitleBar'));
      console.info("[NavigationJsunit_static_0100] hideBackButton: " + obj.getElement('$attrs').getBoolean('hideBackButton'));
      console.info("[NavigationJsunit_static_0100] navBarWidth: " + obj.getElement('$attrs').getString('navBarWidth'));
      console.info("[NavigationJsunit_static_0100] navBarPosition: " + obj.getElement('$attrs').getString('navBarPosition'));
      console.info("[NavigationJsunit_static_0100] mode: " + obj.getElement('$attrs').getString('mode'));
      console.info("[NavigationJsunit_static_0100] backButtonIcon: " + obj.getElement('$attrs').getString('backButtonIcon'));
      console.info("[NavigationJsunit_static_0100] hideNavBar: " + obj.getElement('$attrs').getBoolean('hideNavBar'));
      expect(obj.getElement('$attrs').getString('titleMode')).assertEqual('NavigationTitleMode.Free');
      expect(obj.getElement('$attrs').getBoolean('hideToolBar')).assertEqual(false);
      expect(obj.getElement('$attrs').getBoolean('hideTitleBar')).assertEqual(false);
      expect(obj.getElement('$attrs').getBoolean('hideBackButton')).assertEqual(false);
      expect(obj.getElement('$attrs').getString('navBarWidth')).assertEqual('700.00vp');
      expect(obj.getElement('$attrs').getString('navBarPosition')).assertEqual('NavBarPosition.Start');
      expect(obj.getElement('$attrs').getString('mode')).assertEqual('NavigationMode.SPLIT');
      expect(obj.getElement('$attrs').getString('backButtonIcon')).assertEqual('resources/base/media/icon.png');
      expect(obj.getElement('$attrs').getBoolean('hideNavBar')).assertEqual(false);
      console.info('[NavigationJsunit_static_0100] END');
      done();
    });

    
/**
     * @tc.number   NavigationJsunit_static_0300
     * @tc.name     NavigationJsunit_static_0300
     * @tc.desc     NavigationJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify onTitleModeChange event of Navigation component
      console.info('[NavigationJsunit_static_0300] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('titleModeChange');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_0300] content is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('TitleModeChange:');
      console.info('[NavigationJsunit_static_0300] END');
      done();
    });

    
/**
     * @tc.number   NavigationJsunit_static_0400
     * @tc.name     NavigationJsunit_static_0400
     * @tc.desc     NavigationJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify onNavBarStateChange event of Navigation component
      console.info('[NavigationJsunit_static_0400] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideNavBar',value: true})
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('navBarStateChange');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_0400] content is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('NavBarStateChange:succ');
      console.info('[NavigationJsunit_static_0400] END');
      done();
    });

    
/**
     * @tc.number   NavigationJsunit_static_0600
     * @tc.name     NavigationJsunit_static_0600
     * @tc.desc     NavigationJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify atrributes of Navigation component
      console.info('[NavigationJsunit_static_0600] START');
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideToolBar',value:true})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideTitleBar',value:true})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideBackButton',value:true})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<NavBarPosition>>("messageManager")?.notify({name:'navBarPosition',value:NavBarPosition.End})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'navBarWidth',value:710})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({name:'backButtonIcon',value:'resources/base/media/image.png'})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideNavBar',value:true})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the Navigation component
      let strJson = inspector.getInspectorByKey('navigation');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[NavigationJsunit_static_0600] hideToolBar: " + obj.getElement('$attrs').getBoolean('hideToolBar'));
      console.info("[NavigationJsunit_static_0600] hideTitleBar: " + obj.getElement('$attrs').getBoolean('hideTitleBar'));
      console.info("[NavigationJsunit_static_0600] hideBackButton: " + obj.getElement('$attrs').getBoolean('hideBackButton'));
      console.info("[NavigationJsunit_static_0600] navBarWidth: " + obj.getElement('$attrs').getString('navBarWidth'));
      console.info("[NavigationJsunit_static_0600] navBarPosition: " + obj.getElement('$attrs').getString('navBarPosition'));
      console.info("[NavigationJsunit_static_0600] backButtonIcon: " + obj.getElement('$attrs').getString('backButtonIcon'));
      console.info("[NavigationJsunit_static_0600] hideNavBar: " + obj.getElement('$attrs').getBoolean('hideNavBar'));
      expect(obj.getElement('$attrs').getBoolean('hideToolBar')).assertEqual(true);
      expect(obj.getElement('$attrs').getBoolean('hideTitleBar')).assertEqual(true);
      expect(obj.getElement('$attrs').getBoolean('hideBackButton')).assertEqual(true);
      expect(obj.getElement('$attrs').getString('navBarWidth')).assertEqual('710.00vp');
      expect(obj.getElement('$attrs').getString('navBarPosition')).assertEqual('NavBarPosition.End');
      expect(obj.getElement('$attrs').getString('backButtonIcon')).assertEqual('resources/base/media/image.png');
      expect(obj.getElement('$attrs').getBoolean('hideNavBar')).assertEqual(true);
      console.info('[NavigationJsunit_static_0600] END');
      done();
    });

    
/**
     * @tc.number   NavigationJsunit_static_0700
     * @tc.name     NavigationJsunit_static_0700
     * @tc.desc     NavigationJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the titleMode of Navigation component
      console.info('[NavigationJsunit_static_0700] START');
      AppStorage.get<MessageManager<NavigationTitleMode>>("messageManager")?.notify({name:'titleMode',value:NavigationTitleMode.Mini})
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('navigation');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_0700] titleMode is: " + obj.getElement('$attrs').getString('titleMode'));
      expect(obj.getElement('$attrs').getString('titleMode')).assertEqual('NavigationTitleMode.Mini');

      AppStorage.get<MessageManager<NavigationTitleMode>>("messageManager")?.notify({name:'titleMode',value:NavigationTitleMode.Full})
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('navigation');
      let obj1= JSON.parseJsonElement(strJson1);
      console.info("[NavigationJsunit_static_0700] titleMode1 is: " + obj1.getElement('$attrs').getString('titleMode'));
      expect(obj1.getElement('$attrs').getString('titleMode')).assertEqual('NavigationTitleMode.Full');
      console.info('[NavigationJsunit_static_0700] END');
      done();
    });

    
/**
     * @tc.number   NavigationJsunit_static_0800
     * @tc.name     NavigationJsunit_static_0800
     * @tc.desc     NavigationJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the mode of Navigation component
      console.info('[NavigationJsunit_static_0800] START');
      AppStorage.get<MessageManager<NavigationMode>>("messageManager")?.notify({name:'mode',value:NavigationMode.Auto})
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('navigation');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_0800] mode is: " + obj.getElement('$attrs').getString('mode'));
      expect(obj.getElement('$attrs').getString('mode')).assertEqual('NavigationMode.AUTO');

      AppStorage.get<MessageManager<NavigationMode>>("messageManager")?.notify({name:'mode',value:NavigationMode.Stack})
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('navigation');
      let obj1= JSON.parseJsonElement(strJson1);
      console.info("[NavigationJsunit_static_0800] mode1 is: " + obj1.getElement('$attrs').getString('mode'));
      expect(obj1.getElement('$attrs').getString('mode')).assertEqual('NavigationMode.STACK');
      console.info('[NavigationJsunit_static_0800] END');
      done();
    });

    
/**
     * @tc.number   NavigationJsunit_static_0900
     * @tc.name     NavigationJsunit_static_0900
     * @tc.desc     NavigationJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of Navigation component
      console.info('[NavigationJsunit_static_0900] START');
      AppStorage.get<MessageManager<NavigationTitleMode>>("messageManager")?.notify({name:'titleMode',value:NavigationTitleMode.Full})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideToolBar',value:false})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideTitleBar',value:false})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideBackButton',value:true})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({name:'navBarWidth',value:'200'})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<NavBarPosition>>("messageManager")?.notify({name:'navBarPosition',value:NavBarPosition.End})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<NavigationMode>>("messageManager")?.notify({name:'mode',value:NavigationMode.Auto})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({name:'backButtonIcon',value:''})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<boolean>>("messageManager")?.notify({name:'hideNavBar',value:false})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the Navigation component
      let strJson = inspector.getInspectorByKey('navigation');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_0900] component obj is: " + JSON.stringify(obj));
      console.info("[NavigationJsunit_static_0900] titleMode: " + obj.getElement('$attrs').getString('titleMode'));
      console.info("[NavigationJsunit_static_0900] hideToolBar: " + obj.getElement('$attrs').getBoolean('hideToolBar'));
      console.info("[NavigationJsunit_static_0900] hideTitleBar: " + obj.getElement('$attrs').getBoolean('hideTitleBar'));
      console.info("[NavigationJsunit_static_0900] hideBackButton: " + obj.getElement('$attrs').getBoolean('hideBackButton'));
      console.info("[NavigationJsunit_static_0900] navBarWidth: " + obj.getElement('$attrs').getString('navBarWidth'));
      console.info("[NavigationJsunit_static_0900] navBarPosition: " + obj.getElement('$attrs').getString('navBarPosition'));
      console.info("[NavigationJsunit_static_0900] mode: " + obj.getElement('$attrs').getString('mode'));
      console.info("[NavigationJsunit_static_0900] backButtonIcon: " + obj.getElement('$attrs').getString('backButtonIcon'));
      console.info("[NavigationJsunit_static_0900] hideNavBar: " + obj.getElement('$attrs').getBoolean('hideNavBar'));
      expect(obj.getElement('$attrs').getString('titleMode')).assertEqual('NavigationTitleMode.Full');
      expect(obj.getElement('$attrs').getBoolean('hideToolBar')).assertEqual(false);
      expect(obj.getElement('$attrs').getBoolean('hideTitleBar')).assertEqual(false);
      expect(obj.getElement('$attrs').getBoolean('hideBackButton')).assertEqual(true);
      expect(obj.getElement('$attrs').getString('navBarWidth')).assertEqual('200.00vp');
      expect(obj.getElement('$attrs').getString('navBarPosition')).assertEqual('NavBarPosition.End');
      expect(obj.getElement('$attrs').getString('mode')).assertEqual('NavigationMode.AUTO');
      expect(obj.getElement('$attrs').getString('backButtonIcon')).assertEqual('');
      expect(obj.getElement('$attrs').getBoolean('hideNavBar')).assertEqual(false);
      console.info('[NavigationJsunit_static_0900] END');
      done();
    });
  })
}
