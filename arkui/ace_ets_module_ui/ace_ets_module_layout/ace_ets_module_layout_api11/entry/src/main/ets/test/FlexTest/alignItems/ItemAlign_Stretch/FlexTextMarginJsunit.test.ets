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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flexTextMargin_StretchJsunit() {
  describe('flexItemAlignStretchTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/FlexTextMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexTextMargin state success " + JSON.stringify(pages));
        if (!("FlexTextMargin" == pages.name)) {
          console.info("get FlexTextMargin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push FlexTextMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexTextMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexTextMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_1400
     * @tc.name testFlexItemAlignStretchSubSetMargin
     * @tc.desc Subcomponents set margin within the scope of the parent component.
     */
    it('testFlexItemAlignStretchSubSetMargin', 0, async () => {
      console.info('new testFlexItemAlignStretchSubSetMargin START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 10
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexTextMargin01');

      let textMargin01: RectValue = CommonFunc.getComponentRect('textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('flexTextMargin01');
      expect(Math.abs((textMargin01.left - flexTextMargin01.left) - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs((textMargin02.left - textMargin01.right) - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs(textMargin03.left - textMargin02.right) <= 1).assertTrue()
      expect(Math.abs((flexTextMargin01.right - textMargin03.right) - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs(textMargin02.top - textMargin03.top) <= 1).assertTrue()
      expect(Math.abs(textMargin03.top - flexTextMargin01.top) <= 1).assertTrue()
      expect(Math.abs((textMargin01.top - flexTextMargin01.top) - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs(textMargin02.bottom - textMargin03.bottom) <= 1).assertTrue()
      expect(Math.abs(textMargin03.bottom - flexTextMargin01.bottom) <= 1).assertTrue()
      expect(Math.abs((flexTextMargin01.bottom - textMargin01.bottom) - vp2px(10)) <= 1).assertTrue()

      expect(Math.abs((textMargin01.bottom - textMargin01.top) - vp2px(180)) <= 1).assertTrue()
      expect(Math.abs((textMargin02.bottom - textMargin02.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textMargin03.bottom - textMargin03.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textMargin01.right - textMargin01.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textMargin02.right - textMargin02.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textMargin03.right - textMargin03.left) - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSubSetMargin END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_1500
     * @tc.name testFlexItemAlignStretchSubSetMarginExceed
     * @tc.desc Subcomponents set margin outside the scope of the parent component.
     */
    it('testFlexItemAlignStretchSubSetMarginExceed', 0, async () => {
      console.info('new testFlexItemAlignStretchSubSetMarginExceed START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 30
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexTextMargin01');

      let textMargin01: RectValue = CommonFunc.getComponentRect('textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('flexTextMargin01');

      expect(Math.abs((textMargin01.left - flexTextMargin01.left) - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs((textMargin02.left - textMargin01.right) - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs(textMargin03.left - textMargin02.right) <= 1).assertTrue()
      expect(Math.abs(textMargin03.right - flexTextMargin01.right) <= 1).assertTrue()
      expect(Math.abs(textMargin02.top - textMargin03.top) <= 1).assertTrue()
      expect(Math.abs(textMargin03.top - flexTextMargin01.top) <= 1).assertTrue()
      expect(Math.abs((textMargin01.top - flexTextMargin01.top) - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs(textMargin02.bottom - textMargin03.bottom) <= 1).assertTrue()
      expect(Math.abs(textMargin03.bottom - flexTextMargin01.bottom) <= 1).assertTrue()
      expect(Math.abs((flexTextMargin01.bottom - textMargin01.bottom) - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs((textMargin01.bottom - textMargin01.top) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textMargin02.bottom - textMargin02.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textMargin03.bottom - textMargin03.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textMargin01.right - textMargin01.left) - vp2px(440 / 3)) <= 1).assertTrue()
      expect(Math.abs((textMargin02.right - textMargin02.left) - vp2px(440 / 3)) <= 1).assertTrue()
      expect(Math.abs((textMargin03.right - textMargin03.left) - vp2px(440 / 3)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSubSetMarginExceed END');

    });
  })
}
