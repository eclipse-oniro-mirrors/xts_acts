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

export default function flexAlign_SpaceAround_fixedParentMarginFirst() {
  describe('FlexAlign_SpaceAround_fixedParentMarginFirst', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceAround_fixedParentMarginFirst beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedParentMarginFirst',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceAround_fixedParentMarginFirst state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceAround_fixedParentMarginFirst" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedParentMarginFirst state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceAround_fixedParentMarginFirst page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedParentMarginFirst page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedParentMarginFirst afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_1400
     * @tc.name      testAlignSpaceAroundRowNoWrapMarginFirstInRange
     * @tc.desc      Parent component fixed, child component binding margin properties, the layout space of the parent
     *               component meets the spindle layout requirements of the child component
     */
    it('testAlignSpaceAroundRowNoWrapMarginFirstInRange', 0, async function (done) {
      console.info('new testAlignSpaceAroundRowNoWrapMarginFirstInRange START');
      globalThis.value.message.notify({ name: 'margin', value: 20 })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround14');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceAround40');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceAround41');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceAround42');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceAround14');
      expect(Math.abs(locationText1.top - locationFlex.top) - vp2px(20) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top) - vp2px(100) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top) - vp2px(150) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) - vp2px(50) <= 1).assertTrue();

      expect(Math.abs(locationText1.right - locationText1.left) -
        (locationText2.right - locationText2.left) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left) -
        (locationText2.right - locationText2.left) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right) - vp2px(20) -
        (locationText3.left - locationText2.right) <= 1).assertTrue();

      expect(Math.abs(locationText2.right - locationText2.left) - vp2px(150) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left - vp2px(20)) -
        (locationFlex.right - locationText3.right) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right - vp2px(20)) -
        2 * (locationFlex.right - locationText3.right) <= 1).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapMarginFirstInRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_1500
     * @tc.name      testAlignSpaceAroundRowNoWrapMarginFirstOutRange
     * @tc.desc      Parent component fixed, child component binding margin properties, the layout space of the parent
     *               component is insufficient to meet the spindle layout requirements of the child component
     */
    it('testAlignSpaceAroundRowNoWrapMarginFirstOutRange', 0, async function (done) {
      console.info('new testAlignSpaceAroundRowNoWrapMarginFirstOutRange START');
      globalThis.value.message.notify({ name: 'margin', value: 50 })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround14');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceAround40');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceAround41');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceAround42');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceAround14');
      expect(Math.abs(locationText1.top - locationFlex.top) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top) - vp2px(100) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top) - vp2px(150) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(locationText2.right - locationText3.left) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationFlex.right) <= 1).assertTrue();
      expect(Math.abs(locationText1.right - locationText1.left) - vp2px(400 / 3) <= 1).assertTrue();
      expect(Math.abs(locationText2.right - locationText2.left) - vp2px(400 / 3) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left) - vp2px(400 / 3) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right) - vp2px(50) <= 1).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapMarginFirstOutRange END');
      done();
    });
  })
}