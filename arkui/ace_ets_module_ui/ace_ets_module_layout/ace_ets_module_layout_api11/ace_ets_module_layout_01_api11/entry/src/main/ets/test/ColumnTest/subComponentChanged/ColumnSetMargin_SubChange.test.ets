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

export default function ColumnSetMargin_SubChange() {
  describe('ColumnSetMarginTest',  () =>{
    beforeEach(async () => {
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetMargin_SubChange',
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
    afterEach(async  () =>{
      await CommonFunc.sleep(2000);
      console.info("SetMargin after each called");
    });

    /**
     * @tc.name   testColumnParentMarginPadSubMarPad
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0800
     * @tc.desc   Parent component set margin,subcomponent set margin and paddding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnParentMarginPadSubMarPad',  Level.LEVEL0, async () => {
      console.info('new testColumnParentMarginPadSubMarPad START');
      await CommonFunc.sleep(2000);
      let columnSetMargin_1: RectValue = CommonFunc.getComponentRect('columnSetMargin_1');
      let columnSetMargin_2: RectValue = CommonFunc.getComponentRect('columnSetMargin_2');
      let columnSetMargin_3: RectValue = CommonFunc.getComponentRect('columnSetMargin_3');
      let columnSetMargin: RectValue = CommonFunc.getComponentRect('columnSetMargin');
      expect(Math.abs(Math.round(columnSetMargin_1.top - columnSetMargin.top) - Math.round(vp2px(20))) <= 1).assertTrue()
      expect(Math.abs(Math.round(columnSetMargin_2.top - columnSetMargin_1.bottom) - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(Math.round(columnSetMargin_3.top - columnSetMargin_2.bottom) - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.round(columnSetMargin.bottom - columnSetMargin_3.bottom) <= 1).assertTrue()
      expect(Math.abs(Math.round(columnSetMargin_1.right - columnSetMargin_1.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(Math.round(columnSetMargin_2.right - columnSetMargin_2.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(Math.round(columnSetMargin_3.right - columnSetMargin_3.left) - Math.round(vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentMarginPadSubMarPad END');
    });
  })
}
