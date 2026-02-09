'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

export default function refreshDragJsunit() {
  describe('refreshDragTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshAPI',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get refresh state success " + JSON.stringify(pages));
        if (!("refreshAPI" == pages.name)) {
          console.info("get refresh state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push refresh page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push refresh page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("refreshDrag after each called");
    });


    
    /**
     * @tc.number   testrefreshDrag0011
     * @tc.name     testrefreshDrag0011
     * @tc.desc     testrefreshDrag0011
     * @tc.level    Level.LEVEL1
     */
it('testrefreshDrag0011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('refreshDrag testrefreshDrag0011 START');
      await CommonFunc.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 60304,
          priority: events_emitter.EventPriority.LOW
        }
        let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
          console.info("testrefreshDrag0011 get event data is: " + JSON.stringify(eventData));
          if (eventData.data != null) {
            expect((eventData.data as Record<String,RecordData>)['Result']).assertEqual(true);
          }
          done();
        }
        // console.info("testrefreshDrag0011 click result is: " +
        // JSON.stringify(inspector.sendEventByKey('Refresh', 10, "")));
        events_emitter.on(event, callback);
      } catch (err) {
        console.info("testrefreshDrag0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrefreshDrag0011 END');
      done();
    });


    
    /**
     * @tc.number   testrefreshRefresh_static_0001
     * @tc.name     testrefreshRefresh_static_0001
     * @tc.desc     testrefreshRefresh_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testrefreshRefresh_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('refreshDrag testrefreshRefresh_static_0001 START');
      await CommonFunc.sleep(2000);
      try {
        let eventTwo: events_emitter.InnerEvent = {
          eventId: 60305,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackTwo: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
          console.info("testrefreshRefresh_static_0001 get event data is: " + JSON.stringify(eventData));
          if (eventData.data != null) {
            expect((eventData.data as Record<String,RecordData>)['Result']).assertEqual(true);
          }
          done();
        }
        // console.info("testrefreshRefresh_static_0001 click result is: " +
        // JSON.stringify(inspector.sendEventByKey('Refresh', 10, "")));
        events_emitter.on(eventTwo, callbackTwo);
      } catch (err) {
        console.info("testrefreshRefresh_static_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrefreshRefresh_static_0001 END');
      done();
    });
  })
}
