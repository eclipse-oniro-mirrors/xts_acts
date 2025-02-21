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
import router from '@system.router';
import CommonFunc from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexAlign_SpaceAround_fixedChildParentPadding() {
  describe('FlexAlign_SpaceAround_fixedChildParentPadding', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceAround_fixedChildParentPadding beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedChildParentPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceAround_fixedChildParentPadding state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceAround_fixedChildParentPadding" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedChildParentPadding pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceAround_fixedChildParentPadding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedChildParentPadding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedChildParentPadding afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0300
     * @tc.name      testAlignSpaceAroundRowNoWrapPaddingOutRange
     * @tc.desc      The child component is fixed, and parent component is bound with padding attributes, the layout
     *               space of parent is insufficient to meet the spindle layout requirements of child component
     */
    it('testAlignSpaceAroundRowNoWrapPaddingOutRange', 0, async function (done) {
      console.info('new testAlignSpaceAroundRowNoWrapPaddingOutRange START');
      globalThis.value.message.notify({name:'padding', value:50})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround3');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceAround7');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceAround8');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceAround9');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceAround3');
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((locationText1.top - locationFlex.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((locationText1.left - locationFlex.left) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs(locationText1.right - locationText2.left) <= 1).assertTrue();
      expect(Math.abs(locationText2.right - locationText3.left) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - (locationFlex.right - vp2px(50))) <=1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right - locationText2.left) - vp2px(400/3)) <=2).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapPaddingOutRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0400
     * @tc.name      testAlignSpaceAroundRowNoWrapPaddingInRange
     * @tc.desc      The child component is fixed, and parent component is bound with padding attributes, the layout
     *               space of parent component meets the spindle layout requirements of the child component
     */
    it('testAlignSpaceAroundRowNoWrapPaddingInRange', 0, async function (done) {
      console.info('new testAlignSpaceAroundRowNoWrapPaddingInRange START');
      globalThis.value.message.notify({name:'padding', value:5})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround3');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceAround7');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceAround8');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceAround9');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceAround3');
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs((locationText1.top - locationFlex.top) - vp2px(5)) <=1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationFlex.bottom - locationText3.bottom) - vp2px(45)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right - locationText2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText2.left - locationText1.right) - (locationText3.left - locationText2.right)) <= 1).assertTrue();
      expect(Math.abs((locationText2.left - locationText1.right) - vp2px(40/3)) <= 1).assertTrue();
      expect(Math.abs((locationText1.left - locationFlex.left) - (locationFlex.right - locationText3.right)) <= 1).assertTrue();
      expect(Math.abs((locationText1.left - locationFlex.left) - vp2px(35/3)) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationText2.left - locationText1.right)/2) - Math.round((locationFlex.right - locationText3.right - Math.round(vp2px(5)))))) <= 1).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapPaddingInRange END');
      done();
    });
  })
}