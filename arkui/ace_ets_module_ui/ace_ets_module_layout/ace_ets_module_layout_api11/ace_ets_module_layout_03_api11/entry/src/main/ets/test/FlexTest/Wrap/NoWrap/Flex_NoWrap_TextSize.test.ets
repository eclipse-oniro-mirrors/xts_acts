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
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flex_NoWrap_TextSizeTest() {
  describe('Flex_NoWrap_TextSizeTest', () => {
    beforeEach(async () => {
      console.info("Flex_NoWrap_TextSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_TextSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_TextSize state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_TextSize" == pages.name)) {
          console.info("get Flex_NoWrap_TextSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_TextSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_TextSize page error:" + err);
      }
      console.info("Flex_NoWrap_TextSizeTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_TextSizeTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_2000
     * @tc.name testWrapNoWrapTextSizeMeet
     * @tc.desc The size of the parent component in the main axis direction
     *               meets the layout of the child components when the child component change size
     */
    it('testWrapNoWrapTextSizeMeet',  Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextSizeMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 150
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_TextSize1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_TextSize3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_NoWrap_TextSize_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_NoWrap_TextSize_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.abs(firstText.left - flexContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue();
      expect(Math.abs(firstText.top - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(firstText.right - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();

      expect(Math.abs(firstText.bottom - firstText.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top - vp2px(200)) <= 1).assertTrue();

      expect(Math.abs(firstText.right - firstText.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.abs(secondText.right - secondText.left - (thirdText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.abs(flexContainer.right - thirdText.right - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - flexContainer.bottom) <= 1).assertTrue();
      console.info('[testWrapNoWrapTextSizeMeet] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_2100
     * @tc.name testWrapNoWrapTextSizeOverflow
     * @tc.desc The size of the parent component in the main axis direction is not enough
     *               for the layout of the child components when the child component change size
     */
    it('testWrapNoWrapTextSizeOverflow',  Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextSizeOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 200
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_TextSize1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_TextSize3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_NoWrap_TextSize_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_NoWrap_TextSize_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.abs(firstText.top - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(flexContainer.top - firstText.top) <= 1).assertTrue();
      expect(Math.abs(flexContainer.left - firstText.left) <= 1).assertTrue();
      expect(Math.abs(firstText.right - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();

      expect(Math.abs(firstText.bottom - firstText.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top - Math.round(vp2px(200))) <= 1).assertTrue();

      expect(Math.abs(firstText.right - firstText.left - Math.round(vp2px(500) / 3)) <= 1).assertTrue();
      expect(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.abs(secondText.right - secondText.left - (thirdText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.abs(thirdText.right - flexContainer.right) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - flexContainer.bottom) <= 1).assertTrue();
      console.info('[testWrapNoWrapTextSizeOverflow] END');

    });
  })
}
