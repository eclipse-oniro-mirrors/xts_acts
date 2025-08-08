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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flexHeightModify_AutoJsunit() {
  describe('flexItemAlignAutoTest6', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/ItemAlign_Auto_FlexHeightModify',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Auto_FlexHeightModify state success " + JSON.stringify(pages));
        if (!("ItemAlign_Auto_FlexHeightModify" == pages.name)) {
          console.info("get ItemAlign_Auto_FlexHeightModify state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Auto_FlexHeightModify page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Auto_FlexHeightModify page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Auto_FlexHeightModify after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_0800
     * @tc.name testFlexItemAlignAutoTextHeiCheck
     * @tc.desc Check the the default height of the first subcomponent.
     */
    it('testFlexItemAlignAutoTextHeiCheck',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignAutoTextHeiCheck START');
      let strJson1 = getInspectorByKey('ItemAlign_Auto_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexHeightModify');

      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue();

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue();

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue();
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoTextHeiCheck END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_0900
     * @tc.name testFlexItemAlignAutoTextHei
     * @tc.desc Modify the first subcomponent's height.
     */
    it('testFlexItemAlignAutoTextHei',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignAutoTextHei START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 80
      })
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_Auto_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexHeightModify');

      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue();

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue();

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(80)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue();
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoTextHei END');

    });
  })
}
