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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MultiNavigationTest() {
  describe('MultiNavigationTest', () => {
    beforeAll(() => {
      console.info("MultiNavigationTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("MultiNavigation beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigationEntry',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MultiNavigation state pages:" + JSON.stringify(pages));
        if (!("MultiNavigationEntry" == pages.name)) {
          console.info("get MultiNavigation pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push MultiNavigation page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation page error:" + err);
      }
      console.info("MultiNavigation beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("MultiNavigation after each called");
    });


    
    

    /**
     * @tc.number   MultiNavigation_static_0100
     * @tc.name     MultiNavigation_static_0100
     * @tc.desc     MultiNavigation_static_0100
     * @tc.level    Level.LEVEL0
     */
it('MultiNavigation_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiNavigation_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('setPlaceholderPageId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiNavigation_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('homePageId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[MultiNavigation_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiNavigation_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PageHome1');

      console.info('MultiNavigation_0100 END');
      done();
    });


    
    

    /**
     * @tc.number   MultiNavigation_static_0200
     * @tc.name     MultiNavigation_static_0200
     * @tc.desc     MultiNavigation_static_0200
     * @tc.level    Level.LEVEL0
     */
it('MultiNavigation_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiNavigation_0200 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await (scrollBar?.scrollSearch(ON.id('switchFullScreenId')) as Promise<Component>);
      await (btn1?.click() as Promise<void>)
      console.info('[MultiNavigation_0200] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('homePageId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[MultiNavigation_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiNavigation_0200] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PageHome1');

      console.info('MultiNavigation_0200 END');
      done();
    });


    
    

    /**
     * @tc.number   MultiNavigation_static_0300
     * @tc.name     MultiNavigation_static_0300
     * @tc.desc     MultiNavigation_static_0300
     * @tc.level    Level.LEVEL0
     */
it('MultiNavigation_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiNavigation_0300 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await (scrollBar?.scrollSearch(ON.id('pageDetail1Id')) as Promise<Component>);
      await (btn1?.click() as Promise<void>)
      console.info('[MultiNavigation_0300] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('setKeepBottomPageId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiNavigation_0300] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('detailPopId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiNavigation_0300] btn3 click');
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('detailTextId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[MultiNavigation_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiNavigation_0300] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PageDetail1');

      console.info('MultiNavigation_0300 END');
      done();
    });
  })
}