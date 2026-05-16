/*
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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ColumnMatchParentNewSecondTest() {
  describe('ColumnMatchParentNewSecondTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ColumnMatchParentNewSecondTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnMatchParentNewSecond',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnMatchParentNewSecond state pages:" + JSON.stringify(pages));
        if (!("ColumnMatchParent" == pages.name)) {
          console.info("get ColumnMatchParentNewSecond pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnMatchParentNewSecond page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnMatchParentNewSecond page error:" + err);
      }
      console.info("ColumnMatchParentNewSecond beforeEach end");
      done();
    });
    afterEach(async () => {
    });


    /**
     * @tc.name   ColumnMatchParentNewSecondTest_0100
     * @tc.number SUB_ARKUI_API_ColumnMatchParentNewSecondTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ColumnMatchParentNewSecondTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ColumnMatchParentNewSecondTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('ColumnParentMatchParentSecond');
      console.info("[ColumnMatchParentNewSecondTest_0100] width is: " + JSON.parse(strJson1).$attrs.width);
      console.info("[ColumnMatchParentNewSecondTest_0100] height is: " + JSON.parse(strJson1).$attrs.height);
      
      expect(Math.floor(Math.abs(parseFloat(JSON.parse(strJson1).$attrs.width) - 110)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(parseFloat(JSON.parse(strJson1).$attrs.height) - 95)) <= 1).assertTrue();

      console.info('[ColumnMatchParentNewSecondTest_0100] END');
      done();
    });
  })
}