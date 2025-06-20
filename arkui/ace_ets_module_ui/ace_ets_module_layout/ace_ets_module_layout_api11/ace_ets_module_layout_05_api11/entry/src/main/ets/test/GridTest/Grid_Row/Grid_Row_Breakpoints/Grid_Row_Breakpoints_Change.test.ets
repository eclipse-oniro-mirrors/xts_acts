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

export default function Grid_Row_Breakpoints_Change() {
  describe('Grid_Row_Breakpoints_Change', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Breakpoints_Change beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Change",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Breakpoints_Change state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Change" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Change pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Breakpoints_Change page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Change page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Breakpoints_Change beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Breakpoints_Change after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWBREAKPOTINS_Value_0100
     * @tc.name testBreakpoints
     * @tc.desc Set the Breakpoints of GridRow to '50vp'
     */
    it('SUB_ACE_GridRowBreakpoints_Value_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowBreakpoints_Value_0100 START');
      globalThis.value.message.notify({
        name: 'width', value: '50vp'
      })
      await CommonFunc.sleep(2000)

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change2');

      expect(Math.abs(Math.round(secondBreakpoints.top - firstBreakpoints.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdBreakpoints.top - secondBreakpoints.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowBreakpoints_Value_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWBREAKPOTINS_Value_0200
     * @tc.name testBreakpoints
     * @tc.desc Set the Breakpoints of GridRow to '150vp'
     */
    it('SUB_ACE_GridRowBreakpoints_Value_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowBreakpoints_Value_0200 START');
      globalThis.value.message.notify({
        name: 'width', value: '150vp'
      })
      await CommonFunc.sleep(2000)

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change2');

      expect(Math.abs(Math.round(secondBreakpoints.left - firstBreakpoints.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdBreakpoints.top - firstBreakpoints.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowBreakpoints_Value_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWBREAKPOTINS_Value_0300
     * @tc.name testBreakpoints
     * @tc.desc Set the Breakpoints of GridRow to '300vp'
     */
    it('SUB_ACE_GridRowBreakpoints_Value_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowBreakpoints_Value_0300 START');
      globalThis.value.message.notify({
        name: 'width', value: '300vp'
      })
      await CommonFunc.sleep(2000)

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change2');
      let fourthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change3');
      let fifthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change4');

      expect(Math.abs(Math.round(secondBreakpoints.left - firstBreakpoints.right) - Math.round(vp2px(15))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdBreakpoints.left - secondBreakpoints.right) - Math.round(vp2px(15))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthBreakpoints.top - firstBreakpoints.bottom) - Math.round(vp2px(15))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fifthBreakpoints.top - secondBreakpoints.bottom) - Math.round(vp2px(15))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowBreakpoints_Value_0300 END');
      done();
    });

  })
}
