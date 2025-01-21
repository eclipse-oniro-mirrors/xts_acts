/*
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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

let emitKey = "emitUserAgent";

export default function ActsAlphabetIndexerUxTest() {
  describe('ActsAlphabetIndexerUxTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetIndexerux",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlphabetIndexer state success " + JSON.stringify(pages));
        if (!("alphabetIndexerux" == pages.name)) {
          console.info("get AlphabetIndexer state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push AlphabetIndexer page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlphabetIndexer page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("AlphabetIndexer afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "popupSelectedColorStr": '#00FF00',
            "popupUnselectedColorStr": '#DA70D6',
            "popupItemBackgroundStr": '#FFD700',
            "popupItemFontSizeStr": '20',
            "popupItemFontWeightStr": '400',
            "popupSpaceStr": '120',
            "popupSelectedColor": Color.Orange,
            "popupUnselectedColor": Color.Green,
            "popupItemBackgroundColor": Color.Pink,
            "popupSelectedColorNum": 0x00CED1,
            "popupUnselectedColorNum": 0xC0FF3E,
            "popupItemBackgroundNum": 0x8470FF,
            "popupItemFontSizeNum": 30,
            "popupItemFontWeightNum": FontWeight.Normal,
            "popupSpaceNum": 50,
            "popupSelectedColorRes": $r('app.color.popupSelectedColor'),
            "popupUnselectedColorRes": $r('app.color.popupUnselectedColor'),
            "popupItemBackgroundRes": $r('app.color.popupItemBackground'),
            "popupItemFontSizeRes": $r('app.string.fontSize'),
            "popupSpaceRes": $r('app.string.popupSpace'),
            "popupItemFontWeightFont": FontWeight.Bolder,
            "nullFlag1": false,
            "nullFlag2": false,
            "nullFlag3": false,
            "nullFlag4": false,
            "nullFlag5": false
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      done();
    })

    it('ArkUI_AlphabetIndexer_0100', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0100 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupSelectedColor).assertEqual(obj.$attrs.backgroundColor);
      expect(obj.$attrs.popupUnselectedColor).assertEqual(obj.$attrs.backgroundColor);
      expect(obj.$attrs.popupItemBackground).assertEqual("#FFFFFFFF");
      expect(obj.$attrs.popupItemFontSize).assertEqual("24.00vp");
      expect(obj.$attrs.popupItemFontWeight).assertEqual("FontWeight.Medium");
      expect(obj.$attrs.popupHorizontalSpace).assertEqual("-1.00vp");
      done();
    });

    it('ArkUI_AlphabetIndexer_0600', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0600 start");
      let strJson = getInspectorByKey('alphabetIndexerTest6');
      let obj: ESObject = JSON.parse(strJson);
      let popupItemFontSize: string = obj.$attrs.popupItemFontSize;
      expect(parseFloat(popupItemFontSize)).assertEqual(30)
      done();
    });

    it('ArkUI_AlphabetIndexer_0700', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0700 start");
      let strJson = getInspectorByKey('alphabetIndexerTest7');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupItemFontWeight).assertEqual("FontWeight.Normal");
      done();
    });

    it('ArkUI_AlphabetIndexer_0800', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0800 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupSelectedColor).assertEqual(obj.$attrs.backgroundColor);
      done();
    });

    it('ArkUI_AlphabetIndexer_0900', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0900 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupUnselectedColor).assertEqual(obj.$attrs.backgroundColor);
      done();
    });

    it('ArkUI_AlphabetIndexer_1000', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1000 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemBackground).assertEqual("#FFFFFFFF");
      done();
    });

    it('ArkUI_AlphabetIndexer_1100', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1100 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemFontSize).assertEqual("24.00vp");
      done();
    });

    it('ArkUI_AlphabetIndexer_1200', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1200 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemFontWeight).assertEqual("FontWeight.Medium");
      done();
    });

    it('ArkUI_AlphabetIndexer_1300', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1300 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupHorizontalSpace).assertEqual("-1.00vp");
      done();
    });

    it('ArkUI_AlphabetIndexer_1400', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1400 start");
      let strJson = getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest3');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupSelectedColor).assertEqual(obj.$attrs.backgroundColor);
      done();
    });

    it('ArkUI_AlphabetIndexer_1500', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1500 start");
      let strJson = getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest3');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupUnselectedColor).assertEqual(obj.$attrs.backgroundColor);
      done();
    });

    it('ArkUI_AlphabetIndexer_1600', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1600 start");
      let strJson = getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest3');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemBackground).assertEqual("#FFFFFFFF");
      done();
    });

    it('ArkUI_AlphabetIndexer_1700', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1700 start");
      let strJson = getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest3');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemFontSize).assertEqual("24.00vp");
      done();
    });

    it('ArkUI_AlphabetIndexer_1800', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1800 start");
      let strJson = getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest3');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemFontWeight).assertEqual("FontWeight.Medium");
      done();
    });

    it('ArkUI_AlphabetIndexer_1900', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_1900 start");
      let strJson = getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest3');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupHorizontalSpace).assertEqual("-1.00vp");
      done();
    })

    it('ArkUI_AlphabetIndexer_2600', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_2600 start");
      let strJson = getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_2600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest4');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupSelectedColor).assertEqual(obj.$attrs.backgroundColor);
      done();
    });

    it('ArkUI_AlphabetIndexer_2700', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_2700 start");
      let strJson = getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_2700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest4');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupUnselectedColor).assertEqual(obj.$attrs.backgroundColor);
      done();
    });

    it('ArkUI_AlphabetIndexer_2800', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_2800 start");
      let strJson = getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_2800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest4');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemBackground).assertEqual("#FFFFFFFF");
      done();
    });

    it('ArkUI_AlphabetIndexer_2900', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_2900 start");
      let strJson = getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_2900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest4');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemFontSize).assertEqual("24.00vp");
      done();
    });

    it('ArkUI_AlphabetIndexer_3000', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_3000 start");
      let strJson = getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_3000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest4');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupItemFontWeight).assertEqual("FontWeight.Medium");
      done();
    });

    it('ArkUI_AlphabetIndexer_3100', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_3100 start");
      let strJson = getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_3100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_AlphabetIndexer_3100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = getInspectorByKey('alphabetIndexerTest4');
      let obj: ESObject = JSON.parse(newJson);
      expect(obj.$attrs.popupHorizontalSpace).assertEqual("-1.00vp");
      done();
    });
  })
}