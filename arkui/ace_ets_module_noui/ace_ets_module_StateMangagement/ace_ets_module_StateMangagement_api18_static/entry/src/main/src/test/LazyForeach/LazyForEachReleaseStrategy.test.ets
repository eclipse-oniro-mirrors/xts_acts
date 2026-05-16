'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
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
} from '@ohos.UiTest';
import { LazyForEachReleaseStrategy } from '@ohos.arkui.component';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest,startAbility} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let flexGrow = 3;
let compareFlexGrow = 1;
const uiContext = new UIContext();

export default function LazyForEachReleaseStrategyTest() {
  describe('LazyForEachReleaseStrategyTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("LazyForEachReleaseStrategyTest beforeEach start");
      await startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("LazyForEachReleaseStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForeach/LazyForEachReleaseStrategy",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get LazyForEachReleaseStrategy state pages: " + JSON.stringify(pages));
        if (!("LazyForEachReleaseStrategy" == pages.name)) {
          console.info("get LazyForEachReleaseStrategy state pages.name: " + JSON.stringify(pages.name));

          router.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachReleaseStrategy page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0100
     * @tc.name     SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0100
     * @tc.desc     List type FrameNode node
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LazyForEach_Item_0');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0100] component obj is: " + JSON.stringify(obj));
      expect(LazyForEachReleaseStrategy.PROGRESSIVE).assertEqual(1);
      console.info('[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0200
     * @tc.name     SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0200
     * @tc.desc     List type FrameNode node
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {
      console.info('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LazyForEach_Item_1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0200] component obj is: " + JSON.stringify(obj));
      expect(LazyForEachReleaseStrategy.BATCH).assertEqual(0);
      console.info('[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_static_0200] END');
      done();
    });
  })
}

