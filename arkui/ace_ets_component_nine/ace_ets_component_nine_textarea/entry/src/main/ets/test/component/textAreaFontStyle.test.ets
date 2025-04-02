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

export default function textAreaFontStyle() {
  describe('fontStyleTest', function () {
    beforeEach(async function (done) {
      console.info("fontStyleTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaFontStyle',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fontStyle state pages: " + JSON.stringify(pages));
        if (!("textAreaFontStyle" == pages.name)) {
          console.info("get textAreaFontStyle pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaFontStyle page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaFontStyle page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaFontStyle beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("fontStyle after each called");
    });
     /**
     * @tc.number TextArea_FontStyle_10010
     * @tc.name   testTextAreaFontStyleNormal
     * @tc.desc   The FontStyle property of the TextArea component is set to Normal
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontStyleNormal', 0, async function (done) {
      var tagName = 'testTextAreaFontStyleNormal';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontStyle": FontStyle.Normal,
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
      let strJson = getInspectorByKey('key_textArea_fontStyle');
      let obj = JSON.parse(strJson); 
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontStyle));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontStyle).assertEqual("FontStyle.Normal");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontStyle_10020
     * @tc.name   testTextAreaFontStyleItalic
     * @tc.desc   The FontStyle property of the TextArea component is set to Italic
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontStyleItalic', 0, async function (done) {
      var tagName = 'testTextAreaFontStyleItalic';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontStyle": FontStyle.Italic,
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
      let strJson = getInspectorByKey('key_textArea_fontStyle');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontStyle));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontStyle).assertEqual("FontStyle.Italic");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}