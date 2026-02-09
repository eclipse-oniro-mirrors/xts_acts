'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ohosPromptJsunit() {
  describe('appInfoTest_four_3', () => {
    beforeAll(() => {
      console.info("appInfoTest_four_3 beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("appInfoTest_four_3 beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("OhosPrompt beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/ohosPrompt',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get OhosPrompt state pages: " + JSON.stringify(pages));
        if (!("OhosPrompt" == pages.name)) {
          console.info("get OhosPrompt state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push OhosPrompt success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OhosPrompt  page error:" + err);
      }

    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("OhosPrompt each called");
    });


    
    
/**
     * @tc.number   test_OhosPrompt_static_001
     * @tc.name     test_OhosPrompt_static_001
     * @tc.desc     test_OhosPrompt_static_001
     * @tc.level    Level.LEVEL2
     */
it('test_OhosPrompt_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000)
      let callback = (eventData: emitter.EventData) => {
        console.info("[test_OhosPrompt_static_001] get event state result is: " + JSON.stringify(eventData));
        await Utils.sleep(500)
        expect(((eventData.data) as Record<String,RecordData>)['matrix1']).assertEqual("[100, 10]")
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: 142,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_OhosPrompt_static_001] on emitter err : " + JSON.stringify(err));
      }
      console.info('[test_OhosPrompt_static_001] sendEventByKey ' +
      JSON.stringify(inspector.sendEventByKey('rotate5', 10, "")));
      await Utils.sleep(1000)
      console.info('[test_OhosPrompt_static_001] testSendTouchEvent END');
      done();
    });
  })
}




