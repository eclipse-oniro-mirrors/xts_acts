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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../../hypium/index'
import router from '@ohos.router';
import {
  Driver,
  Component,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { startAbility, stopApplication, UtilsTest } from '../../../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest() {
  describe('BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/BackgroundEffect/BackgroundEffectOptions/BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest state pages: " +
        JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest state pages.name: " +
          JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest page error: " + err);
        expect().assertFail();
      }
    });

    /**
         *  @tc.number   BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest_0100
         * @tc.name     BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest_0100
         * @tc.desc     BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest_0100
         * @tc.level    Level.LEVEL0
         */
    it('BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest_0100 START');
        await CommonFunc.sleep(1000);
        let FOLLOWS_WINDOW_ACTIVE_STATE = inspector.getInspectorByKey('FOLLOWS_WINDOW_ACTIVE_STATE');
        console.info("[BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest_0100] FOLLOWS_WINDOW_ACTIVE_STATE attrs is: " +
        JSON.stringify(JSON.parseJsonElement(FOLLOWS_WINDOW_ACTIVE_STATE).getElement('$attrs')));
        expect(JSON.parseJsonElement(FOLLOWS_WINDOW_ACTIVE_STATE)
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('policy')).assertEqual('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE');
        console.info('[BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest_0100] END');
        done();
      });
  })
}