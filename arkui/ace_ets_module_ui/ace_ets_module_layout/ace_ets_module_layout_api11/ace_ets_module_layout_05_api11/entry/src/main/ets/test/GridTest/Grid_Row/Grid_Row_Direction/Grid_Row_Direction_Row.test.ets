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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function Grid_Row_Direction_Row() {
  describe('Grid_Row_Direction_Row', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Direction_Row beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Direction/Grid_Row_Direction_Row",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Direction_Row state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Direction_Row" == pages.name)) {
          console.info("get Grid_Row_Direction_Row pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Direction_Row page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Direction_Row page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Direction_Row beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Direction_Row after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWDIRECTIONROW_0100
     * @tc.name testDirectionRow
     * @tc.desc Set the Direction of GridRow to Row
     */
    it('SUB_ACE_GridRowDirection_Row_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowDirection_Row_0100 START');

      let DirectionRow_1: RectValue = CommonFunc.getComponentRect('DirectionRow_001');
      let firstDirectionRow: RectValue = CommonFunc.getComponentRect('DirectionRow_0');
      let secondDirectionRow: RectValue = CommonFunc.getComponentRect('DirectionRow_1');
      let thirdDirectionRow: RectValue = CommonFunc.getComponentRect('DirectionRow_2');
      let gridRowDirectionRowJson = getInspectorByKey('DirectionRow_001');
      expect(JSON.parse(gridRowDirectionRowJson).$type).assertEqual('GridRow');

      expect(Math.abs(firstDirectionRow.top - DirectionRow_1.top) <= 1).assertTrue();
      expect(Math.abs(firstDirectionRow.left - DirectionRow_1.left) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondDirectionRow.left - firstDirectionRow.right) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdDirectionRow.top - firstDirectionRow.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowDirection_Row_0100 END');
      done();
    });

  })
}
