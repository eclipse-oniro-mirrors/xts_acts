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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textInputPlaceholderFontTest() {
  describe('textInputPlaceholderFontTest', function () {
    beforeEach(async function (done) {
      console.info("textInputPlaceholderFontTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputPlaceholderFont',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputPlaceholderFont state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputPlaceholderFont pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputPlaceholderFont page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputPlaceholderFont page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputPlaceholderFontTest beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputPlaceholderFont after each called");
    })




    /**
     * @tc.number  textInputPlaceholderFontCase0100
     * @tc.name    Test the PlaceholderFont property of the textinput component
     * @tc.desc    set the PlaceholderFont property value is Font object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputPlaceholderFontCase0100', 0, async function (done) {
      var tagName = 'textInputPlaceholderFontCase0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      let fontJson = JSON.stringify({ size: 10, weight: 500, family: 'Arial, HarmonyOS Sans', style: FontStyle.Italic });
      try {
        var eventData = {
          data: {
            "font": fontJson
          }
        }
        var innerEvent = {
          eventId: 840,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = getInspectorByKey('key_textinput_font');
      let obj = JSON.parse(strJsonNew);
      let fontAttrsJson = obj.$attrs.placeholderFont;
      console.info('[' + tagName + '] Text textCase font is: ' + fontAttrsJson);

      let fontObj = JSON.parse(fontAttrsJson)

      expect(fontObj.style).assertEqual('FontStyle.Italic');
      expect(fontObj.size).assertEqual('10.00fp');
      expect(fontObj.weight).assertEqual('500');
      expect(fontObj.fontFamily).assertEqual('Arial, HarmonyOS Sans');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputPlaceholderFontCase0200
     * @tc.name    Test the PlaceholderFont property of the textinput component
     * @tc.desc    set the PlaceholderFont property value is  Font object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputPlaceholderFontCase0200', 0, async function (done) {
      var tagName = 'textInputPlaceholderFontCase0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      let fontJson = JSON.stringify({ size: 10, weight: 500, family: 'app.string.font_family_regular', style: FontStyle.Italic });
      try {
        var eventData = {
          data: {
            "font": fontJson
          }
        }
        var innerEvent = {
          eventId: 841,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = getInspectorByKey('key_textinput_font');
      let obj = JSON.parse(strJsonNew);
      let fontAttrsJson = obj.$attrs.placeholderFont;
      console.info('[' + tagName + '] Text textCase font is: ' + fontAttrsJson);

      let fontObj = JSON.parse(fontAttrsJson)

      expect(fontObj.style).assertEqual('FontStyle.Italic');
      expect(fontObj.size).assertEqual('10.00fp');
      expect(fontObj.weight).assertEqual('500');
      expect(fontObj.fontFamily).assertEqual('HarmonyOS Sans SC-Regular');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
