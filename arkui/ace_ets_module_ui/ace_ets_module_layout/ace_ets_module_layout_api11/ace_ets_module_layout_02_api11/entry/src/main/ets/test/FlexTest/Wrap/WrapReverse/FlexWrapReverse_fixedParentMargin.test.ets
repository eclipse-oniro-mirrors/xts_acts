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

export default function flexWrapReverse_fixedParentMargin() {
  describe('FlexWrapReverse_fixedParentMargin', () => {
    beforeEach(async () => {
      console.info("FlexWrapReverse_fixedParentMargin beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentMargin state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentMargin" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentMargin state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexWrapReverse_fixedParentMargin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentMargin page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentMargin afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0600
     * @tc.name testWrapReverseParentfixedMarginChildPadding
     * @tc.desc The parent component layout space is fixed, and the parent component setting margin,
     *               and sub component setting padding
     */
    it('testWrapReverseParentfixedMarginChildPadding', 0, async () => {
      console.info('new testWrapReverseParentfixedMarginChildPadding START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 0
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.abs(locationFlex.right - locationText1.right) <= 1).assertTrue()
      expect(Math.abs(locationText1.left - locationText2.right) <= 1).assertTrue()
      expect(Math.abs(locationText2.left - locationText3.right) <= 1).assertTrue()
      expect(Math.abs((locationText3.left - locationFlex.left) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue()
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue()
      expect(Math.abs(locationText3.top - locationFlex.top) <= 1).assertTrue()
      expect(Math.abs((locationFlex.bottom - locationText3.bottom) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedMarginChildPadding END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0700
     * @tc.name testWrapReverseParentfixedMarginChildMargin
     * @tc.desc The parent component layout space is fixed, and the parent component setting margin,
     *               and sub component setting margin
     */
    it('testWrapReverseParentfixedMarginChildMargin', 0, async () => {
      console.info('new testWrapReverseParentfixedMarginChildMargin START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 0
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 50
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.abs((locationFlex.right - locationText1.right) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText1.left - locationText2.right) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.left - locationFlex.left) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.left - locationText1.left) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationFlex.right) <= 1).assertTrue()
      expect(Math.abs((locationText1.top - locationFlex.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationFlex.top) <= 1).assertTrue()
      expect(Math.abs((locationText3.top - locationText2.bottom) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) <= 1).assertTrue()
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedMarginChildMargin END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0800
     * @tc.name testWrapReverseParentfixedMarginChildMarginAndPadding
     * @tc.desc The parent component layout space is fixed, and the parent component setting margin,
     *               and set padding and margin for sub component
     */
    it('testWrapReverseParentfixedMarginChildMarginAndPadding', 0, async () => {
      console.info('new testWrapReverseParentfixedMarginChildMarginAndPadding START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 30
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.abs(locationFlex.right - locationText1.right - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationText2.right - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationFlex.left - vp2px(140)) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText1.left - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationFlex.right) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationFlex.top - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationText2.bottom - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom - vp2px(40)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left - (locationText2.right - locationText2.left)) <= 1)
        .assertTrue();
      expect(Math.abs(locationText1.right - locationText1.left - (locationText2.right - locationText2.left)) <= 1)
        .assertTrue();
      expect(Math.abs(locationText1.right - locationText1.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedMarginChildMarginAndPadding END');

    });
  })
}