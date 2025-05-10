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
import CommonFunc from '../../MainAbility/common/Common';;

export default function textClockJsunit() {
  describe('appInfoTest_four_11', () => {
    beforeEach(async (done: Function) => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/textClock',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get text state pages:" + JSON.stringify(pages));
        if (!("text" == pages.name)) {
          console.info("get text state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push text page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push text page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("text after each called");
    });

    it('textClockTest01', 0, async (done: Function) => {
      console.info('textClockTest01 START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textClock');
      console.info("textClockTest01 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('30.00fp');
      await CommonFunc.sleep(1000);
      done();
    });

    it('textClockTest02', 0, async (done: Function) => {
      console.info('[textClockTest02] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": 30
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 219,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textClockTest02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textClockTest02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('textClock');
      console.info("[textClockTest02] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('30.00fp');
      done();
    });

    it('textClockTest03', 0, async (done: Function) => {
      console.info('[textClockTest03] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('textClock');
      console.info("[textClockTest03] component strJson:" + strJson);

      console.info("[textClockTest03] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FFFF0000');
      done();
    });

    it('textClockTest04', 0, async (done: Function) => {
      console.info('[textClockTest04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": '#FF000990'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 220,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textClockTest04] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[textClockTest04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('textClock');
      console.info("[textClockTest04] component strJson:" + strJson);

      console.info("[textClockTest04] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FF000990');
      done();
    });

    it('textClockTest05', 0, async (done: Function) => {
      console.info('[textClockTest05] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textClock');

      console.info("[textClockTest05] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.format).assertEqual('hhmmss');
      console.info('textClockTest05 END');
      done();
    });

    it('textClockTest06', 0, async (done: Function) => {
      console.info('[textClockTest06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "format": '20',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 221,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textClockTest06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textClockTest06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textClock');

      console.info("[textClockTest06] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.format).assertEqual('20');
      console.info('textClockTest06 END');
      done();
    });
  })
}
