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

export default function textAreaFontColor() {
  describe('fontColorTest', function () {
    beforeEach(async function (done) {
      console.info("fontColorTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaFontColor',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fontColor state pages: " + JSON.stringify(pages));
        if (!("textAreaFontColor" == pages.name)) {
          console.info("get textAreaFontColor pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaFontColor page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaFontColor page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaFontColor beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("fontColor after each called");
    });
     /**
     * @tc.number TextArea_FontColor_10010
     * @tc.name   testTextAreaFontColor
     * @tc.desc   The FontColor property of the TextArea component is set to Number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontColorNumber', 0, async function (done) {
      var tagName = 'testTextAreaFontColorNumber';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontColor": 0xffffff,
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
      let strJson = getInspectorByKey('key_textArea_fontColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontColor).assertEqual("#FFFFFFFF");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontColor_10020
     * @tc.name   testTextAreaFontColorString
     * @tc.desc   The FontColor property of the TextArea component is set to String
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontColorString', 0, async function (done) {
      var tagName = 'testTextAreaFontColorString';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        var eventData = {
          data: {
            "fontColor": "#079B8C",
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
      let strJson = getInspectorByKey('key_textArea_fontColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontColor).assertEqual("#FF079B8C");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontColor_10030
     * @tc.name   testTextAreaCaretColorColor
     * @tc.desc   The FontColor property of the TextArea component is set to Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontColorColor', 0, async function (done) {
      var tagName = 'testTextAreaFontColorColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        var eventData = {
          data: {
            "fontColor": Color.Orange,
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
      let strJson = getInspectorByKey('key_textArea_fontColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontColor).assertEqual("#FFFFA500");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_CaretColor_10040
     * @tc.name   testTextAreaCaretColorResourceColor
     * @tc.desc   The CaretColor property of the TextArea component is set to ResourceColor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontColorResourceColor', 0, async function (done) {
      var tagName = 'testTextAreaFontColorResourceColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontColor": 'app.color.color_D90013_red',
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
      let strJson = getInspectorByKey('key_textArea_fontColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontColor).assertEqual("#FFD90013");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}