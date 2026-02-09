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
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function ColumnSetPaddingMargin_SubChangeMar() {
  describe('ColumnSetPaddingMarginTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPaddingMargin_SubChangeMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetPaddingMargin_SubChangeMar state success " + JSON.stringify(pages));
        if (!("ColumnSetPaddingMargin_SubChangeMar" == pages.name)) {
          console.info("get ColumnSetPaddingMargin_SubChangeMar state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetPaddingMargin_SubChangeMar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPaddingMargin_SubChangeMar page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("ColumnSetPaddingMargin_SubChangeMar after each called");
    });

    /**
     * @tc.name   testColumnParentMarPadSubMargin
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1000
     * @tc.desc   Parent component set paddding and margin,subcomponent set margin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnParentMarPadSubMargin',  Level.LEVEL0, async () => {
      console.info('new testColumnParentMarPadSubMargin START');
      await CommonFunc.sleep(2000);
      let setPadMar01: RectValue = CommonFunc.getComponentRect('setPadMar01');
      let setPadMar02: RectValue = CommonFunc.getComponentRect('setPadMar02');
      let setPadMar03: RectValue = CommonFunc.getComponentRect('setPadMar03');
      let setPadMar: RectValue = CommonFunc.getComponentRect('setPadMar');
      expect(Math.abs(Math.round(setPadMar01.top - setPadMar.top) - Math.round(vp2px(40))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPadMar02.top - setPadMar01.bottom) - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPadMar03.top - setPadMar02.bottom) - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(setPadMar.bottom).assertLess(setPadMar03.bottom)
      expect(Math.abs(Math.round(setPadMar01.right - setPadMar01.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPadMar02.right - setPadMar02.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPadMar03.right - setPadMar03.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentMarPadSubMargin END');
    });
  })
}
