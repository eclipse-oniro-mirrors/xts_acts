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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function ConsumeDefaultValueStringTest() {
  describe('ConsumeDefaultValueStringTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("ConsumeDefaultValueStringTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Consume/ConsumeDefaultValueString",
      }
      try {
        const ConsumeDefaultValueStringTest = AppStorage.get<Router>("router") as Router
        ConsumeDefaultValueStringTest.clear();
        let pages:router.RouterState = ConsumeDefaultValueStringTest.getState();
        console.info("get ConsumeDefaultValueStringTest state pages: " + JSON.stringify(pages));
        if (!("ConsumeDefaultValueString" == pages.name)) {
          console.info("get ConsumeDefaultValueStringTest state pages.name: " + JSON.stringify(pages.name));
          ConsumeDefaultValueStringTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ConsumeDefaultValueStringTest page error:" + err);
      }
      console.info("ConsumeDefaultValueStringTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ConsumeDefaultValueStringTest after each called");
    });

    /**
     * @tc.number   ConsumeDefaultValueStringTest_static_001
     * @tc.name     ConsumeDefaultValueStringTest_static_001
     * @tc.desc     @Consume装饰器支持string类型默认值初始化
     * @tc.level    Level.LEVEL0
     */
    it('ConsumeDefaultValueStringTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ConsumeDefaultValueStringTest_001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('ChildMessageText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ConsumeDefaultValueStringTest_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Child message Hello, World!');

      let button = await driver.findComponent(ON.id('ChangeMessageButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('ChildMessageText');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ConsumeDefaultValueStringTest_001] after click component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Child message Hello, World!a');


      console.info('[ConsumeDefaultValueStringTest_001] END');
      done();
    });
  })
}
