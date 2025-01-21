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

export default function textLineHeightTest() {
  describe('textLineHeightTest', function () {
    beforeEach(async function (done) {
      console.info("textLineHeightTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textLineHeight',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textLineHeightTest state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textLineHeightTest pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textLineHeightTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textLineHeightTest page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textLineHeightTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textLineHeightTest after each called");
    }) 

    /**
     * @tc.number testTextLineHeight0100
     * @tc.name   Test the LineHeight property of the text component
     * @tc.desc   set the LineHeight property value is 20
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextLineHeight0100', 0, async function (done) {
      var tagName = 'testTextLineHeight0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "lineHeight": 20
          }
        }
        var innerEvent = {
          eventId: 510,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_lineHeight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text LineHeight is: ' + JSON.stringify(obj.$attrs.lineHeight));
 
      expect(obj.$attrs.lineHeight).assertEqual('20.00fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testTextLineHeight0200
     * @tc.name   Test the LineHeight property of the text component
     * @tc.desc   set the LineHeight property value is 30.1fp
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextLineHeight0200', 0, async function (done) {
      var tagName = 'testTextLineHeight0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "lineHeight": "30.1fp"
          }
        }
        var innerEvent = {
          eventId: 511,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_lineHeight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text LineHeight is: ' + JSON.stringify(obj.$attrs.lineHeight));
 
      expect(obj.$attrs.lineHeight).assertEqual('30.10fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testTextLineHeight0300
     * @tc.name   Test the LineHeight property of the text component
     * @tc.desc   set the LineHeight property value is  $r('app.float.textLineHeight')
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextLineHeight0300', 0, async function (done) {
      var tagName = 'testTextLineHeight0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "lineHeight":  'app.float.textLineHeight' 
          }
        }
        var innerEvent = {
          eventId: 511,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_lineHeight');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text LineHeight is: ' + JSON.stringify(obj.$attrs.lineHeight));
 
      expect(obj.$attrs.lineHeight).assertEqual('25.50fp');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });    
})
}
