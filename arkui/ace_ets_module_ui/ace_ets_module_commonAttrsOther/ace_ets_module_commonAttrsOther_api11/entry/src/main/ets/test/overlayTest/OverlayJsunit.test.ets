
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function overLayJsunit() {
  describe('overLayTest', () => {
    beforeEach(async (done: Function) => {
      console.info("overlay beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlay/overlay',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get overlay state pages: " + JSON.stringify(pages));
        if (!("overlay" == pages.name)) {
          console.info("get overlay state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push overlay page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push overlay page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    /**
     * @tc.name   testOverlay01
     * @tc.number testOverlay01
     * @tc.desc   testOverlay01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay01', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('overlay');

      console.info("[testOverlay01] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.title).assertEqual("old title");
      expect(JSON.parse(strJson).$attrs.overlay.options.align).assertEqual("Alignment.Bottom");
      expect(JSON.parse(strJson).$attrs.overlay.options.offset.x).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.overlay.options.offset.y).assertEqual('-15.00vp');
      console.info('[testOverlay01] END');
      done()
    });

    /**
     * @tc.name   testOverlay02
     * @tc.number testOverlay02
     * @tc.desc   testOverlay02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay02', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay02] START');
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
        console.info("[testOverlay02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('overlay');

      console.info("[testOverlay02] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.title).assertEqual("new title");
      console.info('testOverlay02 END');
      done()
    });

    /**
     * @tc.name   testOverlay03
     * @tc.number testOverlay03
     * @tc.desc   testOverlay03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay03', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay03] START');
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
        console.info("[testOverlay03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('overlay');

      console.info("[testOverlay03] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      expect(JSON.parse(strJson).$attrs.overlay.options.offset.x).assertEqual('30.00vp');
      expect(JSON.parse(strJson).$attrs.overlay.options.offset
        .y).assertEqual('-30.00vp');
      console.info('testOverlay03 END');
      done()
    });

    /**
     * @tc.name   testOverlay04
     * @tc.number testOverlay04
     * @tc.desc   testOverlay04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay04', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay04] START');
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
        console.info("[testOverlay04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('overlay');

      console.info("[testOverlay04] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      console.info('testOverlay04 END');
      done()
    });

    /**
     * @tc.name   testOverlay05
     * @tc.number testOverlay05
     * @tc.desc   testOverlay05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay05', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": '-1'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('overlay');

      console.info("[testOverlay05] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.options.align).assertEqual("Alignment.Center");
      console.info('testOverlay05 END');
      done()
    });

    /**
     * @tc.name   testOverlay06
     * @tc.number testOverlay06
     * @tc.desc   testOverlay06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay06', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay06] START');
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
        console.info("[testOverlay06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('overlay');

      console.info("[testOverlay06] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.options.offset.x).assertEqual('-30.00vp');
      expect(JSON.parse(strJson).$attrs.overlay.options.offset.y).assertEqual('30.00vp');
      console.info('testOverlay06 END');
      done()
    });

    /**
     * @tc.name   testOverlay07
     * @tc.number testOverlay07
     * @tc.desc   testOverlay07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay07', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay07] START');
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
        console.info("[testOverlay07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay07] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('overlay');

      console.info("[testOverlay07] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.options.offset.x).assertEqual('1111111111.00vp');
      console.info('testOverlay07 END');
      done()
    });

    /**
     * @tc.name   testOverlay08
     * @tc.number testOverlay08
     * @tc.desc   testOverlay08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverlay08', Level.LEVEL0, async (done: Function) => {
      console.info('[testOverlay08] START');
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
        console.info("[testOverlay08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('overlay');
      console.info("[testOverlay08] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.overlay));
      expect(JSON.parse(strJson).$attrs.overlay.options.offset.x).assertEqual('1111111111.00vp');
      console.info('testOverlay08 END');
      done()
    });
  })
}
