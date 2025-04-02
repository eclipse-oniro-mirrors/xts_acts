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

export default function StackAlignContentTest() {
  describe('stackAlignContentTest', function () {
    beforeEach(async function (done) {
      console.info("StackAlignContent beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/stackAlignContentPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackAlignContent state pages: " + JSON.stringify(pages));
        if (!("stackAlignContentPage" == pages.name)) {
          console.info("get stackAlignContent state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push stackAlignContent page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackAlignContent page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("stackAlignContent after each called");
    })

    /**
     * @tc.number testStackAlignContent
     * @tc.name   Test the stackAlignContent property of the gridcol component
     * @tc.desc   set the stackAlignConten property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testStackAlignContent', 0, async function (done) {
      var tagName = 'testStackAlignContent';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyAlignContent');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignContent));
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual("Alignment.TopStart");

      try {
        var eventData = {
          data: {
            "alignContentValue": Alignment.Top
          }
        }
        var innerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyAlignContent');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      
      expect(objNew.$type).assertEqual('Stack');
      expect(objNew.$attrs.alignContent).assertEqual("Alignment.Top");

      try {
        var eventData2 = {
          data: {
            "alignContentValue": Alignment.TopEnd
          }
        }
        var innerEvent2 = {
          eventId: 182,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson2 = getInspectorByKey('keyAlignContent');
      let obj2 = JSON.parse(strJson2);
      console.info('[' + tagName + '] component strJson2 is: ' + JSON.stringify(strJson2));
      expect(obj2.$type).assertEqual('Stack');
      expect(obj2.$attrs.alignContent).assertEqual("Alignment.TopEnd");      

      try {
        var eventData3 = {
          data: {
            "alignContentValue": Alignment.Start
          }
        }
        var innerEvent3 = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson3 = getInspectorByKey('keyAlignContent');
      let obj3 = JSON.parse(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + JSON.stringify(strJson3));
      expect(obj3.$type).assertEqual('Stack');
      expect(obj3.$attrs.alignContent).assertEqual("Alignment.Start");

      try {
        var eventData4 = {
          data: {
            "alignContentValue": Alignment.Center
          }
        }
        var innerEvent4 = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent4, eventData4);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson4 = getInspectorByKey('keyAlignContent');
      let obj4 = JSON.parse(strJson4);
      console.info('[' + tagName + '] component strJson4 is: ' + JSON.stringify(strJson4));
      expect(obj4.$type).assertEqual('Stack');
      expect(obj4.$attrs.alignContent).assertEqual("Alignment.Center");

      try {
        var eventData5 = {
          data: {
            "alignContentValue": Alignment.End
          }
        }
        var innerEvent5 = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent5, eventData5);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson5 = getInspectorByKey('keyAlignContent');
      let obj5 = JSON.parse(strJson5);
      console.info('[' + tagName + '] component strJson5 is: ' + JSON.stringify(strJson5));
      expect(obj5.$type).assertEqual('Stack');
      expect(obj5.$attrs.alignContent).assertEqual("Alignment.End");
      
      try {
        var eventData6 = {
          data: {
            "alignContentValue": Alignment.BottomStart
          }
        }
        var innerEvent6 = {
          eventId: 186,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent6, eventData6);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson6 = getInspectorByKey('keyAlignContent');
      let obj6 = JSON.parse(strJson6);
      console.info('[' + tagName + '] component strJson6 is: ' + JSON.stringify(strJson6));
      expect(obj6.$type).assertEqual('Stack');
      expect(obj6.$attrs.alignContent).assertEqual("Alignment.BottomStart");             

      try {
        var eventData7 = {
          data: {
            "alignContentValue":Alignment.Bottom
          }
        }
        var innerEvent7 = {
          eventId: 187,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent7, eventData7);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson7 = getInspectorByKey('keyAlignContent');
      let obj7 = JSON.parse(strJson7);
      console.info('[' + tagName + '] component strJson7 is: ' + JSON.stringify(strJson7));
      expect(obj7.$type).assertEqual('Stack');
      expect(obj7.$attrs.alignContent).assertEqual("Alignment.Bottom");

       try {
        var eventData8 = {
          data: {
            "alignContentValue":Alignment.BottomEnd
          }
        }
        var innerEvent8 = {
          eventId: 188,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent8, eventData8);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson8 = getInspectorByKey('keyAlignContent');
      let obj8 = JSON.parse(strJson8);
      console.info('[' + tagName + '] component strJson8 is: ' + JSON.stringify(strJson8));
      expect(obj8.$type).assertEqual('Stack');
      expect(obj8.$attrs.alignContent).assertEqual("Alignment.BottomEnd");      

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
