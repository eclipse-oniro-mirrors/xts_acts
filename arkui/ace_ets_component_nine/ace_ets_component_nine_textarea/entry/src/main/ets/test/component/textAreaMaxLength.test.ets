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

export default function textAreaMaxLength() {
  describe('maxLengthTest', function () {
    beforeEach(async function (done) {
      console.info("maxLengthTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaMaxLength',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get maxLength state pages: " + JSON.stringify(pages));
        if (!("textAreaMaxLength" == pages.name)) {
          console.info("get textAreaMaxLength pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaMaxLength page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaMaxLength page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaMaxLength beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("maxLength after each called");
    });
     /**
     * @tc.number TextArea_MaxLength_10010
     * @tc.name   testTextAreaMaxLengthNumber
     * @tc.desc   The MaxLength property of the TextArea component is set to Number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaMaxLengthNumber', 0, async function (done) {
      var tagName = 'testTextAreaMaxLengthNumber';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "maxLength": 10,
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
      let strJson = getInspectorByKey('key_textArea_maxLength');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.maxLength));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.maxLength).assertEqual("10");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}