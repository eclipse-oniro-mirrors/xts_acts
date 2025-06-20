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
import Utils from '../Utils';

export default function GridColJsunit() {
  describe('gridColOffsetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gridCol beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/gridcolPage',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridCol state pages: " + JSON.stringify(pages));
        if (!("gridcolPage" == pages.name)) {
          console.info("get gridColstate pages.name: " + JSON.stringify(pages.name));
          result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push gridCol page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridCol page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gridcol after each called");
    })
    /**
     * @tc.number testGridColOffset01
     * @tc.name Test the gridColOffset property of the gridcol component
     * @tc.desc set the gridColOffset property value is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridColOffset01', Level.LEVEL1, async (done: Function) => {
      let tagName = 'testGridColOffset01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyoffset');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.gridColOffset));
      expect(obj.$type).assertEqual('GridCol');
      expect(obj.$attrs.gridColOffset).assertEqual("0");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "gridColOffsetNum": 1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyoffset');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));

      expect(objNew.$type).assertEqual('GridCol');
      expect(objNew.$attrs.gridColOffset).assertEqual("1");

      try {
        let eventData3: events_emitter.EventData = {
          data: {
            "gridColOffsetNum": 2,
          }
        }
        let innerEvent3: events_emitter.InnerEvent = {
          eventId: 182,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson3 = getInspectorByKey('keykeyoffset');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + JSON.stringify(strJson3));

      expect(obj3.$type).assertEqual('GridCol');
      expect(obj3.$attrs.gridColOffset).assertEqual("2");
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testGridColSpan02
     * @tc.name Test the span property of the gridcol component
     * @tc.desc set the span property value is 0 、1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridColSpan02', Level.LEVEL1, async (done: Function) => {
      let tagName = 'testGridColSpan02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.span));
      expect(obj.$type).assertEqual('GridCol');
      expect(obj.$attrs.span).assertEqual("1");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spanNum": 0,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));

      expect(objNew.$type).assertEqual('GridCol');
      expect(objNew.$attrs.span).assertEqual("1");

      try {
        let eventData3: events_emitter.EventData = {
          data: {
            "spanNum": 1,
          }
        }
        let innerEvent3: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit3');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson3 = getInspectorByKey('keykeyspan');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + JSON.stringify(strJson3));

      expect(obj3.$type).assertEqual('GridCol');
      expect(obj3.$attrs.span).assertEqual("2");
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testGridColOrder03
     * @tc.name Test the order property of the gridcol component
     * @tc.desc set the order property value is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridColOrder03', Level.LEVEL1, async (done: Function) => {
      let tagName = 'testGridColOrder03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJsonOrder1 = getInspectorByKey('keykeyorder1');
      let objOrder1: ESObject = JSON.parse(strJsonOrder1);
      console.info('[' + tagName + '] component objOrder1 is: ' + JSON.stringify(objOrder1.$attrs.order));
      expect(objOrder1.$type).assertEqual('GridCol');
      expect(objOrder1.$attrs.order).assertEqual("1");
      let strJsonOrder2 = getInspectorByKey('keykeyorder2');
      let objOrder2: ESObject = JSON.parse(strJsonOrder2);
      console.info('[' + tagName + '] component objOrder2 is: ' + JSON.stringify(objOrder2.$attrs.order));
      expect(objOrder2.$type).assertEqual('GridCol');
      expect(objOrder2.$attrs.order).assertEqual("2");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "orderNum": 1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNewOrder1 = getInspectorByKey('keykeyorder1');
      let objNewOrder1: ESObject = JSON.parse(strJsonNewOrder1);
      console.info('[' + tagName + '] component objNewOrder1 is: ' + JSON.stringify(objNewOrder1.$attrs.order));
      expect(objNewOrder1.$type).assertEqual('GridCol');
      expect(objNewOrder1.$attrs.order).assertEqual("2");
      let strJsonNewOrder2 = getInspectorByKey('keykeyorder2');
      let objNewOrder2: ESObject = JSON.parse(strJsonNewOrder2);
      console.info('[' + tagName + '] component objNewOrder2 is: ' + JSON.stringify(objNewOrder2.$attrs.order));
      expect(objNewOrder2.$type).assertEqual('GridCol');
      expect(objNewOrder2.$attrs.order).assertEqual("1");


      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
