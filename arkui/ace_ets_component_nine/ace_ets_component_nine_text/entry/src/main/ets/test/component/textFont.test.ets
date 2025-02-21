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

export default function textFontTest() {
  describe('textFontTest', function () {
    beforeEach(async function (done) {
      console.info("textFontTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textFont',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textFont state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textFont pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textFont page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textFont page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textFont beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textFont after each called");
    }) 

    /**
     * @tc.number textFontCase0100
     * @tc.name   Test the font property of the text component
     * @tc.desc   set the font property value is  undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textFontCase0100', 0, async function (done) {
      var tagName = 'textFontCase0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
       
      try {
        var eventData = {
          data: {
            "font": undefined
          }
        }
        var innerEvent = {
          eventId: 1050,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_font');
      let obj = JSON.parse(strJsonNew);

      let fontAttrsJson = obj.$attrs.font;
      console.info('[' + tagName + '] Text textCase font is: ' + fontAttrsJson);
      
      let fontObj = JSON.parse(fontAttrsJson)  

      console.info('fontObj.style :' + fontObj.style)
      console.info('fontObj.size :' + fontObj.size)
      console.info('fontObj.weight :' + fontObj.weight)
      console.info('fontObj.family :' + fontObj.family)
            
      expect(fontObj.style).assertEqual('FontStyle.Normal');
      expect(fontObj.size).assertEqual('16.00fp');
      expect(fontObj.weight).assertEqual('400');
      expect(fontObj.family).assertEqual('Arial, HarmonyOS Sans');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
 
    /**
     * @tc.number textFontCase0200
     * @tc.name   Test the font property of the text component
     * @tc.desc   set the font property value is  undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textFontCase0200', 0, async function (done) {
      var tagName = 'textFontCase0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
      let fontJson = JSON.stringify({size:10,weight:500,family:'Arial, HarmonyOS Sans',style:FontStyle.Italic});
      try {
        var eventData = {
          data: {
            "font": fontJson
          }
        }
        var innerEvent = {
          eventId: 1051,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_font');
      let obj = JSON.parse(strJsonNew);
      let fontAttrsJson =  obj.$attrs.font;
      console.info('[' + tagName + '] Text textCase font is: ' + fontAttrsJson);
      
      let fontObj = JSON.parse(fontAttrsJson)
 
      expect(fontObj.style).assertEqual('FontStyle.Italic');
      expect(fontObj.size).assertEqual('10.00fp');
      expect(fontObj.weight).assertEqual('500');
      expect(fontObj.family).assertEqual('Arial, HarmonyOS Sans');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number textFontCase0300
     * @tc.name   Test the font property of the text component
     * @tc.desc   set the font property value is {size:10,weight:500,family: 'app.string.font_family_regular',style:FontStyle.Italic}
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textFontCase0300', 0, async function (done) {
      var tagName = 'textFontCase0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
      let fontJson = JSON.stringify({size:10,weight:500,family: 'app.string.font_family_regular',style:FontStyle.Italic});
      try {
        var eventData = {
          data: {
            "font": fontJson
          }
        }
        var innerEvent = {
          eventId: 1051,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_font');
      let obj = JSON.parse(strJsonNew);
      let fontAttrsJson =  obj.$attrs.font;
      console.info('[' + tagName + '] Text textCase font is: ' + fontAttrsJson);
      
      let fontObj = JSON.parse(fontAttrsJson)
 
      expect(fontObj.style).assertEqual('FontStyle.Italic');
      expect(fontObj.size).assertEqual('10.00fp');
      expect(fontObj.weight).assertEqual('500');
      expect(fontObj.family).assertEqual('HarmonyOS Sans SC-Regular');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
