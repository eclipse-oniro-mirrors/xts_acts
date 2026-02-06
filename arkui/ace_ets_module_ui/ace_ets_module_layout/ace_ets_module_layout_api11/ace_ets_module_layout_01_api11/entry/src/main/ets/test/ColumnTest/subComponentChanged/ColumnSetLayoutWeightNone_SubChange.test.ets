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
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function ColumnSetLayoutWeightNone_SubChange() {
  describe('ColumnSetLayoutWeightTest',  () =>{
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetLayoutWeightNone_SubChange',
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
    afterEach(async  () =>{
      await CommonFunc.sleep(2000);
      console.info("SetLayoutWeight after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1600
     * @tc.name      testColumnSetLayoutWeightWithRateThreeTwoZero
     * @tc.desc      Subcomponents set layout weight(3-2-0) attribute.
     */
    it('testColumnSetLayoutWeightWithRateThreeTwoZero',  Level.LEVEL0, async () => {
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoZero START');
      await CommonFunc.sleep(1000);
      let layoutExpectHeight1 = (190/5)*3;
      let layoutExpectHeight2 = (190/5)*2;
      let layoutExpectHeight3 = 150;
      let setLayoutWeightNone1: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone1');
      let setLayoutWeightNone2: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone2');
      let setLayoutWeightNone3: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone3');
      let setLayoutWeightNone: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone');

      expect(Math.abs(setLayoutWeightNone1.top - setLayoutWeightNone.top) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeightNone2.top - setLayoutWeightNone1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeightNone3.top - setLayoutWeightNone2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()

      expect(Math.abs(setLayoutWeightNone1.bottom - setLayoutWeightNone1.top - Math.round(vp2px(layoutExpectHeight1))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeightNone2.bottom - setLayoutWeightNone2.top - Math.round(vp2px(layoutExpectHeight2))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeightNone3.bottom - setLayoutWeightNone3.top - Math.round(vp2px(layoutExpectHeight3))) <= 1).assertTrue()
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoZero END');
    });
  })
}
