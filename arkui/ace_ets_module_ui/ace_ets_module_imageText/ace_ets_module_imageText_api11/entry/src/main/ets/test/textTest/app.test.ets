/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common'

export default function appVersionCodeJsunit() {
  describe('appVersionCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/app',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get app state success " + JSON.stringify(pages));
        if (!("app" == pages.name)) {
          console.info("get app state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push app page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push app page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("appVersionCode after each called");
    });

    it('testappVersionCode0011', Level.LEVEL1, async (done: Function) => {
      console.info('appVersionCode testappVersionCode0011 START');
      await CommonFunc.sleep(1000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60302,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testappVersionCode_0011 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.Code).assertEqual(1000000);
        }
        console.info("testappVersion click result is: " + JSON.stringify(sendEventByKey('versionCodeText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testappVersionCode_0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testappVersionCode_0011 END');
      done();
    });
  })
}
