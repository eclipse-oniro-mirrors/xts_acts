// @ts-nocheck
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

export default function ImageSpanJsunit() {
  describe('imageSpanTest', function () {
    beforeEach(async function (done) {
      console.info("imageSpan beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/imageSpanPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageSpan state pages: " + JSON.stringify(pages));
        if (!("imageSpanPage" == pages.name)) {
          console.info("get imageSpan pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push imageSpan page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageSpan page error: " + err);
      }
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("imageSpan after each called");
    })
    /**
     * @tc.number testImageSpanverticalAlign01
     * @tc.name   Test the imageSpan property of the verticalAlign component
     * @tc.desc   set the ImageSpanverticalAlign property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageSpanverticalAlign01', 0, async function (done) {
      var tagName = 'testImageSpanverticalAlign01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageSpan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.verticalAlign).assertEqual("VerticalAlign.BOTTOM");

      try {
        var eventData = {
          data: {
            "verticalAlign":  "ImageSpanAlignment.BOTTOM",
          }
        }
        var innerEvent = {
          eventId: 6901,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImageSpan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.verticalAlign).assertEqual("VerticalAlign.BOTTOM");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageObjectFit02
     * @tc.name   Test the imageSpan property of the ObjectFit component
     * @tc.desc   set the ImageObjectFit property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageObjectFit02', 0, async function (done) {
      var tagName = 'testImageObjectFit02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImageSpan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Cover');

      try {
        var eventData = {
          data: {
            "objectFit": 'ImageFit.Cover',
          }
        }
        var innerEvent = {
          eventId: 6902,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImageSpan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      expect(objNew.$attrs.objectFit).assertEqual('ImageFit.Cover');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
