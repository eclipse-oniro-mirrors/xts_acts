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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import Utils from '../../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

export default function gridItemOnSelectJsunit() {
  describe('gridItemOnSelectTest', () => {
    beforeAll(async () => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridItem/gridItem',
      }
      const routerAlp = AppStorage.get<Router>("router") as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get gridItem state success " + JSON.stringify(pages));
        if (!("gridItem/gridItem" == pages.name)) {
          console.info("get gridItem state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push gridItem page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridItem page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gridItemOnSelect after each called");
    });


    
    /**
     * @tc.number   testgridItemOnSelect0001_static_01
     * @tc.name     testgridItemOnSelect0001_static_01
     * @tc.desc     testgridItemOnSelect0001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testgridItemOnSelect0001_static_01', Level.LEVEL0, async () => {
      console.info('testgridItemOnSelect testgridItemOnSelect0001_static_01 START');
      await Utils.sleep(2000);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("onSelect_0001 get state result is: " + JSON.stringify(indexEvent));
        if (indexEvent.data != null) {
          const data = indexEvent.data as Record<String,RecordData>
          expect(data['STATUS']).assertEqual(true);
        }
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 60207,
        priority: events_emitter.EventPriority.LOW
      }
      inspector.sendEventByKey('onSelected', 10, "")
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onSelect_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testgridItemOnSelect0001_static_01 END');

    });

  }

  )
}
