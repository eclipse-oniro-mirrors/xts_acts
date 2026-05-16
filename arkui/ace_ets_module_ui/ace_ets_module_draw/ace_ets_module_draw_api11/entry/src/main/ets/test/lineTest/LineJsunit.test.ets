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

export default function LineJsunit() {
  describe('LineTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line/line3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push line page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push line page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(2000);
      console.info("line after each called");
    });

    /**
     * @tc.name   lineTest_0100
     * @tc.number lineTest_0100
     * @tc.desc   lineTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0100 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0100 component strJson:" + strJson);
      console.info("lineTest_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.startPoint[0]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lineTest_0200
     * @tc.number lineTest_0200
     * @tc.desc   lineTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0200 START');
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0200 component strJson:" + strJson);
      console.info("lineTest_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.startPoint[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lineTest_0300
     * @tc.number lineTest_0300
     * @tc.desc   lineTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0300 START');
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0300 component strJson:" + strJson);
      console.info("lineTest_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.endPoint[0]).assertEqual(50);
      done();
    });

    /**
     * @tc.name   lineTest_0400
     * @tc.number lineTest_0400
     * @tc.desc   lineTest_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0400 START');
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0400 component strJson:" + strJson);
      console.info("lineTest_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.endPoint[1]).assertEqual(100);
      done();
    });

    /**
     * @tc.name   lineTest_0500
     * @tc.number lineTest_0500
     * @tc.desc   lineTest_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0500 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startPoint": 50,
            "startPointOne": 50,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 131,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("lineTest_0500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("lineTest_0500 change component error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .startPoint[0]));
      console.info("lineTest_0500 component objOne is: " + JSON.stringify(JSON.parse(strJson).$attrs.startPoint[1]));
      expect(JSON.parse(strJson).$attrs.startPoint[0]).assertEqual(50);
      expect(JSON.parse(strJson).$attrs.startPoint[1]).assertEqual(50);
      done();
    });

    /**
     * @tc.name   lineTest_0600
     * @tc.number lineTest_0600
     * @tc.desc   lineTest_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0600 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endPoint": 100,
            "endPointOne": 150,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 131,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("lineTest_0600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("lineTest_0600 change component error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .endPoint[0]));
      console.info("lineTest_0600 component objOne is: " + JSON.stringify(JSON.parse(strJson).$attrs.endPoint[1]));
      expect(JSON.parse(strJson).$attrs.endPoint[0]).assertEqual(100);
      expect(JSON.parse(strJson).$attrs.endPoint[1]).assertEqual(150);
      done();
    });

    /**
     * @tc.name   lineTest_0700
     * @tc.number lineTest_0700
     * @tc.desc   lineTest_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0700 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startPoint": 'A',
            "startPointOne": 'B',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 131,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("lineTest_0700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("lineTest_0700 change component error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .startPoint[0]));
      console.info("lineTest_0700 component objOne is: " + JSON.stringify(JSON.parse(strJson).$attrs.startPoint[1]));
      expect(JSON.parse(strJson).$attrs.startPoint[0]).assertEqual(0);
      expect(JSON.parse(strJson).$attrs.startPoint[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lineTest_0800
     * @tc.number lineTest_0800
     * @tc.desc   lineTest_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('lineTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('lineTest_0900 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endPoint": 'A',
            "endPointOne": 'B',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 131,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("lineTest_0800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("lineTest_0800 change component error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line');
      console.info("lineTest_0800 component objOne is: " + JSON.stringify(JSON.parse(strJson).$attrs.endPoint[1]));
      console.info("lineTest_0800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.endPoint[0]));
      expect(JSON.parse(strJson).$attrs.endPoint[1]).assertEqual(0);
      expect(JSON.parse(strJson).$attrs.endPoint[0]).assertEqual(0);
      done();
    });
  })
}