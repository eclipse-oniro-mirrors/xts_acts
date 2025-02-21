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

export default function textIndentTest() {
  describe('textIndentTest', function () {
    beforeEach(async function (done) {
      console.info("textIndentTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textIndent',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textIndentTest state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textIndentTest pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textIndentTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textIndentTest page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textIndentTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textIndentTest after each called");
    })
 

    /**
     * @tc.number textIndent0100
     * @tc.name   Test the Indent property of the text component
     * @tc.desc   set the Indent property value is 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textIndent0100', 0, async function (done) {
      var tagName = 'textIndent0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "textIndent": 0
          }
        }
        var innerEvent = {
          eventId: 1011,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textIndent');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textIndent is: ' + JSON.stringify(obj.$attrs.textIndent));
 
      expect(obj.$attrs.lineHeight).assertEqual('0.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

     /**
     * @tc.number textIndent0200
     * @tc.name   Test the Indent property of the text component
     * @tc.desc   set the Indent property value is 4
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
      it('textIndent0200', 0, async function (done) {
        var tagName = 'textIndent0200';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)   
          
        try {
          var eventData = {
            data: {
              "textIndent": '4'
            }
          }
          var innerEvent = {
            eventId: 1011,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        await Utils.sleep(2000);
      
        let strJsonNew = getInspectorByKey('key_text_textIndent');
        let obj = JSON.parse(strJsonNew);
        console.info('[' + tagName + '] Text textIndent is: ' + JSON.stringify(obj.$attrs.textIndent));
    
        expect(obj.$attrs.lineHeight).assertEqual('4.00px');
          
        console.info('[' + tagName + '] END ===========================');
        done();
      });
})
}
