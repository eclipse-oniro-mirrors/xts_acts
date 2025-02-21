
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
export default function flex_Wrap_FlexMar_TextMarPadTest() {
  describe('Flex_Wrap_FlexMar_TextMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_FlexMar_TextMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_FlexMar_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_FlexMar_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_FlexMar_TextMarPad" == pages.name)) {
          console.info("get Flex_Wrap_FlexMar_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_FlexMar_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_FlexMar_TextMarPad page error:" + err);
      }
      console.info("Flex_Wrap_FlexMar_TextMarPadTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 0 });
      globalThis.value.message.notify({ name: 'secondTextMargin', value: 0 });
      globalThis.value.message.notify({ name: 'thirdTextMargin', value: 0 });
      globalThis.value.message.notify({ name: 'firstTextPadding', value: 0 });
      globalThis.value.message.notify({ name: 'secondTextPadding', value: 0 });
      globalThis.value.message.notify({ name: 'thirdTextPadding', value: 0 });
      globalThis.value.message.notify({ name: 'flexMargin', value: 0 });
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_FlexMar_TextMarPadText after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_0200
     * @tc.name      testWrapWrapFlexMarTextPad
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *   of the child components when the parent components set margin,and the child components set padding
     */
    it('testWrapWrapFlexMarTextPad', 0, async function (done) {
      console.info('[testWrapWrapFlexMarTextPad] START');
      globalThis.value.message.notify({ name: 'firstTextPadding', value: 10 });
      globalThis.value.message.notify({ name: 'secondTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'thirdTextPadding', value: 30 });
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 });
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('Wrap_FlexMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexMar_TextMarPad_Container');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.left - columnContainer.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMarTextPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_0300
     * @tc.name      testWrapWrapFlexMarTextMar
     * @tc.desc      The size of the parent component in the main axis direction is not enough for
     *               the child components when the parent components set margin,and the child components set margin
     */
    it('testWrapWrapFlexMarTextMar', 0, async function (done) {
      console.info('[testWrapWrapFlexMarTextMar] START');
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 30 });
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 });
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('Wrap_FlexMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexMar_TextMarPad_Container');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(flexContainer.left - columnContainer.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.top - flexContainer.top)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(vp2px(30)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.top - firstText.bottom)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (flexContainer.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(vp2px(140)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(vp2px(40)))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMarTextMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_0400
     * @tc.name      testWrapWrapFlexMarTextMarPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough the layout
     *   of the child components when the parent components set margin,and the child components set margin and padding
     */
    it('testWrapWrapFlexMarTextMarPad', 0, async function (done) {
      console.info('[testWrapWrapFlexMarTextMarPad] START');
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'secondTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'thirdTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'firstTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'secondTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'thirdTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 });
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_FlexMar_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('Wrap_FlexMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexMar_TextMarPad_Container');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(flexContainer.left - columnContainer.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.top - flexContainer.top)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.top - secondText.bottom)) - (Math.round(vp2px(20)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(vp2px(170)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMarTextMarPad] END');
      done();
    });
  })
}