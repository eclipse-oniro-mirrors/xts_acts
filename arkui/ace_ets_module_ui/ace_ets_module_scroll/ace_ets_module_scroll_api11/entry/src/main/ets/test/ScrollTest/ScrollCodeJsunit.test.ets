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
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollCodeJsunit() {
  describe('scrollCodeJsunit', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollCode state success " + JSON.stringify(pages));
        if (!("ScrollCode" == pages.name)) {
          console.info("get ScrollCode pages success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollCode page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("ScrollCode after each called");
    });

    it('test_scrollCode_001', 0, async (done: Function) => {
      console.info('[test_scrollCode_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_001] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual('ScrollDirection.Vertical');
      expect(JSON.parse(strJson).$attrs.scrollBar).assertEqual('BarState.On');
      expect(JSON.parse(strJson).$attrs.scrollBarColor).assertEqual('#FF0000FF');
      expect(JSON.parse(strJson).$attrs.scrollBarWidth).assertEqual('30.00vp');
      done();
    });

    it('test_scrollCode_002', 0, async (done: Function) => {
      console.info('[test_scrollCode_002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "Vertical"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_scrollCode_002] change scrollable error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_002] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual('ScrollDirection.Vertical');
      done();
    });

    it('test_scrollCode_003', 0, async (done: Function) => {
      console.info('[test_scrollCode_003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollBar": "Off"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 186,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_scrollCode_003] change scrollBar error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_003] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.scrollBar).assertEqual('BarState.Off');
      done();
    });

    it('test_scrollCode_004', 0, async (done: Function) => {
      console.info('[test_scrollCode_004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollBarColor": "#FFB6C1"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 187,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_scrollCode_004] change scrollBar error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_004] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.scrollBarColor).assertEqual('#FFFFB6C1');
      done();
    });

    it('test_scrollCode_005', 0, async (done: Function) => {
      console.info('[test_scrollCode_005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollBarWidth": 40
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 188,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_scrollCode_005] change scrollBar error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_005] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.scrollBarWidth).assertEqual('40.00vp');
      done();
    });


    it('test_scrollCode_006', 0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[test_scrollCode_06] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.scrollToIndex).assertEqual(10)
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 189,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_scrollCode_06] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_scrollCode_006] sendEventByKey ' + JSON.stringify(sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[test_scrollCode_006] testSendTouchEvent END');
      done();
    });
  })
}