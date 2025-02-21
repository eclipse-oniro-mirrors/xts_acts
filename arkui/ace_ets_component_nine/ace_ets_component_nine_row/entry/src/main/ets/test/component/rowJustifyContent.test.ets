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

export default function rowJustifyContentTest() {
  describe('justifyContentTest', function () {
    beforeEach(async function (done) {
      console.info("JustifyContent beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/rowJustifyContent',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get JustifyContent state pages: " + JSON.stringify(pages));
        if (!("RowJustifyContent" == pages.name)) {
          console.info("get RowJustifyContent pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push RowJustifyContent page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowJustifyContent page error: " + err);
      }
      await Utils.sleep(1000)
      console.info("Row_JustifyContent beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("JustifyContent after each called");
    })  

    /**
     * @tc.number ROW_RowJustifyContent_10010
     * @tc.name   testRowJustifyContentFlexAlignStart
     * @tc.desc   The JustifyContent property of the ROW component is set to FlexAlign.Start
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */    
    it('testRowJustifyContentFlexAlignStart', 0, async function (done) {
      var tagName = 'testRowJustifyContentFlexAlignStart';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "justifyContent": FlexAlign.Start,
          }
        }
        var innerEvent = {
          eventId: 211,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);


      let strJson = getInspectorByKey('key_row_JustifyContent');
      let obj = JSON.parse(strJson);
      
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.justifyContent));
      console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.justifyContent).assertEqual("FlexAlign.Start");     
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

 
    /**
     * @tc.number ROW_RowJustifyContent_10020
     * @tc.name   testRowJustifyContentFlexAlignCenter
     * @tc.desc   The JustifyContent property of the ROW component is set to FlexAlign.Center
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0     
     */
    it('testRowJustifyContentFlexAlignCenter', 0, async function (done) {
      var tagName = 'testRowJustifyContentFlexAlignCenter';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "justifyContent": FlexAlign.Center,
          }
        }
        var innerEvent = {
          eventId: 212,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);


      let strJson = getInspectorByKey('key_row_JustifyContent');
      let obj = JSON.parse(strJson);
      
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.justifyContent));
      console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.justifyContent).assertEqual("FlexAlign.Center");          
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number ROW_RowJustifyContent_10030
     * @tc.name   testRowJustifyContentFlexAlignEnd
     * @tc.desc   The JustifyContent property of the ROW component is set to FlexAlign.End
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0       
     */

    it('testRowJustifyContentFlexAlignEnd', 0, async function (done) {
        var tagName = 'testRowJustifyContentFlexAlignEnd';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)
  
        try {
          var eventData = {
            data: {
              "justifyContent": FlexAlign.End,
            }
          }
          var innerEvent = {
            eventId: 213,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
  
  
        let strJson = getInspectorByKey('key_row_JustifyContent');
        let obj = JSON.parse(strJson);
        
        console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.justifyContent));
        console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));

        expect(obj.$attrs.justifyContent).assertEqual("FlexAlign.End");
           
        console.info('[' + tagName + '] END ===========================');
        done();
    });


    /**
     * @tc.number ROW_RowJustifyContent_10040
     * @tc.name   testRowJustifyContentFlexAlignSpaceBetween
     * @tc.desc   The JustifyContent property of the ROW component is set to FlexAlign.SpaceBetween
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0  
     */

    it('testRowJustifyContentFlexAlignSpaceBetween', 0, async function (done) {
        var tagName = 'testRowJustifyContentFlexAlignSpaceBetween';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)
  
        try {
          var eventData = {
            data: {
              "justifyContent": FlexAlign.SpaceBetween,
            }
          }
          var innerEvent = {
            eventId: 214,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
  
  
        let strJson = getInspectorByKey('key_row_JustifyContent');
        let obj = JSON.parse(strJson);
        
        console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.justifyContent));
        console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs)); 
  
        expect(obj.$attrs.justifyContent).assertEqual("FlexAlign.SpaceBetween");      
       
        console.info('[' + tagName + '] END ===========================');
        done();
    });

    /**
     * @tc.number ROW_RowJustifyContent_10050
     * @tc.name   testRowJustifyContentFlexAlignSpaceAround
     * @tc.desc   The JustifyContent property of the ROW component is set to FlexAlign.SpaceAround
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0  
     */

    it('testRowJustifyContentFlexAlignSpaceAround', 0, async function (done) {
      var tagName = 'testRowJustifyContentFlexAlignSpaceAround';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        var eventData = {
          data: {
            "justifyContent": FlexAlign.SpaceAround,
          }
        }
        var innerEvent = {
          eventId: 215,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);


      let strJson = getInspectorByKey('key_row_JustifyContent');
      let obj = JSON.parse(strJson);
      
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.justifyContent));
      console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));      

      expect(obj.$attrs.justifyContent).assertEqual("FlexAlign.SpaceAround");   
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number ROW_RowJustifyContent_10060
     * @tc.name   testRowJustifyContentFlexAlignSpaceEvenly
     * @tc.desc   The JustifyContent property of the ROW component is set to FlexAlign.SpaceEvenly
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0  
     */
    it('testRowJustifyContentFlexAlignSpaceEvenly', 0, async function (done) {

        var tagName = 'testRowJustifyContentFlexAlignSpaceEvenly';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)
  
        try {
          var eventData = {
            data: {
              "justifyContent": FlexAlign.SpaceEvenly,
            }
          }
          var innerEvent = {
            eventId: 215,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
  
  
        let strJson = getInspectorByKey('key_row_JustifyContent');
        let obj = JSON.parse(strJson);
        
        console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.justifyContent));
        console.info('Row obj.$attrs is:' + JSON.stringify(obj.$attrs));      
  
        expect(obj.$attrs.justifyContent).assertEqual("FlexAlign.SpaceEvenly");   
       
        console.info('[' + tagName + '] END ===========================');
        done();
    });
  })
}
