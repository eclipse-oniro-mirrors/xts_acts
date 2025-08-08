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

export default function flex_Wrap_FlexMarPad_TextMarPadTest() {
  describe('Flex_Wrap_FlexMarPad_TextMarPadTest', () => {
    beforeEach(async () => {
      console.info("Flex_Wrap_FlexMarPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_FlexMarPad_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_FlexMarPad_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_FlexMarPad_TextMarPad" == pages.name)) {
          console.info("get Flex_Wrap_FlexMarPad_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_FlexMarPad_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_FlexMarPad_TextMarPad page error:" + err);
      }
      console.info("Flex_Wrap_FlexMarPad_TextMarPadTest beforeEach end");

    });
    afterEach(async () => {
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextPadding', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextPadding', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextPadding', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_FlexMarPad_TextMarPadText after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_0500
     * @tc.name testWrapWrapFlexMarPadTextPad
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set padding
     */
    it('testWrapWrapFlexMarPadTextPad', 0, async () => {
      console.info('[testWrapWrapFlexMarPadTextPad] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextPadding', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextPadding', value: 20
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextPadding', value: 30
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Wrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(flexContainer.left - columnContainer.left)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.top - flexContainer.top)) - (Math.round(vp2px(30)))) <= 1).assertTrue();

      expect(Math.abs((secondText.left) - (firstText.right)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();

      expect(Math.abs((thirdText.top) - (secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(vp2px(170)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      console.info('[testWrapWrapFlexMarPadTextPad] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_0600
     * @tc.name testWrapWrapFlexMarPadTextMar
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set margin
     */
    it('testWrapWrapFlexMarPadTextMar', 0, async () => {
      console.info('[testWrapWrapFlexMarPadTextMar] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Wrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(flexContainer.left - columnContainer.left)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.top - flexContainer.top)) - (Math.round(vp2px(30)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(thirdText.top - secondText.bottom)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((flexContainer.bottom) - (thirdText.bottom)) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMarPadTextMar] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_0700
     * @tc.name testWrapWrapFlexMarPadTextMarPad
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when all of components set padding and margin
     */
    it('testWrapWrapFlexMarPadTextMarPad', 0, async () => {
      console.info('[testWrapWrapFlexMarPadTextMarPad] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextPadding', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextPadding', value: 20
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextPadding', value: 30
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexMargin', value: 20
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Wrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(flexContainer.left - columnContainer.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.top - flexContainer.top)) - (Math.round(vp2px(40)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(thirdText.top - secondText.bottom)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(vp2px(140)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.info('[testWrapWrapFlexMarPadTextMarPad] END');

    });
  })
}