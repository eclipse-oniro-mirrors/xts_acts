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

export default function ColumnSetFlexShinkNone_SubChange() {
  describe('ColumnSetFlexShinkTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetFlexShinkNone_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetFlexShink state success " + JSON.stringify(pages));
        if (!("SetFlexShink" == pages.name)) {
          console.info("get SetFlexShink state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetFlexShink page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetFlexShink page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SetFlexShink after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1900
     * @tc.name testColumnSetFlexShinkNone
     * @tc.desc Subcomponents set flexshink (0-0-1) attribute.
     */
    it('testColumnSetFlexShinkNone', 0, async () => {
      console.info('new testColumnSetFlexShinkNone START');
      await CommonFunc.sleep(2000);
      let columnSetFlexShinkNone_1: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone_1');
      let columnSetFlexShinkNone_2: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone_2');
      let columnSetFlexShinkNone_3: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone_3');
      let columnSetFlexShinkNone: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone');

      expect(Math.abs(columnSetFlexShinkNone.top - columnSetFlexShinkNone_1.top) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone.bottom - columnSetFlexShinkNone_3.bottom) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone_2.top - columnSetFlexShinkNone_1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone_3.top - columnSetFlexShinkNone_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone_3.bottom - columnSetFlexShinkNone_3.top - Math.round(vp2px(190))) <= 1).assertTrue()
      console.info('new testColumnSetFlexShinkNone END');
    });
  })
}
