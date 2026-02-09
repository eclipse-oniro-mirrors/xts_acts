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

export default function RowFixAtIdealSizeTest() {
  describe('RowFixAtIdealSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RowFixAtIdealSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowFixAtIdealSizePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowFixAtIdealSizeTest state pages:" + JSON.stringify(pages));
        if (!("RowFixAtIdealSizePage" == pages.name)) {
          console.info("get RowFixAtIdealSizeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RowFixAtIdealSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowFixAtIdealSizeTest page error:" + err);
      }
      console.info("RowFixAtIdealSizeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });
    
    /**
     * @tc.name   RowFixAtIdealSizeTest_0100
     * @tc.number RowFixAtIdealSizeTest_0100
     * @tc.desc   RowFixAtIdealSizeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RowFixAtIdealSizeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[RowFixAtIdealSizeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RowFixAtIdealSizePage_Row');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RowFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RowFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      let row: RectValue = CommonFunc.getComponentRect('RowFixAtIdealSizePage_Row');
      let row_width = row.right - row.left;
      let row_height = row.bottom - row.top;
      console.info("[RowFixAtIdealSizeTest_0100] row_width is: " + row_width);
      console.info("[RowFixAtIdealSizeTest_0100] row_height is: " + row_height);

      expect(obj.$attrs.width).assertEqual('50.00vp');
      expect(obj.$attrs.height).assertEqual('50.00vp');
      expect(Math.floor(Math.abs(row_width - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(row_height - vp2px(50))) <= 1).assertTrue();

      let button = await driver.findComponent(ON.id('RowFixAtIdealSizePage_Btn'));
      await button.click();
      console.info("[RowFixAtIdealSizeTest_0100] change width=160，height=120");
      await Utils.sleep(1000)

      strJson = getInspectorByKey('RowFixAtIdealSizePage_Row');
      obj = JSON.parse(strJson);
      console.info("[RowFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RowFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      row = CommonFunc.getComponentRect('RowFixAtIdealSizePage_Row');
      row_width = row.right - row.left;
      row_height = row.bottom - row.top;
      console.info("[RowFixAtIdealSizeTest_0100] row_width is: " + row_width);
      console.info("[RowFixAtIdealSizeTest_0100] row_height is: " + row_height);

      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(Math.floor(Math.abs(row_width - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(row_height - vp2px(100))) <= 1).assertTrue();

      console.info('[RowFixAtIdealSizeTest_0100] END');
      done();
    });

  })
}