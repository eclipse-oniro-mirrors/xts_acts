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

export default function AlignSpaceEvenly_AddAllSpace() {
  describe('AlignSpaceEvenly_AddAllSpace', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddAllSpace'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddAllSpace state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddAllSpace" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddAllSpace state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddAllSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignAlignSpaceEvenly_AddAllSpace page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignAlignSpaceEvenly_AddAllSpace after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0600
     * @tc.name testFlexAlignSpaceEvenlyFlexSpaceOverflow
     * @tc.desc the space of parent component set to 30
     */
    it('testFlexAlignSpaceEvenlyFlexSpaceOverflow', 0, async () => {
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadAllSpace', value: 30
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddAllSpace_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddAllSpace_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_011');
      let SpaceEvenly_AddAllSpace_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_012');
      let SpaceEvenly_AddAllSpace_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_013');
      let SpaceEvenly_AddAllSpace_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01');
      let SpaceEvenly_AddAllSpace_01_Box: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01_Box');
      expect(Math.abs(Math.round(SpaceEvenly_AddAllSpace_011.top) - Math.round(SpaceEvenly_AddAllSpace_012.top)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddAllSpace_012.top) - Math.round(SpaceEvenly_AddAllSpace_013.top)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.top - SpaceEvenly_AddAllSpace_01.top)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_01.right - SpaceEvenly_AddAllSpace_013.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.left - SpaceEvenly_AddAllSpace_01.left)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddAllSpace_012.left) - Math.round(SpaceEvenly_AddAllSpace_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddAllSpace_013.left) - Math.round(SpaceEvenly_AddAllSpace_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_01.left - SpaceEvenly_AddAllSpace_01_Box.left)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_01.top - SpaceEvenly_AddAllSpace_01_Box.top)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.bottom - SpaceEvenly_AddAllSpace_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_012.bottom - SpaceEvenly_AddAllSpace_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_013.bottom - SpaceEvenly_AddAllSpace_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.right - SpaceEvenly_AddAllSpace_011.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_012.right - SpaceEvenly_AddAllSpace_012.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_013.right - SpaceEvenly_AddAllSpace_013.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0700
     * @tc.name testFlexAlignSpaceEvenlyFlexSpaceMeet
     * @tc.desc the space of parent component set to 20
     */
    it('testFlexAlignSpaceEvenlyFlexSpaceMeet', 0, async () => {
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadAllSpace', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddAllSpace_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddAllSpace_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_011');
      let SpaceEvenly_AddAllSpace_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_012');
      let SpaceEvenly_AddAllSpace_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_013');
      let SpaceEvenly_AddAllSpace_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01');
      let SpaceEvenly_AddAllSpace_01_Box: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01_Box');
      expect(Math.abs(Math.round(SpaceEvenly_AddAllSpace_011.top) - Math.round(SpaceEvenly_AddAllSpace_012.top)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddAllSpace_012.top) - Math.round(SpaceEvenly_AddAllSpace_013.top)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.top - SpaceEvenly_AddAllSpace_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_01.right - SpaceEvenly_AddAllSpace_013.right)) - (Math.round(vp2px(22.5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.left - SpaceEvenly_AddAllSpace_01.left)) - (Math.round(vp2px(22.5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_01.left - SpaceEvenly_AddAllSpace_01_Box.left)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_01.top - SpaceEvenly_AddAllSpace_01_Box.top)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.right - SpaceEvenly_AddAllSpace_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_012.right - SpaceEvenly_AddAllSpace_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_013.right - SpaceEvenly_AddAllSpace_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_011.bottom - SpaceEvenly_AddAllSpace_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_012.bottom - SpaceEvenly_AddAllSpace_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_013.bottom - SpaceEvenly_AddAllSpace_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddAllSpace_012.left - SpaceEvenly_AddAllSpace_011.right) - Math.round(SpaceEvenly_AddAllSpace_013.left - SpaceEvenly_AddAllSpace_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddAllSpace_012.left - SpaceEvenly_AddAllSpace_011.right)) - (Math.round(vp2px(2.5)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceMeet] END');

    });
  })
}
