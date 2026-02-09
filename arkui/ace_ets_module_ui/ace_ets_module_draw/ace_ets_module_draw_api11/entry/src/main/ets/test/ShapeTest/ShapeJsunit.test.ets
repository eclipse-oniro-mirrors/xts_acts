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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';

export default function shapeJsunit() {
  describe('shapeJsunit', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Shape/shape3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shape state success " + JSON.stringify(pages));
        if (!("shape3" == pages.name)) {
          console.info("get shape state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push shape page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shape page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("shape after each called");
    });

    /**
     * @tc.name   shapeTest_0100
     * @tc.number shapeTest_0100
     * @tc.desc   shapeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0100 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.strokeDashOffset).assertEqual('0.00vp');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0200
     * @tc.number shapeTest_0200
     * @tc.desc   shapeTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0200 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0300
     * @tc.number shapeTest_0300
     * @tc.desc   shapeTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0300 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Miter');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0400
     * @tc.number shapeTest_0400
     * @tc.desc   shapeTest_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0400 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.strokeMiterLimit).assertEqual('4.000000');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0500
     * @tc.number shapeTest_0500
     * @tc.desc   shapeTest_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0500 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.strokeOpacity).assertEqual('1.000000');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0600
     * @tc.number shapeTest_0600
     * @tc.desc   shapeTest_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0600 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fillOpacity).assertEqual('0.000000');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0700
     * @tc.number shapeTest_0700
     * @tc.desc   shapeTest_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0700 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.antiAlias).assertEqual('true');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0800
     * @tc.number shapeTest_0800
     * @tc.desc   shapeTest_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0800 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.strokeDashArray[0]).assertEqual('20.00vp');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_0900
     * @tc.number shapeTest_0900
     * @tc.desc   shapeTest_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_0900', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_0900 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_0900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.strokeDashArray[1]).assertEqual('20.00vp');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_1000
     * @tc.number shapeTest_1000
     * @tc.desc   shapeTest_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1000 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "antiAlias": "false",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1000 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1000 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .antiAlias));
      expect(JSON.parse(strJson).$attrs.antiAlias).assertEqual('false');
      done();
    });

    /**
     * @tc.name   shapeTest_1100
     * @tc.number shapeTest_1100
     * @tc.desc   shapeTest_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1100', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1100 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "antiAlias": undefined,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1100 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');
      console.info("shapeTest_1100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .antiAlias));
      expect(JSON.parse(strJson).$attrs.antiAlias).assertEqual('false');
      done();
    });

    /**
     * @tc.name   shapeTest_1200
     * @tc.number shapeTest_1200
     * @tc.desc   shapeTest_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1200', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1200 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "antiAlias": -0.1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1200 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1200 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');
      console.info("shapeTest_1200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .antiAlias));
      expect(JSON.parse(strJson).$attrs.antiAlias).assertEqual('false');
      done();
    });

    /**
     * @tc.name   shapeTest_1300
     * @tc.number shapeTest_1300
     * @tc.desc   shapeTest_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1300', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1300 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineCap": LineCapStyle.Round,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1300 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeLineCap));
      expect(JSON.parse(strJson).$attrs.strokeLineCap).assertEqual('LineCapStyle.Round');
      done();
    });

    /**
     * @tc.name   shapeTest_1400
     * @tc.number shapeTest_1400
     * @tc.desc   shapeTest_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1400', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1400 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineCap": 'string'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1400 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeLineCap));
      expect(JSON.parse(strJson).$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      done();
    });

    /**
     * @tc.name   shapeTest_1500
     * @tc.number shapeTest_1500
     * @tc.desc   shapeTest_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1500', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1500 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineCap": '-0.2'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1500 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeLineCap));
      expect(JSON.parse(strJson).$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      done();
    });

    /**
     * @tc.name   shapeTest_1600
     * @tc.number shapeTest_1600
     * @tc.desc   shapeTest_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1600', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1600 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": LineJoinStyle.Round,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1600 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeLineJoin));
      expect(JSON.parse(strJson).$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Round');
      done();
    });

    /**
     * @tc.name   shapeTest_1700
     * @tc.number shapeTest_1700
     * @tc.desc   shapeTest_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1700', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1700 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": 'nothing',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1700 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeLineJoin));
      expect(JSON.parse(strJson).$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Miter');
      done();
    });

    /**
     * @tc.name   shapeTest_1800
     * @tc.number shapeTest_1800
     * @tc.desc   shapeTest_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1800', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1800 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": 0.11111,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1800 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeLineJoin));
      expect(JSON.parse(strJson).$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Miter');
      done();
    });

    /**
     * @tc.name   shapeTest_2100
     * @tc.number shapeTest_2100
     * @tc.desc   shapeTest_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2100', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2100 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": "-0.11111",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2100 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeMiterLimit));
      expect(parseInt(JSON.parse(strJson).$attrs.strokeMiterLimit)).assertEqual(4);
      done();
    });

    /**
     * @tc.name   shapeTest_3200
     * @tc.number shapeTest_3200
     * @tc.desc   shapeTest_3200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_3200', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_3200 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": 1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_3200 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_3200 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_3200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeMiterLimit));
      expect(parseInt(JSON.parse(strJson).$attrs.strokeMiterLimit)).assertEqual(1);
      done();
    });

    /**
     * @tc.name   shapeTest_3300
     * @tc.number shapeTest_3300
     * @tc.desc   shapeTest_3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_3300', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_3300 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": 0.5,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_3300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_3300 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_3300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeMiterLimit));
      expect(parseInt(JSON.parse(strJson).$attrs.strokeMiterLimit)).assertEqual(1);
      done();
    });

    /**
     * @tc.name   shapeTest_2200
     * @tc.number shapeTest_2200
     * @tc.desc   shapeTest_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2200', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1300 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": '11111',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2200 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2200 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeMiterLimit));
      expect(parseInt(JSON.parse(strJson).$attrs.strokeMiterLimit)).assertEqual(11111);
      done();
    });

    /**
     * @tc.name   shapeTest_1900
     * @tc.number shapeTest_1900
     * @tc.desc   shapeTest_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_1900', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_1900 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": "5",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_1900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_1900 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_1900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeMiterLimit));
      expect(JSON.parse(strJson).$attrs.strokeMiterLimit).assertEqual('5.000000');
      done();
    });

    /**
     * @tc.name   shapeTest_2000
     * @tc.number shapeTest_2000
     * @tc.desc   shapeTest_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2000', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2000 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": "string",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2000 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2000 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeMiterLimit));
      expect(JSON.parse(strJson).$attrs.strokeMiterLimit).assertEqual('4.000000');
      done();
    });


    /**
     * @tc.name   shapeTest_2300
     * @tc.number shapeTest_2300
     * @tc.desc   shapeTest_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2300', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2300 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "1",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2300 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .fillOpacity));
      expect(JSON.parse(strJson).$attrs.fillOpacity).assertEqual('1.000000');
      done();
    });

    /**
     * @tc.name   shapeTest_2400
     * @tc.number shapeTest_2400
     * @tc.desc   shapeTest_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2400', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2400 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "-1",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2400 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .fillOpacity));
      expect(JSON.parse(strJson).$attrs.fillOpacity).assertEqual('0.000000');
      done();
    });

    /**
     * @tc.name   shapeTest_2500
     * @tc.number shapeTest_2500
     * @tc.desc   shapeTest_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2500', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2500 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "aaaaaaa",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2500 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .fillOpacity));
      expect(JSON.parse(strJson).$attrs.fillOpacity).assertEqual('nan');
      done();
    });

    /**
     * @tc.name   shapeTest_2600
     * @tc.number shapeTest_2600
     * @tc.desc   shapeTest_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2600', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2600 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "aa12345",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2600 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .fillOpacity));
      expect(JSON.parse(strJson).$attrs.fillOpacity).assertEqual('nan');
      done();
    });

    /**
     * @tc.name   shapeTest_2700
     * @tc.number shapeTest_2700
     * @tc.desc   shapeTest_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2700', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2700 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeDashArrayOne": "4",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2700 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeDashArray[0]));
      expect(JSON.parse(strJson).$attrs.strokeDashArray[0]).assertEqual('4.00vp');
      done();
    });

    /**
     * @tc.name   shapeTest_2800
     * @tc.number shapeTest_2800
     * @tc.desc   shapeTest_2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2800', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2800 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeDashArrayTwo": "4",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2800 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeDashArray[1]));
      expect(JSON.parse(strJson).$attrs.strokeDashArray[1]).assertEqual('4.00vp');
      done();
    });

    /**
     * @tc.name   shapeTest_2900
     * @tc.number shapeTest_2900
     * @tc.desc   shapeTest_2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_2900', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_2900 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeDashArrayThree": "4",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_2900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_2900 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_2900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeDashArray[1]));
      expect(JSON.parse(strJson).$attrs.strokeDashArray[2]).assertEqual('4.00vp');
      done();
    });

    /**
     * @tc.name   shapeTest_3000
     * @tc.number shapeTest_3000
     * @tc.desc   shapeTest_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_3000', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_3000 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_3000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.stroke).assertEqual('#FF000000');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   shapeTest_3100
     * @tc.number shapeTest_3100
     * @tc.desc   shapeTest_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('shapeTest_3100', Level.LEVEL0, async (done: Function) => {
      console.info('shapeTest_3100 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": LineJoinStyle.Bevel,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("shapeTest_3100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("shapeTest_3100 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('shape');

      console.info("shapeTest_3100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .strokeLineJoin));
      expect(JSON.parse(strJson).$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Bevel');
      done();
    });
  })
}

