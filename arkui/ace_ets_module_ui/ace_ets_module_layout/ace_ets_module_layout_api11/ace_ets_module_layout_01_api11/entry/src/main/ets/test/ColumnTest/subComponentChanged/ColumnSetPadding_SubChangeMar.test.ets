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

export default function ColumnSetPadding__SubChangeMar() {
  describe('ColumnSetPaddingTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPadding_SubChangeMar',
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
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0400
     * @tc.name testColumnParentPaddingSubMargin
     * @tc.desc Parent component set paddding,subcomponent set margin.
     */
    it('testColumnParentPaddingSubMargin', 0, async () => {
      console.info('new testColumnParentPaddingSubMargin START');
      await CommonFunc.sleep(2000);
      let columnSetPad_1: RectValue = CommonFunc.getComponentRect('columnSetPad_1');
      let columnSetPad_2: RectValue = CommonFunc.getComponentRect('columnSetPad_2');
      let columnSetPad_3: RectValue = CommonFunc.getComponentRect('columnSetPad_3');
      let columnSetPad: RectValue = CommonFunc.getComponentRect('columnSetPad');
      expect(Math.abs(columnSetPad_1.top - columnSetPad.top - Math.round(vp2px(40))) <= 1).assertTrue()
      expect(Math.abs(columnSetPad_2.top - columnSetPad_1.bottom - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(columnSetPad_3.top - columnSetPad_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(columnSetPad.bottom).assertLess(columnSetPad_3.bottom)
      expect(Math.abs(columnSetPad_1.right - columnSetPad_1.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetPad_2.right - columnSetPad_2.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetPad_3.right - columnSetPad_3.left - Math.round(vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentPaddingSubMargin END');
    });
  })
}
