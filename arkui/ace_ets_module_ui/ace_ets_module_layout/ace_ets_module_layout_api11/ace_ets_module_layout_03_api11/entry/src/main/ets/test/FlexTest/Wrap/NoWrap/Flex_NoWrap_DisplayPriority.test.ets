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

export default function flex_NoWrap_DisplayPriorityTest() {
  describe('Flex_NoWrap_DisplayPriorityTest', () => {
    beforeEach(async () => {
      console.info("Flex_NoWrap_DisplayPriority beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_DisplayPriority',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_DisplayPriority state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_DisplayPriority" == pages.name)) {
          console.info("get Flex_NoWrap_DisplayPriority state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_DisplayPriority page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_DisplayPriority page error:" + err);
      }
      console.info("Flex_NoWrap_DisplayPriority beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_DisplayPriority after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0100
     * @tc.name testWrapNoWrapTextDisplayPriority
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *               of the child components when display_priority of the child components set different values
     */
    it('testWrapNoWrapTextDisplayPriority',  Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextDisplayPriority] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'firstTextPriority', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'secondTextPriority', value: 2
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'thirdTextPriority', value: 3
      });
      await CommonFunc.sleep(3000);
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_DisplayPriority02');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_DisplayPriority03');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_DisplayPriority_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_DisplayPriority_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(250)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((flexContainer.bottom) - (thirdText.bottom)) <= 1).assertTrue();
      console.info('[testWrapNoWrapTextDisplayPriority] END');

    });
  })
}
