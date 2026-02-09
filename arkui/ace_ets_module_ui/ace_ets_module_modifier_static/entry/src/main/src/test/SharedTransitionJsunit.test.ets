'use static';
/*
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
import { SharedTransitionEffectType} from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

interface EventD {
  duration?: number
  delay?: number
  type?: SharedTransitionEffectType
}
export default function sharedTransitionJsunit() {
  describe('common_sharedTransitionTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("sharedTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sharedTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sharedTransition state pages:" + JSON.stringify(pages));
        if (!("sharedTransition" == pages.name)) {
          console.info("get sharedTransition state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push sharedTransition page error:" + JSON.stringify(err));
      }
    });

    afterEach(async () => {
     await UtilsTest.msSleep(1000);
      console.info("sharedTransition after each called");
    });

    
    
    /**
     * @tc.number   sharedTransitionTest_static_0100
     * @tc.name     sharedTransitionTest_static_0100
     * @tc.desc     sharedTransitionTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('sharedTransitionTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sharedTransitionTest_static_0100 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 2000,
            "delay": 5,
            "type": SharedTransitionEffectType.Exchange
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 194,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(indexEvent, eventData);
       await UtilsTest.msSleep(2500);
      } catch (err: Error) {
        console.log("sharedTransitionTest_static_0100 change component data error: " + err.message);
      }
      let callback = (indexEventOne: events_emitter.EventData) => {
        const data = indexEventOne.data as Record<String,RecordData>
        console.info("sharedTransitionTest_static_0100 get state result is: " + JSON.stringify(indexEventOne));
        try {
          expect(data["duration"] as int).assertEqual(2000);
          expect(data["delay"]  as int).assertEqual(5);
          expect(data["type"] as SharedTransitionEffectType).assertEqual(SharedTransitionEffectType.Exchange);
        } catch (err: Error) {
          console.info("sharedTransitionTest_static_0100 error: " + err.message);
        }

      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 193,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("sharedTransitionTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("sharedTransitionTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('Navigator', 10, "")));
       await UtilsTest.msSleep(2000);
      console.info('sharedTransitionTest_static_0100 END');
      done();
    });
  })
}