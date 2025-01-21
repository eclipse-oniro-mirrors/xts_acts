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

export default function textInputFontWeightTest() {
  describe('textInputFontWeightTest', function () {
    beforeEach(async function (done) {
      console.info("textInputFontWeightTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputFontWeight',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputFontWeight state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputFontWeight pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputFontWeight page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputFontWeight page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputFontWeight beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputFontSize after each called");
    })

 

    /**
     * @tc.number : textInputFontWeight0100
     * @tc.name   : Test the fontWeight property of the textinput component
     * @tc.desc    : set the fontWeight property value is  16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontWeight0100', 0, async function (done) {
      var tagName = 'textInputFontWeight0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": 100
          }
        }
        var innerEvent = {
          eventId: 940,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('100');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number : textInputFontWeight0200
     * @tc.name   : Test the fontWeight property of the textinput component
     * @tc.desc    : set the fontWeight property value is FontWeight.Normal 
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontWeight0200', 0, async function (done) {
      var tagName = 'textInputFontWeight0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": FontWeight.Normal 
          }
        }
        var innerEvent = {
          eventId: 941,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number : textInputFontWeight0300
     * @tc.name   : Test the fontWeight property of the textinput component
     * @tc.desc    : set the fontWeight property value is FontWeight. Lighter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontWeight0300', 0, async function (done) {
      var tagName = 'textInputFontWeight0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": FontWeight.Lighter 
          }
        }
        var innerEvent = {
          eventId: 942,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number : textInputFontWeight0400
     * @tc.name   : Test the fontWeight property of the textinput component
     * @tc.desc    : set the fontWeight property value is FontWeight. Regular
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontWeight0400', 0, async function (done) {
      var tagName = 'textInputFontWeight0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": FontWeight.Regular 
          }
        }
        var innerEvent = {
          eventId: 943,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Regular');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });    

    /**
     * @tc.number : textInputFontWeight0500
     * @tc.name   : Test the fontWeight property of the textinput component
     * @tc.desc    : set the fontWeight property value is FontWeight. Medium
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontWeight0500', 0, async function (done) {
      var tagName = 'textInputFontWeight0500';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": FontWeight.Medium 
          }
        }
        var innerEvent = {
          eventId: 944,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 

    /**
     * @tc.number : textInputFontWeight0600
     * @tc.name   : Test the fontWeight property of the textinput component
     * @tc.desc    : set the fontWeight property value is FontWeight. Bold
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontWeight0600', 0, async function (done) {
      var tagName = 'textInputFontWeight0600';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": FontWeight.Bold 
          }
        }
        var innerEvent = {
          eventId: 945,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputFontWeight0700
     * @tc.name    Test the fontWeight property of the textinput component
     * @tc.desc    set the fontWeight property value is FontWeight. Bolder
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputFontWeight0700', 0, async function (done) {
      var tagName = 'textInputFontWeight0700';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": FontWeight.Bolder 
          }
        }
        var innerEvent = {
          eventId: 946,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputFontWeight0800
     * @tc.name    Test the fontWeight property of the textinput component
     * @tc.desc    set the fontWeight property value is '1000'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputFontWeight0800', 0, async function (done) {
      var tagName = 'textInputFontWeight0800';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontWeight": '1000'
          }
        }
        var innerEvent = {
          eventId: 947,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontweight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontWeight is: ' + JSON.stringify(obj.$attrs.fontWeight));
 
 
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });    

})
}
