
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function buttonJsunit() {
  describe('buttonTest', function () {
    beforeEach(async function (done) {
      console.info("button beforeEach start");
      let options = {
        uri: 'MainAbility/pages/button',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("button" == pages.name)) {
          console.info("get button state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push button page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push button page error: " + err);
      }
      done()
    });

    beforeEach(async function () {
      await Utils.sleep(1000);
      console.info("button before each called");
    })

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("button after each called");
    })

    it('testButton01', 0, async function (done) {
      console.info('[testButton01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('button');
      let obj = JSON.parse(strJson);
      console.info("[testButton01] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.type).assertEqual('ButtonType.Normal');
      done();
    });

    it('testButton02', 0, async function (done) {
      console.info('[testButton02] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('button1');
      let obj = JSON.parse(strJson);
      console.info("[testButton02] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.type).assertEqual('ButtonType.Normal');
      done();
    });

    it('testButton03', 0, async function (done) {
      console.info('[testButton03] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('button2');
      let obj = JSON.parse(strJson);
      console.info("[testButton03] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontSize).assertEqual('20.00px');
      done();
    });

    it('testButton04', 0, async function (done) {
      console.info('[testButton04] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('button3');
      let obj = JSON.parse(strJson);
      console.info("[testButton04] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      done();
    });

    it('testButton05', 0, async function (done) {
      console.info('[testButton05] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "buttonTypeValue": "ButtonType.Capsule",
          }
        }
        var innerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton05] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton05] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.type).assertEqual('ButtonType.Capsule');
      done();
    });

    it('testButton06', 0, async function (done) {
      console.info('[testButton06] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": '30px',
          }
        }
        var innerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton06] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton05] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('30.00px');
      done();
    });

    it('testButton07', 0, async function (done) {
      console.info('[testButton07] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": -1,
          }
        }
        var innerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton07] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton07] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('16.00fp');
      done();
    });

    it('testButton08', 0, async function (done) {
      console.info('[testButton08] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": "121212121px",
          }
        }
        var innerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton08] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton08] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('121212121.00px');
      done();
    });

    it('testButton09', 0, async function (done) {
      console.info('[testButton09] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": "121212121px",
          }
        }
        var innerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton09] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton09] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton09] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('121212121.00px');
      done();
    });

    it('testButton10', 0, async function (done) {
      console.info('[testButton10] START');
      try {
        let eventData = {
          data: {
            "fontColorValue": Color.Pink
          }
        }
        let indexEventOne = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton10 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("testButton10 change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let indexEvent = {
        eventId: 72,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent) => {
        console.info("testButton10 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data.fontColorValue).assertEqual(Color.Pink)
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testButton10 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton10 click result is: " + JSON.stringify(sendEventByKey('button3', 10, "")));
      await Utils.sleep(1000);
      console.info('[testButton10] END');
    });

    it('testButton11', 0, async function (done) {
      console.info('[testButton11] START');
      try {
        let eventData = {
          data: {
            "fontColorValue": 332
          }
        }
        let indexEventOne = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton11 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("testButton11 change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let indexEvent = {
        eventId: 71,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent) => {
        console.info("testButton11 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data.fontColorValue).assertEqual(332)
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testButton11 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton11 click result is: " + JSON.stringify(sendEventByKey('button2', 10, "")));
      await Utils.sleep(1000);
      console.info('[testButton11] END');
    });

    it('testButton12', 0, async function (done) {
      let driver = Driver.create();

      await Utils.sleep(500);
      let buttonCl = await driver.findComponent(ON.id('buttonClick'));
      await Utils.sleep(500);
      let point = await buttonCl.getBoundsCenter();

      let density = await driver.getDisplayDensity();
      console.info("[testButton12] getDisplayDensity is: " + JSON.stringify(density));
      await Utils.sleep(500);
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[testButton12] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual(true)
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event)
          .screenY));
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event)
          .screenX));
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event).x));
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event).y));

        let ScreenX: number = JSON.parse(eventData.data?.event).screenX
        let ScreenY: number = JSON.parse(eventData.data?.event).screenY
        try {
            expect(Math.abs(vp2px(ScreenX) - point.x + globalThis.winLeft) <= 1).assertTrue()
            expect(Math.abs(vp2px(ScreenY) - point.y + globalThis.winTop)  <= 1).assertTrue()
            expect(Math.trunc(JSON.parse(eventData.data?.event).x)).assertEqual(100)
            expect(Math.trunc(JSON.parse(eventData.data?.event).y)).assertEqual(50)
        } catch (err) {
          console.info("[testButton12_] expection err : " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 4,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testButton12] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testButton12] sendEventByKey ' + JSON.stringify(sendEventByKey('buttonClick', 10, "")));
      await Utils.sleep(1000)
      console.info('[testButton12] testSendTouchEvent END');
    });

    it('testButton13', 0, async function (done) {
      console.info('[testButton13] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "buttonTypeValue": "qaq",
          }
        }
        var innerEvent = {
          eventId: 74,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton13] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton13] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton13] component objNew is: " + JSON.stringify(objNew.$attrs.type));
      expect(objNew.$attrs.type).assertEqual('ButtonType.Capsule');
      done();
    });

    it('testButton14', 0, async function (done) {
      console.info('[testButton14] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "buttonTypeValue": 41961,
          }
        }
        var innerEvent = {
          eventId: 75,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton14] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton14] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton14] component objNew is: " + JSON.stringify(objNew.$attrs.type));
      expect(objNew.$attrs.type).assertEqual('');
      done();
    });

    it('testButton15', 0, async function (done) {
      console.info('[testButton15] START');
      try {
        let eventData = {
          data: {
            "fontColorValue": "ab996"
          }
        }
        let indexEventOne = {
          eventId: 76,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton15 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("testButton15 change component data error: " + err.message);
      }
      await Utils.sleep(500);
      let indexEvent = {
        eventId: 77996,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent) => {
        console.info("testButton15 get state result is: " + JSON.stringify(indexEvent))
        console.info("testButton15 indexEvent.data.fontColorValue is: " + indexEvent.data.fontColorValue)
        expect(indexEvent.data.fontColorValue).assertEqual("ab996")
        console.info('[testButton15] END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testButton15 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton15 click result is: " + JSON.stringify(sendEventByKey('button4', 10, "")));
    });
  })
}