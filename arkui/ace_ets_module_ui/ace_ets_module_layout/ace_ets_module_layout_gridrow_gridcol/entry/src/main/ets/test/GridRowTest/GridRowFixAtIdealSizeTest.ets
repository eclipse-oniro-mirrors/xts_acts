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

export default function GridRowFixAtIdealSizeTest() {
  describe('GridRowFixAtIdealSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridRowFixAtIdealSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridRow/GridRowFixAtIdealSizePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRowFixAtIdealSizeTest state pages:" + JSON.stringify(pages));
        if (!("GridRowFixAtIdealSizePage" == pages.name)) {
          console.info("get GridRowFixAtIdealSizeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRowFixAtIdealSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRowFixAtIdealSizeTest page error:" + err);
      }
      console.info("GridRowFixAtIdealSizeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });
    
    /**
     * @tc.name   GridRowFixAtIdealSizeTest_0100
     * @tc.number GridRowFixAtIdealSizeTest_0100
     * @tc.desc   GridRowFixAtIdealSizeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridRowFixAtIdealSizeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[GridRowFixAtIdealSizeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('GridRowFixAtIdealSizePage_GridRow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRowFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      let column: RectValue = CommonFunc.getComponentRect('GridRowFixAtIdealSizePage_GridRow');
      let column_height = column.bottom - column.top;
      console.info("[GridRowFixAtIdealSizeTest_0100] column_height is: " + column_height);

      expect(obj.$attrs.height).assertEqual('50.00vp');
      expect(Math.floor(Math.abs(column_height - vp2px(50))) <= 1).assertTrue();

      let button = await driver.findComponent(ON.id('GridRowFixAtIdealSizePage_Btn'));
      await button.click();
      console.info("[GridRowFixAtIdealSizeTest_0100] change height=120");
      await Utils.sleep(1000)

      strJson = getInspectorByKey('GridRowFixAtIdealSizePage_GridRow');
      obj = JSON.parse(strJson);
      console.info("[GridRowFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      column = CommonFunc.getComponentRect('GridRowFixAtIdealSizePage_GridRow');
      column_height = column.bottom - column.top;
      console.info("[GridRowFixAtIdealSizeTest_0100] column_height is: " + column_height);

      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(Math.floor(Math.abs(column_height - vp2px(100))) <= 1).assertTrue();

      console.info('[GridRowFixAtIdealSizeTest_0100] END');
      done();
    });

  })
}