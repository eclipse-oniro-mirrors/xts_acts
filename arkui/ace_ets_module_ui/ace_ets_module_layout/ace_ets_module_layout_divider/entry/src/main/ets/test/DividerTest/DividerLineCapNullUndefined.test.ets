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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';

export default function DividerLineCapNullUndefinedTest() {
  describe('DividerLineCapNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/DividerLineCapNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DividerLineCapNullUndefined state success " + JSON.stringify(pages));
        if (!("DividerLineCapNullUndefined" == pages.name)) {
          console.info("get DividerLineCapNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push DividerLineCapNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DividerLineCapNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   dividerLineCapNullUndefined_0100
     * @tc.number SUB_ARKUI_DIVIDER_LINECAP_NULL_0100
     * @tc.desc   Test Divider lineCap property with null, should restore to default value LineCapStyle.Butt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dividerLineCapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[dividerLineCapNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('divider_linecap_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('divider_linecap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dividerLineCapNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dividerLineCapNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 LineCapStyle.Butt
      expect(obj.$attrs.lineCap).assertEqual(objCompare.$attrs.lineCap);
      expect(objCompare.$attrs.lineCap).assertEqual('BUTT');
      console.info('[dividerLineCapNullUndefined_0100] END');
    })

    /**
     * @tc.name   dividerLineCapNullUndefined_0200
     * @tc.number SUB_ARKUI_DIVIDER_LINECAP_UNDEFINED_0100
     * @tc.desc   Test Divider lineCap property with undefined, should restore to default value LineCapStyle.Butt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dividerLineCapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[dividerLineCapNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('divider_linecap_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('divider_linecap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dividerLineCapNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dividerLineCapNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 LineCapStyle.Butt
      expect(obj.$attrs.lineCap).assertEqual(objCompare.$attrs.lineCap);
      expect(objCompare.$attrs.lineCap).assertEqual('BUTT');
      console.info('[dividerLineCapNullUndefined_0200] END');
    })

    /**
     * @tc.name   dividerLineCapNullUndefined_0300
     * @tc.number SUB_ARKUI_DIVIDER_LINECAP_BUTT_0100
     * @tc.desc   Test Divider lineCap property with LineCapStyle.Butt, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dividerLineCapNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[dividerLineCapNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('divider_linecap_butt');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dividerLineCapNullUndefined_0300] Butt obj is: " + JSON.stringify(obj.$attrs));

      // LineCapStyle.Butt 应该被正确设置
      expect(obj.$attrs.lineCap).assertEqual('BUTT');
      console.info('[dividerLineCapNullUndefined_0300] END');
    })

    /**
     * @tc.name   dividerLineCapNullUndefined_0400
     * @tc.number SUB_ARKUI_DIVIDER_LINECAP_ROUND_0100
     * @tc.desc   Test Divider lineCap property with LineCapStyle.Round, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dividerLineCapNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[dividerLineCapNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('divider_linecap_round');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dividerLineCapNullUndefined_0400] Round obj is: " + JSON.stringify(obj.$attrs));

      // LineCapStyle.Round 应该被正确设置
      expect(obj.$attrs.lineCap).assertEqual('ROUND');
      console.info('[dividerLineCapNullUndefined_0400] END');
    })

    /**
     * @tc.name   dividerLineCapNullUndefined_0500
     * @tc.number SUB_ARKUI_DIVIDER_LINECAP_SQUARE_0100
     * @tc.desc   Test Divider lineCap property with LineCapStyle.Square, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dividerLineCapNullUndefined_0500', Level.LEVEL0, async () => {
      console.info('[dividerLineCapNullUndefined_0500] START');

      let strJson: string = getInspectorByKey('divider_linecap_square');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dividerLineCapNullUndefined_0500] Square obj is: " + JSON.stringify(obj.$attrs));

      // LineCapStyle.Square 应该被正确设置
      expect(obj.$attrs.lineCap).assertEqual('SQUARE');
      console.info('[dividerLineCapNullUndefined_0500] END');
    })
  })
}
