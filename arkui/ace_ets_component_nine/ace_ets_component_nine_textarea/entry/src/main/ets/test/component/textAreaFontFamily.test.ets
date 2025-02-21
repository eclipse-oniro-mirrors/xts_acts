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

export default function textAreaFontFamily() {
  describe('textAreaFontFamilyTest', function () {
    beforeEach(async function (done) {
      console.info("textAreaFontFamilyTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaFontFamily',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fontFamily state pages: " + JSON.stringify(pages));
        if (!("textAreaFontFamily" == pages.name)) {
          console.info("get textAreaFontFamily pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaFontFamily page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaFontFamily page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaFontFamily beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("fontFamily after each called");
    });
     /**
     * @tc.number TextArea_FontFamily_10010
     * @tc.name   testTextAreaFontFamilyHarmonyOS Sans
     * @tc.desc   The FontFamily property of the TextArea component is set to HarmonyOS Sans
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontFamilyHarmonyOS', 0, async function (done) {
      var tagName = 'testTextAreaFontFamilyHarmonyOS';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontFamily": "HarmonyOS Sans",
          }
        }
        var innerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_textArea_fontFamily');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontFamily));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontFamily).assertEqual("HarmonyOS Sans");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontFamily_10020
     * @tc.name   testTextAreaFontFamilyResource
     * @tc.desc   The FontFamily property of the TextArea component is set to Resource
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontFamilyResource', 0, async function (done) {
      var tagName = 'testTextAreaFontFamilyResource';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontFamily": "app.string.font_family_arial",
          }
        }
        var innerEvent = {
          eventId: 6802,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_textArea_fontFamily');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontFamily));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontFamily).assertEqual("Arial");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}