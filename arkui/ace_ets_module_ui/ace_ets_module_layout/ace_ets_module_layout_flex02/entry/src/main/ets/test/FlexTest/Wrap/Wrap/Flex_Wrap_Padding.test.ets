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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
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
     * @tc.name   testWrapWrapFlexPaddingMeet
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1500
     * @tc.desc   The size of the parent component in the main axis direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapFlexPaddingMeet',  Level.LEVEL0, async () => {
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

      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - (vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.right - thirdText.right) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - vp2px(140))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexPaddingMeet] END');

    });
    /**
     * @tc.name   testWrapWrapFlexPaddingOverflow
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1600
     * @tc.desc   The size of the parent component in the main axis direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapFlexPaddingOverflow',  Level.LEVEL0, async () => {
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
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.right)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - vp2px(170))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - vp2px(20))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexPaddingOverflow] END');

    });
    /**
     * @tc.name   testWrapWrapFlexMargin
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1700
     * @tc.desc   The size of the parent component in the main axis direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapFlexMargin',  Level.LEVEL0, async () => {
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

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.top - columnContainer.top) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.top - columnContainer.top) - (firstText.top - columnContainer.top))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - thirdText.right) - vp2px(50))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMargin] END');

    });
    /**
     * @tc.name   testWrapWrapFlexMarPad
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1800
     * @tc.desc   The size of the parent component in the main axis direction is not enough for
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapFlexMarPad',  Level.LEVEL0, async () => {
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

      expect(Math.floor(Math.abs((flexContainer.top - columnContainer.top) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - columnContainer.top) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - firstText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - vp2px(170))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMarPad] END');

    });
  })
}
