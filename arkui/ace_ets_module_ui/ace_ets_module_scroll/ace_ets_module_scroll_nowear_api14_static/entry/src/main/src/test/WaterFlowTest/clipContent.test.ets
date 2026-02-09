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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility } from '../Util.test.ets';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function clipContent() {
  describe('clipContent', () => {
    beforeAll(() => {
      console.info("clipContent beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("clipContent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/clipContent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get clipContent state pages:" + JSON.stringify(pages));
        if (!("clipContent" == pages.name)) {
          console.info("get clipContent pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push clipContent page error:" + err);
      }
      console.info("clipContent beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("clipContent after each called");
    });

    
    
/**
     * @tc.number   clipContent_static_0100
     * @tc.name     clipContent_static_0100
     * @tc.desc     clipContent_static_0100
     * @tc.level    Level.LEVEL1
     */
it('clipContent_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[clipContent_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('common_clipContent_water');
      console.info("[clipContent_static_0100] component obj1 is: " + JSON.parseJsonElement(strJson1));
      console.info("[clipContent_static_0100] clipContent1: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('clipContent'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('clipContent')).assertEqual("ContentClipMode.CONTENT_ONLY");
      console.info('[focusedList_0100] ContentClipMode.CONTENT_ONLY END');
      done();
    });

    
    
/**
     * @tc.number   clipContent_static_0200
     * @tc.name     clipContent_static_0200
     * @tc.desc     clipContent_static_0200
     * @tc.level    Level.LEVEL1
     */
it('clipContent_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[clipContent_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn2: Component | null = await driver.findComponent(ON.id('clipContent_water_boundary'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('common_clipContent_water');
      console.info("[clipContent_static_0200] component obj2 is: " + JSON.parseJsonElement(strJson2));
      console.info("[clipContent_static_0200] clipContent2: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('clipContent'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('clipContent')).assertEqual("ContentClipMode.BOUNDARY");
      console.info('[clipContent_static_0200] ContentClipMode.BOUNDARY END');
      done();
    });

    
    
/**
     * @tc.number   clipContent_static_0300
     * @tc.name     clipContent_static_0300
     * @tc.desc     clipContent_static_0300
     * @tc.level    Level.LEVEL1
     */
it('clipContent_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[clipContent_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn3: Component | null = await driver.findComponent(ON.id('clipContent_water_safearea'));
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('common_clipContent_water');
      console.info("[clipContent_static_0300] component obj3 is: " + JSON.parseJsonElement(strJson3));
      console.info("[clipContent_static_0300] clipContent3: " + JSON.parseJsonElement(strJson3).getElement('$attrs').getString('clipContent'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('clipContent')).assertEqual("ContentClipMode.SAFE_AREA");
      console.info('[focusedList_0300] ContentClipMode.SAFE_AREA END');
      done();
    });
  })
}