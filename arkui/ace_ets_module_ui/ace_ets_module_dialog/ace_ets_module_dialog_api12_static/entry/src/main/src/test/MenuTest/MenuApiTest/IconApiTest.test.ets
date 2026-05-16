'use static';
/**
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function IconApiTest() {
  describe("IconApiTest", () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("IconApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/MenuApi/IconApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get IconApiTest state pages:" + JSON.stringify(pages));
        if (!("IconApi" == pages.name)) {
          console.info("get IconApiTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push IconApiTest page error:" + err);
      }
      console.info("IconApiTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IconApiTest after each called");
    });

    /**
     * @tc.number   IconApiTest_static_001
     * @tc.name     IconApiTest_static_001
     * @tc.desc     IconApiTest_static_001
     * @tc.level    Level.LEVEL2
     */
    it("IconApiTest_static_001", Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("[IconApiTest_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btn")) as Component;
      await btn.click();
      await CommonFunc.sleep(1000);
      let symbolStartIcon = inspector.getInspectorByKey("symbolStartIcon");
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(symbolStartIcon).getElement('$attrs').getString('content')).assertEqual("symbolStartIcon");
      console.info("[IconApiTest_001] END");
      done();
    });

    /**
     * @tc.number   IconApiTest_static_002
     * @tc.name     IconApiTest_static_002
     * @tc.desc     IconApiTest_static_002
     * @tc.level    Level.LEVEL2
     */    
    it("IconApiTest_static_002", Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("[IconApiTest_002] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btn")) as Component;
      await btn.click();
      await CommonFunc.sleep(1000);
      let symbolEndIcon = inspector.getInspectorByKey("symbolEndIcon");
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(symbolEndIcon).getElement('$attrs').getString('content')).assertEqual("symbolEndIcon");
      console.info("[IconApiTest_002] END");
      done();
    });

  })
}
