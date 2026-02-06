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

export default function AlignSpaceEvenly_NoSpace() {
  describe('AlignSpaceEvenly_NoSpace', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_NoSpace'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_NoSpace state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_NoSpace" == pages.name)) {
          console.info("get AlignSpaceEvenly_NoSpace state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_NoSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_NoSpace page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_NoSpace after each called");
    });

    /**
     * @tc.name   testFlexAlignSpaceEvenlyFlexWidthOverflow
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0100
     * @tc.desc   The parent component layout space does not meet the interface display of the spindle layout of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignSpaceEvenlyFlexWidthOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignSpaceEvenlyFlexWidthOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadWidth', value: 400
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_NoSpace_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_NoSpace_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_011');
      let SpaceEvenly_NoSpace_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_012');
      let SpaceEvenly_NoSpace_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_013');
      let SpaceEvenly_NoSpace_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_01');
      expect(Math.abs(SpaceEvenly_NoSpace_011.top - SpaceEvenly_NoSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_012.top - SpaceEvenly_NoSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_011.top - SpaceEvenly_NoSpace_01.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_011.left - SpaceEvenly_NoSpace_01.left) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_01.right - SpaceEvenly_NoSpace_013.right) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_012.left - SpaceEvenly_NoSpace_011.right) <= 2).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_013.left - SpaceEvenly_NoSpace_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_011.right - SpaceEvenly_NoSpace_011.left)) - (Math.round(vp2px(400 / 3)))) <= 2)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_012.right - SpaceEvenly_NoSpace_012.left)) - (Math.round(vp2px(400 / 3)))) <= 2)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_013.right - SpaceEvenly_NoSpace_013.left)) - (Math.round(vp2px(400 / 3)))) <= 2)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_011.bottom - SpaceEvenly_NoSpace_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_012.bottom - SpaceEvenly_NoSpace_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_013.bottom - SpaceEvenly_NoSpace_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0100] END');

    });
    /**
     * @tc.name   testFlexAlignSpaceEvenlyFlexWidthMeet
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0200
     * @tc.desc   The interface display where the parent component layout space satisfies the spindle layout of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignSpaceEvenlyFlexWidthMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignSpaceEvenlyFlexWidthMeet] START');
      let strJson = getInspectorByKey('SpaceEvenly_NoSpace_01');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadWidth', value: 500
      });
      await CommonFunc.sleep(3000);

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_NoSpace_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_011');
      let SpaceEvenly_NoSpace_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_012');
      let SpaceEvenly_NoSpace_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_013');
      let SpaceEvenly_NoSpace_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_NoSpace_01');
      expect(Math.abs(SpaceEvenly_NoSpace_011.top - SpaceEvenly_NoSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_012.top - SpaceEvenly_NoSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_NoSpace_011.top - SpaceEvenly_NoSpace_01.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_012.left - SpaceEvenly_NoSpace_011.right)) - (Math.round(vp2px(12.5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_011.left - SpaceEvenly_NoSpace_01.left)) - (Math.round(vp2px(12.5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_013.left - SpaceEvenly_NoSpace_012.right)) - (Math.round(vp2px(12.5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_NoSpace_01.right - SpaceEvenly_NoSpace_013.right)) - (Math.round(vp2px(12.5)))) <= 1)
        .assertTrue();


      expect(Math.abs(Math.round(SpaceEvenly_NoSpace_011.right - SpaceEvenly_NoSpace_011.left) - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_NoSpace_012.right - SpaceEvenly_NoSpace_012.left) - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_NoSpace_013.right - SpaceEvenly_NoSpace_013.left) - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_NoSpace_011.bottom - SpaceEvenly_NoSpace_011.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_NoSpace_012.bottom - SpaceEvenly_NoSpace_012.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_NoSpace_013.bottom - SpaceEvenly_NoSpace_013.top) - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignSpaceEvenlyFlexWidthMeet] END');

    });
  });
}
