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

export default function AlignEnd_AddAllSpace() {
  describe('AlignEnd_AddAllSpace', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddAllSpace'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddAllSpace state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddAllSpace" == pages.name)) {
          console.info("get AlignEnd_AddAllSpace state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddAllSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignAlignEnd_AddAllSpace page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignAlignEnd_AddAllSpace after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0600
     * @tc.name testFlexAlignEndFlexSpaceOverflow
     * @tc.desc the space of parent component set to 30
     */
    it('testFlexAlignEndFlexSpaceOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndFlexSpaceOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadAllSpace', value: 30
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddAllSpace_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddAllSpace_011: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_011');
      let End_AddAllSpace_012: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_012');
      let End_AddAllSpace_013: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_013');
      let End_AddAllSpace_01: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01');
      let End_AddAllSpace_01_Box: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01_Box');
      expect(Math.abs(End_AddAllSpace_011.top - End_AddAllSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(End_AddAllSpace_012.top - End_AddAllSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(End_AddAllSpace_012.left - End_AddAllSpace_011.right) <= 1).assertTrue();
      expect(Math.abs(End_AddAllSpace_013.left - End_AddAllSpace_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.left - End_AddAllSpace_01.left)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_01.right - End_AddAllSpace_013.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.top - End_AddAllSpace_01.top)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.bottom - End_AddAllSpace_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_012.bottom - End_AddAllSpace_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_013.bottom - End_AddAllSpace_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.right - End_AddAllSpace_011.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_012.right - End_AddAllSpace_012.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_013.right - End_AddAllSpace_013.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndFlexSpaceOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0700
     * @tc.name testFlexAlignEndFlexSpaceMeet
     * @tc.desc the space of parent component set to 20
     */
    it('testFlexAlignEndFlexSpaceMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndFlexSpaceMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadAllSpace', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddAllSpace_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddAllSpace_011: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_011');
      let End_AddAllSpace_012: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_012');
      let End_AddAllSpace_013: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_013');
      let End_AddAllSpace_01: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01');
      let End_AddAllSpace_01_Box: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01_Box');
      expect(Math.abs(End_AddAllSpace_011.top - End_AddAllSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(End_AddAllSpace_012.top - End_AddAllSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(End_AddAllSpace_012.left - End_AddAllSpace_011.right) <= 1).assertTrue();
      expect(Math.abs(End_AddAllSpace_013.left - End_AddAllSpace_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.left - End_AddAllSpace_01.left)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_01.right - End_AddAllSpace_013.right)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.top - End_AddAllSpace_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.right - End_AddAllSpace_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_012.right - End_AddAllSpace_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_013.right - End_AddAllSpace_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_011.bottom - End_AddAllSpace_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_012.bottom - End_AddAllSpace_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAllSpace_013.bottom - End_AddAllSpace_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndFlexSpaceMeet] END');

    });
  })
}
