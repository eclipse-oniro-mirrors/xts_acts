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
import events_emitter from '@ohos.events.emitter';
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
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

export default function focusJsunit() {
  describe('appInfoTest_four_2', () => {

    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("focus beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/focus',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get focus state pages:" + JSON.stringify(pages));
        if (!("focus" == pages.name)) {
          console.info("get focus pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push focus page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focus page error:" + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("focus after each called");
    });

    
    /**
     * @tc.number   focusTest_0100
     * @tc.name     focusTest_0100
     * @tc.desc     focusTest_0100
     * @tc.level    Level.LEVEL1
     */
it('focusTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('focusTest_0100 START');
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "focusable": true
            } as Record<String,RecordData>
          }
          let indexEventOne: events_emitter.InnerEvent = {
            eventId: 101,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("focusTest_0100 start to publish emit");
          events_emitter.emit(indexEventOne, eventData);
        } catch (err: Error) {
          console.log("focusTest_0100 change component data error: " + err.message);
        }
        await CommonFunc.sleep(2000);
        console.info('focusTest_0100 END');
        done();
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}