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

export default function textAreaCaretColor() {
  describe('caretColorTest', function () {
    beforeEach(async function (done) {
      console.info("caretColorTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaCaretColor',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get caretColor state pages: " + JSON.stringify(pages));
        if (!("textAreaCaretColor" == pages.name)) {
          console.info("get textAreaCaretColor pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaCaretColor page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaCaretColor page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaCaretColor beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("caretColor after each called");
    });
     /**
     * @tc.number TextArea_CaretColor_10010
     * @tc.name   testTextAreaCaretColorNumber
     * @tc.desc   The CaretColor property of the TextArea component is set to Number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaCaretColorNumber', 0, async function (done) {
      var tagName = 'testTextAreaCaretColorNumber';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "caretColor": 0xffffff,
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
      let strJson = getInspectorByKey('key_textArea_caretColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.caretColor));
      console.info('column obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).assertEqual("#FFFFFFFF");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_CaretColor_10020
     * @tc.name   testTextAreaCaretColorString
     * @tc.desc   The CaretColor property of the TextArea component is set to String
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaCaretColorString', 0, async function (done) {
      var tagName = 'testTextAreaCaretColorString';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "caretColor": "#079B8C",
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
      let strJson = getInspectorByKey('key_textArea_caretColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.caretColor));
      console.info('column obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).assertEqual("#FF079B8C");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_CaretColor_10030
     * @tc.name   testTextAreaCaretColorColor
     * @tc.desc   The CaretColor property of the TextArea component is set to Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaCaretColorColor', 0, async function (done) {
      var tagName = 'testTextAreaCaretColorColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "caretColor": Color.Orange,
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
      let strJson = getInspectorByKey('key_textArea_caretColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.caretColor));
      console.info('column obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).assertEqual("#FFFFA500");
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
    it('testTextAreaCaretColorResourceColor', 0, async function (done) {
      var tagName = 'testTextAreaCaretColorResourceColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "caretColor": 'app.color.color_D90013_red',
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
      let strJson = getInspectorByKey('key_textArea_caretColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.caretColor));
      console.info('column obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).assertEqual("#FFD90013");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}