// @ts-nocheck
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
import Utils from '../Utils';

export default function PatternLockJsunit() {
  describe('patternLockTest', function () {
    beforeEach(async function (done) {
      console.info("patternLock beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/patternLockPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get patternLock state pages: " + JSON.stringify(pages));
        if (!("patternLockPage" == pages.name)) {
          console.info("get patternLock pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push patternLock page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push patternLock page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("patternLock after each called");
    })
    /**
     * @tc.number testPatternLockActiveColor
     * @tc.name   Test the PatternLockActiveColor property of the PatternLock component
     * @tc.desc   set the PatternLockActiveColor property value is Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testPatternLockActiveColor', 0, async function (done) {
      var tagName = 'testPatternLockActiveColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.activeColor).assertEqual("#FFB0C4DE");

      try {
        var eventData = {
          data: {
            "activeColorValue": Color.Orange
          }
        }
        var innerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      expect(objNew.$attrs.activeColor).assertEqual("#FFFFA500");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testPatternLockAutoReset
     * @tc.name   Test the PatternLockAutoReset property of the PatternLock component
     * @tc.desc   set the PatternLockAutoReset property value is boolen
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testPatternLockAutoReset', 0, async function (done) {
      var tagName = 'testPatternLockAutoReset';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.autoReset).assertEqual("false");

      try {
        var eventData = {
          data: {
            "autoResetValue": true,
          }
        }
        var innerEvent = {
          eventId: 6802,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      expect(objNew.$attrs.autoReset).assertEqual("true");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testPatternLockCircleRadius
     * @tc.name   Test the PatternLockCircleRadius property of the PatternLock component
     * @tc.desc   set the PatternLockCircleRadius property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testPatternLockCircleRadius', 0, async function (done) {
      var tagName = 'testPatternLockCircleRadius';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.circleRadius).assertEqual("6.00vp");

      try {
        var eventData = {
          data: {
            "circleRadiusValue": 20,
          }
        }
        var innerEvent = {
          eventId: 6803,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      
      expect(objNew.$attrs.circleRadius).assertEqual("20.00vp");

      try {
        var eventData2 = {
          data: {
            "circleRadiusValue": 10
          }
        }
        var innerEvent2 = {
          eventId: 6804,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = getInspectorByKey('keyPatternLock');
      let objNew2 = JSON.parse(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);
      expect(objNew2.$attrs.circleRadius).assertEqual("10.00vp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testPatternLockPathColor
     * @tc.name   Test the PatternLockPathColor property of the PatternLock component
     * @tc.desc   set the testPatternLockPathColor property value is Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testPatternLockPathColor', 0, async function (done) {
      var tagName = 'testPatternLockPathColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.pathColor).assertEqual("#FF182431");

      try {
        var eventData = {
          data: {
            "pathColorValue": Color.Orange
          }
        }
        var innerEvent = {
          eventId: 6805,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      expect(objNew.$attrs.pathColor).assertEqual("#FFFFA500");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testPatternLockStrokeWidth
     * @tc.name   Test the PatternLockStrokeWidth property of the PatternLock component
     * @tc.desc   set the PatternLockStrokeWidth property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testPatternLockStrokeWidth', 0, async function (done) {
      var tagName = 'testPatternLockStrokeWidth';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.pathStrokeWidth).assertEqual("12.00vp");

      try {
        var eventData = {
          data: {
            "pathStrokeWidthValue": 18,
          }
        }
        var innerEvent = {
          eventId: 6806,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      expect(objNew.$attrs.pathStrokeWidth).assertEqual("18.00vp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number PatternLockRegularColor
     * @tc.name   Test the PatternLockRegularColor property of the PatternLock component
     * @tc.desc   set the PatternLockRegularColor property value is Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */   
    it('testPatternLockRegularColor', 0, async function (done) {
      var tagName = 'testPatternLockRegularColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.regularColor).assertEqual("#FF182431");

      try {
        var eventData = {
          data: {
            "regularColorValue": Color.Orange,
          }
        }
        var innerEvent = {
          eventId: 6807,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      expect(objNew.$attrs.regularColor).assertEqual("#FFFFA500");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number testPatternLockSelectedColor
     * @tc.name   Test the PatternLockSelectedColor property of the PatternLock component
     * @tc.desc   set the PatternLockSelectedColor property value is Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */   
    it('testPatternLockSelectedColor', 0, async function (done) {
      var tagName = 'testPatternLockSelectedColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.selectedColor).assertEqual('#FF182431');

      try {
        var eventData = {
          data: {
            "selectedColorValue": Color.Orange
          }
        }
        var innerEvent = {
          eventId: 6808,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      expect(objNew.$attrs.selectedColor).assertEqual("#FFFFA500");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number testPatternLockSideLength
     * @tc.name   Test the PatternLockSideLength property of the PatternLock component
     * @tc.desc   set the PatternLockSideLength property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */   
    it('testPatternLockSideLength', 0, async function (done) {
      var tagName = 'testPatternLockSideLength';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyPatternLock');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.sideLength).assertEqual("288.00vp");
      try {
        var eventData = {
          data: {
            "sideLengthValue": 100
          }
        }
        var innerEvent = {
          eventId: 6809,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyPatternLock');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      expect(objNew.$attrs.sideLength).assertEqual("100.00vp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
