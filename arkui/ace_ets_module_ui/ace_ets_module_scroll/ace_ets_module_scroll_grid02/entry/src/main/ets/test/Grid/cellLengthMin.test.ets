/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function cellLengthMin() {
  describe('cellLengthMin', () => {
    beforeEach(async (done: Function) => {
      console.info("cellLengthMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/cellLengthMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get cellLengthMin state pages:" + JSON.stringify(pages));
        if (!("cellLengthMin" == pages.name)) {
          console.info("get cellLengthMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push cellLengthMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push cellLengthMin page error:" + err);
      }
      console.info("cellLengthMin beforeEach end");
      done();
    });
    /**
     * @tc.name   cellLengthMin_0100
     * @tc.number cellLengthMin_0100
     * @tc.desc   set Grid cellLength to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cellLengthMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[cellLengthMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cellLength_0');
      console.info("[cellLengthMin_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[cellLengthMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[cellLengthMin_0100] cellLength: " + JSON.stringify(JSON.parse(strJson).$attrs.cellLength));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");

      let grid = CommonFunc.getComponentRectOnScreen('cellLength_0');
      let grid_height = grid.bottom - grid.top
      console.info("[cellLengthMin_0100] grid_height is: " + grid_height);
      let gridItem = CommonFunc.getComponentRectOnScreen('gi_cellLength_0');
      let gridItem_height = gridItem.bottom - gridItem.top
      console.info("[cellLengthMin_0100] gridItem_height is: " + gridItem_height);
      expect(Math.floor(Math.abs(grid_height - gridItem_height)) <= 1).assertTrue();
      console.info('[cellLengthMin_0100] END');
      done();
    });

    /**
     * @tc.name   cellLengthMin_0200
     * @tc.number cellLengthMin_0200
     * @tc.desc   set Grid cellLength to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cellLengthMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[cellLengthMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cellLength_1');
      console.info("[cellLengthMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[cellLengthMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[cellLengthMin_0200] cellLength: " + JSON.stringify(JSON.parse(strJson).$attrs.cellLength));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      expect(JSON.parse(strJson).$attrs.cellLength).assertEqual(1);
      console.info('[cellLengthMin_0200] END');
      done();
    });
  })
}
