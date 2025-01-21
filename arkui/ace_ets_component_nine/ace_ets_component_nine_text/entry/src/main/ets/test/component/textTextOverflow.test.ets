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

export default function textTextOverflowTest() {
  describe('textTextOverflowTest', function () {
    beforeEach(async function (done) {
      console.info("textTextOverflowTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textTextOverflow',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textTextOverflow state pages: " + JSON.stringify(pages));
        if (!("textTextOverflow" == pages.name)) {
          console.info("get textTextOverflow pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textTextOverflow page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textTextOverflow page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textTextOverflow beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textTextOverflow after each called");
    }) 

    /**
     * @tc.number testTextTextOverflow0100
     * @tc.name   Test the textOverflow property of the text component
     * @tc.desc   set the textOverflow property value is TextOverflow.None
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextTextOverflow0100', 0, async function (done) {
      var tagName = 'testTextTextOverflow0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
      let value = { overflow:  TextOverflow.None };
      try {
        var eventData = {
          data: {
            "textOverflow": JSON.stringify( value )
          }
        }
        var innerEvent = {
          eventId: 311,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textOverflow is: ' + JSON.stringify(obj.$attrs.textOverflow));

      expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.None")
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testTextTextOverflow0200
     * @tc.name   Test the textOverflow property of the text component
     * @tc.desc   set the textOverflow property value is TextOverflow.Clip
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextTextOverflow0200', 0, async function (done) {
      var tagName = 'testTextTextOverflow0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
      let value = { overflow:  TextOverflow.Clip };
      try {
        var eventData = {
          data: {
            "textOverflow": JSON.stringify( value )
          }
        }
        var innerEvent = {
          eventId: 312,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textOverflow is: ' + JSON.stringify(obj.$attrs.textOverflow));

      expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Clip")
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

     /**
     * @tc.number testTextTextOverflow0300
     * @tc.name   Test the textOverflow property of the text component
     * @tc.desc   set the textOverflow property value is TextOverflow.Ellipsis
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
      it('testTextTextOverflow0300', 0, async function (done) {
        var tagName = 'testTextTextOverflow0300';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)
    
        let value = { overflow:  TextOverflow.Ellipsis };
        try {
          var eventData = {
            data: {
              "textOverflow": JSON.stringify( value )
            }
          }
          var innerEvent = {
            eventId: 313,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
      
        let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
        let obj = JSON.parse(strJsonNew);
        console.info('[' + tagName + '] Text textOverflow is: ' + JSON.stringify(obj.$attrs.textOverflow));
  
        expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Ellipsis")
          
        console.info('[' + tagName + '] END ===========================');
        done();
      });

     /**
     * @tc.number testTextTextOverflow0400
     * @tc.name   Test the textOverflow property of the text component
     * @tc.desc   set the textOverflow property value is TextOverflow.Marquee
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
      it('testTextTextOverflow0400', 0, async function (done) {
        var tagName = 'testTextTextOverflow0400';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)
    
        let value = { overflow:  TextOverflow.MARQUEE };
        try {
          var eventData = {
            data: {
              "textOverflow": JSON.stringify( value )
            }
          }
          var innerEvent = {
            eventId: 314,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
      
        let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
        let obj = JSON.parse(strJsonNew);
        console.info('[' + tagName + '] Text textOverflow is: ' + JSON.stringify(obj.$attrs.textOverflow));
  
        expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Marquee")
          
        console.info('[' + tagName + '] END ===========================');
        done();
      });

     /**
     * @tc.number testTextTextOverflow0500
     * @tc.name   Test the textOverflow property of the text component
     * @tc.desc   set the textOverflow property value is null
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
      it('testTextTextOverflow0500', 0, async function (done) {
        var tagName = 'testTextTextOverflow0500';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)
    
        let value = { overflow:  undefined };
        try {
          var eventData = {
            data: {
              "textOverflow": JSON.stringify( value )
            }
          }
          var innerEvent = {
            eventId: 315,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
      
        let strJsonNew = getInspectorByKey('key_Text_TextOverFlow');
        let obj = JSON.parse(strJsonNew);
        console.info('[' + tagName + '] Text textOverflow is: ' + JSON.stringify(obj.$attrs.textOverflow));
  
        expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.None")
          
        console.info('[' + tagName + '] END ===========================');
        done();
      });
})
}
