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

export default function textAreaStyle() {
  describe('styleTest', function () {
    beforeEach(async function (done) {
      console.info("styleTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaStyle',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get style state pages: " + JSON.stringify(pages));
        if (!("textAreaStyle" == pages.name)) {
          console.info("get textAreaStyle pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaStyle page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaStyle page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaStyle beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("style after each called");
    });
     /**
     * @tc.number TextArea_Style_10010
     * @tc.name   testTextAreaStyleDEFAULT
     * @tc.desc   The Style property of the TextArea component is set to TextContentStyle.DEFAULT
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaStyleDEFAULT', 0, async function (done) {
      var tagName = 'testTextAreaStyleDEFAULT';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "style": TextContentStyle.DEFAULT,
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
      let strJson = getInspectorByKey('key_textArea_style');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.style));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_Style_10020
     * @tc.name   testTextAreaStyleINLINE
     * @tc.desc   The Style property of the TextArea component is set to TextContentStyle.INLINE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaStyleINLINE', 0, async function (done) {
      var tagName = 'testTextAreaStyleINLINE';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "style": TextContentStyle.INLINE,
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
      let strJson = getInspectorByKey('key_textArea_style');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.style));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.style).assertEqual("TextContentStyle.INLINE");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}