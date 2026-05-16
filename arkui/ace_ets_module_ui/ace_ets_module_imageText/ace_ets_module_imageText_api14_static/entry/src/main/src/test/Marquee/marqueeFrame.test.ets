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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Component
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SetFrameRateRangeTest() {
  describe('setFrameRateRangeTest', (): void => {
    beforeAll(() => {
      console.info("SetFrameRateRangeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("SetFrameRateRangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/marqueeFrame",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SetFrameRateRangeTest state pages:" + "");
        if (!("setFrameRateRange" == pages.name)) {
          console.info("get SetFrameRateRangeTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SetFrameRateRangeTest page error:" + err);
      }
      console.info("SetFrameRateRangeTest beforeEach end");
    });

    
    

    /**
     * @tc.number   MarqueerequireDynamicSyncSceneTest_static_0010
     * @tc.name     MarqueerequireDynamicSyncSceneTest_static_0010
     * @tc.desc     MarqueerequireDynamicSyncSceneTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('MarqueerequireDynamicSyncSceneTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MarqueerequireDynamicSyncSceneTest_0010 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('MarqueegetGetFrameRateRange_id'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('MarqueerequireDynamicSyncScene_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[MarqueerequireDynamicSyncSceneTest_0010] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('MarqueerequireDynamicSyncScene succ');
      console.info('[MarqueerequireDynamicSyncSceneTest_0010] END');
      done();
    });
  })
}

