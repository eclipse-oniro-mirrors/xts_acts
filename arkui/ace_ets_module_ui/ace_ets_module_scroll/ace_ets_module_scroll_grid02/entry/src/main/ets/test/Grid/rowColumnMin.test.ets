/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function rowColumnMin() {
  describe('rowColumnMin', () => {
    beforeEach(async (done: Function) => {
      console.info("rowColumnMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/rowColumnMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rowColumnMin state pages:" + JSON.stringify(pages));
        if (!("rowColumnMin" == pages.name)) {
          console.info("get rowColumnMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push rowColumnMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rowColumnMin page error:" + err);
      }
      console.info("rowColumnMin beforeEach end");
      done();
    });
    /**
     * @tc.name   rowColumnMin_0100
     * @tc.number rowColumnMin_0100
     * @tc.desc   set Grid rowStart, rowEnd, columnStart and columnEnd to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rowColumnMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[rowColumnMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('row_column_0');
      console.info("[rowColumnMin_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[rowColumnMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[rowColumnMin_0100] rowStart: " + JSON.stringify(JSON.parse(strJson).$attrs.rowStart));
      console.info("[rowColumnMin_0100] rowEnd: " + JSON.stringify(JSON.parse(strJson).$attrs.rowEnd));
      console.info("[rowColumnMin_0100] columnStart: " + JSON.stringify(JSON.parse(strJson).$attrs.columnStart));
      console.info("[rowColumnMin_0100] columnEnd: " + JSON.stringify(JSON.parse(strJson).$attrs.columnEnd));
      expect(JSON.parse(strJson).$type).assertEqual("GridItem");
      expect(JSON.parse(strJson).$attrs.rowStart).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.rowEnd).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.columnStart).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.columnEnd).assertEqual("0");

      let gridItem4 = CommonFunc.getComponentRectOnScreen('row_column_0');
      console.info("[rowColumnMin_0100] gridItem4 right is: " + gridItem4.right);
      let gridItem0 = CommonFunc.getComponentRectOnScreen('item_rc_0');
      console.info("[rowColumnMin_0100] gridItem0 left is: " + gridItem0.left);
      expect(Math.floor(Math.abs(gridItem0.left - gridItem4.right)) <= 1).assertTrue();
      console.info('[rowColumnMin_0100] END');
      done();
    });

    /**
     * @tc.name   rowColumnMin_0200
     * @tc.number rowColumnMin_0200
     * @tc.desc   set Grid rowStart, rowEnd, columnStart and columnEnd to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rowColumnMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[rowColumnMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('row_column_negative');
      console.info("[rowColumnMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[rowColumnMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[rowColumnMin_0200] rowStart: " + JSON.stringify(JSON.parse(strJson).$attrs.rowStart));
      console.info("[rowColumnMin_0200] rowEnd: " + JSON.stringify(JSON.parse(strJson).$attrs.rowEnd));
      console.info("[rowColumnMin_0200] columnStart: " + JSON.stringify(JSON.parse(strJson).$attrs.columnStart));
      console.info("[rowColumnMin_0200] columnEnd: " + JSON.stringify(JSON.parse(strJson).$attrs.columnEnd));
      expect(JSON.parse(strJson).$type).assertEqual("GridItem");

      let gridItem5 = CommonFunc.getComponentRectOnScreen('row_column_negative');
      console.info("[rowColumnMin_0100] gridItem5 left is: " + gridItem5.left);
      let gridItem10 = CommonFunc.getComponentRectOnScreen('item_rc_10');
      console.info("[rowColumnMin_0100] gridItem10 right is: " + gridItem10.right);
      expect(Math.floor(Math.abs(gridItem5.left - gridItem10.right)) <= 1).assertTrue();
      console.info('[rowColumnMin_0200] END');
      done();
    });
  })
}
