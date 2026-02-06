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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function WordBreakTest() {
  describe('WordBreakTest', () => {
    beforeAll(() => {
      console.info("WordBreakTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("WordBreakTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/WordBreakTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WordBreakTest state pages:" + JSON.stringify(pages));
        if (!("WordBreakTest" == pages.name)) {
          console.info("get WordBreakTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WordBreakTest page error:" + err);
      }
      console.info("WordBreakTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WordBreakTest after each called");
    });


    
    /**
     * @tc.number   WordBreakTest_static_0001
     * @tc.name     WordBreakTest_static_0001
     * @tc.desc     WordBreakTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('WordBreakTest_static_0001', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('WordBreakTest0001 START');
      let strJson = inspector.getInspectorByKey('wordBreakTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('wordBreak')).assertEqual('normal');
      console.info("[WordBreakTest0001] end");
      done();
    });


    
    /**
     * @tc.number   WordBreakTest_static_0002
     * @tc.name     WordBreakTest_static_0002
     * @tc.desc     WordBreakTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('WordBreakTest_static_0002', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('WordBreakTest0002 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('setWordBreak1')) as Component
      await CommonFunc.sleep(500);
      await set.click()
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('wordBreakTest');
      let obj = JSON.parseJsonElement(strJson);
      console.log('22222----' + obj.getElement('$attrs').getString('wordBreak'))
      expect(obj.getElement('$attrs').getString('wordBreak')).assertEqual('break-all');
      console.info("[WordBreakTest0002] end");
      done();
    });


    
    /**
     * @tc.number   WordBreakTest_static_0003
     * @tc.name     WordBreakTest_static_0003
     * @tc.desc     WordBreakTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('WordBreakTest_static_0003', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info(' WordBreakTest0003 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('setWordBreak2')) as Component
      await CommonFunc.sleep(500);
      await set.click()
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('wordBreakTest');
      let obj = JSON.parseJsonElement(strJson);
      console.log('22222----' + obj.getElement('$attrs').getString('wordBreak'))
      expect(obj.getElement('$attrs').getString('wordBreak')).assertEqual('break-word');
      console.info("[WordBreakTest0003] end");
      done();
    });


    
    /**
     * @tc.number   WordBreakTest_static_0004
     * @tc.name     WordBreakTest_static_0004
     * @tc.desc     WordBreakTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('WordBreakTest_static_0004', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info(' WordBreakTest0004 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('setWordBreak3')) as Component
      await CommonFunc.sleep(500);
      await set.click()
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('wordBreakTest');
      let obj = JSON.parseJsonElement(strJson);
      console.log('22222----' + obj.getElement('$attrs').getString('wordBreak'))
      expect(obj.getElement('$attrs').getString('wordBreak')).assertEqual('hyphenation');
      console.info("[WordBreakTest0004] end");
      done();
    });
  })
}