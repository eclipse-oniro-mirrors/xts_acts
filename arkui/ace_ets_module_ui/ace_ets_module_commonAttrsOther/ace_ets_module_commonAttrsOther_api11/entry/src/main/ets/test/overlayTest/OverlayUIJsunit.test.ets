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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'

export default function overLayJsunit() {
  describe('overLayJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("overLayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlay/overlayUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get overLayJsunit state pages: " + JSON.stringify(pages));
        if (!("overlayUI" == pages.name)) {
          console.info("get overLayJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push overLayJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push overLayJsunit page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    it('overLayJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0100] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.title).assertEqual("old title");
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.Bottom");
      expect(obj.$attrs.overlay.options.offset.x).assertEqual('0.00vp');
      expect(obj.$attrs.overlay.options.offset.y).assertEqual('-15.00vp');
      console.info('[overLayJsunit_0100] END');
      done();
    });

    it('overLayJsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "title": "new title"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0200] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.title).assertEqual("new title");
      console.info('overLayJsunit_0200 END');
      done();
    });

    it('overLayJsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.TopStart",
            "x": 30,
            "y": -30
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0300] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      expect(obj.$attrs.overlay.options.offset.x).assertEqual('30.00vp');
      expect(obj.$attrs.overlay.options.offset.y).assertEqual('-30.00vp');
      console.info('overLayJsunit_0300 END');
      done();
    });

    it('overLayJsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0400] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.Center"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0400] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_0400 END');
      done();
    });

    it('overLayJsunit_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align":'-1'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0500] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.Center");
      console.info('overLayJsunit_0500 END');
      done();
    });

    it('overLayJsunit_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "x": -30,
            "y": 30
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0600] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.offset.x).assertEqual('-30.00vp');
      expect(obj.$attrs.overlay.options.offset.y).assertEqual('30.00vp');
      console.info('overLayJsunit_0600 END');
      done();
    });

    it('overLayJsunit_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0700] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "x": 1111111111
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0700] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.offset.x).assertEqual('1111111111.00vp');
      console.info('overLayJsunit_0700 END');
      done();
    });

    it('overLayJsunit_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0800] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "y": 1111111111
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0800] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.offset.x).assertEqual('1111111111.00vp');
      console.info('overLayJsunit_0800 END');
      done();
    });

    it('overLayJsunit_0900', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0900] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.Top"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_0900] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_0900 END');
      done();
    });

    it('overLayJsunit_1000', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_1000] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.TopEnd"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_1000] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1000 END');
      done();
    });

    it('overLayJsunit_1100', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_1100] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.Start"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_1100] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1100 END');
      done();
    });

    it('overLayJsunit_1200', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_1200] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.End"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_1200] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1200 END');
      done();
    });

    it('overLayJsunit_1300', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_1300] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.BottomEnd"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_1300] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1300 END');
      done();
    });

    it('overLayJsunit_1400', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_1400] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.BottomStart"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[overLayJsunit_1400] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1400 END');
      done();
    });

  })
}
