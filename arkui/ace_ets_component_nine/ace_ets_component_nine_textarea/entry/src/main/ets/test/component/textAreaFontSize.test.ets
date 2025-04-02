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

export default function textAreaFontSize() {
  describe('textAreaFontSizeTest', function () {
    beforeEach(async function (done) {
      console.info("textAreaFontSizeTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaFontSize',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fontSize state pages: " + JSON.stringify(pages));
        if (!("textAreaFontSize" == pages.name)) {
          console.info("get textAreaFontSize pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaFontSize page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaFontSize page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaFontSize beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("fontSize after each called");
    });
     /**
     * @tc.number TextArea_FontSize_10010
     * @tc.name   testTextAreaFontSizeNumber
     * @tc.desc   The FontSize property of the TextArea component is set to Number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontSizeNumber', 0, async function (done) {
      var tagName = 'testTextAreaFontSizeNumber';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSize": 10,
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
      let strJson = getInspectorByKey('key_textArea_fontSize');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontSize));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontSize).assertEqual("10.00fp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontSize_10020
     * @tc.name   testTextAreaFontSizeString
     * @tc.desc   The FontSize property of the TextArea component is set to String
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontSizeString', 0, async function (done) {
      var tagName = 'testTextAreaFontSizeString';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSize": "30tx",
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
      let strJson = getInspectorByKey('key_textArea_fontSize');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontSize));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontSize).assertEqual("16.00fp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontSize_10030
     * @tc.name   testTextAreaFontSizeResource
     * @tc.desc   The FontSize property of the TextArea component is set to Resource
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
     it('testTextAreaFontSizeResource', 0, async function (done) {
      var tagName = 'testTextAreaFontSizeResource';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        var eventData = {
          data: {
            "fontSize": "app.float.length_df",
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
      let strJson = getInspectorByKey('key_textArea_fontSize');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontSize));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontSize).assertEqual("30.00fp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}