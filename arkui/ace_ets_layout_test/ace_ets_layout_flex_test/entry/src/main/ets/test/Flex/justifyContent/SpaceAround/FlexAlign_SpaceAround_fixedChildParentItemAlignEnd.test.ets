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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexAlign_SpaceAround_fixedChildParentItemAlignEnd() {
  describe('FlexAlign_SpaceAround_fixedChildParentItemAlignEnd', () => {
    beforeEach(async () => {
      console.info("FlexAlign_SpaceAround_fixedChildParentItemAlignEnd beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedChildParentItemAlignEnd',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceAround_fixedChildParentItemAlignEnd state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceAround_fixedChildParentItemAlignEnd" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedChildParentItemAlignEnd pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexAlign_SpaceAround_fixedChildParentItemAlignEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedChildParentItemAlignEnd page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedChildParentItemAlignEnd afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0800
     * @tc.name testAlignSpaceAroundRowNoWrapAlignmentBottomEnd
     * @tc.desc The child component is fixed, and the parent component is bound with Alignment.BottomEnd attributes
     */
    it('testAlignSpaceAroundRowNoWrapAlignmentBottomEnd', 0, async () => {
      console.info('new testAlignSpaceAroundRowNoWrapAlignmentBottomEnd START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 200
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 500
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround8');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceAround22');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceAround23');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceAround24');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceAround8');
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationFlex.top) - vp2px(0) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top) - vp2px(100) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top) - vp2px(150) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(locationText1.right - locationText1.left) -
        (locationText2.right - locationText2.left) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left) -
        (locationText2.right - locationText2.left) <= 1).assertTrue();
      expect(Math.abs(locationText2.right - locationText2.left) - vp2px(150) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right) -
        (locationText3.left - locationText2.right) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right) - vp2px(50 / 3) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left) -
        (locationFlex.right - locationText3.right) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left) - vp2px(25 / 3) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right) -
        2 * (locationFlex.right - locationText3.right) <= 1).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapAlignmentBottomEnd END');

    });
  })
}