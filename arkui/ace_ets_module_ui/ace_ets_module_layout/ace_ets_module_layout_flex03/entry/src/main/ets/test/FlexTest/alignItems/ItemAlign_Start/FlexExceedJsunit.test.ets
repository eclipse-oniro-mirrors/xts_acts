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

export default function flexExceed_StartJsunit() {
  describe('flexItemAlignStartTest2', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/ItemAlign_Start_FlexExceed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Start_FlexExceed state success " + JSON.stringify(pages));
        if (!("ItemAlign_Start_FlexExceed" == pages.name)) {
          console.info("get ItemAlign_Start_FlexExceed state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Start_FlexExceed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Start_FlexExceed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Start_FlexExceed after each called");
    });

    /**
     * @tc.name   testFlexItemAlignStartSetMarPad
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_0600
     * @tc.desc   Subcomponent inside when parent component set margin and padding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignStartSetMarPad',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartSetMarPad START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 10
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_Start_flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexExceed01');

      expect(Math.abs(textExceed01.left - flexExceed01.left - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed02.left) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed03.left) <= 1).assertTrue()
      expect(Math.abs(flexExceed01.right - textExceed03.right - vp2px(40)) <= 1).assertTrue()

      expect(Math.abs(textExceed01.top - flexExceed01.top - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.top - textExceed02.top) <= 1).assertTrue()
      expect(Math.abs(textExceed02.top - textExceed03.top) <= 1).assertTrue()

      expect(Math.abs(textExceed01.bottom - textExceed01.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.bottom - textExceed02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.bottom - textExceed03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.right - textExceed03.left - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartSetMarPad END');

    });

    /**
     * @tc.name   testFlexItemAlignStartSetMarPadExceed
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_0700
     * @tc.desc   Subcomponent outside when parent component set margin and padding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignStartSetMarPadExceed',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartSetMarPadExceed START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 30
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 30
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_Start_flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexExceed01');

      expect(Math.abs(textExceed01.left - flexExceed01.left - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed02.left) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed03.left) <= 1).assertTrue()
      expect(Math.abs(flexExceed01.right - textExceed03.right - vp2px(30)) <= 1).assertTrue()

      expect(Math.abs(textExceed01.top - flexExceed01.top - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(textExceed01.top - textExceed02.top) <= 1).assertTrue();
      expect(Math.abs(textExceed02.top - textExceed03.top) <= 1).assertTrue();

      expect(Math.abs(textExceed01.bottom - textExceed01.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.bottom - textExceed02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.bottom - textExceed03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed01.left - vp2px(440 / 3)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed02.left - vp2px(440 / 3)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.right - textExceed03.left - vp2px(440 / 3)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartSetMarPadExceed END');

    });
  })
}
