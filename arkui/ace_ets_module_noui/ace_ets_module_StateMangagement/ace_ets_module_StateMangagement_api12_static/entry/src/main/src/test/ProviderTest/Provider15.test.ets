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
export default function Provider15Test() {
  describe('Provider15Test', () => {

    beforeAll(() => {
      console.info("Provider15Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Provider15Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider15',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Provider15Test state pages:" + JSON.stringify(pages));
        if (!("Provider15" == pages.name)) {
          console.info("get Provider15Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.replaceUrl(options);
          console.info("get Provider15Test pages.name:" + JSON.stringify(routerInstance.getState().name));
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Provider15Test page error:" + err);
      }
      console.info("Provider15Test beforeEach end");
    });

    
    
    /**
     * @tc.number   Provider15Test_static_0100
     * @tc.name     Provider15Test_static_0100
     * @tc.desc     Provider15Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Provider15Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider15Test_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Provider15'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strBut = inspector.getInspectorByKey('Provider15');
      let strBut1 = inspector.getInspectorByKey('Provider15-01');
      let objBut = JSON.parseJsonElement(strBut);
      let objBut1 = JSON.parseJsonElement(strBut1);
      console.info("[Provider15Test_static_0100] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider15Test_static_0100] component objBut1 is: " + JSON.stringify(objBut1));
      expect(objBut.getElement('$attrs').getString('label')).assertEqual('0');
      expect(objBut1.getElement('$attrs').getString('label')).assertEqual('0');
      console.info('[Provider15Test_static_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   Provider15Test_static_0200
     * @tc.name     Provider15Test_static_0200
     * @tc.desc     Provider15Test_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Provider15Test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider15Test_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Provider15-01'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strBut = inspector.getInspectorByKey('Provider15');
      let strBut1 = inspector.getInspectorByKey('Provider15-01');
      let objBut = JSON.parseJsonElement(strBut);
      let objBut1 = JSON.parseJsonElement(strBut1);
      console.info("[Provider15Test_static_0100] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider15Test_static_0100] component objBut1 is: " + JSON.stringify(objBut1));
      expect(objBut.getElement('$attrs').getString('label')).assertEqual('1');
      expect(objBut1.getElement('$attrs').getString('label')).assertEqual('1');
      console.info('[Provider15Test_static_0200] END');
      done();
    });
  })
}

