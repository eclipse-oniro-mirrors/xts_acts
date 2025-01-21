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

export default function ColumnSetPadding_SubChangePad() {
  describe('ColumnSetPaddingTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPadding_SubChangePad',
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
      await CommonFunc.sleep(2000);
      console.info("parentComponentSetPadding after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0300
     * @tc.name testColumnParentPaddingSubPadding
     * @tc.desc Parent component and subcomponent both set paddding.
     */
    it('testColumnParentPaddingSubPadding', 0, async () => {
      console.info('new testColumnParentPaddingSubPadding START');
      await CommonFunc.sleep(2000);
      let columnSetPadding_SubPad1: RectValue = CommonFunc.getComponentRect('columnSetPadding_SubPad1');
      let columnSetPadding_SubPad2: RectValue = CommonFunc.getComponentRect('columnSetPadding_SubPad2');
      let columnSetPadding_SubPad3: RectValue = CommonFunc.getComponentRect('columnSetPadding_SubPad3');
      let columnSetPadding_SubPad: RectValue = CommonFunc.getComponentRect('columnSetPadding_SubPad');
      expect(Math.abs(columnSetPadding_SubPad1.top - columnSetPadding_SubPad.top - Math.round(vp2px(20))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_SubPad.bottom - columnSetPadding_SubPad3.bottom - Math.round(vp2px(20))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_SubPad2.top - columnSetPadding_SubPad1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_SubPad3.top - columnSetPadding_SubPad2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_SubPad1.right - columnSetPadding_SubPad1.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_SubPad2.right - columnSetPadding_SubPad2.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetPadding_SubPad3.right - columnSetPadding_SubPad3.left - Math.round(vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentPaddingSubPadding END');
    });
  })
}
