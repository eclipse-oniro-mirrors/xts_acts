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

export default function flexWrapReverse_fixedParent() {
  describe('FlexWrapReverse_fixedParent', () => {
    beforeEach(async () => {
      console.info("FlexWrapReverse_fixedParent beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParent state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParent" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexWrapReverse_fixedParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParent afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0100
     * @tc.name testWrapReverseParentfixedChangeChildWidthLessThanParent
     * @tc.desc The layout space of the parent component is fixed, and the size of the child component is changed,
     *               child component width is smaller than parent component width
     */
    it('testWrapReverseParentfixedChangeChildWidthLessThanParent', 0, async () => {
      console.info('new testWrapReverseParentfixedChangeChildWidthLessThanParent START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 150
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest8');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest22');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest23');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest24');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest8');

      expect(Math.abs(locationText1.right - locationFlex.right) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationText2.right) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText3.right) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationFlex.left) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationFlex.top) <= 1).assertTrue();

      expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationFlex.bottom - locationText3.bottom) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.right - locationText2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.right - locationText3.left) - vp2px(150)) <= 1).assertTrue();

      console.info('new testWrapReverseParentfixedChangeChildWidthLessThanParent END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0200
     * @tc.name testWrapReverseParentfixedChangeChildWidthLargerThanParent
     * @tc.desc The layout space of the parent component is fixed, and the size of the child component is changed,
     *               child component width is larger than parent component width
     */
    it('testWrapReverseParentfixedChangeChildWidthLargerThanParent', 0, async () => {
      console.info('new testWrapReverseParentfixedChangeChildWidthLargerThanParent START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 200
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest8');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest22');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest23');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest24');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest8');

      expect(Math.abs(locationText1.right - locationFlex.right) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationText2.right) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationFlex.left) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText1.left) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText1.right) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationText2.bottom) <= 1).assertTrue();

      expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationFlex.bottom - locationText3.bottom) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.right - locationText1.left) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.right - locationText2.left) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.right - locationText3.left) - vp2px(200)) <= 1).assertTrue();

      console.info('new testWrapReverseParentfixedChangeChildWidthLargerThanParent END');

    });
  })
}