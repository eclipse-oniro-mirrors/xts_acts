/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';

export default function RowColMaxCount() {
  describe('RowColMaxCount', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_maxCountTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GridTemplatesAllSet/GridChange/RowCol_maxCount",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_maxCount state pages:" + JSON.stringify(pages));
        if (!("RowCol_maxCount" == pages.name)) {
          console.info("get Grid_RowCol_maxCount pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_maxCount page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_maxCount page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_RowCol_maxCountTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_maxCount after each called")
    });
    /**
     * @tc.name   testGridRowColGridMaxCount
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_1000
     * @tc.desc   The Grid layout maxCount property does not take effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridRowColGridMaxCount',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColGridMaxCount] START');
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_maxCount_01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let Grid_RowCol_maxCount_011 = CommonFunc.getComponentRect('Grid_RowCol_maxCount_011');
      let Grid_RowCol_maxCount_012 = CommonFunc.getComponentRect('Grid_RowCol_maxCount_012');
      let Grid_RowCol_maxCount_013 = CommonFunc.getComponentRect('Grid_RowCol_maxCount_013');
      let Grid_RowCol_maxCount_014 = CommonFunc.getComponentRect('Grid_RowCol_maxCount_014');
      let Grid_RowCol_maxCount_01 = CommonFunc.getComponentRect('Grid_RowCol_maxCount_01');
      expect(Math.abs(Grid_RowCol_maxCount_011.left - Grid_RowCol_maxCount_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_013.left - Grid_RowCol_maxCount_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_maxCount_011.right - Grid_RowCol_maxCount_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_013.right - Grid_RowCol_maxCount_014.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_maxCount_012.right - Grid_RowCol_maxCount_01.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_014.right - Grid_RowCol_maxCount_01.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_maxCount_011.top - Grid_RowCol_maxCount_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_012.top - Grid_RowCol_maxCount_01.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_maxCount_011.bottom - Grid_RowCol_maxCount_013.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_012.bottom - Grid_RowCol_maxCount_014.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_maxCount_013.bottom - Grid_RowCol_maxCount_01.bottom) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_014.bottom - Grid_RowCol_maxCount_01.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_maxCount_011.right - Grid_RowCol_maxCount_011.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_012.right - Grid_RowCol_maxCount_012.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_013.right - Grid_RowCol_maxCount_013.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_014.right - Grid_RowCol_maxCount_014.left - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_maxCount_011.bottom - Grid_RowCol_maxCount_011.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_012.bottom - Grid_RowCol_maxCount_012.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_013.bottom - Grid_RowCol_maxCount_013.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_maxCount_014.bottom - Grid_RowCol_maxCount_014.top - vp2px(150)) <= 1).assertTrue();
      console.info('[testGridRowColGridMaxCount] END');
      done();
    });
  })
}
