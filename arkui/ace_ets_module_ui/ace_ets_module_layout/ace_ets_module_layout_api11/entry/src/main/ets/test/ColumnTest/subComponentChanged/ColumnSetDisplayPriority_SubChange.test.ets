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
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function ColumnSetDisplayPriority_SubChange() {
  describe('ColumnSetDisplayPriorityTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetDisplayPriority_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetDisplayPriority state success " + JSON.stringify(pages));
        if (!("SetDisplayPriority" == pages.name)) {
          console.info("get SetDisplayPriority state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetDisplayPriority page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetDisplayPriority page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SetDisplayPriority after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1400
     * @tc.name testColumnSetDisplayPriorityWithRateOneTwoThree
     * @tc.desc Subcomponents set display priority(1-2-3) attribute.
     */
    it('testColumnSetDisplayPriorityWithRateOneTwoThree', 0, async () => {
      console.info('new testColumnSetDisplayPriorityWithRateOneTwoThree START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testpriority1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testpriority2', value: 2
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testpriority3', value: 3
      });
      await CommonFunc.sleep(2000);
      let setDisplayPriority1: RectValue = CommonFunc.getComponentRect('setDisplayPriority1');
      let setDisplayPriority2: RectValue = CommonFunc.getComponentRect('setDisplayPriority2');
      let setDisplayPriority3: RectValue = CommonFunc.getComponentRect('setDisplayPriority3');
      let setDisplayPriority: RectValue = CommonFunc.getComponentRect('setDisplayPriority');
      expect(Math.abs(setDisplayPriority.top - setDisplayPriority1.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.top - setDisplayPriority2.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.top - setDisplayPriority2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority.bottom - setDisplayPriority3.bottom - Math.round(vp2px(20))) <= 1).assertTrue()

      expect(Math.abs(setDisplayPriority1.right - setDisplayPriority1.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.right - setDisplayPriority2.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.right - setDisplayPriority3.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.bottom - setDisplayPriority1.top - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.bottom - setDisplayPriority2.top - Math.round(vp2px(200))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.bottom - setDisplayPriority3.top - Math.round(vp2px(150))) <= 1).assertTrue()
      console.info('new testColumnSetDisplayPriorityWithRateOneTwoThree END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1500
     * @tc.name testColumnSetDisplayPriorityWithRateTwoOneTwo
     * @tc.desc Subcomponents set display priority(1-0.5-1) attribute.
     */
    it('testColumnSetDisplayPriorityWithRateTwoOneTwo', 0, async () => {
      console.info('new testColumnSetDisplayPriorityWithRateTwoOneTwo START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testpriority1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testpriority2', value: 0.5
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'testpriority3', value: 1
      });
      await CommonFunc.sleep(2000);
      let setDisplayPriority1: RectValue = CommonFunc.getComponentRect('setDisplayPriority1');
      let setDisplayPriority2: RectValue = CommonFunc.getComponentRect('setDisplayPriority2');
      let setDisplayPriority3: RectValue = CommonFunc.getComponentRect('setDisplayPriority3');
      let setDisplayPriority: RectValue = CommonFunc.getComponentRect('setDisplayPriority');
      expect(Math.abs(setDisplayPriority.top - setDisplayPriority1.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.top - setDisplayPriority2.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.top - setDisplayPriority2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority.bottom - setDisplayPriority3.bottom - Math.round(vp2px(20))) <= 1).assertTrue()

      expect(Math.abs(setDisplayPriority1.right - setDisplayPriority1.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.right - setDisplayPriority2.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.right - setDisplayPriority3.left - Math.round(vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.bottom - setDisplayPriority1.top - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.bottom - setDisplayPriority2.top - Math.round(vp2px(200))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.bottom - setDisplayPriority3.top - Math.round(vp2px(150))) <= 1).assertTrue()
      console.info('new testColumnSetDisplayPriorityWithRateTwoOneTwo END');
    });
  })
}
