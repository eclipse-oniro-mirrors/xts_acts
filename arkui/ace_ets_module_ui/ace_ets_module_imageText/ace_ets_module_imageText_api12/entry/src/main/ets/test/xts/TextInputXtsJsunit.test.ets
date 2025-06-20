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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function TextInputXtsJsunit() {
  describe('TextInputXtsJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info('TextInputXtsJsunit beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/xts/TextInputXts',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextInputXts state pages: ' + JSON.stringify(pages));
        if (!('TextInputXts' == pages.name)) {
          console.info('get TextInputXts state pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push TextInputXts page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextInputXts page error: ' + err);
      }
      done();
    })

    /**
     * @tc.number TextInputXtsJsunit_0101
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextInputXtsJsunit_0101',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputXtsJsunit_0103] START');
      let strJson = getInspectorByKey('key_textinput_textIndent');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextInputXtsJsunit_0101] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textIndent).assertEqual('5.00vp');
      console.info('[TextInputXtsJsunit_0101] END');
      done();
    });

    /**
     * @tc.number TextInputXtsJsunit_0102
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextInputXtsJsunit_0102',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputXtsJsunit_0102] START');
      let strJson = getInspectorByKey('key_textinput_textOverflow');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextInputXtsJsunit_0102] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textOverflow).assertEqual('TextOverflow.Clip');
      console.info('[TextInputXtsJsunit_0102] END');
      done();
    });
    /**
     * @tc.number TextInputXtsJsunit_0103
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextInputXtsJsunit_0103',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputXtsJsunit_0103] START');
      let strJson = getInspectorByKey('key_textinput_caretStyle');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextInputXtsJsunit_0103] obj is: ' + JSON.stringify(obj.$attrs));
      let caretstyle_obj: ESObject = JSON.parse(obj.$attrs.caretStyle);
      expect(caretstyle_obj.width).assertEqual('5.00vp');
      expect(caretstyle_obj.color).assertEqual('#F5F5F5F5');
      console.info('[TextInputXtsJsunit_0103] END');
      done();
    });
  })
}
