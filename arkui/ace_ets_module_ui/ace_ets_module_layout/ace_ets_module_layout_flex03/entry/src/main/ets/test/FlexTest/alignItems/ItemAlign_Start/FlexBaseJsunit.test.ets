/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flexBase_StartJsunit() {
  describe('flexItemAlignStartTest3', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/ItemAlign_Start_FlexBase',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Start_FlexBase state success " + JSON.stringify(pages));
        if (!("ItemAlign_Start_FlexBase" == pages.name)) {
          console.info("get ItemAlign_Start_FlexBase state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Start_FlexBase page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Start_FlexBase page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Start_FlexBase after each called");
    });

    /**
     * @tc.name   testFlexItemAlignStart
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_0100
     * @tc.desc   The subcomponent is inside the parent component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignStart',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStart START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 200
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 500
      });
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('ItemAlign_Start_flex01');

      let textFlex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flex01');

      expect(Math.abs(flex01.top - textFlex01.top) <= 1).assertTrue();
      expect(Math.abs(textFlex01.top - textFlex02.top) <= 1).assertTrue();
      expect(Math.abs(textFlex02.top - textFlex03.top) <= 1).assertTrue();

      expect(Math.abs(textFlex01.right - textFlex02.left) <= 1).assertTrue();
      expect(Math.abs(textFlex02.right - textFlex03.left) <= 1).assertTrue();
      expect(Math.abs((flex01.right - textFlex03.right) - vp2px(50)) <= 1).assertTrue();

      expect(Math.abs((textFlex01.bottom - textFlex01.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((textFlex02.bottom - textFlex02.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((textFlex03.bottom - textFlex03.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textFlex01.right - textFlex01.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textFlex02.right - textFlex02.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textFlex03.right - textFlex03.left) - vp2px(150)) <= 1).assertTrue();
      console.info('new testFlexItemAlignStart END');

    });

    /**
     * @tc.name   testFlexItemAlignStartExceed
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_0200
     * @tc.desc   The subcomponent exceeds the parent component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignStartExceed',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartExceed START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 420
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 140
      });
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('ItemAlign_Start_flex01');

      let textFlex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flex01');
      expect(Math.abs(flex01.top - textFlex01.top) <= 1).assertTrue();
      expect(Math.abs(textFlex01.top - textFlex02.top) <= 1).assertTrue();
      expect(Math.abs(textFlex02.top - textFlex03.top) <= 1).assertTrue();

      expect(Math.abs(textFlex03.right - flex01.right) <= 1).assertTrue();
      expect(textFlex03.bottom).assertLarger(flex01.bottom)
      expect(Math.abs((textFlex01.bottom - textFlex01.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((textFlex02.bottom - textFlex02.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((textFlex03.bottom - textFlex03.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textFlex01.right - textFlex01.left) - vp2px(140)) <= 1).assertTrue();
      expect(Math.abs((textFlex02.right - textFlex02.left) - vp2px(140)) <= 1).assertTrue();
      expect(Math.abs((textFlex03.right - textFlex03.left) - vp2px(140)) <= 1).assertTrue();

      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartExceed END');

    });
  })
}
