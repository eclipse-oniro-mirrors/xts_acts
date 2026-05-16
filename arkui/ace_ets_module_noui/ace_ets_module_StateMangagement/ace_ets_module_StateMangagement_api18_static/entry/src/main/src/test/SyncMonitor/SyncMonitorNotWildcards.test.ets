'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
 
 
export default function SyncMonitorNotWildcards() {
  describe('SyncMonitorNotWildcardsTest', () => {
    beforeAll(async (): Promise<void> => {
 
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
 
    })
    beforeEach(async (): Promise<void> => {
      console.info("SyncMonitorNotWildcardsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SyncMonitor/SyncMonitorNotWildcards",
      }
      try {
        const SyncMonitorNotWildcardsTest = AppStorage.get<Router>("router") as Router
        SyncMonitorNotWildcardsTest.clear();
        let pages:router.RouterState = SyncMonitorNotWildcardsTest.getState();
        console.info("get SyncMonitorNotWildcardsTest state pages: " + JSON.stringify(pages));
        if (!("SyncMonitorNotWildcards" == pages.name)) {
          console.info("get SyncMonitorNotWildcardsTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await SyncMonitorNotWildcardsTest.pushUrl(options);
          SyncMonitorNotWildcardsTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SyncMonitorNotWildcardsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SyncMonitorNotWildcardsTest page error:" + err);
      }
      console.info("SyncMonitorNotWildcardsTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SyncMonitorNotWildcardsTest after each called");
    });
 
 
    /**
     * @tc.number   SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0100
     * @tc.name     SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0100
     * @tc.desc     SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("componentV2Button"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
 
      let strJsonNew = inspector.getInspectorByKey('MessageText');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('Hello World!:1');
      console.info('[SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0100] END');
      done();
    });
 
    /**
     * @tc.number   SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0200
     * @tc.name     SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0200
     * @tc.desc     SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("observedV2Button"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
 
      let strJsonNew = inspector.getInspectorByKey('NameText');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('Jack:1');
      console.info('[SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0200] END');
      done();
    });
 
    /**
     * @tc.number   SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0300
     * @tc.name     SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0300
     * @tc.desc     SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButton"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
 
      let strJsonNew = inspector.getInspectorByKey('dimensionTwoText');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('2:2');
      console.info('[SUB_ARKUI_API_SyncMonitorNotWildcardsTest_static_0300] END');
      done();
    });
  })
}
