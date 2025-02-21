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

export default function flexWrapReverse_notFixedParent() {
  describe('FlexWrapReverse_notFixedParent', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_notFixedParent beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_notFixedParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_notFixedParent state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_notFixedParent" == pages.name)) {
          console.info("get FlexWrapReverse_notFixedParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_notFixedParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_notFixedParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_notFixedParent afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0100
     * @tc.name      testWrapReverseChildfixedChangeParentInRange
     * @tc.desc      The parent component changes the location and space of the layout, affecting the layout of child
     *               components, the width and height of parent component meets the requirements of the child components
     */
    it('testWrapReverseChildfixedChangeParentInRange', 0, async function (done) {
      console.info('new testWrapReverseChildfixedChangeParentInRange START');
      globalThis.value.message.notify({name:'height', value:150})
      globalThis.value.message.notify({name:'width', value:500})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest1');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest2');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest3');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest1');
      expect(Math.abs(locationText1.right - locationFlex.right) <=1).assertTrue()
      expect(Math.abs(locationText1.left - locationText2.right) <=1).assertTrue()
      expect(Math.abs(locationText2.left - locationText3.right) <=1).assertTrue()
      expect(Math.abs((locationText3.left - locationFlex.left) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationText2.top) <=1).assertTrue()
      expect(Math.abs(locationText2.top - locationText3.top) <=1).assertTrue()
      expect(Math.abs(locationText3.top - locationFlex.top) <=1).assertTrue()
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationFlex.bottom) <=1).assertTrue()
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right - locationText2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseChildfixedChangeParentInRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0200
     * @tc.name      testWrapReverseChildfixedChangeParentChildWidthOutRange
     * @tc.desc      The parent component changes location and space of layout, affecting layout of child components,
     *               the width of parent component does not meet the requirements of child components, but height meets
     */
    it('testWrapReverseChildfixedChangeParentChildWidthOutRange', 0, async function (done) {
      console.info('new testWrapReverseChildfixedChangeParentChildWidthOutRange START');
      globalThis.value.message.notify({name:'height', value:250})
      globalThis.value.message.notify({name:'width', value:400})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest1');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest2');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest3');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest1');
      expect(Math.abs(locationText1.right - locationFlex.right) <=1).assertTrue()
      expect(Math.abs(locationText1.left - locationText2.right) <=1).assertTrue()
      expect(Math.abs((locationText2.left - locationFlex.left) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText1.left) <=1).assertTrue()
      expect(Math.abs(locationText3.right - locationText1.right) <=1).assertTrue()
      expect(Math.abs(locationText1.top - locationText2.top) <=1).assertTrue()
      expect(Math.abs(locationText2.top - locationFlex.top) <=1).assertTrue()
      expect(Math.abs(locationText3.top - locationText2.bottom) <=1).assertTrue()
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationFlex.bottom) <=1).assertTrue()
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right - locationText2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseChildfixedChangeParentChildWidthOutRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0300
     * @tc.name      testWrapReverseChildfixedChangeParentChildAllOutRange
     * @tc.desc      The parent component changes location and space of layout, affecting layout of child components,
     *               the width and height of parent component does not meet the requirements of the child components
     */
    it('testWrapReverseChildfixedChangeParentChildAllOutRange', 0, async function (done) {
      console.info('new testWrapReverseChildfixedChangeParentChildAllOutRange START');
      globalThis.value.message.notify({name:'height', value:100})
      globalThis.value.message.notify({name:'width', value:400})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest1');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest2');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest3');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest1');
      expect(Math.abs(locationText1.right - locationFlex.right) <=1).assertTrue()
      expect(Math.abs(locationText1.left - locationText2.right) <=1).assertTrue()
      expect(Math.abs((locationText2.left - locationFlex.left) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText1.left) <=1).assertTrue()
      expect(Math.abs(locationText3.right - locationText1.right) <=1).assertTrue()
      expect(Math.abs(locationText1.top - locationText2.top) <=1).assertTrue()
      expect(Math.abs(locationText2.top - locationFlex.top) <=1).assertTrue()
      expect(Math.abs(locationText3.top - locationText2.bottom) <=1).assertTrue()
      expect(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationFlex.bottom) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right - locationText1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right - locationText2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseChildfixedChangeParentChildAllOutRange END');
      done();
    });
  })
}