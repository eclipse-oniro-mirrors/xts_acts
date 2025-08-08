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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexAlign_SpaceBetween_fixedParentMarginFirst() {
  describe('FlexAlign_SpaceBetween_fixedParentMarginFirst', () => {
    beforeEach(async () => {
      console.info("FlexAlign_SpaceBetween_fixedParentMarginFirst beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedParentMarginFirst',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceBetween_fixedParentMarginFirst state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedParentMarginFirst" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedParentMarginFirst state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexAlign_SpaceBetween_fixedParentMarginFirst page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedParentMarginFirst page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedParentMarginFirst afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1400
     * @tc.name testAlignSpaceBetweenRowNoWrapMarginFirstInRange
     * @tc.desc Parent component fixed, child component binding margin properties, the layout space of the parent
     *               component meets the spindle layout requirements of the child component
     */
    it('testAlignSpaceBetweenRowNoWrapMarginFirstInRange', 0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstInRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween14');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween40');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween41');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween42');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween14');
      expect(Math.abs((Math.round(locationText1.top - locationFlex.top)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationFlex.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.top - locationFlex.top)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationText2.left - locationText1.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationText3.left - locationText2.right) * 10) / 10) - (Math.round(vp2px(5) * 10) / 10)) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstInRange END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1500
     * @tc.name testAlignSpaceBetweenRowNoWrapMarginFirstOutRange
     * @tc.desc Parent component fixed, child component binding margin properties, the layout space of the parent
     *               component is insufficient to meet the spindle layout requirements of the child component
     */
    it('testAlignSpaceBetweenRowNoWrapMarginFirstOutRange', 0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstOutRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 50
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween14');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween40');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween41');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween42');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween14');
      expect(Math.abs((Math.round(locationText1.top - locationFlex.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationFlex.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.top - locationFlex.top)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText2.right) - (locationText3.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(vp2px(400 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(400 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(400 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationText1.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstOutRange END');

    });
  })
}