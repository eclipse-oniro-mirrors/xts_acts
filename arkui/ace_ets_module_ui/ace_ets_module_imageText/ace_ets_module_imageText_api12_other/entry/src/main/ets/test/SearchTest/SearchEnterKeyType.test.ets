/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function searchEnterKeyTypeTest() {
  describe('searchEnterKeyTypeTest',  ()=> {
    beforeEach(async (done: Function)=> {
      console.info("searchEnterKeyTypeTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchEnterKeyType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get searchEnterKeyType state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get searchEnterKeyType pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push searchEnterKeyType page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchEnterKeyType page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("searchEnterKeyType beforeEach end");
      done()
    });

    afterEach(async  ()=> {
      await Utils.sleep(1000);
      console.info("searchEnterKeyType after each called");
    }) 

    /**
     * @tc.number  searchEnterKeyType0100
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Go
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0100', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0100';
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
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Go');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  searchEnterKeyType0200
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Search
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0200', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0200';
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
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  searchEnterKeyType0300
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Send
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0300', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0300';
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
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Send');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  searchEnterKeyType0400
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Next
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0400', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0400';
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
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Next');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  searchEnterKeyType0500
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Done
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0500', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0500';
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
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 
    

    /**
     * @tc.number  searchEnterKeyType0600
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Done
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0600', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0600';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.PREVIOUS
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 815,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.PREVIOUS');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 

    /**
     * @tc.number  searchEnterKeyType0700
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is EnterKeyType.Done
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0700', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0700';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.NEW_LINE
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 816,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
 
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.NEW_LINE');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

            /**
     * @tc.number  searchEnterKeyType0800
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0800', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0800';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  undefined
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 817,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_search_enterkeytype');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  searchEnterKeyType0900
     * @tc.name    Test the EnterKeyType property of the search component
     * @tc.desc    set the EnterKeyType property value is default
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   1
     */
    it('searchEnterKeyType0900', Level.LEVEL1, async (done: Function) => {
      let tagName = 'searchEnterKeyType0900';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_search_enterkeytype_default');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.$attrs.enterKeyType));
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
