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
export default function Grid_Row_Breakpoints_Component() {
  describe('Grid_Row_Breakpoints_Component', function () {
    beforeEach(async function (done) {
      console.info("Grid_Row_Breakpoints_Component beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Component",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Breakpoints_Component state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Component" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Component pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Breakpoints_Component page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Component page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Breakpoints_Component beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Breakpoints_Component after each called")
    });

    /**
     * @tc.number    SUB_ACE_GRIDROWBREAKPOTINS_0100
     * @tc.name      testBreakpoints
     * @tc.desc      Set the reference to ComponentSize
     */
    it('SUB_ACE_GridRowBreakpoints_Component_0100', 0, async function (done) {
      console.info('SUB_ACE_GridRowBreakpoints_Component_0100 START');
      await CommonFunc.sleep(2000)

      let firstBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Component0');
      let secondBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Component1');
      let thirdBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Component2');
      let fourthBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Component3');
      let fifthBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Component4');

      expect(Math.round(secondBreakpoints.left - firstBreakpoints.right)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(thirdBreakpoints.left - secondBreakpoints.right)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(fourthBreakpoints.left - thirdBreakpoints.right)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(fifthBreakpoints.top - firstBreakpoints.bottom)).assertEqual(Math.round(vp2px(20)));

      console.info('SUB_ACE_GridRowBreakpoints_Component_0100 END');
      done();
    });

  })
}
