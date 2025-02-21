
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
export default function flex_NoWrap_FlexMar_TextMarPadTest() {
  describe('Flex_NoWrap_FlexMar_TextMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_NoWrap_FlexMar_TextMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_FlexMar_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_FlexMar_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_FlexMar_TextMarPad" == pages.name)) {
          console.info("get Flex_NoWrap_FlexMar_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_FlexMar_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_FlexMar_TextMarPad page error:" + err);
      }
      console.info("Flex_NoWrap_FlexMar_TextMarPadTest beforeEach end");
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
      console.info("Flex_NoWrap_FlexMar_TextMarPadText after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0200
     * @tc.name      testWrapNoWrapFlexMarTextPad
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *   of the child components when the parent components set margin,and the child components set padding
     */
    it('testWrapNoWrapFlexMarTextPad', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarTextPad] START');

      globalThis.value.message.notify({ name: 'firstTextPadding', value: 10 });
      globalThis.value.message.notify({ name: 'secondTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'thirdTextPadding', value: 30 });
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 });
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_FlexMar_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.abs((flexContainer.top - columnContainer.top) - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((flexContainer.left - columnContainer.left) - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((flexContainer.top - columnContainer.top)   - (firstText.top - columnContainer.top)) <=1).assertTrue()

      expect(Math.abs(firstText.left - flexContainer.left) <=1).assertTrue()
      expect(Math.abs(firstText.right - secondText.left) <=1).assertTrue()
      expect(Math.abs(secondText.right - thirdText.left) <=1).assertTrue()

      expect(Math.abs(firstText.top - secondText.top) <=1).assertTrue()
      expect(Math.abs(secondText.top - thirdText.top) <=1).assertTrue()

      expect(Math.abs((firstText.bottom - firstText.top)   - vp2px(100)) <=1).assertTrue()
      expect(Math.abs((secondText.bottom - secondText.top) - vp2px(150)) <=1).assertTrue()
      expect(Math.abs((thirdText.bottom - thirdText.top)   - vp2px(200)) <=1).assertTrue()

      expect(Math.abs((firstText.right - firstText.left) - vp2px(150)) <=1).assertTrue()
      expect(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left)) <=1).assertTrue()
      expect(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left)  ) <=1).assertTrue()

      expect(Math.abs(flexContainer.bottom - thirdText.bottom) <=1).assertTrue()
      expect(Math.abs((flexContainer.right - thirdText.right) - vp2px(50)) <=1).assertTrue()
      console.info('[testWrapNoWrapFlexMarTextPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0300
     * @tc.name      testWrapNoWrapFlexMarTextMar
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *   of the child components when the parent components set margin,and the child components set margin
     */
    it('testWrapNoWrapFlexMarTextMar', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarTextMar] START');
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 });
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad3');
      let columnContainer = CommonFunc.getComponentRect('Column_FlexMar_TextMarPad_Container01');
      let flexContainer = CommonFunc.getComponentRect('FlexMar_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.abs((flexContainer.top - columnContainer.top)   - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((flexContainer.left - columnContainer.left) - vp2px(10)) <=1).assertTrue()

      expect(Math.abs((firstText.left - flexContainer.left) - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((firstText.top - flexContainer.top)   - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((firstText.left - flexContainer.left) - (secondText.left - firstText.right)) <=1).assertTrue()

      expect(Math.abs(secondText.top - thirdText.top) <=1).assertTrue()
      expect(Math.abs(secondText.right - thirdText.left) <=1).assertTrue()

      expect(Math.abs((firstText.bottom - firstText.top)   - vp2px(100)) <=1).assertTrue()
      expect(Math.abs((secondText.bottom - secondText.top) - vp2px(150)) <=1).assertTrue()
      expect(Math.abs((thirdText.bottom - thirdText.top)   - vp2px(200)) <=1).assertTrue()

      expect(Math.abs((firstText.right- firstText.left)   - vp2px(150)) <=1).assertTrue()
      expect(Math.abs((firstText.right- firstText.left)   - (secondText.right- secondText.left)) <=1).assertTrue()
      expect(Math.abs((secondText.right- secondText.left) - (thirdText.right- thirdText.left)  ) <=1).assertTrue()

      expect(Math.abs(flexContainer.bottom - thirdText.bottom) <=1).assertTrue()
      expect(Math.abs((flexContainer.right - thirdText.right) - vp2px(30)) <=1).assertTrue()
      console.info('[testWrapNoWrapFlexMarTextMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0400
     * @tc.name      testWrapNoWrapFlexMarTextMarPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough the layout
     *   of the child components when the parent components set margin,and the child components set margin and padding
     */
    it('testWrapNoWrapFlexMarTextMarPad', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarTextMarPad] START');
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'secondTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'thirdTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'firstTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'secondTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'thirdTextPadding', value: 20 });
      globalThis.value.message.notify({ name: 'flexMargin', value: 10 });
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_FlexMar_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((flexContainer.left - columnContainer.left) - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((flexContainer.top - columnContainer.top)   - vp2px(10)) <=1).assertTrue()

      expect(Math.abs((firstText.top - flexContainer.top) - vp2px(10)) <=1).assertTrue()
      expect(Math.abs(firstText.top - secondText.top) <=1).assertTrue()
      expect(Math.abs(secondText.top - thirdText.top) <=1).assertTrue()

      expect(Math.abs((firstText.bottom - firstText.top)   - vp2px(100)) <=1).assertTrue()
      expect(Math.abs((secondText.bottom - secondText.top) - vp2px(150)) <=1).assertTrue()
      expect(Math.abs((thirdText.bottom - thirdText.top)   - vp2px(200)) <=1).assertTrue()

      expect(Math.abs((firstText.left - flexContainer.left) - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((secondText.left - firstText.right)   - vp2px(20)) <=1).assertTrue()
      expect(Math.abs((thirdText.left - secondText.right)   - vp2px(20)) <=1).assertTrue()

      expect(Math.abs((firstText.right - firstText.left) - (vp2px(440) / 3)) <=1).assertTrue()
      expect(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left)) <=1).assertTrue()
      expect(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left)  ) <=1).assertTrue()

      expect(Math.abs((flexContainer.right - thirdText.right) - vp2px(10)) <=1).assertTrue()
      expect(Math.abs((thirdText.bottom - flexContainer.bottom) - vp2px(10)) <=1).assertTrue()
      console.info('[testWrapNoWrapFlexMarTextMarPad] END');
      done();
    });
  })
}