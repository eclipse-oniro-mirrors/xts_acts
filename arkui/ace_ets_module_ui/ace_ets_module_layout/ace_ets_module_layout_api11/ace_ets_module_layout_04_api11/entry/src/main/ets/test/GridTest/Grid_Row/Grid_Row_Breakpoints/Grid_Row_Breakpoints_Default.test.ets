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

export default function Grid_Row_Breakpoints_Default() {
  describe('Grid_Row_Breakpoints_Default', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Breakpoints_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Breakpoints_Default state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Default" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Breakpoints_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Breakpoints_Default beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Breakpoints_Default after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWBREAKPOTINS_Default_0100
     * @tc.name testBreakpoints
     * @tc.desc Set the Breakpoints of GridRow to '300vp'
     */
    it('SUB_ACE_GridRowBreakpoints_Default_0100', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowBreakpoints_Default_0100 START');
      globalThis.value.message.notify({
        name: 'width', value: '300vp'
      })
      await CommonFunc.sleep(2000)

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Default0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Default1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Default2');

      expect(Math.abs(Math.round(secondBreakpoints.top - firstBreakpoints.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowBreakpoints_Default_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWBREAKPOTINS_Default_0200
     * @tc.name testBreakpoints
     * @tc.desc Set the Breakpoints of GridRow to default
     */
    it('SUB_ACE_GridRowBreakpoints_Default_0200', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowBreakpoints_Default_0200 START');
      globalThis.value.message.notify({
        name: 'width', value: '350vp'
      })
      await CommonFunc.sleep(2000)

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Default0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Default1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Default2');

      expect(Math.abs(Math.round(secondBreakpoints.left - firstBreakpoints.right) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdBreakpoints.top - firstBreakpoints.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowBreakpoints_Default_0200 END');
      done();
    });

  })
}
