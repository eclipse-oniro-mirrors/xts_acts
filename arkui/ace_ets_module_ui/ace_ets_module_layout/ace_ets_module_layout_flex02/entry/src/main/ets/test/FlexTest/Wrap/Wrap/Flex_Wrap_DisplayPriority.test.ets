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

export default function flex_Wrap_DisplayPriorityTest() {
  describe('Flex_Wrap_DisplayPriorityTest', () => {
    beforeEach(async () => {
      console.info("Flex_Wrap_DisplayPriority beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_DisplayPriority',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_DisplayPriority state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_DisplayPriority" == pages.name)) {
          console.info("get Flex_Wrap_DisplayPriority state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_DisplayPriority page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_DisplayPriority page error:" + err);
      }
      console.info("Flex_Wrap_DisplayPriority beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_DisplayPriority after each called");
    });
    /**
     * @tc.name   testWrapWrapTextDisplayPriority
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_0100
     * @tc.desc   The size of the parent component in the main axis direction meets the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWrapTextDisplayPriority',  Level.LEVEL0, async () => {
      console.info('[testWrapWrapTextDisplayPriority] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextPriority', value: 3
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextPriority', value: 2
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextPriority', value: 1
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_DisplayPriority01');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_DisplayPriority02');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_DisplayPriority03');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexWrap_DisplayPriority_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_DisplayPriority_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs(firstText.left - flexContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstText.right - secondText.left) <= 1).assertTrue();
      expect(Math.abs(firstText.top - secondText.top) <= 1).assertTrue();
      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue();

      expect(Math.abs((firstText.bottom - firstText.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((secondText.bottom - secondText.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((thirdText.bottom - thirdText.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((firstText.right - firstText.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((secondText.right - secondText.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((thirdText.right - thirdText.left) - vp2px(300)) <= 1).assertTrue();

      expect(Math.abs((flexContainer.right - secondText.right) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - flexContainer.left) <= 1).assertTrue()
      expect(Math.abs(thirdText.top - secondText.bottom) <= 1).assertTrue()
      expect(Math.abs((flexContainer.bottom - thirdText.bottom) - vp2px(50)) <= 1).assertTrue();
      console.info('[testWrapWrapTextDisplayPriority] END');

    });
  })
}
