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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';

export default function navigationJsunit() {
  describe('navigationTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("NavigationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigation',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationJsunit state pages: " + JSON.stringify(pages));
        if (!("navigation" == pages.name)) {
          console.info("get NavigationJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push NavigationJsunit page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1000
     * @tc.name     NavigationJsunit_static_1000
     * @tc.desc     NavigationJsunit_static_1000
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1000] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1000] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('minContentWidth')).assertEqual('10.00px');
      console.info('[NavigationJsunit_static_1000] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1001
     * @tc.name     NavigationJsunit_static_1001
     * @tc.desc     NavigationJsunit_static_1001
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1001] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1001] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('navBarWidthRange')).assertEqual("300.00vp, 800.00vp");
      console.info('[NavigationJsunit_static_1001] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1002
     * @tc.name     NavigationJsunit_static_1002
     * @tc.desc     NavigationJsunit_static_1002
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1002] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1002] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('navBarWidth')).assertEqual('120.00vp');
      console.info('[NavigationJsunit_static_1002] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1003
     * @tc.name     NavigationJsunit_static_1003
     * @tc.desc     NavigationJsunit_static_1003
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1003] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1003] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('navBarPosition')).assertEqual('NavBarPosition.Start');
      console.info('[NavigationJsunit_static_1003] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1004
     * @tc.name     NavigationJsunit_static_1004
     * @tc.desc     NavigationJsunit_static_1004
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1004] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1004] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('mode')).assertEqual('NavigationMode.SPLIT');
      console.info('[NavigationJsunit_static_1004] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1005
     * @tc.name     NavigationJsunit_static_1005
     * @tc.desc     NavigationJsunit_static_1005
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1005', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1005] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1005] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('backButtonIcon')).assertEqual('resources/base/media/icon.png');
      console.info('[NavigationJsunit_static_1005] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1006
     * @tc.name     NavigationJsunit_static_1006
     * @tc.desc     NavigationJsunit_static_1006
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1006] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1006] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('hideNavBar')).assertEqual(false);
      console.info('[NavigationJsunit_static_1006] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1007
     * @tc.name     NavigationJsunit_static_1007
     * @tc.desc     NavigationJsunit_static_1007
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1007', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1007] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1007] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('hideTitleBar')).assertEqual(false);
      console.info('[NavigationJsunit_static_1007] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1008
     * @tc.name     NavigationJsunit_static_1008
     * @tc.desc     NavigationJsunit_static_1008
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1008', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1008] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1008] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('title')).assertEqual('test');
      console.info('[NavigationJsunit_static_1008] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1009
     * @tc.name     NavigationJsunit_static_1009
     * @tc.desc     NavigationJsunit_static_1009
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1009', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1009] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1009] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('hideBackButton')).assertEqual(false);
      console.info('[NavigationJsunit_static_1009] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1010
     * @tc.name     NavigationJsunit_static_1010
     * @tc.desc     NavigationJsunit_static_1010
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1010] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1010] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('titleMode')).assertEqual('NavigationTitleMode.Free');
      console.info('[NavigationJsunit_static_1010] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1011
     * @tc.name     NavigationJsunit_static_1011
     * @tc.desc     NavigationJsunit_static_1011
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1011', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[NavigationJsunit_static_1011] START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1011] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('hideToolBar')).assertEqual(false);
      console.info('[NavigationJsunit_static_1011] END');
      done();
    });

    
    
    /**
     * @tc.number   NavigationJsunit_static_1012
     * @tc.name     NavigationJsunit_static_1012
     * @tc.desc     NavigationJsunit_static_1012
     * @tc.level    Level.LEVEL0
     */
it('NavigationJsunit_static_1012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[NavigationJsunit_static_1012] START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[NavigationJsunit_static_1012] component obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('minContentWidth')).assertEqual('20.00px');
      console.info('[NavigationJsunit_static_1012] END');
      done();
    });
  })
}
