/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager, Callback, Message } from '../../../MainAbility/common/MessageManager';

export default function ColumnSetPadding__SubChange() {
  describe('ColumnSetPaddingTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPadding_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get parentComponentSetPadding state success " + JSON.stringify(pages));
        if (!("parentComponentSetPadding" == pages.name)) {
          console.info("get parentComponentSetPadding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push parentComponentSetPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push parentComponentSetPadding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      console.info("parentComponentSetPadding after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0500
     * @tc.name testColumnParentPaddingSubMarPad
     * @tc.desc Parent component set paddding,subcomponent set paddding and margin.
     */
    it('testColumnParentPaddingSubMarPad', 0, async () => {
      console.info('new testColumnParentPaddingSubMarPad START');
      await CommonFunc.sleep(2000);
      let columnSetPadding_1: RectValue = CommonFunc.getComponentRect('columnSetPadding_1');
      let columnSetPadding_2: RectValue = CommonFunc.getComponentRect('columnSetPadding_2');
      let columnSetPadding_3: RectValue = CommonFunc.getComponentRect('columnSetPadding_3');
      let columnSetPadding: RectValue = CommonFunc.getComponentRect('columnSetPadding');
      expect(Math.abs(columnSetPadding_1.top - columnSetPadding.top - Math.round(vp2px(40))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_2.top - columnSetPadding_1.bottom - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_3.top - columnSetPadding_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(columnSetPadding.bottom).assertLess(columnSetPadding_3.bottom)
      expect(Math.abs(columnSetPadding_1.right - columnSetPadding_1.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_2.right - columnSetPadding_2.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_3.right - columnSetPadding_3.left - Math.round(vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentPaddingSubMarPad END');
    });
  })
}
