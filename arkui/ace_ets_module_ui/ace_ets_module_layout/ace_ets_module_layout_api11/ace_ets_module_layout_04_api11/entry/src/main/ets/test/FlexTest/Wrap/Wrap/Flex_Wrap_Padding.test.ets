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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flex_Wrap_PaddingTest() {
  describe('Flex_Wrap_PaddingTest', () => {
    beforeEach(async () => {
      console.info("Flex_Wrap_PaddingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_Padding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_Padding state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_Padding" == pages.name)) {
          console.info("get Flex_Wrap_Padding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_Padding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_Padding page error:" + err);
      }
      console.info("Flex_Wrap_PaddingTest beforeEach end");

    });
    afterEach(async () => {
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_Padding after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1500
     * @tc.name testWrapWrapFlexPaddingMeet
     * @tc.desc The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set padding
     */
    it('testWrapWrapFlexPaddingMeet', 0, async () => {
      console.info('[testWrapWrapFlexPaddingMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

	  expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);

	  expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(thirdText.right - thirdText.left)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(flexContainer.right - thirdText.right) - Math.round(vp2px(40))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(flexContainer.bottom - thirdText.bottom) - Math.round(vp2px(140))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexPaddingMeet] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1600
     * @tc.name testWrapWrapFlexPaddingOverflow
     * @tc.desc The size of the parent component in the main axis direction
     *               is not enough for the layout of the child components when the parent component set padding
     */
    it('testWrapWrapFlexPaddingOverflow', 0, async () => {
      console.info('[testWrapWrapFlexPaddingOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 30
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
	  expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(30))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(30))) <= 1).assertTrue();
      expect(firstText.top).assertEqual(secondText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.bottom).assertEqual(thirdText.top);
      expect(secondText.left).assertEqual(thirdText.right);

	  expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(thirdText.right - thirdText.left)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(flexContainer.right - secondText.right) - Math.round(vp2px(170))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(flexContainer.bottom - thirdText.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexPaddingOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1700
     * @tc.name testWrapWrapFlexMargin
     * @tc.desc The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set margin
     */
    it('testWrapWrapFlexMargin', 0, async () => {
      console.info('[testWrapWrapFlexMargin] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexMargin', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Wrap_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(firstText.left).assertEqual(flexContainer.left);
      expect(firstText.top).assertEqual(flexContainer.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

	  expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(firstText.top - columnContainer.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(thirdText.right - thirdText.left)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(flexContainer.bottom - thirdText.bottom) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(flexContainer.right - thirdText.right) - Math.round(vp2px(50))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMargin] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1800
     * @tc.name testWrapWrapFlexMarPad
     * @tc.desc The size of the parent component in the main axis direction is not enough for
     *               the layout of the child components when the parent component set margin and padding
     */
    it('testWrapWrapFlexMarPad', 0, async () => {
      console.info('[testWrapWrapFlexMarPad] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Wrap_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Pad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

	  expect(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.top - columnContainer.top) - Math.round(vp2px(40))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(30))) <= 1).assertTrue();
      expect(firstText.top).assertEqual(secondText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(thirdText.top).assertEqual(secondText.bottom);
      expect(thirdText.left).assertEqual(firstText.left);

	  expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(thirdText.right - thirdText.left)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(flexContainer.bottom - thirdText.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(flexContainer.right - secondText.right) - Math.round(vp2px(170))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMarPad] END');

    });
  })
}
