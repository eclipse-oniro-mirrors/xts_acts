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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../MainAbility/common/Utils';
import { BusinessError } from '@ohos.base';

;

export default function videoJsunit2() {
  describe('videoTest', () => {
    beforeEach(async (done: Function) => {
      console.info("video beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video/video2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get video state pages:" + JSON.stringify(pages));
        if (!("video" == pages.name)) {
          console.info("get video state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push video page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push video page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("video after each called");
    });

    it('testVideo01', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo01] START');
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('video');
      expect(JSON.parse(strJsonNew).$type).assertEqual('Video');
      console.info('[testVideo01] END');
      done();
    });

    it('testVideo02', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_2_00_X,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo02] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('video');
      console.info("[testVideo02] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info('[testVideo02] END');
      done();
    });

    it('testVideo03', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo03] START ');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_1_75_X,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo03] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('video');
      console.info("[testVideo03] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info('[testVideo03] END');
      done();
    });

    it('testVideo04', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_1_25_X,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo04] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('video');
      console.info("[testVideo04] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info('[testVideo04] END');
      done();
    });

    it('testVideo05', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_1_00_X,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo05] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('video');

      console.info("[testVideo05] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info('[testVideo05] END');
      done();
    });

    it('testVideo06', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_0_75_X,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo06] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('video');

      console.info("[testVideo06] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info('[testVideo06] END');
      done();
    });

    it('testVideo07', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo07] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isStopped": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo07] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('video');

      console.info("[testVideo07] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info('[testVideo07] END');
      done();
    });

  });
}
