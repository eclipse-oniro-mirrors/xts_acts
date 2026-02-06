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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MarqueeMirroringTest() {
  describe('MarqueeMirroringTest', (): void => {

    beforeAll(() => {
      console.info("FontSettingOptions beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("FontSettingOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/MarqueeMirroring",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FontSettingOptions state pages:" + JSON.stringify(pages));
        if (!("MarqueeMirroring" == pages.name)) {
          console.info("get FontSettingOptions pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FontSettingOptions page error:" + err);
      }
      console.info("FontSettingOptions beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("MarqueeMirroringTest after each called");
    });

    /**
     * @tc.number   MarqueeMirroringTest_static_002
     * @tc.name     MarqueeMirroringTest_static_002
     * @tc.desc     MarqueeMirroringTest_static_002
     * @tc.level   Level.LEVEL0
     */
    it('MarqueeMirroringTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[MarqueeMirroringTest_static_002] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await (driver.findComponent(ON.id('MarqueeMirroring_Start')) as Promise<Component>);
      CommonFunc.sleep(1000);
      console.info('[MarqueeMirroringTest_static_002] click');
      await button1.click();
      console.info('[MarqueeMirroringTest_static_002] click before');
      await CommonFunc.sleep(8000);
      let strJson = inspector.getInspectorByKey('MarqueeMirroring_onBounce');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[MarqueeMirroringTest_static_002] component obj is: " + String(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onBounce succ');
      expect(obj !== null).assertTrue();
      console.info('[MarqueeMirroringTest_static_002] END');
      done();
    });
    /**
         * @tc.number   MarqueeMirroringTest_static_001
         * @tc.name     MarqueeMirroringTest_static_001
         * @tc.desc     MarqueeMirroringTest_static_001
         * @tc.level   Level.LEVEL0
         */
    it('MarqueeMirroringTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[MarqueeMirroringTest_static_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await (driver.findComponent(ON.id('MarqueeMirroring_Start')) as Promise<Component>);
      console.info('[MarqueeMirroringTest_static_002] click');
      await button1.click();
      console.info('[MarqueeMirroringTest_static_002] after');
      CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('MarqueeMirroring_onStart');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[MarqueeMirroringTest_static_001] component obj is: " + strJson);
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onStart succ');
      expect(obj !== null).assertTrue();
      console.info('[MarqueeMirroringTest_static_001] END');
      done();
    });

    /**
     * @tc.number   MarqueeMirroringTest_static_003
     * @tc.name     MarqueeMirroringTest_static_003
     * @tc.desc     MarqueeMirroringTest_static_003
     * @tc.level   Level.LEVEL0
     */
    it('MarqueeMirroringTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[MarqueeMirroringTest_static_003] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await (driver.findComponent(ON.id('MarqueeMirroring_Start')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(6000);
      let strJson = inspector.getInspectorByKey('MarqueeMirroring_onFinish');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[MarqueeMirroringTest_static_003] component obj is: " + String(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onFinish succ');
      expect(obj !== null).assertTrue();
      console.info('[MarqueeMirroringTest_static_003] END');
      done();
    });
  })
}