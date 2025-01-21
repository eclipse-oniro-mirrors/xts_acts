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

export default function textAreaPlaceholderFont() {
  describe('textAreaPlaceholderFontTest', function () {
    beforeEach(async function (done) {
      console.info("textAreaPlaceholderFontTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaPlaceholderFont',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get placeholderFont state pages: " + JSON.stringify(pages));
        if (!("textAreaPlaceholderFont" == pages.name)) {
          console.info("get textAreaPlaceholderFont pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaPlaceholderFont page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaPlaceholderFont page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaPlaceholderFont beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("placeholderFont after each called");
    });
     /**
     * @tc.number TextArea_PlaceholderFont_10010
     * @tc.name   testTextAreaPlaceholderFontAll
     * @tc.desc   The PlaceholderFont property of the TextArea component is set to All
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderFontAll', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderFontAll';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "placeholderFont": JSON.stringify({
              size: "20",
              weight: 900,
              family: 'HarmonyOS Sans',
              style: FontStyle.Italic
            })
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
      let strJson = getInspectorByKey('key_textArea_placeholderFont');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderFont));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderFont).assertEqual("{\"style\":\"FontStyle.Italic\",\"size\":\"20.00fp\",\"weight\":\"900\",\"fontFamily\":\"HarmonyOS Sans\"}");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_PlaceholderFont_10020
     * @tc.name   testTextAreaPlaceholderFontNumber
     * @tc.desc   The PlaceholderFont property of the TextArea component is set to Number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderFontNumber', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderFontNumber';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        var eventData = {
          data: {
            "placeholderFont": JSON.stringify({
              weight: 500,
            })
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
      let strJson = getInspectorByKey('key_textArea_placeholderFont');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderFont));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderFont).assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"weight\":\"500\",\"fontFamily\":\"HarmonyOS Sans\"}");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_PlaceholderFont_10030
     * @tc.name   testTextAreaPlaceholderFontString
     * @tc.desc   The PlaceholderFont property of the TextArea component is set to String
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderFontString', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderFontString';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "placeholderFont": JSON.stringify({
              family: 'Arial',
            })
          }
        }
        var innerEvent = {
          eventId: 6803,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_textArea_placeholderFont');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderFont));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderFont).assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial\"}");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_PlaceholderFont_10040
     * @tc.name   testTextAreaPlaceholderFontResource
     * @tc.desc   The PlaceholderFont property of the TextArea component is set to Resource
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderFontResource', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderFontResource';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "placeholderFont": "app.float.length_df",
          }
        }
        var innerEvent = {
          eventId: 6804,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_textArea_placeholderFont');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderFont));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderFont).assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"30.00fp\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial\"}");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}