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

export default function textLetterSpacingTest() {
  describe('textLetterSpacingTest', function () {
    beforeEach(async function (done) {
      console.info("textLetterSpacingTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textLetterSpacing',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textLetterSpacingTest state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textLetterSpacingTest pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textLetterSpacingTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textLetterSpacingTest page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textLetterSpacingTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textLetterSpacingTest after each called");
    })
 

    /**
     * @tc.number textLetterSpacing0100
     * @tc.name   Test the LetterSpacing property of the text component
     * @tc.desc   set the LetterSpacing property value is 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textLetterSpacing0100', 0, async function (done) {
      var tagName = 'textLetterSpacing0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "letterSpacing": 0
          }
        }
        var innerEvent = {
          eventId: 911,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_letterSpacing');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text letterSpacing is: ' + JSON.stringify(obj.$attrs.letterSpacing));
 
      expect(obj.$attrs.letterSpacing).assertEqual('0.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textLetterSpacing0200
     * @tc.name   Test the LetterSpacing property of the text component
     * @tc.desc   set the LetterSpacing property value is -1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textLetterSpacing0200', 0, async function (done) {
      var tagName = 'textLetterSpacing0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "letterSpacing": -1
          }
        }
        var innerEvent = {
          eventId: 912,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_letterSpacing');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text letterSpacing is: ' + JSON.stringify(obj.$attrs.letterSpacing));
 
      expect(obj.$attrs.letterSpacing).assertEqual('-1.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 


    /**
     * @tc.number textLetterSpacing0300
     * @tc.name   Test the LetterSpacing property of the text component
     * @tc.desc   set the LetterSpacing property value is 5.6
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textLetterSpacing0300', 0, async function (done) {
      var tagName = 'textLetterSpacing0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "letterSpacing": '5.6'
          }
        }
        var innerEvent = {
          eventId: 913,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_letterSpacing');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text letterSpacing is: ' + JSON.stringify(obj.$attrs.letterSpacing));
 
      expect(obj.$attrs.letterSpacing).assertEqual('5.60fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 
})
}
