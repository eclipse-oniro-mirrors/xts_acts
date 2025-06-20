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
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function ColumnSetPosition_SubChange() {
  describe('ColumnSetPositionTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPosition_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetPosition state success " + JSON.stringify(pages));
        if (!("SetPosition" == pages.name)) {
          console.info("get SetPosition state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetPosition page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetPosition page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SetPosition after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1200
     * @tc.name testColumnSubcomponentSetPosition
     * @tc.desc The first subcomponent set position attribute.
     */
    it('testColumnSubcomponentSetPosition',  Level.LEVEL0, async () => {
      console.info('new testColumnSubcomponentSetPosition START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'position_x', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'position_y', value: 10
      });
      await CommonFunc.sleep(2000);
      let columnPosition_1: RectValue = CommonFunc.getComponentRect('columnPosition_1');
      let columnPosition_2: RectValue = CommonFunc.getComponentRect('columnPosition_2');
      let columnPosition_3: RectValue = CommonFunc.getComponentRect('columnPosition_3');
      let columnPosition: RectValue = CommonFunc.getComponentRect('columnPosition');

      expect(Math.abs(columnPosition_1.top - columnPosition.top - Math.round(vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(columnPosition_1.left - columnPosition.left - Math.round(vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(columnPosition_2.top - columnPosition.top) <= 1).assertTrue()
      expect(Math.abs(columnPosition_3.top - columnPosition_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(columnPosition_3.bottom).assertLess(columnPosition.bottom)
      console.info('new testColumnSubcomponentSetPosition END');
    });
  })
}
