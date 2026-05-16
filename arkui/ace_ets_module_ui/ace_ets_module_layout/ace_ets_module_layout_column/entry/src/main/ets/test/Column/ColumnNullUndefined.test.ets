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
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

export default function ColumnNullUndefinedTest() {
  describe('ColumnNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("ColumnNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnNullUndefined state pages:" + JSON.stringify(pages));
        if (!("ColumnNullUndefined" == pages.name)) {
          console.info("get ColumnNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnNullUndefined page error:" + err);
      }
      console.info("ColumnNullUndefined beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   columnAlignItemsNullUndefined_0100
     * @tc.number SUB_ARKUI_COLUMN_ALIGNITEMS_NULL_0100
     * @tc.desc   Test Column alignItems property with null, should restore to default value HorizontalAlign.Center
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnAlignItemsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[columnAlignItemsNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('column_alignItems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('column_alignItems_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnAlignItemsNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[columnAlignItemsNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 HorizontalAlign.Center
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      expect(objCompare.$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.info('[columnAlignItemsNullUndefined_0100] END');
    })

    /**
     * @tc.name   columnAlignItemsNullUndefined_0200
     * @tc.number SUB_ARKUI_COLUMN_ALIGNITEMS_NULL_0200
     * @tc.desc   Test Column alignItems property with undefined, should restore to default value HorizontalAlign.Center
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnAlignItemsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[columnAlignItemsNullUndefined_0200] ' +
        '');

      let strJsonCompare: string = getInspectorByKey('column_alignItems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('column_alignItems_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnAlignItemsNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[columnAlignItemsNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 HorizontalAlign.Center
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      expect(objCompare.$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.info('[columnAlignItemsNullUndefined_0200] END');
    })

    /**
     * @tc.name   columnJustifyContentNullUndefined_0100
     * @tc.number SUB_ARKUI_COLUMN_JUSTIFYCONTENT_NULL_0100
     * @tc.desc   Test Column justifyContent property with null, should restore to default value FlexAlign.Start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnJustifyContentNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[columnJustifyContentNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('column_justifyContent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('column_justifyContent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnJustifyContentNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[columnJustifyContentNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 FlexAlign.Start
      expect(obj.$attrs.justifyContent).assertEqual(objCompare.$attrs.justifyContent);
      expect(objCompare.$attrs.justifyContent).assertEqual('FlexAlign.Start');
      console.info('[columnJustifyContentNullUndefined_0100] END');
    })

    /**
     * @tc.name   columnJustifyContentNullUndefined_0200
     * @tc.number SUB_ARKUI_COLUMN_JUSTIFYCONTENT_NULL_0200
     * @tc.desc   Test Column justifyContent property with undefined, should restore to default value FlexAlign.Start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnJustifyContentNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[columnJustifyContentNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('column_justifyContent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('column_justifyContent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnJustifyContentNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[columnJustifyContentNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 FlexAlign.Start
      expect(obj.$attrs.justifyContent).assertEqual(objCompare.$attrs.justifyContent);
      expect(objCompare.$attrs.justifyContent).assertEqual('FlexAlign.Start');
      console.info('[columnJustifyContentNullUndefined_0200] END');
    })

    /**
     * @tc.name   columnReverseNullUndefined_0100
     * @tc.number SUB_ARKUI_COLUMN_REVERSE_NULL_0100
     * @tc.desc   Test Column reverse property with null, should treat as default value true (反转)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnReverseNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[columnReverseNullUndefined_0100] START');

      // 验证位置：子组件应该反转排列
      let parentRect: RectValue = CommonFunc.getComponentRect('column_reverse_null');
      let child1Rect: RectValue = CommonFunc.getComponentRect('column_reverse_null_child1');
      let child2Rect: RectValue = CommonFunc.getComponentRect('column_reverse_null_child2');

      console.info("[columnReverseNullUndefined_0100] parent rect: " + JSON.stringify(parentRect));
      console.info("[columnReverseNullUndefined_0100] child1 rect: " + JSON.stringify(child1Rect));
      console.info("[columnReverseNullUndefined_0100] child2 rect: " + JSON.stringify(child2Rect));

      // 第一个子组件('1')在下面，其底部与父组件底部对齐，向下取整
      expect(Math.floor(Math.abs(child1Rect.bottom - parentRect.bottom)) <= 1).assertEqual(true);
      // 第二个子组件('2')在上面，其底部与第一个子组件的顶部对齐，向下取整
      expect(Math.floor(Math.abs(child2Rect.bottom - child1Rect.top)) <= 1).assertEqual(true);

      console.info('[columnReverseNullUndefined_0100] END');
    })

    /**
     * @tc.name   columnReverseNullUndefined_0200
     * @tc.number SUB_ARKUI_COLUMN_REVERSE_NULL_0200
     * @tc.desc   Test Column reverse property with undefined, should treat as default value true (反转)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnReverseNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[columnReverseNullUndefined_0200] START');

      // 验证位置：子组件应该反转排列
      let parentRect: RectValue = CommonFunc.getComponentRect('column_reverse_undefined');
      let child1Rect: RectValue = CommonFunc.getComponentRect('column_reverse_undefined_child1');
      let child2Rect: RectValue = CommonFunc.getComponentRect('column_reverse_undefined_child2');

      console.info("[columnReverseNullUndefined_0200] parent rect: " + JSON.stringify(parentRect));
      console.info("[columnReverseNullUndefined_0200] child1 rect: " + JSON.stringify(child1Rect));
      console.info("[columnReverseNullUndefined_0200] child2 rect: " + JSON.stringify(child2Rect));

      // 第一个子组件('1')在下面，其底部与父组件底部对齐，向下取整
      expect(Math.floor(Math.abs(child1Rect.bottom - parentRect.bottom)) <= 1).assertEqual(true);
      // 第二个子组件('2')在上面，其底部与第一个子组件的顶部对齐，向下取整
      expect(Math.floor(Math.abs(child2Rect.bottom - child1Rect.top)) <= 1).assertEqual(true);

      console.info('[columnReverseNullUndefined_0200] END');
    })
  })
}
