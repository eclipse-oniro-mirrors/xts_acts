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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function Grid_Row_Direction_RowReverse() {
  describe('Grid_Row_Direction_RowReverse', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Direction_RowReverse beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Direction/Grid_Row_Direction_RowReverse",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Direction_RowReverse state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Direction_RowReverse" == pages.name)) {
          console.info("get Grid_Row_Direction_RowReverse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Direction_RowReverse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Direction_RowReverse page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Direction_RowReverse beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Direction_RowReverse after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWDIRECTIONROWREVERSE_0100
     * @tc.name testDirectionRowReverse
     * @tc.desc Set the Direction of GridRow to RowReverse
     */
    it('SUB_ACE_GridRowDirection_RowReverse_0100', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowDirection_RowReverse_0100 START');
      await CommonFunc.sleep(2000)

      let DirectionRowReverse_1: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_001');
      let firstDirectionRowReverse: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_0');
      let secondDirectionRowReverse: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_1');
      let thirdDirectionRowReverse: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_2');
      let gridRowDirectionRowReverseJson = getInspectorByKey('DirectionRowReverse_001');
      expect(JSON.parse(gridRowDirectionRowReverseJson).$type).assertEqual('GridRow');

      expect(Math.abs(firstDirectionRowReverse.top - DirectionRowReverse_1.top) <= 1).assertTrue();
      expect(Math.abs(firstDirectionRowReverse.right - DirectionRowReverse_1.right) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstDirectionRowReverse.left - secondDirectionRowReverse.right) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdDirectionRowReverse.top - firstDirectionRowReverse.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowDirection_RowReverse_0100 END');
      done();
    });

  })
}
