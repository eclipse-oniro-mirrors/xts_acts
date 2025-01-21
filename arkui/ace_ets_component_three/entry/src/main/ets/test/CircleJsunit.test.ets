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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function circleJsunit() {
  describe('circleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("circle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/circle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get circle state pages:" + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get circle state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push circle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push circle page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("circle after each called");
    });

    it('circleTest_0100', 0, async (done: Function) => {
      console.info('circleTest_0100 START');
      let strJson = getInspectorByKey('circle');
      console.info("circleTest_0100 component strJson:" + strJson);

      console.info("circleTest_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.height).assertEqual('450.00px');
      expect(JSON.parse(strJson).$attrs.width).assertEqual('450.00px');
      done();
    });

    it('circleTest_0200', 0, async (done: Function) => {
      console.info('[circleTest_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '500px',
            "height": '500px',
          }
        }
        console.info('[circleTest_0200] START');
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 77,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[circleTest_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[circleTest_0200] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('circle');
      console.info("[circleTest_0200] component objNew is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.height).assertEqual('500.00px');
      expect(JSON.parse(strJson).$attrs.width).assertEqual('500.00px');
      console.info('circleTest_0200 END');
      done();
    });

    it('circleTest_0300', 0, async (done: Function) => {
      console.info('[circleTest_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '-a',
            "height": '-b',
          }
        }
        console.info('[circleTest_0300] START');
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 77,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[circleTest_030] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[circleTest_030] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('circle');
      console.info("[circleTest_0300] component objNew is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.width).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('0.00vp');
      console.info('circleTest_0300 END');
      done();
    });
  })
}
