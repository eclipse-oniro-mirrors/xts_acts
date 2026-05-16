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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

export default function RowAlignItemsJustifyContentReverseNullUndefinedTest() {
  describe('RowAlignItemsJustifyContentReverseNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("RowAlignItemsJustifyContentReverseNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowAlignItemsJustifyContentReverseNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowAlignItemsJustifyContentReverseNullUndefined state pages:" + JSON.stringify(pages));
        if (!("RowAlignItemsJustifyContentReverseNullUndefined" == pages.name)) {
          console.info("get RowAlignItemsJustifyContentReverseNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RowAlignItemsJustifyContentReverseNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowAlignItemsJustifyContentReverseNullUndefined page error:" + err);
      }
      console.info("RowAlignItemsJustifyContentReverseNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   rowAlignItemsNull_0100
     * @tc.number SUB_ARKUI_ROW_ALIGNITEMS_NULL_0100
     * @tc.desc   Test Row alignItems method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowAlignItemsNull_0100', Level.LEVEL0, async () => {
      console.info('[rowAlignItemsNull_0100] START');

      let strJson = getInspectorByKey('row_alignitems_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignItems).assertEqual('VerticalAlign.Center');
      console.info('[rowAlignItemsNull_0100] END');
    })

    /**
     * @tc.name   rowAlignItemsUndefined_0100
     * @tc.number SUB_ARKUI_ROW_ALIGNITEMS_UNDEFINED_0100
     * @tc.desc   Test Row alignItems method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowAlignItemsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rowAlignItemsUndefined_0100] START');

      let strJson = getInspectorByKey('row_alignitems_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignItems).assertEqual('VerticalAlign.Center');
      console.info('[rowAlignItemsUndefined_0100] END');
    })

    /**
     * @tc.name   rowAlignItemsValid_0100
     * @tc.number SUB_ARKUI_ROW_ALIGNITEMS_VALID_0100
     * @tc.desc   Test Row alignItems method without setting, should work correctly with default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowAlignItemsValid_0100', Level.LEVEL0, async () => {
      console.info('[rowAlignItemsValid_0100] START');

      let strJson = getInspectorByKey('row_alignitems_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignItems).assertEqual('VerticalAlign.Center');
      console.info('[rowAlignItemsValid_0100] END');
    })

    /**
     * @tc.name   rowJustifyContentNull_0100
     * @tc.number SUB_ARKUI_ROW_JUSTIFYCONTENT_NULL_0100
     * @tc.desc   Test Row justifyContent method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowJustifyContentNull_0100', Level.LEVEL0, async () => {
      console.info('[rowJustifyContentNull_0100] START');

      let strJson = getInspectorByKey('row_justifycontent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.justifyContent).assertEqual('FlexAlign.Start');
      console.info('[rowJustifyContentNull_0100] END');
    })

    /**
     * @tc.name   rowJustifyContentUndefined_0100
     * @tc.number SUB_ARKUI_ROW_JUSTIFYCONTENT_UNDEFINED_0100
     * @tc.desc   Test Row justifyContent method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowJustifyContentUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rowJustifyContentUndefined_0100] START');

      let strJson = getInspectorByKey('row_justifycontent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.justifyContent).assertEqual('FlexAlign.Start');
      console.info('[rowJustifyContentUndefined_0100] END');
    })

    /**
     * @tc.name   rowJustifyContentValid_0100
     * @tc.number SUB_ARKUI_ROW_JUSTIFYCONTENT_VALID_0100
     * @tc.desc   Test Row justifyContent method without setting, should work correctly with default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowJustifyContentValid_0100', Level.LEVEL0, async () => {
      console.info('[rowJustifyContentValid_0100] START');

      let strJson = getInspectorByKey('row_justifycontent_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.justifyContent).assertEqual('FlexAlign.Start');
      console.info('[rowJustifyContentValid_0100] END');
    })

    /**
     * @tc.name   rowReverseNull_0100
     * @tc.number SUB_ARKUI_ROW_REVERSE_NULL_0100
     * @tc.desc   Test Row reverse method with null parameter, should have same effect as true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowReverseNull_0100', Level.LEVEL0, async () => {
      console.info('[rowReverseNull_0100] START');

      // reverse(null) 效果同 true，子组件反转
      // 使用 getComponentRect 获取组件位置信息
      let rowRect = CommonFunc.getComponentRect('row_reverse_null');
      let text1Rect = CommonFunc.getComponentRect('row_reverse_null_text1');
      let text2Rect = CommonFunc.getComponentRect('row_reverse_null_text2');

      // 验证反转效果：
      // 1. 第一个子组件（原第二个）的右边界与父组件右边界对齐
      expect(Math.floor(Math.abs(rowRect.right - text1Rect.right))).assertLessOrEqual(1);

      // 2. 第二个子组件（原第一个）的右边界与第一个子组件左边界对齐
      expect(Math.floor(Math.abs(text2Rect.right - text1Rect.left))).assertLessOrEqual(1);

      console.info('[rowReverseNull_0100] END');
    })

    /**
     * @tc.name   rowReverseUndefined_0100
     * @tc.number SUB_ARKUI_ROW_REVERSE_UNDEFINED_0100
     * @tc.desc   Test Row reverse method with undefined parameter, should be treated as default value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowReverseUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rowReverseUndefined_0100] START');

      // reverse(undefined) 视为默认值 true，子组件反转
      // 使用 getComponentRect 获取组件位置信息
      let rowRect = CommonFunc.getComponentRect('row_reverse_undefined');
      let text1Rect = CommonFunc.getComponentRect('row_reverse_undefined_text1');
      let text2Rect = CommonFunc.getComponentRect('row_reverse_undefined_text2');

      // 验证反转效果：
      // 1. 第一个子组件（原第二个）的右边界与父组件右边界对齐
      expect(Math.floor(Math.abs(rowRect.right - text1Rect.right))).assertLessOrEqual(1);

      // 2. 第二个子组件（原第一个）的右边界与第一个子组件左边界对齐
      expect(Math.floor(Math.abs(text2Rect.right - text1Rect.left))).assertLessOrEqual(1);

      console.info('[rowReverseUndefined_0100] END');
    })

    /**
     * @tc.name   rowReverseValid_0100
     * @tc.number SUB_ARKUI_ROW_REVERSE_VALID_0100
     * @tc.desc   Test Row reverse method without setting, should keep original order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowReverseValid_0100', Level.LEVEL0, async () => {
      console.info('[rowReverseValid_0100] START');

      // 不设置 reverse，子组件保持原序
      // 使用 getComponentRect 获取组件位置信息
      let rowRect = CommonFunc.getComponentRect('row_reverse_valid');
      let text1Rect = CommonFunc.getComponentRect('row_reverse_valid_text1');
      let text2Rect = CommonFunc.getComponentRect('row_reverse_valid_text2');

      // 验证原序效果：
      expect(Math.floor(Math.abs(rowRect.left - text1Rect.left))).assertLessOrEqual(1);
      expect(Math.floor(Math.abs(text1Rect.right - text2Rect.left))).assertLessOrEqual(1);

      console.info('[rowReverseValid_0100] END');
    })
  })
}
