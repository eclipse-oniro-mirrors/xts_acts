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

export default function textMaxFontSizeTest() {
  describe('textMaxFontSizeTest', function () {
    beforeEach(async function (done) {
      console.info("textMaxFontSizeTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textMaxFontSize',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textMaxFontSize state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textMaxFontSize pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textMaxFontSize page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textMaxFontSize page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textMaxFontSize beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textMaxFontSize after each called");
    }) 

    /**
     * @tc.number textMaxFontSize0100
     * @tc.name   Test the maxFontSize property of the text component
     * @tc.desc   set the maxFontSize property value is  21
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textMaxFontSize0100', 0, async function (done) {
      var tagName = 'textMaxFontSize0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "maxFontSize": 21
          }
        }
        var innerEvent = {
          eventId: 1070,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_maxFontSize');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text maxFontSize is: ' + JSON.stringify(obj.$attrs.maxFontSize));
 
 
      expect(obj.$attrs.maxFontSize).assertEqual('21.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textMaxFontSize0200
     * @tc.name   Test the maxFontSize property of the text component
     * @tc.desc   set the maxFontSize property value is  $r('app.float.maxFontSize') 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textMaxFontSize0200', 0, async function (done) {
      var tagName = 'textMaxFontSize0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "maxFontSize": 'app.float.maxFontSize' 
          }
        }
        var innerEvent = {
          eventId: 1071,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_maxFontSize');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text maxFontSize is: ' + JSON.stringify(obj.$attrs.maxFontSize));
 
 
      expect(obj.$attrs.maxFontSize).assertEqual('35.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

     /**
     * @tc.number textMaxFontSize0300
     * @tc.name   Test the maxFontSize property of the text component
     * @tc.desc   set the maxFontSize property value is  '14fp'
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
      it('textMaxFontSize0300', 0, async function (done) {
        var tagName = 'textMaxFontSize0300';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)    
          
        try {
          var eventData = {
            data: {
              "maxFontSize": '14fp'
            }
          }
          var innerEvent = {
            eventId: 1071,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
      
        let strJsonNew = getInspectorByKey('key_text_maxFontSize');
        let obj = JSON.parse(strJsonNew);
        console.info('[' + tagName + '] Text maxFontSize is: ' + JSON.stringify(obj.$attrs.maxFontSize));    
    
        expect(obj.$attrs.maxFontSize).assertEqual('14.00fp');
          
        console.info('[' + tagName + '] END ===========================');
        done();
      });

})
}
