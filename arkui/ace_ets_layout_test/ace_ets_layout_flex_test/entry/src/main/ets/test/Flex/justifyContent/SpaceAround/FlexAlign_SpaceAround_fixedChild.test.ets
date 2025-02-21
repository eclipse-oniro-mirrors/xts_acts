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

export default function flexAlign_SpaceAround_fixedChild() {
  describe('FlexAlign_SpaceAround_fixedChild', () => {
    beforeEach(async () => {
      console.info("FlexAlign_SpaceAround_fixedChild beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedChild',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceAround_fixedChild state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceAround_fixedChild" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedChild state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexAlign_SpaceAround_fixedChild page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedChild page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedChild afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0100
     * @tc.name testAlignSpaceAroundRowNoWrapOutRange
     * @tc.desc The child component is fixed, and parent component is bound with width and height attributes,
     *               the layout space of parent is insufficient to meet the spindle layout requirements of child
     */
    it('testAlignSpaceAroundRowNoWrapOutRange', 0, async () => {
      console.info('new testAlignSpaceAroundRowNoWrapOutRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 200
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 400
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround1');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceAround1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceAround2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceAround3');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceAround1');
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left) <= 2).assertTrue();
      expect(Math.abs(locationText1.right - locationText2.left) <= 2).assertTrue();
      expect(Math.abs(locationText2.right - locationText3.left) <= 2).assertTrue();
      expect(Math.abs(locationText3.right - locationFlex.right) <= 2).assertTrue();

      expect(Math.abs(locationText1.right - locationText1.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left -
        (locationText2.right - locationText2.left)) <= 2).assertTrue();
      expect(Math.abs(locationText2.right - locationText2.left - vp2px(400 / 3)) <= 2).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapOutRange END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0200
     * @tc.name testAlignSpaceAroundRowNoWrapInRange
     * @tc.desc The child component is fixed, and parent component is bound with width and height attributes,
     *               the layout space of parent meets the spindle layout requirements of child
     */
    it('testAlignSpaceAroundRowNoWrapInRange', 0, async () => {
      console.info('new testAlignSpaceAroundRowNoWrapInRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 200
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 500
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround1');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceAround1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceAround2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceAround3');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceAround1');
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.right - locationText1.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText2.right - locationText2.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right -
        (locationText3.left - locationText2.right)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right - vp2px(50 / 3)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left -
        (locationFlex.right - locationText3.right)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left - vp2px(25 / 3)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right -
        2 * (locationFlex.right - locationText3.right)) <= 2).assertTrue(); //
      console.info('new testAlignSpaceAroundRowNoWrapInRange END');

    });
  })
}