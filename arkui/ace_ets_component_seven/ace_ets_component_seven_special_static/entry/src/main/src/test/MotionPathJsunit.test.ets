'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'
import { RecordData } from '@ohos.base';

export default function motionPathJsunit() {
  describe('motionPathTest', () => {
    beforeAll(() => {
        console.info("motionPathTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/motionPath',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get motionPath state success " + JSON.stringify(pages));
        if (!("motionPath" == pages.name)) {
          console.info("get motionPath state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push motionPath page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("motionPath after each called");
    });

   
    
    
/**
     * @tc.number   motionPathTest_static_0100
     * @tc.name     motionPathTest_static_0100
     * @tc.desc     motionPathTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('motionPathTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('motionPathTest_static_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("motionPathTest_static_0100 get state result is: " + (indexEvent.data as Record<String,RecordData>)['ACTION']);
        expect((indexEvent.data as Record<String,RecordData>)['ACTION']).assertEqual(true);

        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 132,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("motionPathTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("motionPathTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await Utils.sleep(1000);
      console.info('motionPathTest_static_0100 END');
      done();
    });
  })
}