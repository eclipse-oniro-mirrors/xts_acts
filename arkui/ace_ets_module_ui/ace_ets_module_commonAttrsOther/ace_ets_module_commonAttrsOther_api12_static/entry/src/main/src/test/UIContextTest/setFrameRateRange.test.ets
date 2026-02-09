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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  Point,
  Rect,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function setFrameRateRangeTest() {
  describe('setFrameRateRangeTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("setFrameRateRangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/setFrameRateRange",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setFrameRateRangeTest state pages:" + JSON.stringify(pages));
        if (!("setFrameRateRange" == pages.name)) {
          console.info("get setFrameRateRangeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setFrameRateRangeTest page error:" + err);
      }
      console.info("setFrameRateRangeTest beforeEach end");
    });


    
    
/**
     * @tc.number   requireDynamicSyncSceneTest_static_0010
     * @tc.name     requireDynamicSyncSceneTest_static_0010
     * @tc.desc     requireDynamicSyncSceneTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('requireDynamicSyncSceneTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('requireDynamicSyncSceneTest_0010 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('requireDynamicSyncScene_id');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[requireDynamicSyncSceneTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('requireDynamicSyncScene succ');
      console.info('[requireDynamicSyncSceneTest_0010] END');
      done();
    });
  })
}

