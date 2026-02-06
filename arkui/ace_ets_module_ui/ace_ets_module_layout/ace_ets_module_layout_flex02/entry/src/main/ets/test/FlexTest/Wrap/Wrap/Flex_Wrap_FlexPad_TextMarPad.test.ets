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
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flex_Wrap_FlexPad_TextMarPadTest() {
  describe('Flex_Wrap_FlexPad_TextMarPadTest', () => {
    beforeEach(async () => {
      console.info("Flex_Wrap_FlexPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_FlexPad_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_FlexPad_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_FlexPad_TextMarPad" == pages.name)) {
          console.info("get Flex_Wrap_FlexPad_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_FlexPad_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_FlexPad_TextMarPad page error:" + err);
      }
      console.info("Flex_Wrap_FlexPad_TextMarPadTest beforeEach end");

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
        name: 'flexPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_FlexPad_TextMarPadText after each called");
    });
    /**
     * @tc.name   testWrapWrapFlexPadTextPad
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_0800
     * @tc.desc   The size of the parent component in the main axis direction is not enough for
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapFlexPadTextPad',  Level.LEVEL0, async () => {
      console.info('[testWrapWrapFlexPadTextPad] START');
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
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - firstText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - vp2px(170))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - vp2px(20))) <= 1)
        .assertTrue();
      console.info('[testWrapWrapFlexPadTextPad] END');

    });
    /**
     * @tc.name   testWrapWrapFlexPadTextMargin
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_0900
     * @tc.desc   The size of the parent component in the main axis direction is not enough for the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapFlexPadTextMargin',  Level.LEVEL0, async () => {
      console.info('[testWrapWrapFlexPadTextMargin] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextMargin', value: 20
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'flexPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - thirdText.left) - vp2px(20))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - vp2px(140))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - vp2px(30))) <= 1)
        .assertTrue();
      console.info('[testWrapWrapFlexPadTextMargin] END');

    });
    /**
     * @tc.name   testWrapWrapFlexPadTextMarPad
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1000
     * @tc.desc   The size of the parent component in the main axis direction is not enough for the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapFlexPadTextMarPad',  Level.LEVEL0, async () => {
      console.info('[testWrapWrapFlexPadTextMarPad] START');
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
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - secondText.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - firstText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - vp2px(140))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - flexContainer.bottom) - vp2px(10))) <= 2)
        .assertTrue();
      console.info('[testWrapWrapFlexPadTextMarPad] END');

    });
  })
}