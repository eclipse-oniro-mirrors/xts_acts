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

export default function textInputSelectedBackgroundColorTest() {
  describe('textInputSelectedBackgroundColorTest', function () {
    beforeEach(async function (done) {
      console.info("textInputSelectedBackgroundColorTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputSelectedBackgroundColor',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputSelectedBackgroundColor state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputSelectedBackgroundColor pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputSelectedBackgroundColor page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputSelectedBackgroundColor page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputSelectedBackgroundColorTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputSelectedBackgroundColorTest after each called");
    })

 

    /**
     * @tc.number  textInputSelectedBackgroundColor0100
     * @tc.name    Test the selectedBackgroundColor property of the textinput component
     * @tc.desc    set the selectedBackgroundColor property value is Color.Black
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputSelectedBackgroundColor0100', 0, async function (done) {
      var tagName = 'textInputSelectedBackgroundColor0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "selectedBackgroundColor":  Color.Black
          }
        }
        var innerEvent = {
          eventId: 910,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_selectedbackgroundcolor');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontColor is: ' + JSON.stringify(obj.$attrs.selectedBackgroundColor));
 
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#33000000');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

 
    /**
     * @tc.number  textInputSelectedBackgroundColor0200
     * @tc.name    Test the selectedBackgroundColor property of the textinput component
     * @tc.desc    set the selectedBackgroundColor property value is #D90013 from resource
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputSelectedBackgroundColor0200', 0, async function (done) {
      var tagName = 'textInputSelectedBackgroundColor0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        var eventData = {
          data: {
            "selectedBackgroundColor":  'app.color.color_D90013_red'
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
    
      let strJsonNew = getInspectorByKey('key_textinput_selectedbackgroundcolor');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontColor is: ' + JSON.stringify(obj.$attrs.selectedBackgroundColor));
 
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#33D90013');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
