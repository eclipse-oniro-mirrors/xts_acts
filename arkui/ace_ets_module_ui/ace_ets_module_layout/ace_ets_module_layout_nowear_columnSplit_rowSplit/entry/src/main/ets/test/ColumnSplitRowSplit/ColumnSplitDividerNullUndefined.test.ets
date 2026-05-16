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

import { afterEach, beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function ColumnSplitDividerNullUndefinedTest() {
  describe('ColumnSplitDividerNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ColumnSplitRowSplit/ColumnSplitDividerNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnSplitDividerNullUndefined state success " + JSON.stringify(pages));
        if (!("ColumnSplitDividerNullUndefined" == pages.name)) {
          console.info("get ColumnSplitDividerNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push ColumnSplitDividerNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSplitDividerNullUndefined page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.name   columnSplitDividerNullUndefined_0100
     * @tc.number SUB_ARKUI_COLUMNSPLIT_DIVIDER_NULL_0100
     * @tc.desc   Test ColumnSplit divider property with null, startMargin and endMargin should be 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnSplitDividerNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[columnSplitDividerNullUndefined_0100] START');

      let strJson = getInspectorByKey('columnsplit_divider_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnSplitDividerNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.divider));
      expect(JSON.stringify(obj.$attrs.divider)).assertEqual('{}');
      console.info('[columnSplitDividerNullUndefined_0100] END');
    })

    /**
     * @tc.name   columnSplitDividerNullUndefined_0200
     * @tc.number SUB_ARKUI_COLUMNSPLIT_DIVIDER_UNDEFINED_0100
     * @tc.desc   Test ColumnSplit divider property with undefined, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnSplitDividerNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[columnSplitDividerNullUndefined_0200] START');

      let strJson = getInspectorByKey('columnsplit_divider_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnSplitDividerNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.divider));
      expect(JSON.stringify(obj.$attrs.divider)).assertEqual('{}');
      console.info('[columnSplitDividerNullUndefined_0200] END');
    })

    /**
     * @tc.name   columnSplitDividerNullUndefined_0300
     * @tc.number SUB_ARKUI_COLUMNSPLIT_DIVIDER_VALID_0100
     * @tc.desc   Test ColumnSplit divider property with valid value { startMargin: 5, endMargin: 5 }
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnSplitDividerNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[columnSplitDividerNullUndefined_0300] START');

      let strJson = getInspectorByKey('columnsplit_divider_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnSplitDividerNullUndefined_0300] valid obj is: " + JSON.stringify(obj.$attrs.divider));
      expect(obj.$attrs.divider.startMargin).assertEqual('5.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('5.00vp');
      console.info('[columnSplitDividerNullUndefined_0300] END');
    })

    /**
     * @tc.name   columnSplitDividerNullUndefined_0400
     * @tc.number SUB_ARKUI_COLUMNSPLIT_DIVIDER_STARTMARGIN_0100
     * @tc.desc   Test ColumnSplit divider property with { startMargin: 10, endMargin: 0 }
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnSplitDividerNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[columnSplitDividerNullUndefined_0400] START');

      let strJson = getInspectorByKey('columnsplit_divider_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnSplitDividerNullUndefined_0400] valid obj is: " + JSON.stringify(obj.$attrs.divider));
      expect(obj.$attrs.divider.startMargin).assertEqual('10.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('0.00vp');
      console.info('[columnSplitDividerNullUndefined_0400] END');
    })

    /**
     * @tc.name   columnSplitDividerNullUndefined_0500
     * @tc.number SUB_ARKUI_COLUMNSPLIT_DIVIDER_ENDMARGIN_0100
     * @tc.desc   Test ColumnSplit divider property with { startMargin: 0, endMargin: 10 }
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnSplitDividerNullUndefined_0500', Level.LEVEL0, async () => {
      console.info('[columnSplitDividerNullUndefined_0500] START');

      let strJson = getInspectorByKey('columnsplit_divider_end');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnSplitDividerNullUndefined_0500] valid obj is: " + JSON.stringify(obj.$attrs.divider));
      expect(obj.$attrs.divider.startMargin).assertEqual('0.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('10.00vp');
      console.info('[columnSplitDividerNullUndefined_0500] END');
    })
  })
}
