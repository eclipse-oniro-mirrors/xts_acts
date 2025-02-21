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
import CommonFunc from '../../../../MainAbility/common/Common'
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexWrapReverse_notFixedParentMargin() {
  describe('FlexWrapReverse_notFixedParentMargin', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_notFixedParentMargin beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_notFixedParentMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_notFixedParentMargin state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_notFixedParentMargin" == pages.name)) {
          console.info("get FlexWrapReverse_notFixedParentMargin state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_notFixedParentMargin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_notFixedParentMargin page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_notFixedParentMargin afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0600
     * @tc.name      testWrapReverseChildfixedParentMargin
     * @tc.desc      The parent component changes the location and space of the layout, affecting the layout of the
     *               child components, parent component setting margin
     */
    it('testWrapReverseChildfixedParentMargin', 0, async function (done) {
      console.info('new testWrapReverseChildfixedParentMargin START');
      globalThis.value.message.notify({name:'height', value:300})
      globalThis.value.message.notify({name:'width', value:500})
      globalThis.value.message.notify({name:'padding', value:0})
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest6');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest16');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest17');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest18');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest6');

      expect(Math.abs(locationFlex.right - locationText1.right) <=1).assertTrue();
      expect(Math.abs(locationText1.left - locationText2.right) <=1).assertTrue();
      expect(Math.abs(locationText2.left - locationText3.right) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationFlex.left) - vp2px(50) ) <=1).assertTrue();
      expect(Math.abs(locationText1.top - locationText2.top) <=1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <=1).assertTrue();
      expect(Math.abs(locationText3.top - locationFlex.top) <=1).assertTrue();
      expect(Math.abs(Math.round(locationFlex.bottom - locationText3.bottom) - vp2px(150) ) <=1).assertTrue();
      expect(Math.abs((locationText2.right - locationText2.left)  - (locationText2.right - locationText2.left)) <=1).assertTrue();
      expect(Math.abs((locationText2.right - locationText2.left)  - (locationText1.right - locationText1.left)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText1.right - locationText1.left)  - vp2px(150)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText1.bottom - locationText1.top)  - vp2px(50)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText2.bottom - locationText2.top)  - vp2px(100)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText3.bottom - locationText3.top)  - vp2px(150)) <=1).assertTrue();
      console.info('new testWrapReverseChildfixedParentMargin END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0700
     * @tc.name      testWrapReverseChildfixedParentMarPad
     * @tc.desc      The parent component changes the location and space of the layout, affecting the layout of the
     *               child components, parent component setting margin and padding
     */
    it('testWrapReverseChildfixedParentMarPad', 0, async function (done) {
      console.info('new testWrapReverseChildfixedParentMarPad START');
      globalThis.value.message.notify({name:'height', value:300})
      globalThis.value.message.notify({name:'width', value:500})
      globalThis.value.message.notify({name:'padding', value:30})
      globalThis.value.message.notify({name:'margin', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest6');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest16');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest17');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest18');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest6');

      expect(Math.abs(Math.round(locationFlex.right - locationText1.right) - vp2px(30)) <=1).assertTrue();
      expect(Math.abs(locationText1.left - locationText2.right) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationFlex.left) - vp2px(170)) <=1).assertTrue();
      expect(Math.abs(locationText3.left - locationText1.left) <=1).assertTrue();
      expect(Math.abs(locationText3.right - locationText1.right) <=1).assertTrue();
      expect(Math.abs(locationText1.top - locationText2.top) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText2.top - locationFlex.top) - vp2px(30)) <=1).assertTrue();      
      expect(Math.abs(locationText3.top - locationText2.bottom) <=1).assertTrue();
      expect(Math.abs(Math.round(locationFlex.bottom - locationText3.bottom) - vp2px(20)) <=1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left)  - (locationText2.right - locationText2.left)) <=1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left)  - (locationText2.right - locationText2.left)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText1.right - locationText1.left)  - vp2px(150)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText1.bottom - locationText1.top)  - vp2px(50)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText2.bottom - locationText2.top)  - vp2px(100)) <=1).assertTrue();
      expect(Math.abs(Math.round(locationText3.bottom - locationText3.top)  - vp2px(150)) <=1).assertTrue();
      console.info('new testWrapReverseChildfixedParentMarPad END');
      done();
    });
  })
}