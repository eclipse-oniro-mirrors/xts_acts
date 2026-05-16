/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function QrcodePropertiesNullUndefinedTest() {
  describe('QrcodePropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('QrcodePropertiesNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/QRCode/QrcodePropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get QrcodePropertiesNullUndefinedTest state pages: ' + JSON.stringify(pages));
        if (!('QrcodePropertiesNullUndefinedTest' == pages.name)) {
          console.info('get QrcodePropertiesNullUndefinedTest pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push QrcodePropertiesNullUndefinedTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('QrcodePropertiesNullUndefinedTest beforeEach end');
      done()
    });

    /**
     * @tc.name   qrcodeColor_null_0100
     * @tc.number SUB_ARKUI_QRCODE_COLOR_NULL_0100
     * @tc.desc   Test QRCode color property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('qrcodeColor_null_0100', Level.LEVEL0, async () => {
      console.info('[qrcodeColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Qrcode_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Qrcode_color_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[qrcodeColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[qrcodeColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[qrcodeColor_null_0100] default color is: " + JSON.stringify(objCompare.$attrs.color));
      console.info("[qrcodeColor_null_0100] null color is: " + JSON.stringify(obj.$attrs.color));

      // null 应该恢复为默认值
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[qrcodeColor_null_0100] END');
    })

    /**
     * @tc.name   qrcodeColor_undefined_0100
     * @tc.number SUB_ARKUI_QRCODE_COLOR_UNDEFINED_0100
     * @tc.desc   Test QRCode color property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('qrcodeColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[qrcodeColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Qrcode_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Qrcode_color_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[qrcodeColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[qrcodeColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[qrcodeColor_undefined_0100] default color is: " + JSON.stringify(objCompare.$attrs.color));
      console.info("[qrcodeColor_undefined_0100] undefined color is: " + JSON.stringify(obj.$attrs.color));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[qrcodeColor_undefined_0100] END');
    })

    /**
     * @tc.name   qrcodeBackgroundColor_null_0100
     * @tc.number SUB_ARKUI_QRCODE_BACKGROUNDCOLOR_NULL_0100
     * @tc.desc   Test QRCode backgroundColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('qrcodeBackgroundColor_null_0100', Level.LEVEL0, async () => {
      console.info('[qrcodeBackgroundColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Qrcode_backgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Qrcode_backgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[qrcodeBackgroundColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[qrcodeBackgroundColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[qrcodeBackgroundColor_null_0100] default backgroundColor is: " + JSON.stringify(objCompare.$attrs.backgroundColor));
      console.info("[qrcodeBackgroundColor_null_0100] null backgroundColor is: " + JSON.stringify(obj.$attrs.backgroundColor));

      // null 应该恢复为默认值
      expect(obj.$attrs.backgroundColor).assertEqual(objCompare.$attrs.backgroundColor);
      console.info('[qrcodeBackgroundColor_null_0100] END');
    })

    /**
     * @tc.name   qrcodeBackgroundColor_undefined_0100
     * @tc.number SUB_ARKUI_QRCODE_BACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.desc   Test QRCode backgroundColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('qrcodeBackgroundColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[qrcodeBackgroundColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Qrcode_backgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Qrcode_backgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[qrcodeBackgroundColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[qrcodeBackgroundColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[qrcodeBackgroundColor_undefined_0100] default backgroundColor is: " + JSON.stringify(objCompare.$attrs.backgroundColor));
      console.info("[qrcodeBackgroundColor_undefined_0100] undefined backgroundColor is: " + JSON.stringify(obj.$attrs.backgroundColor));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.backgroundColor).assertEqual(objCompare.$attrs.backgroundColor);
      console.info('[qrcodeBackgroundColor_undefined_0100] END');
    })

    /**
     * @tc.name   qrcodeContentOpacity_null_0100
     * @tc.number SUB_ARKUI_QRCODE_CONTENTOPACITY_NULL_0100
     * @tc.desc   Test QRCode contentOpacity property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('qrcodeContentOpacity_null_0100', Level.LEVEL0, async () => {
      console.info('[qrcodeContentOpacity_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Qrcode_contentOpacity_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Qrcode_contentOpacity_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[qrcodeContentOpacity_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[qrcodeContentOpacity_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[qrcodeContentOpacity_null_0100] default contentOpacity is: " + JSON.stringify(objCompare.$attrs.contentOpacity));
      console.info("[qrcodeContentOpacity_null_0100] null contentOpacity is: " + JSON.stringify(obj.$attrs.contentOpacity));

      // null 应该恢复为默认值
      expect(obj.$attrs.contentOpacity).assertEqual(objCompare.$attrs.contentOpacity);
      console.info('[qrcodeContentOpacity_null_0100] END');
    })

    /**
     * @tc.name   qrcodeContentOpacity_undefined_0100
     * @tc.number SUB_ARKUI_QRCODE_CONTENTOPACITY_UNDEFINED_0100
     * @tc.desc   Test QRCode contentOpacity property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('qrcodeContentOpacity_undefined_0100', Level.LEVEL0, async () => {
      console.info('[qrcodeContentOpacity_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Qrcode_contentOpacity_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Qrcode_contentOpacity_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[qrcodeContentOpacity_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[qrcodeContentOpacity_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[qrcodeContentOpacity_undefined_0100] default contentOpacity is: " + JSON.stringify(objCompare.$attrs.contentOpacity));
      console.info("[qrcodeContentOpacity_undefined_0100] undefined contentOpacity is: " + JSON.stringify(obj.$attrs.contentOpacity));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.contentOpacity).assertEqual(objCompare.$attrs.contentOpacity);
      console.info('[qrcodeContentOpacity_undefined_0100] END');
    })
  })
}
