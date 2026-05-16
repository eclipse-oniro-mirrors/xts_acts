'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function ProviderTestJsunit18() {
  describe('ProviderTestJsunit18', () => {

    beforeAll(() => {
      console.info("ProviderTestJsunit18 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("ProviderTestJsunit18 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Provider/Provider18",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ProviderTestJsunit18 state pages:" + JSON.stringify(pages));
        if (!("Provider18" == pages.name)) {
          console.info("get ProviderTestJsunit18 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ProviderTestJsunit18 page error:" + err);
      }
      console.info("ProviderTestJsunit18 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProviderTestJsunit18 after each called");
    });

    
    
    /**
     * @tc.number   Provider18Test_static_0100
     * @tc.name     Provider18Test_static_0100
     * @tc.desc     Provider18Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Provider18Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider18Test_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnParent'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strBut = inspector.getInspectorByKey('btnParent');
      let strText = inspector.getInspectorByKey('tvChild1');
      let objBut = JSON.parseJsonElement(strBut);
      let objText = JSON.parseJsonElement(strText);
      console.info("[Provider18Test_static_0100] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider18Test_static_0100] component objText is: " + JSON.stringify(objText));
      expect(objBut.getElement('$attrs').getString('label')).assertEqual('parent (51) +1');
      expect(objText.getElement('$attrs').getString('content')).assertEqual('reviewVotes(41)');
      console.info('[Provider18Test_static_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   Provider18Test_static_0200
     * @tc.name     Provider18Test_static_0200
     * @tc.desc     Provider18Test_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Provider18Test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider18Test_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnChild'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strBut = inspector.getInspectorByKey('btnChild');
      let strText = inspector.getInspectorByKey('tvChild1');
      let strText1 = inspector.getInspectorByKey('tvChild2');
      let strText2 = inspector.getInspectorByKey('tvChild3');
      let strText3 = inspector.getInspectorByKey('tvChild4');
      let objBut = JSON.parseJsonElement(strBut);
      let objText = JSON.parseJsonElement(strText);
      let objText1 = JSON.parseJsonElement(strText1);
      let objText2 = JSON.parseJsonElement(strText2);
      let objText3 = JSON.parseJsonElement(strText3);
      console.info("[Provider18Test_static_0200] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider18Test_static_0200] component objText is: " + JSON.stringify(objText));
      console.info("[Provider18Test_static_0200] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_static_0200] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_static_0200] component objText3 is: " + JSON.stringify(objText3));
      expect(objText.getElement('$attrs').getString('content')).assertEqual('reviewVotes(45)');
      expect(objText1.getElement('$attrs').getString('content')).assertEqual('reviewVotes(64)');
      expect(objText2.getElement('$attrs').getString('content')).assertEqual('reviewVotes(64)');
      expect(objText3.getElement('$attrs').getString('content')).assertEqual('reviewVotes(64)');
      console.info('[Provider18Test_static_0200] END');
      done();
    });
    
    
    /**
     * @tc.number   Provider18Test_static_0300
     * @tc.name     Provider18Test_static_0300
     * @tc.desc     Provider18Test_static_0300
     * @tc.level    Level.LEVEL0
     */
it('Provider18Test_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider18Test_static_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('tvChild2'));
      await (text?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strText1 = inspector.getInspectorByKey('tvChild2');
      let strText2 = inspector.getInspectorByKey('tvChild3');
      let strText3 = inspector.getInspectorByKey('tvChild4');
      let objText1 = JSON.parseJsonElement(strText1);
      let objText2 = JSON.parseJsonElement(strText2);
      let objText3 = JSON.parseJsonElement(strText3);
      console.info("[Provider18Test_static_0300] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_static_0300] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_static_0300] component objText3 is: " + JSON.stringify(objText3));
      expect(objText1.getElement('$attrs').getString('content')).assertEqual('reviewVotes(65)');
      expect(objText2.getElement('$attrs').getString('content')).assertEqual('reviewVotes(65)');
      expect(objText3.getElement('$attrs').getString('content')).assertEqual('reviewVotes(65)');
      console.info('[Provider18Test_static_0300] END');
      done();
    });
    
    
    /**
     * @tc.number   Provider18Test_static_0400
     * @tc.name     Provider18Test_static_0400
     * @tc.desc     Provider18Test_static_0400
     * @tc.level    Level.LEVEL0
     */
it('Provider18Test_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider18Test_static_0400 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('tvChild3'));
      await (text?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strText1 = inspector.getInspectorByKey('tvChild2');
      let strText2 = inspector.getInspectorByKey('tvChild3');
      let strText3 = inspector.getInspectorByKey('tvChild4');
      let objText1 = JSON.parseJsonElement(strText1);
      let objText2 = JSON.parseJsonElement(strText2);
      let objText3 = JSON.parseJsonElement(strText3);
      console.info("[Provider18Test_static_0400] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_static_0400] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_static_0400] component objText3 is: " + JSON.stringify(objText3));
      expect(objText1.getElement('$attrs').getString('content')).assertEqual('reviewVotes(66)');
      expect(objText2.getElement('$attrs').getString('content')).assertEqual('reviewVotes(66)');
      expect(objText3.getElement('$attrs').getString('content')).assertEqual('reviewVotes(66)');
      console.info('[Provider18Test_static_0400] END');
      done();
    });
    
    
    /**
     * @tc.number   Provider18Test_static_0500
     * @tc.name     Provider18Test_static_0500
     * @tc.desc     Provider18Test_static_0500
     * @tc.level    Level.LEVEL0
     */
it('Provider18Test_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider18Test_static_0500 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('tvChild4'));
      await (text?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strText1 = inspector.getInspectorByKey('tvChild2');
      let strText2 = inspector.getInspectorByKey('tvChild3');
      let strText3 = inspector.getInspectorByKey('tvChild4');
      let objText1 = JSON.parseJsonElement(strText1);
      let objText2 = JSON.parseJsonElement(strText2);
      let objText3 = JSON.parseJsonElement(strText3);
      console.info("[Provider18Test_static_0500] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_static_0500] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_static_0500] component objText3 is: " + JSON.stringify(objText3));
      expect(objText1.getElement('$attrs').getString('content')).assertEqual('reviewVotes(67)');
      expect(objText2.getElement('$attrs').getString('content')).assertEqual('reviewVotes(67)');
      expect(objText3.getElement('$attrs').getString('content')).assertEqual('reviewVotes(67)');
      console.info('[Provider18Test_static_0500] END');
      done();
    });
  })
}
