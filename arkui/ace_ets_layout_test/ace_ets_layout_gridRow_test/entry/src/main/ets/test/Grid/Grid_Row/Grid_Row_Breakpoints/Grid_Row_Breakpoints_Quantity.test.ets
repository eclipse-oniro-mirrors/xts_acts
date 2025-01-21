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
import CommonFunc from '../../../../MainAbility/common/Common';
export default function Grid_Row_Breakpoints_Quantity() {
  describe('Grid_Row_Breakpoints_Quantity', function () {
    beforeEach(async function (done) {
      console.info("Grid_Row_Breakpoints_Quantity beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Quantity",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Breakpoints_Quantity state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Quantity" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Quantity pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Breakpoints_Quantity page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Quantity page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Breakpoints_Quantity beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Breakpoints_Quantity after each called")
    });

    /**
     * @tc.number    SUB_ACE_GRIDROWBREAKPOTINS_0100
     * @tc.name      testBreakpoints
     * @tc.desc      The number of breakpoint ranges cannot exceed the number of values that can be taken
     */
    it('SUB_ACE_GridRowBreakpoints_Quantity_0100', 0, async function (done) {
      console.info('SUB_ACE_GridRowBreakpoints_Quantity_0100 START');
      await CommonFunc.sleep(2000)

      let firstBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Quantity0');
      let secondBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Quantity1');
      let thirdBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Quantity2');
      let fourthBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Quantity3');
      let fifthBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Quantity4');

      expect(Math.abs(Math.round(secondBreakpoints.top - firstBreakpoints.bottom) - Math.round(vp2px(5))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdBreakpoints.top - secondBreakpoints.bottom) - Math.round(vp2px(5))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthBreakpoints.top - thirdBreakpoints.bottom) - Math.round(vp2px(5))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fifthBreakpoints.top - fourthBreakpoints.bottom) - Math.round(vp2px(5))) <= 1).assertTrue();
      console.info('SUB_ACE_GridRowBreakpoints_Quantity_0100 END');
      done();
    });

  })
}
