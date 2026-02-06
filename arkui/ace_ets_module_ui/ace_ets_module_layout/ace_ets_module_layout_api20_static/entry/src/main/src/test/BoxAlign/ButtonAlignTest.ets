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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
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

export default function ButtonAlignTest() {
  describe('ButtonAlignTest', () => {
    beforeAll(() => {
      console.info("ButtonAlignTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ButtonAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BoxAlign/ButtonAlign',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ButtonAlignTest state pages:" + JSON.stringify(pages));
        if (!("ButtonAlignTest" == pages.name)) {
          console.info("get ButtonAlignTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push ButtonAlignTest page error:" + err);
      }
      console.info("ButtonAlignTest beforeEach end");
      
    });
    afterEach(async () => {
    });


    
/**
     * @tc.number   ButtonAlignTest_static_0100
     * @tc.name     ButtonAlignTest_static_0100
     * @tc.desc     ButtonAlignTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ButtonAlignTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ButtonAlignTest_static_0100] START');
      console.info('[ButtonAlignTest_static_0100] START000');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment is:');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment is:' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString("localizedAlignment")));

      let button1 = await driver.findComponent(ON.id('AlignTopStart'));
      await (button1?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment1 is:');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment1 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString("localizedAlignment")));

      let button2 = await driver.findComponent(ON.id('AlignTop'));
      await (button2?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson2 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment2 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString("localizedAlignment")));

      let button3 = await driver.findComponent(ON.id('AlignTopEnd'));
      await (button3?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson3 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment3 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString("localizedAlignment")));

      let button4 = await driver.findComponent(ON.id('AlignStart'));
      await (button4?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson4 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment4 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson4).getElement('$attrs').getString("localizedAlignment")));

      let button5 = await driver.findComponent(ON.id('AlignCenter'));
      await (button5?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson5 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment5 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson5).getElement('$attrs').getString("localizedAlignment")));

      let button6 = await driver.findComponent(ON.id('AlignEnd'));
      await (button6?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson6 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment6 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson6).getElement('$attrs').getString("localizedAlignment")));

      let button7 = await driver.findComponent(ON.id('AlignBottomStart'));
      await (button7?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson7 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment7 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson7).getElement('$attrs').getString("localizedAlignment")));

      let button8 = await driver.findComponent(ON.id('AlignBottom'));
      await (button8?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson8 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment8 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson8).getElement('$attrs').getString("localizedAlignment")));

      let button9 = await driver.findComponent(ON.id('AlignBottomEnd'));
      await (button9?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson9 = inspector.getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_static_0100] LocalizedAlignment9 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson9).getElement('$attrs').getString("localizedAlignment")));

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString("localizedAlignment"))
        .assertEqual('top_start');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString("localizedAlignment")).assertEqual('top');
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString("localizedAlignment"))
        .assertEqual('top_end');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString("localizedAlignment")).assertEqual('start');
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString("localizedAlignment"))
        .assertEqual('center');
      expect(JSON.parseJsonElement(strJson6).getElement('$attrs').getString("localizedAlignment")).assertEqual('end');
      expect(JSON.parseJsonElement(strJson7).getElement('$attrs').getString("localizedAlignment"))
        .assertEqual('bottom_start');
      expect(JSON.parseJsonElement(strJson8).getElement('$attrs').getString("localizedAlignment"))
        .assertEqual('bottom');
      expect(JSON.parseJsonElement(strJson9).getElement('$attrs').getString("localizedAlignment"))
        .assertEqual('bottom_end');

      console.info('[ButtonAlignTest_static_0100] END');
      done();
    });

  })
}