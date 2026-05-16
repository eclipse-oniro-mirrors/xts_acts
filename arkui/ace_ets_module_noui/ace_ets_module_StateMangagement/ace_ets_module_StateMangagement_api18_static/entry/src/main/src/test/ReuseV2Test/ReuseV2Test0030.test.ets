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
export default function ReuseV2Test0030() {
  describe('ReuseV2Test0030', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("ReuseV2Test0030 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ReuseV2/ReuseV20030",
      }
      try {
        const ReuseV2Test0030 = AppStorage.get<Router>("router") as Router
        ReuseV2Test0030.clear();
        let pages:router.RouterState = ReuseV2Test0030.getState();
        console.info("get ReuseV2Test0030 state pages: " + JSON.stringify(pages));
        if (!("ReuseV20030" == pages.name)) {
          console.info("get ReuseV2Test0030 state pages.name: " + JSON.stringify(pages.name));
          // let result = await ReuseV2Test0030.pushUrl(options);
          ReuseV2Test0030.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ReuseV2Test0030 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReuseV2Test0030 page error:" + err);
      }
      console.info("ReuseV2Test0030 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ReuseV2Test0030 after each called");
    });

    
    /**
     * @tc.number   ReuseV2Test0030_static_001
     * @tc.name     ReuseV2Test0030_static_001
     * @tc.desc     ReuseV2Test0030_static_001
     * @tc.level    Level.LEVEL0
     */
    it('ReuseV2Test0030_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ReuseV2Test0030_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      for (let index = 0; index < 2; index++) {
        let btn = await driver.findComponent(ON.id("btnReuseV20030Change"));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      }
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildReuseV20030'));
      console.info("[ReuseV2Test0030_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ReuseV2Test0030_001] obj1 content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('aboutToReuse');
      console.info('[ReuseV2Test0030_001] END');
      done();
    });
  })
}
