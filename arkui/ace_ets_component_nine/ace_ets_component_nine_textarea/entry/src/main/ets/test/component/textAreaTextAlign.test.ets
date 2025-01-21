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

export default function textAreaTextAlign() {
  describe('textAlignTest', function () {
    beforeEach(async function (done) {
      console.info("textAlignTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaTextAlign',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAlign state pages: " + JSON.stringify(pages));
        if (!("textAreaTextAlign" == pages.name)) {
          console.info("get textAreaTextAlign pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaTextAlign page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaTextAlign page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaTextAlign beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textAlign after each called");
    });
     /**
     * @tc.number TextArea_TextAlign_10010
     * @tc.name   testTextAreaTextAlignStart
     * @tc.desc   The TextAlign property of the TextArea component is set to TextAlign.Start
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaTextAlignStart', 0, async function (done) {
      var tagName = 'testTextAreaTextAlignStart';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "textAlign": TextAlign.Start,
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
      let strJson = getInspectorByKey('key_textArea_textAlign');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.textAlign));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Start");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_TextAlign_10020
     * @tc.name   testTextAreaTextAlignCenter
     * @tc.desc   The TextAlign property of the TextArea component is set to TextAlign.Center
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaTextAlignCenter', 0, async function (done) {
      var tagName = 'testTextAreaTextAlignCenter';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "textAlign": TextAlign.Center,
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
      let strJson = getInspectorByKey('key_textArea_textAlign');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.textAlign));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_TextAlign_10030
     * @tc.name   testTextAreaTextAlignEnd
     * @tc.desc   The TextAlign property of the TextArea component is set to TextAlign.End
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaTextAlignEnd', 0, async function (done) {
      var tagName = 'testTextAreaTextAlignEnd';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "textAlign": TextAlign.End,
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
      let strJson = getInspectorByKey('key_textArea_textAlign');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.textAlign));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.End");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_TextAlign_10040
     * @tc.name   testTextAreaTextAlignJUSTIFY
     * @tc.desc   The TextAlign property of the TextArea component is set to TextAlign.JUSTIFY
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaTextAlignJUSTIFY', 0, async function (done) {
      var tagName = 'testTextAreaTextAlignJUSTIFY';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "textAlign": TextAlign.JUSTIFY,
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
      let strJson = getInspectorByKey('key_textArea_textAlign');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.textAlign));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Justify");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}