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

export default function flex_Wrap_VisibilityTest() {
  describe('Flex_Wrap_VisibilityTest', () => {
    beforeEach(async () => {
      console.info("Flex_Wrap_VisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_Visibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_Visibility state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_Visibility" == pages.name)) {
          console.info("get Flex_Wrap_Visibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_Visibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_Visibility page error:" + err);
      }
      console.info("Flex_Wrap_VisibilityTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_Visibility after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_2200
     * @tc.name testWrapWrapTextVisibilityNoneOverflow
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *               of the child components when one of the child components set "Visibility.NOne"
     */
    it('testWrapWrapTextVisibilityNoneOverflow',  Level.LEVEL0, async () => {
      console.info('[testWrapWrapTextVisibilityNoneOverflow] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'firstTextWidth', value: 250
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'secondTextWidth', value: 350
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'thirdTextWidth', value: 350
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.None
        })
        await CommonFunc.sleep(3000);
        let secondText: RectValue = CommonFunc.getComponentRect('Wrap_Text_Visibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_Text_Visibility3');
        let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Visibility_Container01');

        expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

        let firstTextStrJson = getInspectorByKey('Wrap_Text_Visibility1');
        expect(JSON.parse(firstTextStrJson).$attrs.visibility).assertEqual("Visibility.None");

        expect(Math.abs((secondText.top) - (flexContainer.top)) <= 1).assertTrue();
        expect(Math.abs((secondText.left) - (flexContainer.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(350)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
          .assertTrue();
        expect(Math.abs((thirdText.top) - (secondText.bottom)) <= 1).assertTrue();
        expect(Math.abs((thirdText.left) - (secondText.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testWrapWrapTextVisibilityNoneOverflow] failed');
        expect().assertFail();
      }
      console.info('[testWrapWrapTextVisibilityNoneOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_2300
     * @tc.name testWrapWrapTextVisibilityNoneMeet
     * @tc.desc The size of the parent component in the main axis direction meets the layout
     *               of the child components when one of the child components set "Visibility.NOne"
     */
    it('testWrapWrapTextVisibilityNoneMeet',  Level.LEVEL0, async () => {
      console.info('[testWrapWrapTextVisibilityNoneMeet] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'firstTextWidth', value: 250
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'secondTextWidth', value: 150
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'thirdTextWidth', value: 150
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.None
        })
        await CommonFunc.sleep(3000);
        let secondText: RectValue = CommonFunc.getComponentRect('Wrap_Text_Visibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_Text_Visibility3');
        let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Visibility_Container01');

        expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

        let firstTextStrJson = getInspectorByKey('Wrap_Text_Visibility1');
        expect(JSON.parse(firstTextStrJson).$attrs.visibility).assertEqual("Visibility.None");

        expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
        expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
        expect(Math.abs((flexContainer.top) - (thirdText.top)) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(vp2px(200)))) <= 1)
          .assertTrue();
        expect(Math.abs((flexContainer.left) - (secondText.left)) <= 1).assertTrue();
      } catch (err) {
        console.error('[testWrapWrapTextVisibilityNoneMeet] failed');
        expect().assertFail();
      }
      console.info('[testWrapWrapTextVisibilityNoneMeet] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_2400
     * @tc.name testWrapWrapTextVisibilityHidden
     * @tc.desc The size of the parent component in the main axis direction meets the layout
     *               of the child components when one of the child components set "Visibility.Hidden"
     */
    it('testWrapWrapTextVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('[testWrapWrapTextVisibilityHidden] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'firstTextWidth', value: 150
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'secondTextWidth', value: 150
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'thirdTextWidth', value: 150
        });
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.Hidden
        })
        await CommonFunc.sleep(3000);
        let secondText: RectValue = CommonFunc.getComponentRect('Wrap_Text_Visibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_Text_Visibility3');
        let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Visibility_Container01');

        expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

        let firstTextStrJson = getInspectorByKey('Wrap_Text_Visibility1');
        expect(JSON.parse(firstTextStrJson).$attrs.visibility).assertEqual("Visibility.Hidden");

        expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
        expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
        expect(Math.abs((flexContainer.top) - (thirdText.top)) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(vp2px(50)))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(secondText.left - flexContainer.left)) - (Math.round(vp2px(150)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testWrapWrapTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testWrapWrapTextVisibilityHidden] END');

    });
  })
}
