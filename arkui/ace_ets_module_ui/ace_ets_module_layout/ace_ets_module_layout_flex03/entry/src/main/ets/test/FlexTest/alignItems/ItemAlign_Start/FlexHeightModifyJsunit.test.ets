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

export default function flexHeightModify_StartJsunit() {
  describe('flexItemAlignStartTest6', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/ItemAlign_Start_FlexHeightModify',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Start_FlexHeightModify state success " + JSON.stringify(pages));
        if (!("ItemAlign_Start_FlexHeightModify" == pages.name)) {
          console.info("get ItemAlign_Start_FlexHeightModify state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Start_FlexHeightModify page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Start_FlexHeightModify page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Start_FlexHeightModify after each called");
    });

    /**
     * @tc.name   testFlexItemAlignStartDefaultSize
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_0800
     * @tc.desc   Check the the default height of the first subcomponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignStartDefaultSize',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartDefaultSize START');
      let strJson1 = getInspectorByKey('ItemAlign_Start_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexHeightModify');

      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartDefaultSize END');

    });

    /**
     * @tc.name   testFlexItemAlignStartHeightModify
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_0900
     * @tc.desc   Modify the first subcomponent's height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignStartHeightModify',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartHeightModify START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 80
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_Start_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexHeightModify');

      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(80)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartHeightModify END');

    });
  })
}
