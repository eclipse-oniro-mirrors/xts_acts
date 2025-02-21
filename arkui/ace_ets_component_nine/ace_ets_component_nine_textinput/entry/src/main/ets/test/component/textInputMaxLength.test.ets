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

export default function textInputMaxLengthTest() {
  describe('textInputMaxLengthTest', function () {
    beforeEach(async function (done) {
      console.info("textInputMaxLengthTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputMaxLength',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputMaxLength state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputMaxLength pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputMaxLength page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputMaxLength page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputMaxLength beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputMaxLength after each called");
    })

 

    /**
     * @tc.number : textInputMaxLength0100
     * @tc.name   : Test the maxLength property of the textinput component
     * @tc.desc    : set the maxLength property value is  5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputMaxLength0100', 0, async function (done) {
      var tagName = 'textInputMaxLength0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "maxLength": 5
          }
        }
        var innerEvent = {
          eventId: 810,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_maxlength');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Textinput maxLength is: ' + JSON.stringify(obj.$attrs.maxLength));  
 
      expect(obj.$attrs.maxLength).assertEqual('5');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number : textInputMaxLength0200
     * @tc.name   : Test the maxLength property of the textinput component
     * @tc.desc    : set the maxLength property value is  0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputMaxLength0200', 0, async function (done) {
      var tagName = 'textInputMaxLength0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "maxLength": 0
          }
        }
        var innerEvent = {
          eventId: 811,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_maxlength');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Textinput maxLength is: ' + JSON.stringify(obj.$attrs.maxLength)); 
 
      expect(obj.$attrs.maxLength).assertEqual('0');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputMaxLength0300
     * @tc.name    Test the maxLength property of the textinput component
     * @tc.desc    set the maxLength property value is  -1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputMaxLength0300', 0, async function (done) {
      var tagName = 'textInputMaxLength0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "maxLength": -1
          }
        }
        var innerEvent = {
          eventId: 812,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_maxlength');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Textinput maxLength is: ' + JSON.stringify(obj.$attrs.maxLength)); 
 
      expect(obj.$attrs.maxLength).assertEqual('INF');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
