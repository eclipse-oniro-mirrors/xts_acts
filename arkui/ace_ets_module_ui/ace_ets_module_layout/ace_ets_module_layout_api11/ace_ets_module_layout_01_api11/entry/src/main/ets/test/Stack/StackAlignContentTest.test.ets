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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils2';

interface optionsObj {
  uri: string
}
interface eventDataObj {
  data : dataObj
}
interface dataObj {
  alignContentValue : Alignment
}
interface innerEventObj {
  eventId: number
  priority : events_emitter.EventPriority
}

export default function StackAlignContentTest() {
  describe('StackAlignContentTest',  () => {
    beforeEach(async (done: Function) => {
      console.info("StackAlignContent beforeEach start");
      let options:optionsObj = {
        uri: 'MainAbility/pages/Stack/stackAlignContentPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackAlignContent state pages: " + JSON.stringify(pages));
        if (!("stackAlignContentPage" == pages.name)) {
          console.info("get stackAlignContent state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push stackAlignContent page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackAlignContent page error: " + err);
      }
      done()
    });

    afterEach(async () => {
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
    it('testStackAlignContent', 0, async (done: Function) => {
      let tagName = 'testStackAlignContent';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyAlignContent');
      let obj : ESObject  = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.alignContent));
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual("Alignment.TopStart");

      try {
        let eventData : eventDataObj = {
          data: {
            "alignContentValue": Alignment.Top
          }
        }
        let innerEvent : innerEventObj = {
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
      let objNew: ESObject  = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      
      expect(objNew.$type).assertEqual('Stack');
      expect(objNew.$attrs.alignContent).assertEqual("Alignment.Top");

      try {
        let eventData2 : eventDataObj = {
          data: {
            "alignContentValue": Alignment.TopEnd
          }
        }
        let innerEvent2 : innerEventObj = {
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
      let obj2 : ESObject = JSON.parse(strJson2);
      console.info('[' + tagName + '] component strJson2 is: ' + JSON.stringify(strJson2));
      expect(obj2.$type).assertEqual('Stack');
      expect(obj2.$attrs.alignContent).assertEqual("Alignment.TopEnd");      

      try {
        let eventData3 : eventDataObj = {
          data: {
            "alignContentValue": Alignment.Start
          }
        }
        let innerEvent3 : innerEventObj = {
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
      let obj3: ESObject  = JSON.parse(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + JSON.stringify(strJson3));
      expect(obj3.$type).assertEqual('Stack');
      expect(obj3.$attrs.alignContent).assertEqual("Alignment.Start");

      try {
        let eventData4 : eventDataObj = {
          data: {
            "alignContentValue": Alignment.Center
          }
        }
        let innerEvent4 : innerEventObj = {
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
      let obj4 : ESObject = JSON.parse(strJson4);
      console.info('[' + tagName + '] component strJson4 is: ' + JSON.stringify(strJson4));
      expect(obj4.$type).assertEqual('Stack');
      expect(obj4.$attrs.alignContent).assertEqual("Alignment.Center");

      try {
        let eventData5 : eventDataObj = {
          data: {
            "alignContentValue": Alignment.End
          }
        }
        let innerEvent5 : innerEventObj = {
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
      let obj5: ESObject  = JSON.parse(strJson5);
      console.info('[' + tagName + '] component strJson5 is: ' + JSON.stringify(strJson5));
      expect(obj5.$type).assertEqual('Stack');
      expect(obj5.$attrs.alignContent).assertEqual("Alignment.End");
      
      try {
        let eventData6 : eventDataObj = {
          data: {
            "alignContentValue": Alignment.BottomStart
          }
        }
        let innerEvent6 : innerEventObj = {
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
      let obj6 : ESObject = JSON.parse(strJson6);
      console.info('[' + tagName + '] component strJson6 is: ' + JSON.stringify(strJson6));
      expect(obj6.$type).assertEqual('Stack');
      expect(obj6.$attrs.alignContent).assertEqual("Alignment.BottomStart");             

      try {
        let eventData7 : eventDataObj = {
          data: {
            "alignContentValue":Alignment.Bottom
          }
        }
        let innerEvent7 : innerEventObj = {
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
      let obj7 : ESObject = JSON.parse(strJson7);
      console.info('[' + tagName + '] component strJson7 is: ' + JSON.stringify(strJson7));
      expect(obj7.$type).assertEqual('Stack');
      expect(obj7.$attrs.alignContent).assertEqual("Alignment.Bottom");

       try {
        let eventData8 : eventDataObj = {
          data: {
            "alignContentValue":Alignment.BottomEnd
          }
        }
        let innerEvent8 : innerEventObj = {
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
      let obj8 : ESObject = JSON.parse(strJson8);
      console.info('[' + tagName + '] component strJson8 is: ' + JSON.stringify(strJson8));
      expect(obj8.$type).assertEqual('Stack');
      expect(obj8.$attrs.alignContent).assertEqual("Alignment.BottomEnd");      

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
