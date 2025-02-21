/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function RelativeContainer_AnchorPoint_Absent() {
  describe('RelativeContainer_AnchorPoint_Absent', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainer_AnchorPoint_Absent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Absent",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainer_AnchorPoint_Absent state pages:" + JSON.stringify(pages));
        if (!("RelativeContainer_AnchorPoint_Absent" == pages.name)) {
          console.info("get RelativeContainer_AnchorPoint_Absent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RelativeContainer_AnchorPoint_Absent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainer_AnchorPoint_Absent page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RelativeContainer_AnchorPoint_Absent after each called")
    });

    /**
     * @tc.number SUB_ACE_RelativeContainer_AnchorPoint_Absent_TEST_0100
     * @tc.name testRelativeContainer
     * @tc.desc Relying on non-existent elements as anchors
     */
    it('SUB_ACE_RelativeContainer_AnchorPoint_Absent_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Absent_TEST_0100] START');

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_AnchorPoint_Absent_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Absent_bt1');
      let RelativeContainer_AnchorPoint_Absent_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Absent_tx2');
      let RelativeContainer_AnchorPoint_Absent_r1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Absent_r1');
      let RelativeContainer_AnchorPoint_Absent_row1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Absent_row1');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_AnchorPoint_Absent_r1.left - RelativeContainer_AnchorPoint_Absent_row1.left) <= 1)
        .assertTrue();

      expect(Math.abs(RelativeContainer_AnchorPoint_Absent_bt1.top - RelativeContainer_AnchorPoint_Absent_r1.top) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Absent_bt1.left + (RelativeContainer_AnchorPoint_Absent_bt1.right - RelativeContainer_AnchorPoint_Absent_bt1.left) / 2 - (RelativeContainer_AnchorPoint_Absent_r1.left + (RelativeContainer_AnchorPoint_Absent_r1.right - RelativeContainer_AnchorPoint_Absent_r1.left) / 2)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Absent_TEST_0100] END');
      done();
    });


  })
}