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
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function ColumnSetPaddingMargin_SubChange() {
  describe('ColumnSetPaddingMarginTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPaddingMargin_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetPaddingMargin state success " + JSON.stringify(pages));
        if (!("ColumnSetPaddingMargin" == pages.name)) {
          console.info("get ColumnSetPaddingMargin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetPaddingMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPaddingMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("ColumnSetPaddingMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1100
     * @tc.name testColumnParentMarPadSubMarPad
     * @tc.desc Parent component and subcomponent both set paddding and margin.
     */
    it('testColumnParentMarPadSubMarPad', 0, async () => {
      console.info('new testColumnParentMarPadSubMarPad START');
      await CommonFunc.sleep(2000);
      let setPaddingMargin01: RectValue = CommonFunc.getComponentRect('setPaddingMargin01');
      let setPaddingMargin02: RectValue = CommonFunc.getComponentRect('setPaddingMargin02');
      let setPaddingMargin03: RectValue = CommonFunc.getComponentRect('setPaddingMargin03');
      let setPaddingMargin: RectValue = CommonFunc.getComponentRect('setPaddingMargin');
      expect(Math.abs(Math.round(setPaddingMargin01.top - setPaddingMargin.top) - Math.round(vp2px(40))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPaddingMargin02.top - setPaddingMargin01.bottom) - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPaddingMargin03.top - setPaddingMargin02.bottom) - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPaddingMargin03.bottom - setPaddingMargin.bottom) - Math.round(vp2px(20))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPaddingMargin01.right - setPaddingMargin01.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPaddingMargin02.right - setPaddingMargin02.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPaddingMargin03.right - setPaddingMargin03.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentMarPadSubMarPad END');
    });
  })
}
