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

import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

let emitKey = 'emitUserAgent';

export default function SelectStatusTest() {
  describe('SelectStatus', () => {
    beforeAll(() => {
      console.info("SelectStatus beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("SelectStatus  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkbox/SelectStatus',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get SelectStatus state pages: " + JSON.stringify(pages));
        if (!("SelectStatus" == pages.name)) {
          console.info("get SelectStatus state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SelectStatus success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SelectStatus page error ' + JSON.stringify(err));
      }

    });

    
    /**
     * @tc.number   SelectStatusTest_static_0100
     * @tc.name     SelectStatusTest_static_0100
     * @tc.desc     SelectStatusTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('SelectStatusTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
        let tagName = 'SelectStatusTest_static_0100';
        console.info('[' + tagName + '] START============================');
        let driver: Driver = Driver.create();
        let btnCheckboxGroup1 = await driver.findComponent(ON.id('SelectAll'));
        await (btnCheckboxGroup1?.click() as Promise<void>);
        await Utils.sleep(1000);
        let btnCheckboxGroup4 = await driver.findComponent(ON.id('SelectAll'));
        await (btnCheckboxGroup4?.click() as Promise<void>);
        await Utils.sleep(1000);
        let btnCheckboxGroup5 = await driver.findComponent(ON.id('SelectAll'));
        await (btnCheckboxGroup5?.click() as Promise<void>);
        await Utils.sleep(1000);
        let strJson1 = inspector.getInspectorByKey('text1');
        console.info('[' + tagName + '] strJson1============================' + strJson1);
        console.info('[' + tagName + '] $attrs ============================' +
        JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString("content")));
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString("content")).assertEqual('0');

        console.info('[' + tagName + '] END============================');
        done();
      });

    
    /**
     * @tc.number   SelectStatusTest_static_0200
     * @tc.name     SelectStatusTest_static_0200
     * @tc.desc     SelectStatusTest_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('SelectStatusTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
        let tagName = 'SelectStatusTest_static_0200';
        console.info('[' + tagName + '] START============================');
        let driver: Driver = Driver.create();
        let btnCheckboxGroup2 = await driver.findComponent(ON.id('SelectAll'));
        await (btnCheckboxGroup2?.click() as Promise<void>);
        await Utils.sleep(1000);
        let strJson2 = inspector.getInspectorByKey('text1');
        console.info('[' + tagName + '] strJson2============================' + strJson2);
        console.info('[' + tagName + '] $attrs ============================' +
        JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString("content")));
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString("content")).assertEqual('2');

        console.info('[' + tagName + '] END============================');
        done();
      });

  })
}