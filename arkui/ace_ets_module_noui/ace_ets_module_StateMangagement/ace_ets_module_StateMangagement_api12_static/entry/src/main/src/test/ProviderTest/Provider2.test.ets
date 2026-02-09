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
export default function Provider2Test() {
  describe('Provider2Test', () => {

    beforeAll(() => {
      console.info("Provider2Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Provider2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Provider2Test state pages:" + JSON.stringify(pages));
        if (!("Provider2" == pages.name)) {
          console.info("get Provider2Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.replaceUrl(options);
          console.info("get Provider2Test pages.name:" + JSON.stringify(routerInstance.getState().name));
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Provider2Test page error:" + err);
      }
      console.info("Provider2Test beforeEach end");
    });

    
    
    /**
     * @tc.number   Provider2Test_static_0100
     * @tc.name     Provider2Test_static_0100
     * @tc.desc     Provider2Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Provider2Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider2Test_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('button1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Provider2Test_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('0');

      strJson = inspector.getInspectorByKey('button2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[Provider2Test_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('0');
      console.info('[Provider2Test_static_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   Provider2Test_static_0200
     * @tc.name     Provider2Test_static_0200
     * @tc.desc     Provider2Test_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Provider2Test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider2Test_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('button2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Provider2Test_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('1');

      strJson = inspector.getInspectorByKey('button1');
      obj = JSON.parseJsonElement(strJson);
      console.info("[Provider2Test_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('1');
      console.info('[Provider2Test_static_0200] END');
      done();
    });
  })
}

