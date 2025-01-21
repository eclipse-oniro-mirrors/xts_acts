
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_Wrap_PaddingTest() {
  describe('Flex_Wrap_PaddingTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_PaddingTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_Padding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_Padding state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_Padding" == pages.name)) {
          console.info("get Flex_Wrap_Padding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_Padding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_Padding page error:" + err);
      }
      console.info("Flex_Wrap_PaddingTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({ name: 'flexMargin', value: 0 });
      globalThis.value.message.notify({ name: 'flexPadding', value: 0 });
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_Padding after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1500
     * @tc.name      testWrapWrapFlexPaddingMeet
     * @tc.desc      The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set padding
     */
    it('testWrapWrapFlexPaddingMeet', 0, async function (done) {
      console.info('[testWrapWrapFlexPaddingMeet] START');
      globalThis.value.message.notify({ name: 'flexPadding', value: 10 })
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(Math.round(vp2px(10)));
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(150)));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(Math.round(vp2px(40)));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(Math.round(vp2px(140)));
      console.info('[testWrapWrapFlexPaddingMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1600
     * @tc.name      testWrapWrapFlexPaddingOverflow
     * @tc.desc      The size of the parent component in the main axis direction
     *               is not enough for the layout of the child components when the parent component set padding
     */
    it('testWrapWrapFlexPaddingOverflow', 0, async function (done) {
      console.info('[testWrapWrapFlexPaddingOverflow] START');
      globalThis.value.message.notify({ name: 'flexPadding', value: 30 })
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(Math.round(vp2px(30)));
      expect(firstText.top).assertEqual(secondText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.bottom).assertEqual(thirdText.top);
      expect(secondText.left).assertEqual(thirdText.right);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(150)));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - secondText.right)).assertEqual(Math.round(vp2px(170)));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(Math.round(vp2px(20)));
      console.info('[testWrapWrapFlexPaddingOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1700
     * @tc.name      testWrapWrapFlexMargin
     * @tc.desc      The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set margin
     */
    it('testWrapWrapFlexMargin', 0, async function (done) {
      console.info('[testWrapWrapFlexMargin] START');
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 })
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(firstText.left).assertEqual(flexContainer.left);
      expect(firstText.top).assertEqual(flexContainer.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(150)));

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(flexContainer.top - columnContainer.top))
        .assertEqual(Math.round(firstText.top - columnContainer.top));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(Math.round(vp2px(50)));
      console.info('[testWrapWrapFlexMargin] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1800
     * @tc.name      testWrapWrapFlexMarPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough for
     *               the layout of the child components when the parent component set margin and padding
     */
    it('testWrapWrapFlexMarPad', 0, async function (done) {
      console.info('[testWrapWrapFlexMarPad] START');
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 });
      globalThis.value.message.notify({ name: 'flexPadding', value: 30 });
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(firstText.top - columnContainer.top)).assertEqual(Math.round(vp2px(40)));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(Math.round(vp2px(30)));
      expect(firstText.top).assertEqual(secondText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(thirdText.top).assertEqual(secondText.bottom);
      expect(thirdText.left).assertEqual(firstText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(150)));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(flexContainer.right - secondText.right)).assertEqual(Math.round(vp2px(170)));
      console.info('[testWrapWrapFlexMarPad] END');
      done();
    });
  })
}
