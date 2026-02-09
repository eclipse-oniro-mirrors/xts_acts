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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'
import { RecordData } from '@ohos.base';

export default function transitionJsunit() {
  describe('transitionTest', () => {
    beforeAll(() => {
        console.info("transitionTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/transition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get transition state pages:" + JSON.stringify(pages));
        if (!("transition" == pages.name)) {
          console.info("get transition state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push transition page error:" + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("transition after each called");
    });

    
    
/**
     * @tc.number   transitionTest_static_0200
     * @tc.name     transitionTest_static_0200
     * @tc.desc     transitionTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('transitionTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('transitionTest_static_0200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 233,
        priority: events_emitter.EventPriority.LOW
      }
      await Utils.sleep(1000);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("transitionTest_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as Record<String,RecordData>)['btn1']).assertEqual(false);
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("transitionTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("transitionTest_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await Utils.sleep(1000);
      console.info('transitionTest_static_0200 END');
      done();
    });
  })
}