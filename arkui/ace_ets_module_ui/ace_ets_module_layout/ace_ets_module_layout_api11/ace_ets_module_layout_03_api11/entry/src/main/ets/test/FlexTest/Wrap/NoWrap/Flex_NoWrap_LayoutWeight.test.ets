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

export default function flex_NoWrap_LayoutWeightTest() {
  describe('Flex_NoWrap_LayoutWeightTest', () => {
    beforeEach(async () => {
      console.info("Flex_NoWrap_LayoutWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_LayoutWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_LayoutWeight state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_LayoutWeight" == pages.name)) {
          console.info("get Flex_NoWrap_LayoutWeight state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push Flex_NoWrap_LayoutWeight page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_LayoutWeight page error:" + err);
      }
      console.info("Flex_NoWrap_LayoutWeightTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_LayoutWeight after each called");
    });
    /**
     * @tc.name   testWrapNoWrapTextLayoutWeight
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_1400
     * @tc.desc   The size of the parent component in the main axis direction meets the layout of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapNoWrapTextLayoutWeight',  Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextLayoutWeight] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextLayoutWeight', value: 1
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextLayoutWeight', value: 2
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextLayoutWeight', value: 3
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_LayoutWeight01');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_LayoutWeight02');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_LayoutWeight03');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_NoWrap_layoutWeight_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_NoWrap_layoutWeight_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();

      expect(Math.abs((thirdText.bottom) - (flexContainer.bottom)) <= 1).assertTrue();
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((thirdText.right) - (flexContainer.right)) <= 1).assertTrue();

      expect(Math.abs((Math.round(2 * (firstText.right - firstText.left))) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((1.5 * (secondText.right - secondText.left)) * 10) / 10) - (Math.round((thirdText.right - thirdText.left) * 10) / 10)) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapTextLayoutWeight] END');

    });
  })
}
