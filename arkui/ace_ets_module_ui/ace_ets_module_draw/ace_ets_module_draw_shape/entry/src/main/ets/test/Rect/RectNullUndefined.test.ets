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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function RectNullUndefinedTest() {
  describe('RectNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("RectNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Rect/RectNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RectNullUndefined state pages: " + JSON.stringify(pages));
        if (!("RectNullUndefined" == pages.name)) {
          console.info("get RectNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RectNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RectStrokeMiterLimitNull_0100
     * @tc.number SUB_ARKUI_RECT_STROKEMITERLIMIT_NULL_0100
     * @tc.desc   Test Rect strokeMiterLimit method with null parameter, should be treated as default value 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('RectStrokeMiterLimitNull_0100', Level.LEVEL0, async () => {
      console.info('[RectStrokeMiterLimitNull_0100] START');

      let strJson = getInspectorByKey('Rect_strokeMiterLimit_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('4.000000');
      console.info('[RectStrokeMiterLimitNull_0100] END');
    })

    /**
     * @tc.name   RectStrokeMiterLimitUndefined_0100
     * @tc.number SUB_ARKUI_RECT_STROKEMITERLIMIT_UNDEFINED_0100
     * @tc.desc   Test Rect strokeMiterLimit method with undefined parameter, should be treated as default value 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('RectStrokeMiterLimitUndefined_0100', Level.LEVEL0, async () => {
      console.info('[RectStrokeMiterLimitUndefined_0100] START');

      let strJson = getInspectorByKey('Rect_strokeMiterLimit_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('4.000000');
      console.info('[RectStrokeMiterLimitUndefined_0100] END');
    })

    /**
     * @tc.name   RectStrokeMiterLimitEmptyString_0100
     * @tc.number SUB_ARKUI_RECT_STROKEMITERLIMIT_EMPTY_STRING_0100
     * @tc.desc   Test Rect strokeMiterLimit method with empty string parameter, should be treated as default value 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('RectStrokeMiterLimitEmptyString_0100', Level.LEVEL0, async () => {
      console.info('[RectStrokeMiterLimitEmptyString_0100] START');

      let strJson = getInspectorByKey('Rect_strokeMiterLimit_empty_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('4.000000');
      console.info('[RectStrokeMiterLimitEmptyString_0100] END');
    })

    /**
     * @tc.name   RectStrokeMiterLimitValid_0100
     * @tc.number SUB_ARKUI_RECT_STROKEMITERLIMIT_VALID_0100
     * @tc.desc   Test Rect strokeMiterLimit method with valid 5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('RectStrokeMiterLimitValid_0100', Level.LEVEL0, async () => {
      console.info('[RectStrokeMiterLimitValid_0100] START');

      let strJson = getInspectorByKey('Rect_strokeMiterLimit_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('5.000000');
      console.info('[RectStrokeMiterLimitValid_0100] END');
    })

    /**
     * @tc.name   RectAntiAliasValid_0100
     * @tc.number SUB_ARKUI_RECT_ANTIALIAS_VALID_0100
     * @tc.desc   Test Rect antiAlias method with valid false parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('RectAntiAliasValid_0100', Level.LEVEL0, async () => {
      console.info('[RectAntiAliasValid_0100] START');

      let strJson = getInspectorByKey('Rect_antiAlias_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.antiAlias).assertEqual('false');
      console.info('[RectAntiAliasValid_0100] END');
    })
  })
}
