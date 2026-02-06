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
export default function Provider14Test() {
  describe('Provider14Test', () => {

    beforeAll(() => {
      console.info("Provider14Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Provider14Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider14',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Provider14Test state pages:" + JSON.stringify(pages));
        if (!("Provider14Test" == pages.name)) {
          console.info("get Provider14Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Provider14Test page error:" + err);
      }
      console.info("Provider14Test beforeEach end");
    });


    
    
    /**
     * @tc.number   Provider14Test_static_0100
     * @tc.name     Provider14Test_static_0100
     * @tc.desc     Provider14Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Provider14Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Provider14Test_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Provider14'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strBut = inspector.getInspectorByKey('Provider14');
      let objBut = JSON.parseJsonElement(strBut);
      console.info("[Provider14Test_static_0100] component objBut is: " + JSON.stringify(objBut));
      expect(objBut.getElement('$attrs').getString('label')).assertEqual('1');
      console.info('[Provider14Test_static_0100] END');
      done();
    });
  })
}

