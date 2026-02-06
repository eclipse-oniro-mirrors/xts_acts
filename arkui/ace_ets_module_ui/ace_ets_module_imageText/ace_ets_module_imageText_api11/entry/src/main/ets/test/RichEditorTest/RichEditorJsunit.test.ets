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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it,expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function richEditorTest() {
  describe('richEditorTest',() => {
    beforeEach(async (done: Function) => {
      console.info("richEditor beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/richEditorPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditor state pages: " + JSON.stringify(pages));
        if (!("richEditorPage" == pages.name)) {
          console.info("get richEditor pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push richEditor page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditor page error: " + err);
      }
      done()
    });

    afterEach(async  () => {
      await Utils.sleep(1000);
      console.info("RichEditor after each called");
    })

   
    /**
     * @tc.number testRichEditorCopyOptions01
     * @tc.name   Test the CopyOptions property of the RichEditor component
     * @tc.desc   set the CopyOptions property value is  CopyOptions.None
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testRichEditorCopyOptions01', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testRichEditorCopyOptions01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": CopyOptions.None
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 301,
          priority: events_emitter.EventPriority.LOW
        }
        
        console.info('[' + tagName + '] send eventData is: '+ JSON.stringify(eventData));
        console.info('[' + tagName + '] start to publish emit');

        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('key_RichEditor');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component copyOption is: ' +  JSON.stringify(objNew.$attrs.copyOption));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.None");
     // expect(objNew.$type).assertEqual('RichEditor');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testRichEditorCopyOptions02
     * @tc.name   Test the CopyOptions property of the RichEditor component
     * @tc.desc   set the CopyOptions property value is  CopyOptions.InApp
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */     
    it('testRichEditorCopyOptions02', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testRichEditorCopyOptions02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": CopyOptions.InApp
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 302,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('key_RichEditor');
      let objNew:ESObject = JSON?.parse(strJsonNew);
      console.info('[' + tagName + '] component copyOption is: ' +  JSON.stringify(objNew.$attrs.copyOption));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.InApp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testRichEditorCopyOptions03
     * @tc.name   Test the CopyOptions property of the RichEditor component
     * @tc.desc   set the CopyOptions property value is  CopyOptions.LocalDevice
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */       
    it('testRichEditorCopyOptions03', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testRichEditorCopyOptions03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": CopyOptions.LocalDevice
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 303,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('key_RichEditor');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component copyOption is: ' +  JSON.stringify(objNew.$attrs.copyOption));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.Local");
     // expect(objNew.$type).assertEqual('RichEditor');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testRichEditorCopyOptions04
     * @tc.name   Test the CopyOptions property of the RichEditor component
     * @tc.desc   set the CopyOptions property value is  CopyOptions.CROSS_DEVICE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */      
    it('testRichEditorCopyOptions04', Level.LEVEL0, async (done: Function) => {
      let tagName = 'testRichEditorCopyOptions04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": CopyOptions.CROSS_DEVICE
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 304,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('key_RichEditor');
      let objNew:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component copyOption is: ' +  JSON.stringify(objNew.$attrs.copyOption));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.Distributed");
     // expect(objNew.$type).assertEqual('RichEditor');

      console.info('[' + tagName + '] END ===========================');
      done();
    });     
  })  
}
