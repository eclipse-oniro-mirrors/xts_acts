/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function gridItemOnSelectJsunit() {
  describe('gridItemOnSelectTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridItem/gridItem',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridItem state success " + JSON.stringify(pages));
        if (!("gridItem" == pages.name)) {
          console.info("get gridItem state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gridItem page success " + JSON.stringify(result));
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
     * @tc.name   testgridItemOnSelect0001
     * @tc.number testgridItemOnSelect0001
     * @tc.desc   testgridItemOnSelect0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgridItemOnSelect0001', Level.LEVEL1, async () => {
      console.info('testgridItemOnSelect testgridItemOnSelect0001 START');
      await Utils.sleep(2000);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("onSelect_0001 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.STATUS).assertEqual(true);

      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 60207,
        priority: events_emitter.EventPriority.LOW
      }
      sendEventByKey('onSelected', 10, "")
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onSelect_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testgridItemOnSelect0001 END');

    });

  }

  )
}
