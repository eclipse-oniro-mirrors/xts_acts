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
export default function GridRow_onBreakpoint() {
  describe('GridRow_onBreakpoint', function () {
    beforeEach(async function (done) {
      console.info("GridRow_onBreakpoint beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_Row/onBreakpointChange/onBreakpointChange",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRow_onBreakpoint state pages:" + JSON.stringify(pages));
        if (!("GridRow_onBreakpoint" == pages.name)) {
          console.info("get GridRow_onBreakpoint pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRow_onBreakpoint page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRow_onBreakpoint page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("GridRow_onBreakpoint beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("GridRow_onBreakpoint after each called")
    });

    /**
     * @tc.number    SUB_ACE_GRIDROWONBREAKPOINTCHANGE_0100
     * @tc.name      testOnBreakChange
     * @tc.desc      Trigger event printing xxl
     */
    it('SUB_ACE_GridRow_onBreakPointChange_0100', 0, async function (done) {
      console.info('SUB_ACE_GridRow_onBreakPointChange_0100 START');
      await CommonFunc.sleep(2000)

      let Breakpoint_1 = CommonFunc.getComponentRect('GridRow_onBreakpoint001');
      let firstBreakpoint = CommonFunc.getComponentRect('GridRow_onBreakpoint_0');
      let secondBreakpoint = CommonFunc.getComponentRect('GridRow_onBreakpoint_1');
      let thirdBreakpoint = CommonFunc.getComponentRect('GridRow_onBreakpoint_2');
      let fourthBreakpoint = CommonFunc.getComponentRect('GridRow_onBreakpoint_3');
      let fifthBreakpoint = CommonFunc.getComponentRect('GridRow_onBreakpoint_4');
      let sixthBreakpoint = CommonFunc.getComponentRect('GridRow_onBreakpoint_5');
      let seventhBreakpoint = CommonFunc.getComponentRect('GridRow_onBreakpoint_6');
      let gridRowBreakpointJson = getInspectorByKey('GridRow_onBreakpoint001');
      let gridRow = JSON.parse(gridRowBreakpointJson);
      let textComponent2 = getInspectorByKey('GridRowText');
      let text2 = JSON.parse(textComponent2);
      expect(gridRow.$type).assertEqual('GridRow');
      expect(text2.$attrs.content).assertEqual('xxl');

      expect(Math.abs(firstBreakpoint.top - Breakpoint_1.top) <= 1).assertTrue();
      expect(Math.abs(secondBreakpoint.top - secondBreakpoint.top) <= 1).assertTrue();
      expect(Math.abs(thirdBreakpoint.top - thirdBreakpoint.top) <= 1).assertTrue();
      expect(Math.abs(firstBreakpoint.left - Breakpoint_1.left) <= 1).assertTrue();

      expect(Math.round(secondBreakpoint.left - firstBreakpoint.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(thirdBreakpoint.left - secondBreakpoint.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(fourthBreakpoint.left - thirdBreakpoint.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(seventhBreakpoint.top - firstBreakpoint.bottom)).assertEqual(Math.round(vp2px(30)));

      console.info('SUB_ACE_GridRow_onBreakPointChange_0100 END');
      done();
    });

  })
}
