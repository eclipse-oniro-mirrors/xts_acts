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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

export default function routerStandardJsunit() {
  describe('routerStandardTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ohosRouter/router',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get router state success " + JSON.stringify(pages));
        if (!("router" == pages.name)) {
          console.info("get router state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push router page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("routerStandard after each called");
    });

    
/**
     * @tc.number   testrouterStandard0011_static
     * @tc.name     testrouterStandard0011_static
     * @tc.desc     testrouterStandard0011_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterStandard0011_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('routerStandard testrouterStandard0011_static START');
      await Utils.sleep(2000);
      try {
        let standardEvent: events_emitter.InnerEvent = {
          eventId: 101,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testrouterStandard_0011_static get event data is: " + JSON.stringify(eventData));
          expect((eventData.data as Record<String,RecordData>)['ArrayData']).assertEqual("45");

        }
        events_emitter.on(standardEvent, callback1);
        console.info("testrouterStandard_0011_static click result1 is: " + JSON.stringify(inspector.sendEventByKey('StandardText', 10, "")));
        await Utils.sleep(2000);
        console.info("testrouterStandard_0011_static click result2 is: " + JSON.stringify(inspector.sendEventByKey('DataText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("testrouterStandard_0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrouterStandard0011 END');
      done();
    });

    
/**
     * @tc.number   testrouterSingle0001_static
     * @tc.name     testrouterSingle0001_static
     * @tc.desc     testrouterSingle0001_static
     * @tc.level    Level.LEVEL2
     */
it('testrouterSingle0001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('routerSingle testrouterSingle0001_static START');
      await Utils.sleep(2000);
      try {
        let singleEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        let callback2 = (eventData: events_emitter.EventData) => {
          console.info("testrouterSingle_0001_static get event data is: " + JSON.stringify(eventData));
          expect((eventData.data as Record<String,RecordData>)['ArrayData']).assertEqual("46");
        }
        events_emitter.on(singleEvent, callback2);
        console.info("testrouterSingle_0001_static click result1 is: " + JSON.stringify(inspector.sendEventByKey('SingleText', 10, "")));
        await Utils.sleep(2000);
        console.info("testrouterSingle_0001_static click result2 is: " + JSON.stringify(inspector.sendEventByKey('SingleDataText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("testrouterSingle_0001_static on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrouterSingle_0001_static END');
      done();
    });
  })
}
