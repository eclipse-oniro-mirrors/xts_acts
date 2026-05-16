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

export default function GridRowBreakpoints_Value1() {
  describe('Grid_Row_Breakpoints_Incremental', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Breakpoints_Incremental beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Incremental",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Breakpoints_Incremental state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Incremental" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Incremental pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Breakpoints_Incremental page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Incremental page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Breakpoints_Incremental beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("GridRowBreakpoints_Value1 after each called")
    });

    /**
     * @tc.name   SUB_ACE_GridRowBreakpoints_0100
     * @tc.number SUB_ACE_GridRowBreakpoints_0100
     * @tc.desc   The breakpoint range value monotonically increases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GridRowBreakpoints_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowBreakpoints_0100 START');
      await CommonFunc.sleep(2000)

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental2');
      let fourthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental3');
      let fifthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental4');

      expect(Math.floor(Math.abs((secondBreakpoints.left - firstBreakpoints.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdBreakpoints.left - secondBreakpoints.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthBreakpoints.left - thirdBreakpoints.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fifthBreakpoints.top - firstBreakpoints.bottom) - vp2px(20))) <= 1).assertTrue();
      console.info('SUB_ACE_GridRowBreakpoints_0100 END');
      done();
    });

  })
}
