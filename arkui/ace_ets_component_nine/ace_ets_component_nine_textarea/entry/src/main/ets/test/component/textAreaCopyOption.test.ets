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

export default function textAreaCopyOption() {
  describe('copyOptionTest', function () {
    beforeEach(async function (done) {
      console.info("copyOptionTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaCopyOption',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get copyOption state pages: " + JSON.stringify(pages));
        if (!("textAreaCopyOption" == pages.name)) {
          console.info("get textAreaCopyOption pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaCopyOption page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaCopyOption page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaCopyOption beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("copyOption after each called");
    });
     /**
     * @tc.number TextArea_CopyOption_10010
     * @tc.name   testTextAreaCopyOptionNone
     * @tc.desc   The CopyOption property of the TextArea component is set to CopyOptions.None
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaCopyOptionNone', 0, async function (done) {
      var tagName = 'testTextAreaCopyOptionNone';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        var eventData = {
          data: {
            "copyOption": CopyOptions.None,
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
      let strJson = getInspectorByKey('key_textArea_copyOption');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.copyOption));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_CopyOption_10020
     * @tc.name   testTextAreaCopyOptionInApp
     * @tc.desc   The CopyOption property of the TextArea component is set to CopyOptions.InApp
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaCopyOptionInApp', 0, async function (done) {
      var tagName = 'testTextAreaCopyOptionInApp';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "copyOption": CopyOptions.InApp,
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
      let strJson = getInspectorByKey('key_textArea_copyOption');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.copyOption));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.InApp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_CopyOption_10030
     * @tc.name   testTextAreaCopyOptionLocalDevice
     * @tc.desc   The CopyOption property of the TextArea component is set to CopyOptions.LocalDevice
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaCopyOptionLocalDevice', 0, async function (done) {
      var tagName = 'testTextAreaCopyOptionLocalDevice';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "copyOption": CopyOptions.LocalDevice,
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
      let strJson = getInspectorByKey('key_textArea_copyOption');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.copyOption));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.Local");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_CopyOption_10040
     * @tc.name   testTextAreaCopyOptionCROSS_DEVICE
     * @tc.desc   The CopyOption property of the TextArea component is set to CopyOptions.CROSS_DEVICE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaCopyOptionCROSS_DEVICE', 0, async function (done) {
      var tagName = 'testTextAreaCopyOptionCROSS_DEVICE';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "copyOption": CopyOptions.CROSS_DEVICE,
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
      let strJson = getInspectorByKey('key_textArea_copyOption');
      let obj = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.copyOption));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.Distributed");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}