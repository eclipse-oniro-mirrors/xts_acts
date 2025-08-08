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
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function textTextCaseTest() {
  describe('textTextCaseTest',  ()=> {
    beforeEach(async (done: Function)=> {
      console.info("textTextCaseTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/text/textTextCase',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textTextCase state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textTextCase pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textTextCase page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textTextCase page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textTextCase beforeEach end");
      done()
    });

    afterEach(async ()=> {
      await Utils.sleep(1000);
      console.info("textTextCase after each called");
    }) 

    /**
     * @tc.number textTextCase0100
     * @tc.name   Test the textCase property of the text component
     * @tc.desc   set the textCase property value is  TextCase.Normal
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTextCase0100', 0,async (done: Function) => {
      let tagName = 'textTextCase0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCase": TextCase.Normal
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1030,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textCase');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textCase is: ' + JSON.stringify(obj.$attrs.textCase));
 
      expect(obj.$attrs.textCase).assertEqual('TextCase.Normal');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textTextCase0200
     * @tc.name   Test the textCase property of the text component
     * @tc.desc   set the textCase property value is  TextCase.LowerCase
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTextCase0200', 0,async (done: Function) => {
      let tagName = 'textTextCase0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCase": TextCase.LowerCase
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1031,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textCase');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textCase is: ' + JSON.stringify(obj.$attrs.textCase));
 
      expect(obj.$attrs.textCase).assertEqual('TextCase.LowerCase');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number textTextCase0300
     * @tc.name   Test the textCase property of the text component
     * @tc.desc   set the textCase property value is  TextCase.UpperCase
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTextCase0300', 0,async (done: Function) => {
      let tagName = 'textTextCase0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)  
        
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCase": TextCase.UpperCase
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1032,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textCase');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textCase is: ' + JSON.stringify(obj.$attrs.textCase));
  
      expect(obj.$attrs.textCase).assertEqual('TextCase.UpperCase');
        
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
