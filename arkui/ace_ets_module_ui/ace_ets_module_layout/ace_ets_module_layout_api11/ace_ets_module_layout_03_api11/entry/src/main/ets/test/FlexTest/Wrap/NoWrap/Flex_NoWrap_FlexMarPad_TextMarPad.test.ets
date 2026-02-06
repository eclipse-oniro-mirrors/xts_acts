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

export default function flex_NoWrap_FlexMarPad_TextMarPadTest() {
  describe('Flex_NoWrap_FlexMarPad_TextMarPadTest', () => {
    beforeEach(async () => {
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_FlexMarPad_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_FlexMarPad_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_FlexMarPad_TextMarPad" == pages.name)) {
          console.info("get Flex_NoWrap_FlexMarPad_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_FlexMarPad_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_FlexMarPad_TextMarPad page error:" + err);
      }
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadTest beforeEach end");

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
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadText after each called");
    });
    /**
     * @tc.name   testWrapNoWrapFlexMarPadTextPad
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0500
     * @tc.desc   The size of the parent component in the main axis direction is not enough for the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapNoWrapFlexMarPadTextPad',  Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexMarPadTextPad] START');
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
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.floor(Math.abs(flexContainer.left - columnContainer.left - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flexContainer.top - columnContainer.top - vp2px(10))) <= 1).assertTrue(); //margin = 10

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - vp2px(30))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - vp2px(30))) <= 1).assertTrue(); //padding=30

      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.right - firstText.left - vp2px(440) / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - vp2px(30))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexMarPadTextPad] END');

    });
    /**
     * @tc.name   testWrapNoWrapFlexMarPadTextMar
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0600
     * @tc.desc   The size of the parent component in the main axis direction is not enough for the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapNoWrapFlexMarPadTextMar',  Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexMarPadTextMar] START');
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
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.floor(Math.abs(flexContainer.top - columnContainer.top - vp2px(10))) <= 1).assertTrue(); //margin = 10
      expect(Math.floor(Math.abs(flexContainer.left - columnContainer.left - vp2px(10))) <= 1).assertTrue(); //margin = 10

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - vp2px(30))) <= 1).assertTrue(); //padding+margin=30

      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.right - firstText.left - vp2px(400) / 3)) <= 2).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (thirdText.right - thirdText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - firstText.right - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - vp2px(30))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexMarPadTextMar] END');

    });
    /**
     * @tc.name   testWrapNoWrapFlexMarPadTextMarPad
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0700
     * @tc.desc   The size of the parent component in the main axis direction is not enough for the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapNoWrapFlexMarPadTextMarPad',  Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] START');
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
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.floor(Math.abs(flexContainer.top - columnContainer.top - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flexContainer.left - columnContainer.left - vp2px(20))) <= 1)
        .assertTrue(); //margin = 20

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - vp2px(40))) <= 1)
        .assertTrue(); //flex_padding + margin=40
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - vp2px(200))) <= 1).assertTrue();

      console.info('[testWrapNoWrapFlexMarPadTextMarPad] px2vp(firstText.right - firstText.left): ' + px2vp(firstText.right - firstText.left));
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] px2vp(secondText.right - secondText.left): ' + px2vp(secondText.right - secondText.left));
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] px2vp(thirdText.right - thirdText.left): ' + px2vp(thirdText.right - thirdText.left));
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] px2vp(secondText.left - firstText.right): ' + px2vp(secondText.left - firstText.right));
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] px2vp(thirdText.left - secondText.right): ' + px2vp(thirdText.left - secondText.right));
      expect(Math.floor(Math.abs(px2vp(firstText.right - firstText.left) - 380 / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(secondText.right - secondText.left) - 380 / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(thirdText.right - thirdText.left) - 380 / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(secondText.left - firstText.right) - 20)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(thirdText.left - secondText.right) - 20)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - vp2px(40))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] END');

    });
  })
}