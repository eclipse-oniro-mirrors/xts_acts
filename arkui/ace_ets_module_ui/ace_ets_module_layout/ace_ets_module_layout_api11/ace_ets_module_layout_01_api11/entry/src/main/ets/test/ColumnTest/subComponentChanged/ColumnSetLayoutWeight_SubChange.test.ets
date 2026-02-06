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

export default function ColumnSetLayoutWeight_SubChange() {
  describe('ColumnSetLayoutWeightTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetLayoutWeight_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetLayoutWeight state success " + JSON.stringify(pages));
        if (!("SetLayoutWeight" == pages.name)) {
          console.info("get SetLayoutWeight state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetLayoutWeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetLayoutWeight page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SetLayoutWeight after each called");
    });

    /**
     * @tc.name   testColumnSetLayoutWeightWithRateThreeTwoOne
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1700
     * @tc.desc   Subcomponents set layout weight(3-2-1) attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnSetLayoutWeightWithRateThreeTwoOne',  Level.LEVEL0, async () => {
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoOne START');
      await CommonFunc.sleep(1000);
      let layoutExpectHeight1 = 510 / 3;
      let layoutExpectHeight2 = 340 / 3;
      let layoutExpectHeight3 = 170 / 3;
      let setLayoutWeight1: RectValue = CommonFunc.getComponentRect('setLayoutWeight1');
      let setLayoutWeight2: RectValue = CommonFunc.getComponentRect('setLayoutWeight2');
      let setLayoutWeight3: RectValue = CommonFunc.getComponentRect('setLayoutWeight3');
      let setLayoutWeight: RectValue = CommonFunc.getComponentRect('setLayoutWeight');

      expect(Math.abs(setLayoutWeight1.top - setLayoutWeight.top) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight2.top - setLayoutWeight1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight3.top - setLayoutWeight2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight.bottom - setLayoutWeight3.bottom) <= 1).assertTrue()

      expect(Math.abs(setLayoutWeight1.bottom - setLayoutWeight1.top - Math.round(vp2px(510 / 3))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight2.bottom - setLayoutWeight2.top - Math.round(vp2px(340 / 3))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight3.bottom - setLayoutWeight3.top - Math.round(vp2px(170 / 3))) <= 1).assertTrue()
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoOne END');
    });
  })
}
