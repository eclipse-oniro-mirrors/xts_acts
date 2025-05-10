/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import { BusinessError } from '@ohos.base';

export default function navigatorCodeJsunit() {
  describe('navigatorCodeJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigatorClick beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigatorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigatorClick state pages:" + JSON.stringify(pages));
        if (!("NavigatorCode" == pages.name)) {
          console.info("get NavigatorClick state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push NavigatorClick page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigatorClick page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("NavigatorClick after each called");
    });

    it('test_NavigatorClick_001', 0, async (done: Function) => {
      console.info('[test_NavigatorClick_001] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('NavigatorType');
      console.info("[test_NavigatorClick_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.active).assertEqual('false');
      console.info('[test_NavigatorClick_001] END');
      done();
    });

    it('test_NavigatorClick_002', 0, async (done: Function) => {
      console.info('[test_NavigatorClick_002] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": "NavigationType.Back"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 138,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_NavigatorClick_002] start to publish emit" + JSON.stringify(eventData));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_NavigatorClick_002] change component error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('NavigatorType');
      console.info("[test_NavigatorClick_002] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs.type));
      expect(JSON.parse(strJson).$attrs.type).assertEqual('NavigationType.Back');
      done();
    });

    it('test_NavigatorClick_003', 0, async (done: Function) => {
      await Utils.sleep(1000)
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[test_NavigatorClick_003] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual(10)
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 139,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_NavigatorClick_003] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_NavigatorClick_003] sendEventByKey ' + JSON.stringify(sendEventByKey('button', 10, "")));
      await Utils.sleep(1000)
      console.info('[test_NavigatorClick_003] testSendTouchEvent END');
      done();
    });
  })
}