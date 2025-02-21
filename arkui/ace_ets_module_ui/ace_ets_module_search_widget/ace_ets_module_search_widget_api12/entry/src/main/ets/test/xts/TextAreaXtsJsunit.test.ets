/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import Utils from './Utils';

export default function textAreaXtsJsunit() {
  describe('textAreaXtsJsunit', function () {
    beforeEach(async function (done) {
      console.info('TextAreaXtsJsunit beforeEach start');
      let options = {
        uri: 'MainAbility/pages/xts/TextAreaXts',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextAreaXts state pages: ' + JSON.stringify(pages));
        if (!('TextAreaXts' == pages.name)) {
          console.info('get TextAreaXts state pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push TextAreaXts page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextAreaXts page error: ' + err);
      }
      done();
    })

    /**
     * @tc.number TextAreaXtsJsunit_0101
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextAreaXtsJsunit_0101', 0, async function (done) {
      console.info('[TextAreaXtsJsunit_0101] START');
      let strJson = getInspectorByKey('key_textarea_selectedBackgroundColor');
      let obj = JSON.parse(strJson);
      console.info('[TextAreaXtsJsunit_0101] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#F5F5F5F5');
      console.info('[TextAreaXtsJsunit_0101] END');
      done();
    });

    /**
     * @tc.number TextAreaXtsJsunit_0102
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextAreaXtsJsunit_0102', 0, async function (done) {
      console.info('[TextAreaXtsJsunit_0102] START');
      let strJson = getInspectorByKey('key_textarea_caretStyle');
      let obj = JSON.parse(strJson);
      console.info('[TextAreaXtsJsunit_0102] obj is: ' + JSON.stringify(obj.$attrs));
      let caretstyle_obj = JSON.parse(obj.$attrs.caretStyle);
      expect(caretstyle_obj.width).assertEqual('5.00vp');
      expect(caretstyle_obj.color).assertEqual('#F5F5F5F5');
      console.info('[TextAreaXtsJsunit_0102] END');
      done();
    });

    /**
     * @tc.number TextAreaXtsJsunit_0103
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextAreaXtsJsunit_0103', 0, async function (done) {
      console.info('[TextAreaXtsJsunit_0103] START');
      let strJson = getInspectorByKey('key_textarea_textIndent');
      let obj = JSON.parse(strJson);
      console.info('[TextAreaXtsJsunit_0103] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textIndent).assertEqual('5.00vp');
      console.info('[TextAreaJsunit_0103] END');
      done();
    });

    /**
     * @tc.number TextAreaXtsJsunit_0104
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextAreaXtsJsunit_0104', 0, async function (done) {
      console.info('[TextAreaXtsJsunit_0104] START');
      let strJson = getInspectorByKey('key_textarea_textOverflow');
      let obj = JSON.parse(strJson);
      console.info('[TextAreaXtsJsunit_0104] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textOverflow).assertEqual('TextOverflow.Clip');
      console.info('[TextAreaXtsJsunit_0104] END');
      done();
    });


  })
}
