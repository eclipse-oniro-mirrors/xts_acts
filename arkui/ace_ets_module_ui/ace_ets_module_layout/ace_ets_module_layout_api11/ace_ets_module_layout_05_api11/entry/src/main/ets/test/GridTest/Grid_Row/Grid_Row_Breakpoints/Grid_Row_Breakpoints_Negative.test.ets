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

export default function Grid_Row_Breakpoints_Negative() {
  describe('Grid_Row_Breakpoints_Negative', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Breakpoints_Negative beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Negative",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Breakpoints_Negative state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Negative" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Negative pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Breakpoints_Negative page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Negative page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Breakpoints_Negative beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Breakpoints_Negative after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWBREAKPOTINS_Negative_0100
     * @tc.name testBreakpoints
     * @tc.desc The breakpoint range value cannot be negative
     */
    it('SUB_ACE_GridRowBreakpoints_Negative_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowBreakpoints_Negative_0100 START');
      await CommonFunc.sleep(2000)

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Negative0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Negative1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Negative2');
      let fourthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Negative3');
      let fifthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Negative4');

      expect(Math.abs(Math.round(secondBreakpoints.top - firstBreakpoints.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdBreakpoints.top - secondBreakpoints.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthBreakpoints.top - thirdBreakpoints.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fifthBreakpoints.top - fourthBreakpoints.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      console.info('SUB_ACE_GridRowBreakpoints_Negative_0100 END');
      done();
    });

  })
}
