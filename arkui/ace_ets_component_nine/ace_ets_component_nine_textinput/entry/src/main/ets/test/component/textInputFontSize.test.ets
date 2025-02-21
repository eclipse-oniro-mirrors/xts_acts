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

export default function textInputFontSizeTest() {
  describe('textInputFontSizeTest', function () {
    beforeEach(async function (done) {
      console.info("textInputFontSizeTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputFontSize',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputFontSize state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputFontSize pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputFontSize page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputFontSize page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputFontSize beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputFontSize after each called");
    })

 

    /**
     * @tc.number  textInputFontSize0100
     * @tc.name    Test the fontSize property of the textinput component
     * @tc.desc    set the fontSize property value is  16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontSize0100', 0, async function (done) {
      var tagName = 'textInputFontSize0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontSize": 16
          }
        }
        var innerEvent = {
          eventId: 920,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontsize');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontSize is: ' + JSON.stringify(obj.$attrs.fontSize));
 
 
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputFontSize0200
     * @tc.name    Test the fontSize property of the textinput component
     * @tc.desc    set the fontSize property value is $r('app.float.font_size') 
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontSize0200', 0, async function (done) {
      var tagName = 'textInputFontSize0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontSize": 'app.float.font_size' 
          }
        }
        var innerEvent = {
          eventId: 921,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontsize');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontSize is: ' + JSON.stringify(obj.$attrs.fontSize));
 
 
      expect(obj.$attrs.fontSize).assertEqual('12.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

     /**
     * @tc.number  textInputFontSize0300
     * @tc.name    Test the fontSize property of the textinput component
     * @tc.desc    set the fontSize property value is '9fp'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
     it('textInputFontSize0300', 0, async function (done) {
      var tagName = 'textInputFontSize0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "fontSize": '9fp'
          }
        }
        var innerEvent = {
          eventId: 922,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontsize');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontSize is: ' + JSON.stringify(obj.$attrs.fontSize));
 
 
      expect(obj.$attrs.fontSize).assertEqual('9.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
