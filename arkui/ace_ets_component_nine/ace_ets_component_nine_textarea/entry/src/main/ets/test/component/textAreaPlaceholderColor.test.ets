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

export default function textAreaPlaceholderColor() {
  describe('placeholderColorTest', function () {
    beforeEach(async function (done) {
      console.info("placeholderColorTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaPlaceholderColor',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get placeholderColor state pages: " + JSON.stringify(pages));
        if (!("textAreaPlaceholderColor" == pages.name)) {
          console.info("get textAreaPlaceholderColor pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaPlaceholderColor page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaPlaceholderColor page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaPlaceholderColor beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("placeholderColor after each called");
    });
     /**
     * @tc.number TextArea_PlaceholderColor_10010
     * @tc.name   testTextAreaPlaceholderColorNumber
     * @tc.desc   The PlaceholderColor property of the TextArea component is set to Number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderColorNumber', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderColorNumber';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "placeholderColor": 0xffffff,
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
      let strJson = getInspectorByKey('key_textArea_placeholderColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderColor).assertEqual("#FFFFFFFF");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_PlaceholderColor_10020
     * @tc.name   testTextAreaPlaceholderColorString
     * @tc.desc   The PlaceholderColor property of the TextArea component is set to String
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderColorString', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderColorString';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "placeholderColor": "#079B8C",
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
      let strJson = getInspectorByKey('key_textArea_placeholderColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderColor).assertEqual("#FF079B8C");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_PlaceholderColor_10030
     * @tc.name   testTextAreaPlaceholderColorColor
     * @tc.desc   The PlaceholderColor property of the TextArea component is set to Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderColorColor', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderColorColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "placeholderColor": Color.Orange,
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
      let strJson = getInspectorByKey('key_textArea_placeholderColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderColor).assertEqual("#FFFFA500");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_PlaceholderColor_10040
     * @tc.name   testTextAreaPlaceholderColorResourceColor
     * @tc.desc   The PlaceholderColor property of the TextArea component is set to ResourceColor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaPlaceholderColorResourceColor', 0, async function (done) {
      var tagName = 'testTextAreaPlaceholderColorResourceColor';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "placeholderColor": 'app.color.color_D90013_red',
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
      let strJson = getInspectorByKey('key_textArea_placeholderColor');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.placeholderColor));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderColor).assertEqual("#FFD90013");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}