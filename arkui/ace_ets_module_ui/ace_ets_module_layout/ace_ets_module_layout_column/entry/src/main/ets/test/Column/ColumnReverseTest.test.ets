/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function ColumnReverseTest() {
  describe('ColumnReverseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ColumnReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnReversePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnReverseTest state pages:" + JSON.stringify(pages));
        if (!("ColumnReverseTest" == pages.name)) {
          console.info("get ColumnReverseTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnReverseTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnReverseTest page error:" + err);
      }
      console.info("ColumnReverseTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   ColumnReverseTest_0100
     * @tc.number ColumnReverseTest_0100
     * @tc.desc   test Column reverse is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ColumnReverseTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ColumnReverseTest_0100] START');
      await CommonFunc.sleep(1000);

      let Column_1 = CommonFunc.getComponentRect('ColumnReverse_Column_1');
      let Column_01 = CommonFunc.getComponentRect('ColumnReverse_Column_01');
      let Column_02 = CommonFunc.getComponentRect('ColumnReverse_Column_02');

      console.log('[ColumnReverseTest_0100] Column_01.top - Column_02.bottom', +(Column_01.top - Column_02.bottom));
      console.log('[ColumnReverseTest_0100] Column_01.bottom - Column_1.bottom', +(Column_01.bottom - Column_1.bottom));
      expect(Math.floor(Math.abs(Column_01.top - Column_02.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_01.bottom - Column_1.bottom)) <= 1).assertTrue();

      console.info('[ColumnReverseTest_0100] END');
      done();
    });

    /**
     * @tc.name   ColumnReverseTest_0200
     * @tc.number ColumnReverseTest_0200
     * @tc.desc   test Column reverse is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ColumnReverseTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ColumnReverseTest_0200] START');
      await CommonFunc.sleep(1000);

      let Column_2 = CommonFunc.getComponentRect('ColumnReverse_Column_2');
      let Column_03 = CommonFunc.getComponentRect('ColumnReverse_Column_03');
      let Column_04 = CommonFunc.getComponentRect('ColumnReverse_Column_04');

      console.log('[ColumnReverseTest_0200] Column_2.top - Column_03.top', +(Column_2.top - Column_03.top));
      console.log('[ColumnReverseTest_0200] Column_03.bottom - Column_04.top', +(Column_03.bottom - Column_04.top));
      expect(Math.floor(Math.abs(Column_2.top - Column_03.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_03.bottom - Column_04.top)) <= 1).assertTrue();

      console.info('[ColumnReverseTest_0200] END');
      done();
    });
  })
}