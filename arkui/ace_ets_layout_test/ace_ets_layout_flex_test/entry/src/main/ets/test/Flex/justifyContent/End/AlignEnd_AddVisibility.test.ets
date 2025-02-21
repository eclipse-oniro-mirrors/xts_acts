/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignEnd_AddVisibility() {
  describe('AlignEnd_AddVisibility', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddVisibility state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddVisibility" == pages.name)) {
          console.info("get AlignEnd_AddVisibility state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignEnd_AddVisibility page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_1000
     * @tc.name testFlexAlignEndVisibilityNone
     * @tc.desc The subcomponent sets the visibility. None, the child components are hidden in the interface display
     */
    it('testFlexAlignEndVisibilityNone', 0, async () => {
      console.info('[testFlexAlignEndVisibilityNone] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('End_AddVisibility_01');

        let strJson2 = getInspectorByKey('End_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.None");
        let End_AddVisibility_012: RectValue = CommonFunc.getComponentRect('End_AddVisibility_012');
        let End_AddVisibility_013: RectValue = CommonFunc.getComponentRect('End_AddVisibility_013');
        let End_AddVisibility_01: RectValue = CommonFunc.getComponentRect('End_AddVisibility_01');
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_013.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_01.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.right) - (End_AddVisibility_013.left)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_013.right) - (End_AddVisibility_01.right)) <= 1).assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.left - End_AddVisibility_01.left)) - (Math.round(vp2px(200)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.right - End_AddVisibility_012.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right - End_AddVisibility_013.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.bottom - End_AddVisibility_012.top)) - (Math.round(vp2px(100)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.bottom - End_AddVisibility_013.top)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignEndVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignEndVisibilityNone] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_1100
     * @tc.name testFlexAlignEndVisibilityHidden
     * @tc.desc When the subcomponent sets visibility.hidden, the interface of the subcomponent does not occupy the
     * position
     */
    it('testFlexAlignEndVisibilityHidden', 0, async () => {
      console.info('[testFlexAlignEndVisibilityHidden] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Hidden
        })
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('End_AddVisibility_01');

        let strJson2 = getInspectorByKey('End_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Hidden");
        let End_AddVisibility_011: RectValue = CommonFunc.getComponentRect('End_AddVisibility_011');
        let End_AddVisibility_012: RectValue = CommonFunc.getComponentRect('End_AddVisibility_012');
        let End_AddVisibility_013: RectValue = CommonFunc.getComponentRect('End_AddVisibility_013');
        let End_AddVisibility_01: RectValue = CommonFunc.getComponentRect('End_AddVisibility_01');
        expect(Math.abs((Math.round(End_AddVisibility_011.top)) - (Math.round(End_AddVisibility_012.top))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.top)) - (Math.round(End_AddVisibility_013.top))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.top)) - (Math.round(End_AddVisibility_01.top))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.right)) - (Math.round(End_AddVisibility_012.left))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right)) - (Math.round(End_AddVisibility_01.right))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.left)) - (Math.round(End_AddVisibility_012.right))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.left - End_AddVisibility_01.left)) - (Math.round(vp2px(50)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.right - End_AddVisibility_011.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.right - End_AddVisibility_012.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right - End_AddVisibility_013.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.bottom - End_AddVisibility_011.top)) - (Math.round(vp2px(50)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.bottom - End_AddVisibility_012.top)) - (Math.round(vp2px(100)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.bottom - End_AddVisibility_013.top)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignEndVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignEndVisibilityHidden] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_1700
     * @tc.name testFlexAlignEndVisibilityVisible
     * @tc.desc The subcomponent sets the visibility. Visible, the subcomponent does not occupy a position in the
     * interface display
     */
    it('testFlexAlignEndVisibilityVisible', 0, async () => {
      console.info('[testFlexAlignEndVisibilityVisible] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Visible
        })
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('End_AddVisibility_01');

        let strJson2 = getInspectorByKey('End_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Visible");
        let End_AddVisibility_011: RectValue = CommonFunc.getComponentRect('End_AddVisibility_011');
        let End_AddVisibility_012: RectValue = CommonFunc.getComponentRect('End_AddVisibility_012');
        let End_AddVisibility_013: RectValue = CommonFunc.getComponentRect('End_AddVisibility_013');
        let End_AddVisibility_01: RectValue = CommonFunc.getComponentRect('End_AddVisibility_01');
        expect(Math.abs((End_AddVisibility_011.top) - (End_AddVisibility_012.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_013.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_01.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_011.right) - (End_AddVisibility_012.left)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_013.right) - (End_AddVisibility_01.right)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_013.left) - (End_AddVisibility_012.right)) <= 1).assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.left - End_AddVisibility_01.left)) - (Math.round(vp2px(50)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.right - End_AddVisibility_011.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.right - End_AddVisibility_012.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right - End_AddVisibility_013.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.bottom - End_AddVisibility_011.top)) - (Math.round(vp2px(50)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.bottom - End_AddVisibility_012.top)) - (Math.round(vp2px(100)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.bottom - End_AddVisibility_013.top)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignEndVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignEndVisibilityVisible] END');

    });
  })
}
