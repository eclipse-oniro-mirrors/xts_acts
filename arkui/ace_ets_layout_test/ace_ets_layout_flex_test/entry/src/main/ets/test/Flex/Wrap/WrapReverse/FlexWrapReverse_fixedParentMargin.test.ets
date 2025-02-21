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

export default function flexWrapReverse_fixedParentMargin() {
  describe('FlexWrapReverse_fixedParentMargin', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_fixedParentMargin beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentMargin state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentMargin" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentMargin state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_fixedParentMargin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentMargin page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentMargin afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0600
     * @tc.name      testWrapReverseParentfixedMarginChildPadding
     * @tc.desc      The parent component layout space is fixed, and the parent component setting margin,
     *               and sub component setting padding
     */
    it('testWrapReverseParentfixedMarginChildPadding', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarginChildPadding START');
      globalThis.value.message.notify({name:'padding', value:10})
      globalThis.value.message.notify({name:'margin', value:0})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.abs(locationFlex.right - locationText1.right) <=1).assertTrue()
      expect(Math.abs(locationText1.left - locationText2.right) <=1).assertTrue()
      expect(Math.abs(locationText2.left - locationText3.right) <=1).assertTrue()
      expect(Math.abs((locationText3.left - locationFlex.left) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationText2.top) <=1).assertTrue()
      expect(Math.abs(locationText2.top - locationText3.top) <=1).assertTrue()
      expect(Math.abs(locationText3.top - locationFlex.top) <=1).assertTrue()
      expect(Math.abs((locationFlex.bottom - locationText3.bottom) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedMarginChildPadding END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0700
     * @tc.name      testWrapReverseParentfixedMarginChildMargin
     * @tc.desc      The parent component layout space is fixed, and the parent component setting margin,
     *               and sub component setting margin
     */
    it('testWrapReverseParentfixedMarginChildMargin', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarginChildMargin START');
      globalThis.value.message.notify({name:'padding', value:0})
      globalThis.value.message.notify({name:'margin', value:50})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.abs((locationFlex.right - locationText1.right) - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs((locationText1.left - locationText2.right) - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs((locationText2.left - locationFlex.left)   - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.left - locationText1.left)  - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationFlex.right) <=1).assertTrue()
      expect(Math.abs((locationText1.top - locationFlex.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationFlex.top) <=1).assertTrue()
      expect(Math.abs((locationText3.top - locationText2.bottom) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom) <=1).assertTrue()
      expect(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50) ) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedMarginChildMargin END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0800
     * @tc.name      testWrapReverseParentfixedMarginChildMarginAndPadding
     * @tc.desc      The parent component layout space is fixed, and the parent component setting margin,
     *               and set padding and margin for sub component
     */
    it('testWrapReverseParentfixedMarginChildMarginAndPadding', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarginChildMarginAndPadding START');
      globalThis.value.message.notify({name:'padding', value:10})
      globalThis.value.message.notify({name:'margin', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(locationText1.left - locationText2.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(Math.round(vp2px(140)));
      expect(Math.round(locationText3.left - locationText1.left)).assertEqual(Math.round(vp2px(30)));
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(Math.round(vp2px(30)));
      expect(locationText2.top).assertEqual(locationFlex.top);
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(Math.round(vp2px(40)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(150)));
      console.info('new testWrapReverseParentfixedMarginChildMarginAndPadding END');
      done();
    });
  })
}