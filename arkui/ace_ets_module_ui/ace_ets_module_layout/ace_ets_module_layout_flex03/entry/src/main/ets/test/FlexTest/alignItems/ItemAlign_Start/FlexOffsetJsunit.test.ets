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

export default function flexOffset_StartJsunit() {
  describe('flexItemAlignStartTest1', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/ItemAlign_Start_FlexOffset',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Start_FlexOffset state success " + JSON.stringify(pages));
        if (!("ItemAlign_Start_FlexOffset" == pages.name)) {
          console.info("get ItemAlign_Start_FlexOffset state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Start_FlexOffset page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Start_FlexOffset page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Start_FlexOffset after each called");
    });

    /**
     * @tc.name   testFlexItemAlignStartSetOffset
     * @tc.number testFlexItemAlignStartSetOffset
     * @tc.desc   First subcomponent set offset attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignStartSetOffset',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartSetOffset START');
      let strJson1 = getInspectorByKey('ItemAlign_Start_flexOffset');

      let textOffset01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textOffset01');
      let textOffset02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textOffset02');
      let textOffset03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textOffset03');
      let flexOffset: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexOffset');

      expect(Math.abs((textOffset01.right - textOffset02.left) - vp2px(15)) <= 1).assertTrue();
      expect(Math.abs((textOffset01.top - flexOffset.top) - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs((textOffset01.left - flexOffset.left) - vp2px(15)) <= 1).assertTrue();
      expect(Math.abs(textOffset02.top - textOffset03.top) <= 1).assertTrue();
      expect(Math.abs(textOffset03.top - flexOffset.top) <= 1).assertTrue();

      expect(Math.abs((textOffset01.bottom - textOffset01.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((textOffset02.bottom - textOffset02.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((textOffset03.bottom - textOffset03.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textOffset01.right - textOffset01.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textOffset02.right - textOffset02.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textOffset03.right - textOffset03.left) - vp2px(150)) <= 1).assertTrue();

      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartSetOffset END');

    });
  })
}
