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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexAlign_SpaceBetween_fixedParentChangeFirst() {
  describe('FlexAlign_SpaceBetween_fixedParentChangeFirst', () => {
    beforeEach(async () => {
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirst beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedParentChangeFirst',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceBetween_fixedParentChangeFirst state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedParentChangeFirst" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedParentChangeFirst state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexAlign_SpaceBetween_fixedParentChangeFirst page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedParentChangeFirst page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirst afterEach called");
    });

    /**
     * @tc.name   testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight122
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1200
     * @tc.desc   Parent component fixed, child component binding layoutWeight first1 second2 third2 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight122',  Level.LEVEL0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight122 START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testFirstlayoutWeight', value: 1
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testSecondlayoutWeight', value: 2
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testThirdlayoutWeight', value: 2
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween12');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween34');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween35');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween36');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween12');
      expect(Math.abs((locationText1.top) - (locationText2.top)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationFlex.top)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationFlex.left)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((locationText1.right) - (locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right) - (locationText3.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight122 END');

    });

    /**
     * @tc.name   testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight120
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1600
     * @tc.desc   Parent component fixed, child component binding layoutWeight first1 second2 third0 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight120',  Level.LEVEL0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight120 START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testFirstlayoutWeight', value: 1
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testSecondlayoutWeight', value: 2
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testThirdlayoutWeight', value: 0
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween12');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween34');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween35');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween36');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween12');
      expect(Math.abs((locationText1.top) - (locationText2.top)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationFlex.top)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationFlex.left)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((locationText1.right) - (locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right) - (locationText3.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationText1.right - locationText1.left) * 10) / 10) - (Math.round(vp2px(350 / 3) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationText2.right - locationText2.left) * 10) / 10) - (Math.round(vp2px(700 / 3) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight120 END');

    });
  })
}