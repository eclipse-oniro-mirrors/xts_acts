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

export default function ColumnSetMargin_SubChangePad() {
  describe('ColumnSetMarginTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetMargin_SubChangePad',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetMargin state success " + JSON.stringify(pages));
        if (!("FlexBase" == pages.name)) {
          console.info("get SetMargin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("SetMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0600
     * @tc.name testColumnParentMarginSubPaddding
     * @tc.desc Parent component set margin,subcomponent set paddding.
     */
    it('testColumnParentMarginSubPaddding', 0, async () => {
      console.info('new testColumnParentMarginSubPaddding START');
      await CommonFunc.sleep(2000);
      let columnSetMar_SubPad_1: RectValue = CommonFunc.getComponentRect('columnSetMar_SubPad_1');
      let columnSetMar_SubPad_2: RectValue = CommonFunc.getComponentRect('columnSetMar_SubPad_2');
      let columnSetMar_SubPad_3: RectValue = CommonFunc.getComponentRect('columnSetMar_SubPad_3');
      let columnSetMar_SubPad: RectValue = CommonFunc.getComponentRect('columnSetMar_SubPad');
      expect(Math.abs(columnSetMar_SubPad_1.top - columnSetMar_SubPad.top) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_SubPad.bottom - columnSetMar_SubPad_3.bottom - Math.round(vp2px(40))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_SubPad_2.top - columnSetMar_SubPad_1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_SubPad_3.top - columnSetMar_SubPad_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_SubPad_1.right - columnSetMar_SubPad_1.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_SubPad_2.right - columnSetMar_SubPad_2.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_SubPad_3.right - columnSetMar_SubPad_3.left - Math.round(vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentMarginSubPaddding END');
    });
  })
}
