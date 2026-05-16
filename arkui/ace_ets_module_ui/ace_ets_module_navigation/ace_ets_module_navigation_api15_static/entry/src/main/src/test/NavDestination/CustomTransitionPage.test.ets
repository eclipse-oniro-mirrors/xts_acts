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
let tag = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function CustomTransitionPage() {
  describe('CustomTransitionPage', () => {
    beforeAll(() => {
      console.info("CustomTransitionPage beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.navigation15.static", "EntryAbility");
      await UtilsTest.msSleep(8000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("CustomTransitionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/CustomTransitionPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomTransitionPage state pages:" + JSON.stringify(pages));
        if (!("CustomTransitionPage" == pages.name)) {
          console.info("get CustomTransitionPage pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CustomTransitionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomTransitionPage page error:" + err);
      }
      console.info("CustomTransitionPage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("CustomTransitionPage after each called");
    });


    
    

    /**
     * @tc.number   CustomTransitionPage_static_0100
     * @tc.name     CustomTransitionPage_static_0100
     * @tc.desc     CustomTransitionPage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CustomTransitionPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CustomTransitionPage_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushOneId'));
      await (btn1?.click() as Promise<void>)
      console.info('[CustomTransitionPage_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('pushTrueId');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[CustomTransitionPage_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[CustomTransitionPage_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('50');

      console.info('CustomTransitionPage_0100 END');
      done();
    });

    
    

    /**
     * @tc.number   CustomTransitionPage_static_0200
     * @tc.name     CustomTransitionPage_static_0200
     * @tc.desc     CustomTransitionPage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('CustomTransitionPage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CustomTransitionPage_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushId'));
      await (btn1?.click() as Promise<void>)
      console.info('[CustomTransitionPage_0200] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('pushTrueId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[CustomTransitionPage_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[CustomTransitionPage_0200] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100');

      let strJson2 = inspector.getInspectorByKey('pushFalseId');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[CustomTransitionPage_0200] component obj2 is: ' + JSON.stringify(obj2));
      console.info('[CustomTransitionPage_0200] content obj2 is: ' + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('push_0');

      console.info('CustomTransitionPage_0200 END');
      done();
    });


    
    

    /**
     * @tc.number   CustomTransitionPage_static_0300
     * @tc.name     CustomTransitionPage_static_0300
     * @tc.desc     CustomTransitionPage_static_0300
     * @tc.level    Level.LEVEL0
     */
it('CustomTransitionPage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CustomTransitionPage_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('popId'));
      await (btn1?.click() as Promise<void>)
      console.info('[CustomTransitionPage_0300] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('popTrueId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[CustomTransitionPage_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[CustomTransitionPage_0300] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('pop_1');

      let strJson2 = inspector.getInspectorByKey('popFalseId');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[CustomTransitionPage_0200] component obj2 is: ' + JSON.stringify(obj2));
      console.info('[CustomTransitionPage_0200] content obj2 is: ' + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('pop_0');

      console.info('CustomTransitionPage_0300 END');
      done();
    });

    
    

    /**
     * @tc.number   CustomTransitionPage_static_0400
     * @tc.name     CustomTransitionPage_static_0400
     * @tc.desc     CustomTransitionPage_static_0400
     * @tc.level    Level.LEVEL0
     */
it('CustomTransitionPage_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CustomTransitionPage_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushId'));
      await (btn1?.click() as Promise<void>)
      console.info('[CustomTransitionPage_0400] btn1 click');
      await CommonFunc.sleep(500);
      let btn2 = await driver.findComponent(ON.id('replaceId'));
      await (btn2?.click() as Promise<void>)
      console.info('[CustomTransitionPage_0400] btn2 click');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('replaceTrueId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[CustomTransitionPage_0400] component obj is: ' + JSON.stringify(obj));
      console.info('[CustomTransitionPage_0400] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('replace_1');

      let strJson2 = inspector.getInspectorByKey('replaceFalseId');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[CustomTransitionPage_0400] component obj2 is: ' + JSON.stringify(obj2));
      console.info('[CustomTransitionPage_0400] content obj2 is: ' + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('replace_0');

      console.info('CustomTransitionPage_0400 END');
      done();
    });
  })
}