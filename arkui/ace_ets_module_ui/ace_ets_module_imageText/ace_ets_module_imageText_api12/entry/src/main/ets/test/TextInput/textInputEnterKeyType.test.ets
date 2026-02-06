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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function textInputEnterKeyTypeTest() {
  describe('textInputEnterKeyTypeTest',  ()=> {
    beforeEach(async (done: Function)=> {
      console.info("textInputEnterKeyTypeTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInputEnterKeyType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputEnterKeyType state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputEnterKeyType pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputEnterKeyType page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputEnterKeyType page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputEnterKeyType beforeEach end");
      done()
    });

    afterEach(async  ()=> {
      await Utils.sleep(1000);
      console.info("textInputEnterKeyType after each called");
    }) 

    /**
     * @tc.number  textInputEnterKeyType0100
     * @tc.name    Test the EnterKeyType property of the textinput component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Go
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputEnterKeyType0100',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputEnterKeyType0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Go
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 810,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Go');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputEnterKeyType0200
     * @tc.name    Test the EnterKeyType property of the textinput component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Search
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputEnterKeyType0200',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputEnterKeyType0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Search
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 811,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputEnterKeyType0300
     * @tc.name    Test the EnterKeyType property of the textinput component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Send
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputEnterKeyType0300',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputEnterKeyType0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Send
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 812,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Send');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputEnterKeyType0400
     * @tc.name    Test the EnterKeyType property of the textinput component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Next
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputEnterKeyType0400',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputEnterKeyType0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Next
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 813,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Next');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputEnterKeyType0500
     * @tc.name    Test the EnterKeyType property of the textinput component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Done
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputEnterKeyType0500',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputEnterKeyType0500';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Done
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 814,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 
    
})
}
