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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ColumnFixAtIdealSizeTest() {
  describe('ColumnFixAtIdealSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ColumnFixAtIdealSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnFixAtIdealSizePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnFixAtIdealSizeTest state pages:" + JSON.stringify(pages));
        if (!("ColumnFixAtIdealSizePage" == pages.name)) {
          console.info("get ColumnFixAtIdealSizeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnFixAtIdealSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnFixAtIdealSizeTest page error:" + err);
      }
      console.info("ColumnFixAtIdealSizeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });
    
    /**
     * @tc.name   ColumnFixAtIdealSizeTest_0100
     * @tc.number ColumnFixAtIdealSizeTest_0100
     * @tc.desc   ColumnFixAtIdealSizeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ColumnFixAtIdealSizeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ColumnFixAtIdealSizeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ColumnFixAtIdealSizePage_Column');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ColumnFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[ColumnFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      let column: RectValue = CommonFunc.getComponentRect('ColumnFixAtIdealSizePage_Column');
      let column_width = column.right - column.left;
      let column_height = column.bottom - column.top;
      console.info("[ColumnFixAtIdealSizeTest_0100] column_width is: " + column_width);
      console.info("[ColumnFixAtIdealSizeTest_0100] column_height is: " + column_height);

      expect(Math.floor(Math.abs(column_width - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(column_height - vp2px(50))) <= 1).assertTrue();

      let button = await driver.findComponent(ON.id('ColumnFixAtIdealSizePage_Btn'));
      await button.click();
      console.info("[ColumnFixAtIdealSizeTest_0100] change width=160，height=120");
      await Utils.sleep(1000)

      strJson = getInspectorByKey('ColumnFixAtIdealSizePage_Column');
      obj = JSON.parse(strJson);
      console.info("[ColumnFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[ColumnFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      column = CommonFunc.getComponentRect('ColumnFixAtIdealSizePage_Column');
      column_width = column.right - column.left;
      column_height = column.bottom - column.top;
      console.info("[ColumnFixAtIdealSizeTest_0100] column_width is: " + column_width);
      console.info("[ColumnFixAtIdealSizeTest_0100] column_height is: " + column_height);

      expect(Math.floor(Math.abs(column_width - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(column_height - vp2px(100))) <= 1).assertTrue();

      console.info('[ColumnFixAtIdealSizeTest_0100] END');
      done();
    });

  })
}