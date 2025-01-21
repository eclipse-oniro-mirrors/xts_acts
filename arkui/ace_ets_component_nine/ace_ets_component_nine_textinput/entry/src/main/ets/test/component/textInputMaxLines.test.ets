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

export default function textInputMaxLinesTest() {
  describe('textInputMaxLinesTest', function () {
    beforeEach(async function (done) {
      console.info("textInputMaxLinesTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputMaxLines',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputMaxLines state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputMaxLines pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputMaxLines page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputMaxLines page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputMaxLinesTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputMaxLines after each called");
    })

 

    /**
     * @tc.number  textInputMaxLines0100
     * @tc.name    Test the MaxLines property of the textinput component
     * @tc.desc    set the MaxLines property value is 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputMaxLines0100', 0, async function (done) {
      var tagName = 'textInputMaxLines0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "maxLines": 0
          }
        }
        var innerEvent = {
          eventId: 820,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_maxLines');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextInput maxLines is: ' + JSON.stringify(obj.$attrs.maxLines));
 
      expect(obj.$attrs.maxLines).assertEqual('3');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

     /**
     * @tc.number  textInputMaxLines0200
     * @tc.name    Test the MaxLines property of the textinput component
     * @tc.desc    set the MaxLines property value is 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputMaxLines0200', 0, async function (done) {
      var tagName = 'textInputMaxLines0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
  
        
      try {
        var eventData = {
          data: {
            "maxLines": 4
          }
        }
        var innerEvent = {
          eventId: 821,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_maxLines');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextInput maxLines is: ' + JSON.stringify(obj.$attrs.maxLines));
  
      expect(obj.$attrs.maxLines).assertEqual('4');
        
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputMaxLines0300
     * @tc.name    Test the MaxLines property of the textinput component
     * @tc.desc    set the MaxLines property value is -1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
      it('textInputMaxLines0300', 0, async function (done) {
      var tagName = 'textInputMaxLines0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
  
        
      try {
        var eventData = {
          data: {
            "maxLines": -1
          }
        }
        var innerEvent = {
          eventId: 822,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_maxLines');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextInput maxLines is: ' + JSON.stringify(obj.$attrs.maxLines));
      expect(obj.$attrs.maxLines).assertEqual('3');
        
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
