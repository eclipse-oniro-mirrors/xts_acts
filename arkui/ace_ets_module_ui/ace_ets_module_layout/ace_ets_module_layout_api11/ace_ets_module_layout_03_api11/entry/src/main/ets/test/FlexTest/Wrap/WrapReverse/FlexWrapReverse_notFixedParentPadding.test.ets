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
import GlobalContext from '../../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexWrapReverse_notFixedParentPadding() {
  describe('FlexWrapReverse_notFixedParentPadding', () => {
    beforeEach(async () => {
      console.info("FlexWrapReverse_notFixedParentPadding beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_notFixedParentPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_notFixedParentPadding state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_notFixedParentPadding" == pages.name)) {
          console.info("get FlexWrapReverse_notFixedParentPadding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexWrapReverse_notFixedParentPadding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_notFixedParentPadding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_notFixedParentPadding afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0400
     * @tc.name testWrapReverseChildfixedParentPaddingInRange
     * @tc.desc The parent component changes location and space of layout, affecting layout of child components,
     *               parent component setting padding, the remaining layout space meets the requirements
     */
    it('testWrapReverseChildfixedParentPaddingInRange',  Level.LEVEL0, async () => {
      console.info('new testWrapReverseChildfixedParentPaddingInRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 300
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 500
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest4');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      //expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest10');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest11');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest12');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest4');
      expect(Math.floor(Math.abs((locationFlex.right - locationText1.right) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.left - locationText2.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.left - locationText3.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationFlex.left) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.top - locationText2.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.top - locationText3.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.top - locationFlex.top) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - (locationText1.right - locationText1.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - (locationText3.right - locationText3.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1).assertTrue();
      console.info('new testWrapReverseChildfixedParentPaddingInRange END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0500
     * @tc.name testWrapReverseChildfixedParentPaddingOutRange
     * @tc.desc The parent component changes location and space of layout, affecting layout of child components,
     *               parent component setting padding, the remaining layout space does not meet the requirements
     */
    it('testWrapReverseChildfixedParentPaddingOutRange',  Level.LEVEL0, async () => {
      console.info('new testWrapReverseChildfixedParentPaddingOutRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 300
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 500
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 30
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest4');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest10');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest11');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest12');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest4');
      expect(Math.floor(Math.abs((locationFlex.right - locationText1.right) - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.left - locationText2.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationFlex.left) - vp2px(170))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.left - locationText1.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.right - locationText1.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.top - locationText2.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationFlex.top) - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.top - locationText2.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationFlex.bottom - locationText3.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1).assertTrue();
      console.info('new testWrapReverseChildfixedParentPaddingOutRange END');

    });
  })
}