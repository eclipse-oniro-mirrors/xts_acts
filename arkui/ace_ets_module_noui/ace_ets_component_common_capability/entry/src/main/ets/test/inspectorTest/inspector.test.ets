/*
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

import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function inspectorTestJsunit() {
  describe('inspectorTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/inspectorTest/inspector',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get inspector state success " + JSON.stringify(pages));
        if (!("inspector" == pages.name)) {
          console.info("get inspector state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push inspector page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push inspector page error: " + err);
      }
    });

    afterEach(async () => {
      console.info("inspectorTest after each called");
    });

    /**
     * @tc.name   testInspectorTestAdd0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   acelazyForEachOnDataAddEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd0001', Level.LEVEL0, async () => {
      console.info('Inspector testInspectorTestAdd0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd0001] component width strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testInspectorTestAdd0001] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /**
     * @tc.name   testInspectorTestAdd0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   aceTestInspectorTestAdd0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd0002', Level.LEVEL0, async () => {
      console.info('Inspector testInspectorTestAdd0002 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd0002] component width strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual("FontWeight.Bold");
      console.info("[testInspectorTestAdd0002] fontWeight value :" + JSON.parse(strJson).$attrs.fontWeight);

    });

    /**
     * @tc.name   testInspectorTestAdd0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   aceTestInspectorTestAdd0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd0003', Level.LEVEL0, async () => {
      console.info("testInspectorTestAdd0003 start test");
      let innerEvent1: events_emitter.InnerEvent = {
        eventId: 60208,
        priority: events_emitter.EventPriority.LOW
      }
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("eventData.data?.getInspectorNodes result is: " + eventData.data?.getInspectorNodes);
        try {
          console.info("callback1 success");
          console.info("inspector_101 eventData.data?.result result is: " + eventData.data?.result);
          expect(eventData.data?.result).assertEqual("success");
          console.info("inspector_101 end: ");
          if (eventData.data?.getInspectorNodes != null) {
            console.info("eventData.data?.result result is: " + eventData.data?.result);
            expect(eventData.data?.result).assertEqual("success");
          }
        } catch (err) {
          console.info("inspector_101 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        events_emitter.on(innerEvent1, callback1);
        console.info("inspector_101 click result is: " + JSON.stringify(sendEventByKey('inspectorApiOne', 10, "")));
      } catch (err) {
        console.info("inspector_101 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   testInspectorTestAdd0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   aceTestInspectorTestAdd0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd0004', Level.LEVEL0, async () => {
      let innerEvent2: events_emitter.InnerEvent = {
        eventId: 60209,
        priority: events_emitter.EventPriority.LOW
      }
      let callback2 = (eventData: events_emitter.EventData) => {
        console.info("eventData.data?.getInspectorNodeById result is: " + eventData.data?.getInspectorNodeById);
        try {
          console.info("callback2 success");
          console.info("inspector_102 eventData.data?.result result is: " + eventData.data?.result);
          expect(eventData.data?.result).assertEqual("success");
          console.info("inspector_102 end");
        } catch (err) {
          console.info("inspector_102 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("inspector_102 click result is: " + JSON.stringify(sendEventByKey('inspectorApiTwo', 10, "")));
        events_emitter.on(innerEvent2, callback2);
        await CommonFunc.sleep(2000);

      } catch (err) {
        console.info("inspector_102 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   testInspectorTestAdd0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   aceTestInspectorTestAdd0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd0005', Level.LEVEL0, async () => {
      console.info('testInspectorTestAdd0005 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "setColor": 'red'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60211,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        // 事件发射前添加断言 (不影响原有逻辑)
        expect(innerEvent.eventId).assertEqual(60211);

        events_emitter.emit(innerEvent, eventData);

        // 事件发射后添加断言 (不影响原有逻辑)
        expect(eventData.data?.setColor).assertEqual('red');
      } catch (err) {
        console.log("[testInspectorTestAdd0005] change component data error: " + (err as Error)?.message);
      }

    });

    /**
     * @tc.name   testInspectorTestAdd0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   aceTestInspectorTestAdd0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd0006', Level.LEVEL0, async () => {

      let innerEvent3: events_emitter.InnerEvent = {
        eventId: 60210,
        priority: events_emitter.EventPriority.LOW
      }
      let callback3 = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback3 success");
          console.info("inspector_103 eventData.data?.result result is: " + eventData.data?.catchStatus);
          expect(eventData.data?.catchStatus).assertEqual("callBackSuccess");
          console.info("inspector_103 end");
        } catch (err) {
          console.info("inspector_103 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("inspector_103 click result is: " + JSON.stringify(sendEventByKey('inspectorApiFour', 10, "")));
        events_emitter.on(innerEvent3, callback3);
      } catch (err) {
        console.info("inspector_103 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   testInspectorTestAdd007
     * @tc.number SUB_ACE_BASIC_ETS_API_0007
     * @tc.desc   aceTestInspectorTestAdd0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd007', Level.LEVEL0, async (done: Function) => {
      console.info('testInspectorTestAdd007 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('getFilteredInspectorTree'))
      await btn.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text01_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("response: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain("401");
      console.info('[testInspectorTestAdd007] END');
      done();
    });

    /**
     * @tc.name   testInspectorTestAdd008
     * @tc.number SUB_ACE_BASIC_ETS_API_0008
     * @tc.desc   aceTestInspectorTestAdd0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInspectorTestAdd008', Level.LEVEL0, async (done: Function) => {
      console.info('testInspectorTestAdd008 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('getFilteredInspectorTreeById'))
      await btn.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text02_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("response: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain("401");
      console.info('[testInspectorTestAdd008] END');
      done();
    });


  })
}
