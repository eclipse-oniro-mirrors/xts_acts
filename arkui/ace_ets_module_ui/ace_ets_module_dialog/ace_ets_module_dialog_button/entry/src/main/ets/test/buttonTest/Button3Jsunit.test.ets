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
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';
import { Driver,ON } from '@ohos.UiTest';

export default function button3Jsunit() {
  describe('button3Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/button3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("button3" == pages.name)) {
          console.info("get button state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push button page error: " + err);
      }
      done()
    });

    beforeEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("button before each called");
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("button after each called");
    })

    /**
     * @tc.name   testButton01
     * @tc.number testButton01
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton01', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton01] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button3Jsunit_button');
      console.info("[testButton01] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Button');
      expect(JSON.parse(strJson).$attrs.type).assertEqual('ButtonType.Normal');
      done();
    });

    /**
     * @tc.name   testButton02
     * @tc.number testButton02
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton02', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton02] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button3Jsunit_button1');
      console.info("[testButton02] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Button');
      expect(JSON.parse(strJson).$attrs.type).assertEqual('ButtonType.Normal');
      done();
    });

    /**
     * @tc.name   testButton03
     * @tc.number testButton03
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton03', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton03] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button3Jsunit_button2');
      console.info("[testButton03] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('20.00px');
      done();
    });

    /**
     * @tc.name   testButton04
     * @tc.number testButton04
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton04', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton04] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button3Jsunit_button3');
      console.info("[testButton04] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.borderColor).assertContain('#');   
      done();
    });

    /**
     * @tc.name   testButton05
     * @tc.number testButton05
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton05', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton05] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "buttonTypeValue": "ButtonType.Capsule",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('button3Jsunit_button');

      console.info("[testButton05] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.type).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      done();
    });

    /**
     * @tc.name   testButton06
     * @tc.number testButton06
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton06', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton06] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": '30px',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('button3Jsunit_button2');

      console.info("[testButton05] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('30.00px');
      done();
    });

    /**
     * @tc.name   testButton07
     * @tc.number testButton07
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton07', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton07] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": -1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton07] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('button3Jsunit_button2');

      let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_size_body1').id)
	    console.info("[TextInputPageJsunit_0200] size: " +px2fp(resourceSize));
      console.info("[testButton07] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertContain('fp');
      done();
    });

    /**
     * @tc.name   testButton08
     * @tc.number testButton08
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton08', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton08] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121px",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('button3Jsunit_button2');

      console.info("[testButton08] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('121212121.00px');
      done();
    });

    /**
     * @tc.name   testButton09
     * @tc.number testButton09
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton09', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton09] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121px",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton09] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton09] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('button3Jsunit_button2');

      console.info("[testButton09] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('121212121.00px');
      done();
    });

    /**
     * @tc.name   testButton10
     * @tc.number testButton10
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton10', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton10] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": Color.Pink
          }
        }
        let indexEventOne: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton10 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("testButton10 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 72,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testButton10 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data?.fontColorValue).assertEqual(Color.Pink)
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testButton10 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton10 click result is: " + JSON.stringify(sendEventByKey('button3Jsunit_button3', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('[testButton10] END');
    });

    /**
     * @tc.name   testButton11
     * @tc.number testButton11
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton11', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton11] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": 332
          }
        }
        let indexEventOne: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton11 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("testButton11 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 71,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testButton11 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data?.fontColorValue).assertEqual(332)
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testButton11 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton11 click result is: " + JSON.stringify(sendEventByKey('button3Jsunit_button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('[testButton11] END');
    });

    /**
     * @tc.name   testButton12
     * @tc.number testButton12
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton12', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();

      await CommonFunc.sleep(500);
      let buttonCl = await driver.findComponent(ON.id('button3Jsunit_buttonClick'));
      await CommonFunc.sleep(500);
      let point = await buttonCl.getBoundsCenter();

      let density = await driver.getDisplayDensity();
      console.info("[testButton12] getDisplayDensity is: " + JSON.stringify(density));
      await CommonFunc.sleep(500);
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[testButton12] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual(true)
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event)
          .screenY));
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event)
          .screenX));
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event).x));
        console.info("[testButton12] get event state result is: " + Math.trunc(JSON.parse(eventData.data?.event).y));

        let ScreenX: number = Number(JSON.parse(eventData.data?.event).screenX)
        let ScreenY: number = Number(JSON.parse(eventData.data?.event).screenY)
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
      console.info('[testButton12] sendEventByKey ' + JSON.stringify(sendEventByKey('button3Jsunit_buttonClick', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[testButton12] testSendTouchEvent END');
    });

    /**
     * @tc.name   testButton13
     * @tc.number testButton13
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton13', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton13] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "buttonTypeValue": "qaq",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 74,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton13] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton13] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('button3Jsunit_button');

      console.info("[testButton13] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .type));
      expect(JSON.parse(strJsonNew).$attrs.type).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      done();
    });

    /**
     * @tc.name   testButton14
     * @tc.number testButton14
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton14', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton14] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "buttonTypeValue": 41961,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 75,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton14] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton14] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('button3Jsunit_button');

      console.info("[testButton14] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .type));
      expect(JSON.parse(strJsonNew).$attrs.type).assertEqual('');
      done();
    });

    /**
     * @tc.name   testButton15
     * @tc.number testButton15
     * @tc.desc   test Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButton15', Level.LEVEL1, async (done: Function) => {
      console.info('[testButton15] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": "ab996"
          }
        }
        let indexEventOne: events_emitter.InnerEvent = {
          eventId: 76,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton15 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("testButton15 change component data error: " + err.message);
      }
      await CommonFunc.sleep(500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 77996,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testButton15 get state result is: " + JSON.stringify(indexEvent))
        console.info("testButton15 indexEvent.data?.fontColorValue is: " + indexEvent.data?.fontColorValue)
        expect(indexEvent.data?.fontColorValue).assertEqual("ab996")
        console.info('[testButton15] END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testButton15 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton15 click result is: " + JSON.stringify(sendEventByKey('button3Jsunit_button4', 10, "")));
    });
  })
}