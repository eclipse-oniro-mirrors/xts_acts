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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function counterApi() {
  describe('counterApi', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.platform.nowear.api12.static", "EntryAbility");
    });

    beforeEach(async () => {
      console.info("counterApi beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get counterApi state pages:" + JSON.stringify(pages));
        if (!("counterApi" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/Counter/counterApi"
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push counterApi page error:" + err);
      }
      console.info("counterApi foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("counterApi after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_CounterComponent_001
     * @tc.name counterApi_static_001
     * @tc.desc onFocusIncrease test of CounterComponent
     * @tc.level Level 3
     * @tc.type
     */
    it('counterApi_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[counterApi_static_001] START');
      await CommonFunc.sleep(1000);
      
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('counterApiText2');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[counterApi_static_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onFocusDecrease');
      console.info('[counterApi_static_001] END');
      done();

    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_CounterComponent_002
     * @tc.name counterApi_static_002
     * @tc.desc onBlurIncrease and onFocusDecrease test of CounterComponent
     * @tc.level Level 3
     * @tc.type
     */
    it('counterApi_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[counterApi_static_002] START');
      await CommonFunc.sleep(1000);
      
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('counterApiText1');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('counterApiText2');
      await CommonFunc.sleep(1000);
      console.info("[counterApi_static_002] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[counterApi_static_002] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onFocusIncrease');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onBlurDecrease');
      console.info('[counterApi_static_002] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_CounterComponent_003
     * @tc.name counterApi_static_003
     * @tc.desc onBlurDecrease test of CounterComponent
     * @tc.level Level 3
     * @tc.type
     */
    it('counterApi_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[counterApi_static_003] START');
      await CommonFunc.sleep(1000);
      
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('counterApiText1');
      await CommonFunc.sleep(1000);
      console.info("[counterApi_static_003] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onBlurIncrease');
      console.info('[counterApi_static_003] END');
      done();
    });
  })
}
