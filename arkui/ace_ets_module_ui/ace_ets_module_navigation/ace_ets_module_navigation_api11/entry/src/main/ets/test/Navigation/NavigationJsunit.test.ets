/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function NavigationJsunit() {
  describe('NavigationJsunit', function () {
    beforeEach(async function (done) {
      console.info("NavigationJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Navigation/NavigationPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationJsunit state pages: " + JSON.stringify(pages));
        if (!("NavigationPage" == pages.name)) {
          console.info("get NavigationJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('NavigationJsunit_0100', 0, async function (done) {
      // Get the information of the Navigation component
      console.info('[NavigationJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigation');
      let obj = JSON.parse(strJson);
      console.info("[NavigationJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[NavigationJsunit_0100] titleMode: " + obj.$attrs.titleMode);
      console.info("[NavigationJsunit_0100] toolBar: " + obj.$attrs.toolBar);
      console.info("[NavigationJsunit_0100] hideToolBar: " + obj.$attrs.hideToolBar);
      console.info("[NavigationJsunit_0100] hideTitleBar: " + obj.$attrs.hideTitleBar);
      console.info("[NavigationJsunit_0100] hideBackButton: " + obj.$attrs.hideBackButton);
      console.info("[NavigationJsunit_0100] navBarWidth: " + obj.$attrs.navBarWidth);
      console.info("[NavigationJsunit_0100] navBarPosition: " + obj.$attrs.navBarPosition);
      console.info("[NavigationJsunit_0100] mode: " + obj.$attrs.mode);
      console.info("[NavigationJsunit_0100] backButtonIcon: " + obj.$attrs.backButtonIcon);
      console.info("[NavigationJsunit_0100] hideNavBar: " + obj.$attrs.hideNavBar);
      expect(obj.$attrs.titleMode).assertEqual('NavigationTitleMode.Free');
      expect(obj.$attrs.toolBar).assertEqual('{"items":[]}');
      expect(obj.$attrs.hideToolBar).assertEqual(false);
      expect(obj.$attrs.hideTitleBar).assertEqual(false);
      expect(obj.$attrs.hideBackButton).assertEqual(false);
      expect(obj.$attrs.navBarWidth).assertEqual('700.00vp');
      expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.Start');
      expect(obj.$attrs.mode).assertEqual('NavigationMode.SPLIT');
      expect(obj.$attrs.backButtonIcon).assertEqual('resources/base/media/icon.png');
      expect(obj.$attrs.hideNavBar).assertEqual(false);
      console.info('[NavigationJsunit_0100] END');
      done();
    });

    it('NavigationJsunit_0300', 0, async function (done) {
      // Verify onTitleModeChange event of Navigation component
      console.info('[NavigationJsunit_0300] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('titleModeChange');
      let obj = JSON.parse(strJson);
      console.info("[NavigationJsunit_0300] content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('TitleModeChange:');
      console.info('[NavigationJsunit_0300] END');
      done();
    });

    it('NavigationJsunit_0400', 0, async function (done) {
      // Verify onNavBarStateChange event of Navigation component
      console.info('[NavigationJsunit_0400] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideNavBar',value:'true'})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('navBarStateChange');
      let obj = JSON.parse(strJson);
      console.info("[NavigationJsunit_0400] content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('NavBarStateChange:succ');
      console.info('[NavigationJsunit_0400] END');
      done();
    });

    it('NavigationJsunit_0600', 0, async function (done) {
      // Modify atrributes of Navigation component 
      console.info('[NavigationJsunit_0600] START');
      globalThis.value.message.notify({name:'hideToolBar',value:true})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideTitleBar',value:true})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideBackButton',value:true})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'navBarPosition',value:NavBarPosition.End})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'navBarWidth',value:710})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'backButtonIcon',value:'resources/base/media/image.png'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideNavBar',value:true})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the Navigation component
      let strJson = getInspectorByKey('navigation');
      let obj = JSON.parse(strJson);
      console.info("[NavigationJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[NavigationJsunit_0600] hideToolBar: " + obj.$attrs.hideToolBar);
      console.info("[NavigationJsunit_0600] hideTitleBar: " + obj.$attrs.hideTitleBar);
      console.info("[NavigationJsunit_0600] hideBackButton: " + obj.$attrs.hideBackButton);
      console.info("[NavigationJsunit_0600] navBarWidth: " + obj.$attrs.navBarWidth);
      console.info("[NavigationJsunit_0600] navBarPosition: " + obj.$attrs.navBarPosition);
      console.info("[NavigationJsunit_0600] backButtonIcon: " + obj.$attrs.backButtonIcon);
      console.info("[NavigationJsunit_0600] hideNavBar: " + obj.$attrs.hideNavBar);
      expect(obj.$attrs.hideToolBar).assertEqual(true);
      expect(obj.$attrs.hideTitleBar).assertEqual(true);
      expect(obj.$attrs.hideBackButton).assertEqual(true);
      expect(obj.$attrs.navBarWidth).assertEqual('710.00vp');
      expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.End');
      expect(obj.$attrs.backButtonIcon).assertEqual('resources/base/media/image.png');
      expect(obj.$attrs.hideNavBar).assertEqual(true);
      console.info('[NavigationJsunit_0600] END');
      done();
    });

    it('NavigationJsunit_0700', 0, async function (done) {
      // Modify the titleMode of Navigation component 
      console.info('[NavigationJsunit_0700] START');
      globalThis.value.message.notify({name:'titleMode',value:NavigationTitleMode.Mini})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('navigation');
      let obj = JSON.parse(strJson);
      console.info("[NavigationJsunit_0700] titleMode is: " + obj.$attrs.titleMode);
      expect(obj.$attrs.titleMode).assertEqual('NavigationTitleMode.Mini');

      globalThis.value.message.notify({name:'titleMode',value:NavigationTitleMode.Full})
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('navigation');
      let obj1 = JSON.parse(strJson1);
      console.info("[NavigationJsunit_0700] titleMode1 is: " + obj1.$attrs.titleMode);
      expect(obj1.$attrs.titleMode).assertEqual('NavigationTitleMode.Full');
      console.info('[NavigationJsunit_0700] END');
      done();
    });

    it('NavigationJsunit_0800', 0, async function (done) {
      // Modify the mode of Navigation component 
      console.info('[NavigationJsunit_0800] START');
      globalThis.value.message.notify({name:'mode',value:NavigationMode.Auto})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('navigation');
      let obj = JSON.parse(strJson);
      console.info("[NavigationJsunit_0800] mode is: " + obj.$attrs.mode);
      //expect(obj.$attrs.mode).assertEqual('NavigationMode.Auto');

      globalThis.value.message.notify({name:'mode',value:NavigationMode.Stack})
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('navigation');
      let obj1 = JSON.parse(strJson1);
      console.info("[NavigationJsunit_0800] mode1 is: " + obj1.$attrs.mode);
      expect(obj1.$attrs.mode).assertEqual('NavigationMode.STACK');
      console.info('[NavigationJsunit_0800] END');
      done();
    });

    it('NavigationJsunit_0900', 0, async function (done) {
      // Illegal modification of properties of Navigation component
      console.info('[NavigationJsunit_0900] START');
      globalThis.value.message.notify({name:'titleMode',value:123})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideToolBar',value:-5})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideTitleBar',value:'#abc'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideBackButton',value:'123'})
      await CommonFunc.sleep(1000);      
      globalThis.value.message.notify({name:'navBarWidth',value:'200'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'navBarPosition',value:123})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'mode',value:'abc'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'backButtonIcon',value:123})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'hideNavBar',value:0})
      await CommonFunc.sleep(2000); 

      // Get the propoties value of the Navigation component
      let strJson = getInspectorByKey('navigation');
      let obj = JSON.parse(strJson);
      console.info("[NavigationJsunit_0900] component obj is: " + JSON.stringify(obj));
      console.info("[NavigationJsunit_0900] titleMode: " + obj.$attrs.titleMode);
      console.info("[NavigationJsunit_0900] hideToolBar: " + obj.$attrs.hideToolBar);
      console.info("[NavigationJsunit_0900] hideTitleBar: " + obj.$attrs.hideTitleBar);
      console.info("[NavigationJsunit_0900] hideBackButton: " + obj.$attrs.hideBackButton);
      console.info("[NavigationJsunit_0900] navBarWidth: " + obj.$attrs.navBarWidth);
      console.info("[NavigationJsunit_0900] navBarPosition: " + obj.$attrs.navBarPosition);
      console.info("[NavigationJsunit_0900] mode: " + obj.$attrs.mode);
      console.info("[NavigationJsunit_0900] backButtonIcon: " + obj.$attrs.backButtonIcon);
      console.info("[NavigationJsunit_0900] hideNavBar: " + obj.$attrs.hideNavBar);
      expect(obj.$attrs.titleMode).assertEqual('NavigationTitleMode.Full');
      expect(obj.$attrs.hideToolBar).assertEqual(false);
      expect(obj.$attrs.hideTitleBar).assertEqual(false);
      expect(obj.$attrs.hideBackButton).assertEqual(true);
      expect(obj.$attrs.navBarWidth).assertEqual('200.00vp');
      expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.End');
      expect(obj.$attrs.mode).assertEqual('NavigationMode.AUTO');
      expect(obj.$attrs.backButtonIcon).assertEqual('');
      expect(obj.$attrs.hideNavBar).assertEqual(false);
      console.info('[NavigationJsunit_0900] END');
      done();
    });
  })
}
