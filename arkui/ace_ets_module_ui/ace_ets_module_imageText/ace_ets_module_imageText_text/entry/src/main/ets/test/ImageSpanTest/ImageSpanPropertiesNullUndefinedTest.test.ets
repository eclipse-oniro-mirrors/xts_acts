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

import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageSpanPropertiesNullUndefinedTest() {
  describe('ImageSpanPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageSpanPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSpan/ImageSpanPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageSpanPropertiesNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("ImageSpanPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get ImageSpanPropertiesNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageSpanPropertiesNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageSpanPropertiesNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   imageSpanColorFilter_null_0100
     * @tc.number SUB_ARKUI_IMAGESPAN_COLORFILTER_NULL_0100
     * @tc.desc   Test ImageSpan colorFilter property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('imageSpanColorFilter_null_0100', Level.LEVEL0, async () => {
      console.info('[imageSpanColorFilter_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('ImageSpan_colorFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('ImageSpan_colorFilter_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageSpanColorFilter_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[imageSpanColorFilter_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[imageSpanColorFilter_null_0100] default colorFilter is: " + JSON.stringify(objCompare.$attrs.colorFilter));
      console.info("[imageSpanColorFilter_null_0100] null colorFilter is: " + JSON.stringify(obj.$attrs.colorFilter));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.colorFilter)).assertContain('1.000000 0.000000 0.000000');
      console.info('[imageSpanColorFilter_null_0100] END');
    })

    /**
     * @tc.name   imageSpanColorFilter_undefined_0100
     * @tc.number SUB_ARKUI_IMAGESPAN_COLORFILTER_UNDEFINED_0100
     * @tc.desc   Test ImageSpan colorFilter property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('imageSpanColorFilter_undefined_0100', Level.LEVEL0, async () => {
      console.info('[imageSpanColorFilter_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('ImageSpan_colorFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('ImageSpan_colorFilter_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageSpanColorFilter_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[imageSpanColorFilter_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[imageSpanColorFilter_null_0100] default colorFilter is: " + JSON.stringify(objCompare.$attrs.colorFilter));
      console.info("[imageSpanColorFilter_null_0100] null colorFilter is: " + JSON.stringify(obj.$attrs.colorFilter));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.colorFilter)).assertContain('1.000000 0.000000 0.000000');
      console.info('[imageSpanColorFilter_undefined_0100] END');
    })

    /**
     * @tc.name   imageSpanAlt_null_0100
     * @tc.number SUB_ARKUI_IMAGESPAN_ALT_NULL_0100
     * @tc.desc   Test ImageSpan alt property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('imageSpanAlt_null_0100', Level.LEVEL0, async () => {
      console.info('[imageSpanAlt_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('ImageSpan_alt_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('ImageSpan_alt_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageSpanAlt_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[imageSpanAlt_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[imageSpanAlt_null_0100] default alt is: " + JSON.stringify(objCompare.$attrs.alt));
      console.info("[imageSpanAlt_null_0100] null alt is: " + JSON.stringify(obj.$attrs.alt));

      // null 应该恢复为默认值
      expect(obj.$attrs.alt).assertEqual(objCompare.$attrs.alt);
      console.info('[imageSpanAlt_null_0100] END');
    })

    /**
     * @tc.name   imageSpanAlt_undefined_0100
     * @tc.number SUB_ARKUI_IMAGESPAN_ALT_UNDEFINED_0100
     * @tc.desc   Test ImageSpan alt property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('imageSpanAlt_undefined_0100', Level.LEVEL0, async () => {
      console.info('[imageSpanAlt_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('ImageSpan_alt_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('ImageSpan_alt_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageSpanAlt_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[imageSpanAlt_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[imageSpanAlt_null_0100] default alt is: " + JSON.stringify(objCompare.$attrs.alt));
      console.info("[imageSpanAlt_null_0100] null alt is: " + JSON.stringify(obj.$attrs.alt));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.alt).assertEqual(objCompare.$attrs.alt);
      console.info('[imageSpanAlt_undefined_0100] END');
    })
  })
}
