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

export default function flexWrapReverse_fixedParentPadding() {
  describe('FlexWrapReverse_fixedParentPadding', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_fixedParentPadding beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentPadding state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentPadding" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentPadding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_fixedParentPadding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentPadding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentPadding afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0300
     * @tc.name      testWrapReverseParentfixedPaddingChildPadding
     * @tc.desc      The parent component layout space is fixed, and the parent component setting padding,
     *               and sub component setting padding
     */
    it('testWrapReverseParentfixedPaddingChildPadding', 0, async function (done) {
      console.info('new testWrapReverseParentfixedPaddingChildPadding START');
      globalThis.value.message.notify({name:'padding', value:20})
      globalThis.value.message.notify({name:'margin', value:0})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest10');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest28');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest29');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest30');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest10');
      expect(Math.abs((locationFlex.right - locationText1.right) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationText2.right) <=1).assertTrue()
      expect(Math.abs((locationText2.left - locationFlex.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText1.left) <=1).assertTrue()
      expect(Math.abs(locationText3.right - locationText1.right) <=1).assertTrue()
      expect(Math.abs(locationText1.top - locationText2.top) <=1).assertTrue()
      expect(Math.abs((locationText2.top - locationFlex.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationText2.bottom) <=1).assertTrue()
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) <=1).assertTrue()
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedPaddingChildPadding END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0400
     * @tc.name      testWrapReverseParentfixedPaddingChildMargin
     * @tc.desc      The parent component layout space is fixed, and the parent component setting padding,
     *               and sub component setting margin
     */
    it('testWrapReverseParentfixedPaddingChildMargin', 0, async function (done) {
      console.info('new testWrapReverseParentfixedPaddingChildMargin START');
      globalThis.value.message.notify({name:'padding', value:0})
      globalThis.value.message.notify({name:'margin', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest10');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest28');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest29');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest30');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest10');
      expect(Math.abs(Math.round(locationFlex.right - locationText1.right) - vp2px(70) ) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.left - locationText2.right) - vp2px(20) ) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationFlex.left)   - vp2px(110)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText1.left)  - vp2px(20) ) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationFlex.right - locationText3.right) - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationText2.top)    - vp2px(20) ) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.top - locationFlex.top)     - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationText2.bottom) <=1).assertTrue()
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) <=1).assertTrue()
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedPaddingChildMargin END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0500
     * @tc.name      testWrapReverseParentfixedPaddingChildPaddingAndMargin
     * @tc.desc      The parent component layout space is fixed, and the parent component setting padding,
     *               and sub component setting margin and padding
     */
    it('testWrapReverseParentfixedPaddingChildPaddingAndMargin', 0, async function (done) {
      console.info('new testWrapReverseParentfixedPaddingChildPaddingAndMargin START');
      globalThis.value.message.notify({name:'padding', value:10})
      globalThis.value.message.notify({name:'margin', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest10');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest28');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest29');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest30');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest10');
      expect(Math.abs((locationFlex.right - locationText1.right)   - vp2px(80)) <= 1).assertTrue();
      expect(Math.abs((locationText1.left - locationText2.right)   - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs((locationText2.left - locationFlex.left)     - vp2px(90)) <= 1).assertTrue();
      expect(Math.abs((locationText3.left - locationText1.left)    - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs((locationFlex.right - locationText3.right)   - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText1.top - locationText2.top)      - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top - locationFlex.top)       - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText3.top - locationText2.bottom)   - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationFlex.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedPaddingChildPaddingAndMargin END');
      done();
    });
  })
}