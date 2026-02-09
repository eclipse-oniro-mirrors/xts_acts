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

export default function flexWrapReverse_fixedParentChildLayoutWeight() {
  describe('FlexWrapReverse_fixedParentChildLayoutWeight', () => {
    beforeEach(async () => {
      console.info("FlexWrapReverse_fixedParentChildLayoutWeight beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentChildLayoutWeight',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentChildLayoutWeight state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentChildLayoutWeight" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentChildLayoutWeight pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexWrapReverse_fixedParentChildLayoutWeight page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentChildLayoutWeight page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentChildLayoutWeight afterEach called");
    });

    /**
     * @tc.name   testWrapReverseParentfixedLayoutWeight
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1600
     * @tc.desc   The layout space of the parent component is fixed, and the layoutweight is set for child component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapReverseParentfixedLayoutWeight',  Level.LEVEL0, async () => {
      console.info('new testWrapReverseParentfixedLayoutWeight START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 300
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 500
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest23');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest67');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest68');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest69');
      let locationFlexParent: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest23');
      expect(Math.abs(locationText1.top - locationFlexParent.top) <= 1).assertTrue()
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue()
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue()
      expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs(Math.round(locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.right - locationText2.left) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.right - locationText3.left) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.right - locationText2.left) -
      Math.round(locationText3.right - locationText3.left)) <= 1).assertTrue()
      expect(Math.abs(Math.round((locationText1.right - locationText1.left) * 100) / 100 -
        Math.round(150 * (locationText3.right - locationText3.left)) / 100) <= 1).assertTrue()
      console.info('new testWrapReverseParentfixedLayoutWeight END');

    });
  })
}