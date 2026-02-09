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
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function Span3JsunitTest() {
  describe('Span3JsunitTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Span/Span3Jsunit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Span3Jsunit state success " + JSON.stringify(pages));
        if (!("Span3Jsunit" == pages.name)) {
          console.info("get Span3Jsunit success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Span3Jsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Span3Jsunit page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Span3Jsunit after each called");
    });
    /**
     * @tc.name   testSpan001
     * @tc.number SUB_ACE_testSpan001
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpan001', Level.LEVEL1, async (done: Function) => {
      console.info('[testSpan001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('decoration');
      console.info("[testSpan001] component strJson:" + strJson);

      expect(JSON.parse(JSON.parse(strJson).$attrs.decoration).type).assertEqual('TextDecorationType.None');
      expect(JSON.parse(JSON.parse(strJson).$attrs.decoration).color).assertEqual('#FFFF0000');
      done();
    });
    /**
     * @tc.name   testSpan002
     * @tc.number SUB_ACE_testSpan002
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpan002', Level.LEVEL1, async (done: Function) => {
      console.info('[testSpan002] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('decoration');
      console.info("[testSpan002] component strJson:" + strJson);

      console.info("[testSpan002] textCase:" + JSON.parse(strJson).$attrs.textCase);
      expect(JSON.parse(strJson).$attrs.textCase).assertEqual('TextCase.Normal');
      done();
    });
    /**
     * @tc.name   testSpan003
     * @tc.number SUB_ACE_testSpan003
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpan003', Level.LEVEL1, async (done: Function) => {
      console.info('[testSpan003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCaseValue": TextCase.UpperCase
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 200,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan003] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testSpan003] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('decoration');
      console.info("[testSpan003] component strJson:" + strJson);

      console.info("[testSpan003] textCase:" + JSON.parse(strJson).$attrs.textCase);
      expect(JSON.parse(strJson).$attrs.textCase).assertEqual('TextCase.UpperCase');
      done();
    });
    /**
     * @tc.name   testSpan004
     * @tc.number SUB_ACE_testSpan004
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpan004', Level.LEVEL1, async (done: Function) => {
      console.info('[testSpan004] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('fontColor');
      console.info("[testSpan004] component strJson:" + strJson);

      console.info("[testSpan004] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FFCCCCCC');
      done();
    });
    /**
     * @tc.name   testSpan005
     * @tc.number SUB_ACE_testSpan005
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpan005', Level.LEVEL1, async (done: Function) => {
      console.info('[testSpan005] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": '#FF000990'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 201,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan005] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testSpan005] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('fontColor');
      console.info("[testSpan005] component strJson:" + strJson);

      console.info("[testSpan005] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FF000990');
      done();
    });
    /**
     * @tc.name   testSpan006
     * @tc.number SUB_ACE_testSpan006
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpan006', Level.LEVEL1, async (done: Function) => {
      console.info('[testSpan006] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCaseValue": undefined!
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1029,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testSpan006] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('decoration');
      console.info("[testSpan006] component strJson:" + strJson);

      console.info("[testSpan006] textCase:" + JSON.parse(strJson));
      expect(JSON.parse(strJson).$attrs.textCase).assertEqual('TextCase.UpperCase');
      done();
    });
    /**
     * @tc.name   testSpan007
     * @tc.number SUB_ACE_testSpan007
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpan007', Level.LEVEL1, async (done: Function) => {
      console.info('[testSpan007] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCaseValue": -1
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1030,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan007] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testSpan007] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('decoration');
      console.info("[testSpan007] component strJson:" + strJson);

      console.info("[testSpan007] textCase:" + JSON.parse(strJson));
      expect(JSON.parse(strJson).$attrs.textCase).assertEqual('TextCase.UpperCase');
      done();
    });

  })
}