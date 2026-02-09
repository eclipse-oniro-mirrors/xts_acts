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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function CounterEnableTest() {

  const SUITE: string = 'CounterEnable'
  const waitUiReadyMs: number = 500;

  describe('CounterEnableTest', () => {
    beforeAll(() => {
      console.info("CounterEnableTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Counter/CounterEnable",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages == null || !("CounterEnable" == pages.name)) {
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });


    /**
     * @tc.number   ArkUI_Counter_static_0100
     * @tc.name     ArkUI_Counter_static_0100
     * @tc.desc     ArkUI_Counter_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Counter_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Counter_0100'
      console.info(`${SUITE} ${CASE} START`);

      inspector.sendEventByKey('CounterEnable_Button_1', 10, "")
      let strJson: string = inspector.getInspectorByKey('CounterEnable_Counter_1');
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Counter");

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /**
     * @tc.number   ArkUI_Counter_static_0200
     * @tc.name     ArkUI_Counter_static_0200
     * @tc.desc     ArkUI_Counter_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Counter_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Counter_0200'
      console.info(`${SUITE} ${CASE} START`);
      inspector.sendEventByKey('CounterEnable_Button_2', 10, "")
      let strJson = inspector.getInspectorByKey('CounterEnable_Counter_1');
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Counter");
      console.info(`${SUITE} ${CASE} END`);
      done()
    });

  })
}
