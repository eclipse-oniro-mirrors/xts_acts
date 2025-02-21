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

export default function textBaseLineOffsetTest() {
  describe('textBaseLineOffsetTest', function () {
    beforeEach(async function (done) {
      console.info("textBaseLineOffset beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textBaseLineOffset',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textBaseLineOffset state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textBaseLineOffset pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textBaseLineOffset page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textBaseLineOffset page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textBaseLineOffset beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textBaseLineOffset after each called");
    })
 

    /**
     * @tc.number textBaseLineOffset0100
     * @tc.name   Test the textBaseLineOffset property of the text component
     * @tc.desc   set the textBaseLineOffset property value is  0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textBaseLineOffset0100', 0, async function (done) {
      var tagName = 'textBaseLineOffset0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "baselineOffset": 0
          }
        }
        var innerEvent = {
          eventId: 1060,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_baselineOffset');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text baselineOffset is: ' + JSON.stringify(obj.$attrs.baselineOffset));
 
      expect(obj.$attrs.baselineOffset).assertEqual('0');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textBaseLineOffset0200
     * @tc.name   Test the textBaseLineOffset property of the text component
     * @tc.desc   set the textBaseLineOffset property value is  30
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textBaseLineOffset0200', 0, async function (done) {
      var tagName = 'textBaseLineOffset0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "baselineOffset": 30
          }
        }
        var innerEvent = {
          eventId: 1061,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_baselineOffset');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text baselineOffset is: ' + JSON.stringify(obj.$attrs.baselineOffset));
 
      expect(obj.$attrs.baselineOffset).assertEqual('30');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textBaseLineOffset0300
     * @tc.name   Test the textBaseLineOffset property of the text component
     * @tc.desc   set the textBaseLineOffset property value is  '50'
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textBaseLineOffset0300', 0, async function (done) {
      var tagName = 'textBaseLineOffset0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "baselineOffset": '50'
          }
        }
        var innerEvent = {
          eventId: 1062,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_baselineOffset');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text baselineOffset is: ' + JSON.stringify(obj.$attrs.baselineOffset));
 
      expect(obj.$attrs.baselineOffset).assertEqual('50');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });      
})
}
