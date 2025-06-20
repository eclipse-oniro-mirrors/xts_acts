/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignEnd_NoSpace() {
  describe('AlignEnd_NoSpace', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_NoSpace'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_NoSpace state success " + JSON.stringify(pages));
        if (!("AlignEnd_NoSpace" == pages.name)) {
          console.info("get AlignEnd_NoSpace state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_NoSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignEnd_NoSpace page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_NoSpace after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0100
     * @tc.name testFlexAlignEndFlexWidthOverflow
     * @tc.desc The parent component layout space does not meet the interface display of the spindle layout of
     * the child component
     */
    it('testFlexAlignEndFlexWidthOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndFlexWidthOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadWidth', value: 400
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_NoSpace_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_NoSpace_011: RectValue = CommonFunc.getComponentRect('End_NoSpace_011');
      let End_NoSpace_012: RectValue = CommonFunc.getComponentRect('End_NoSpace_012');
      let End_NoSpace_013: RectValue = CommonFunc.getComponentRect('End_NoSpace_013');
      let End_NoSpace_01: RectValue = CommonFunc.getComponentRect('End_NoSpace_01');
      expect(Math.abs(End_NoSpace_011.top - End_NoSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_012.top - End_NoSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_011.top - End_NoSpace_01.top) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_011.left - End_NoSpace_01.left) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_012.left - End_NoSpace_011.right) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_013.left - End_NoSpace_012.right) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_013.right - End_NoSpace_01.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_011.bottom - End_NoSpace_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_012.bottom - End_NoSpace_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_013.bottom - End_NoSpace_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_011.right - End_NoSpace_011.left)) - (Math.round(vp2px(400 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_012.right - End_NoSpace_012.left)) - (Math.round(vp2px(400 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_013.right - End_NoSpace_013.left)) - (Math.round(vp2px(400 / 3)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndFlexWidthOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0200
     * @tc.name testFlexAlignEndFlexWidthMeet
     * @tc.desc The interface display where the parent component layout space satisfies the spindle layout of
     * the child component
     */
    it('testFlexAlignEndFlexWidthMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndFlexWidthMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadWidth', value: 500
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_NoSpace_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_NoSpace_011: RectValue = CommonFunc.getComponentRect('End_NoSpace_011');
      let End_NoSpace_012: RectValue = CommonFunc.getComponentRect('End_NoSpace_012');
      let End_NoSpace_013: RectValue = CommonFunc.getComponentRect('End_NoSpace_013');
      let End_NoSpace_01: RectValue = CommonFunc.getComponentRect('End_NoSpace_01');
      expect(Math.abs(End_NoSpace_011.top - End_NoSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_012.top - End_NoSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_011.top - End_NoSpace_01.top) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_012.left - End_NoSpace_011.right) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_013.left - End_NoSpace_012.right) <= 1).assertTrue();
      expect(Math.abs(End_NoSpace_013.right - End_NoSpace_01.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_011.left - End_NoSpace_01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_011.bottom - End_NoSpace_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_012.bottom - End_NoSpace_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_013.bottom - End_NoSpace_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_011.right - End_NoSpace_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_012.right - End_NoSpace_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_NoSpace_013.right - End_NoSpace_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndFlexWidthMeet] END');

    });
  })
}
