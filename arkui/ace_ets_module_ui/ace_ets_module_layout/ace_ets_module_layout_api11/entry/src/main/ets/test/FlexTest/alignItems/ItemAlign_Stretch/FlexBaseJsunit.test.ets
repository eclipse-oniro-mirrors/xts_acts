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

export default function flexBase_StretchJsunit() {
  describe('flexItemAlignStretchTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/FlexBase',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexBase state success " + JSON.stringify(pages));
        if (!("FlexBase" == pages.name)) {
          console.info("get FlexBase state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push FlexBase page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexBase page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexBase after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_0100
     * @tc.name testFlexItemAlignStretch
     * @tc.desc The subcomponent is inside the parent component.
     */
    it('testFlexItemAlignStretch', 0, async () => {
      console.info('new testFlexItemAlignStretch START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 200
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 500
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flex01');

      let textFlex01: RectValue = CommonFunc.getComponentRect('textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('flex01');

      expect(Math.abs(flex01.top - textFlex01.top) <= 1).assertTrue()
      expect(Math.abs(textFlex01.top - textFlex02.top) <= 1).assertTrue()
      expect(Math.abs(textFlex02.top - textFlex03.top) <= 1).assertTrue()
      expect(Math.abs(textFlex01.bottom - textFlex02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlex02.bottom - textFlex03.bottom) <= 1).assertTrue()

      expect(Math.abs(textFlex01.right - textFlex02.left) <= 1).assertTrue()
      expect(Math.abs(textFlex02.right - textFlex03.left) <= 1).assertTrue()
      expect(Math.abs((flex01.right - textFlex03.right) - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs((textFlex01.bottom - textFlex01.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textFlex02.bottom - textFlex02.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textFlex03.bottom - textFlex03.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textFlex01.right - textFlex01.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textFlex02.right - textFlex02.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textFlex03.right - textFlex03.left) - vp2px(150)) <= 1).assertTrue()

      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretch END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_0200
     * @tc.name testFlexItemAlignStretchExceed
     * @tc.desc The subcomponent exceeds the parent component.
     */
    it('testFlexItemAlignStretchExceed', 0, async () => {
      console.info('new testFlexItemAlignStretchExceed START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 140
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 420
      });
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('flex01');

      let textFlex01: RectValue = CommonFunc.getComponentRect('textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('flex01');

      expect(Math.abs(textFlex01.left - flex01.left) <= 1).assertTrue()
      expect(Math.abs(textFlex01.right - textFlex02.left) <= 1).assertTrue()
      expect(Math.abs(textFlex02.right - textFlex03.left) <= 1).assertTrue()
      expect(Math.abs(flex01.top - textFlex01.top) <= 1).assertTrue()
      expect(Math.abs(textFlex01.top - textFlex02.top) <= 1).assertTrue()
      expect(Math.abs(textFlex02.top - textFlex03.top) <= 1).assertTrue()

      expect(Math.abs(textFlex01.bottom - flex01.bottom) <= 1).assertTrue()
      expect(Math.abs(flex01.right - textFlex03.right) <= 1).assertTrue()
      expect(Math.abs(textFlex01.bottom - textFlex02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlex02.bottom - textFlex03.bottom) <= 1).assertTrue()

      expect(Math.abs((textFlex01.bottom - textFlex01.top) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textFlex02.bottom - textFlex02.top) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textFlex03.bottom - textFlex03.top) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textFlex01.right - textFlex01.left) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textFlex02.right - textFlex02.left) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textFlex03.right - textFlex03.left) - vp2px(140)) <= 1).assertTrue()


      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchExceed END');

    });
  })
}
