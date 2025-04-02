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

export default function textFontFamilyTest() {
  describe('textFontFamilyTest', function () {
    beforeEach(async function (done) {
      console.info("textFontFamilyTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textFontFamily',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textFontFamily state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textFontFamily pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textFontFamily page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textFontFamily page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textFontFamily beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textFont after each called");
    }) 

    /**
     * @tc.number textFontFamily0100
     * @tc.name   Test the fontFaimly property of the text component
     * @tc.desc   set the fontFamily property value is  ’HarmonyOS Sans’
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textFontFamily0100', 0, async function (done) {
      var tagName = 'textFontFamily0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "fontFamily": 'HarmonyOS Sans'
          }
        }
        var innerEvent = {
          eventId: 1075,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_fontFamily');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontFamily  obj is: ' + JSON.stringify(obj.$attrs));
 
      console.info('[' + tagName + '] Text fontFamily  fontFamily is: ' + JSON.stringify(obj.$attrs.fontFamily));
      console.info('[' + tagName + '] Text fontFamily is: ' + JSON.stringify(obj.$attrs.fontFamily)); 
 
      expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textFontFamily0200
     * @tc.name   Test the fontFaimly property of the text component
     * @tc.desc   set the fontFamily property value is  $r('app.string.font_family_regular' )
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textFontFamily0200', 0, async function (done) {
      var tagName = 'textFontFamily0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000) 
       
      try {
        var eventData = {
          data: {
            "fontFamily":  'app.string.font_family_regular' 
          }
        }
        var innerEvent = {
          eventId: 1075,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_fontFamily');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontFamily  obj is: ' + JSON.stringify(obj.$attrs));
 
      console.info('[' + tagName + '] Text fontFamily  fontFamily is: ' + JSON.stringify(obj.$attrs.fontFamily));
      console.info('[' + tagName + '] Text fontFamily is: ' + JSON.stringify(obj.$attrs.fontFamily)); 
 
      expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans SC-Regular');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });  
})
}
