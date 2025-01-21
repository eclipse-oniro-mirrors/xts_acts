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

export default function RelativeContainer_AnchorPoint_Visibility_Hidden() {
  describe('RelativeContainer_AnchorPoint_Visibility_Hidden', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainer_AnchorPoint_Visibility_Hidden beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Visibility_Hidden",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainer_AnchorPoint_Visibility_Hidden state pages:" + JSON.stringify(pages));
        if (!("RelativeContainer_AnchorPoint_Visibility_Hidden" == pages.name)) {
          console.info("get RelativeContainer_AnchorPoint_Visibility_Hidden pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RelativeContainer_AnchorPoint_Visibility_Hidden page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainer_AnchorPoint_Visibility_Hidden page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RelativeContainer_AnchorPoint_Visibility_Hidden after each called")
    });

    /**
     * @tc.number SUB_ACE_RelativeContainer_AnchorPoint_Visibility_Hidden_TEST_0100
     * @tc.name testRelativeContainer
     * @tc.desc Set visibility.none for btn1
     */
    it('SUB_ACE_RelativeContainer_AnchorPoint_Visibility_Hidden_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Visibility_Hidden_TEST_0100] START');

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_AnchorPoint_Visibility_Hidden_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Visibility_Hidden_bt1');
      let RelativeContainer_AnchorPoint_Visibility_Hidden_bt2: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Visibility_Hidden_bt2');
      let RelativeContainer_AnchorPoint_Visibility_Hidden_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Visibility_Hidden_tx2');
      let RelativeContainer_AnchorPoint_Visibility_Hidden_r1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Visibility_Hidden_r1');

      console.log('assert position')

      expect(Math.abs(RelativeContainer_AnchorPoint_Visibility_Hidden_bt1.top - RelativeContainer_AnchorPoint_Visibility_Hidden_r1.top) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Visibility_Hidden_bt2.right - RelativeContainer_AnchorPoint_Visibility_Hidden_r1.right) <= 1)
        .assertTrue();

      expect(Math.abs(RelativeContainer_AnchorPoint_Visibility_Hidden_tx2.top - RelativeContainer_AnchorPoint_Visibility_Hidden_bt1.bottom) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Visibility_Hidden_tx2.bottom - RelativeContainer_AnchorPoint_Visibility_Hidden_r1.bottom) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Visibility_Hidden_tx2.right - ((RelativeContainer_AnchorPoint_Visibility_Hidden_bt1.right - RelativeContainer_AnchorPoint_Visibility_Hidden_bt1.left) / 2 + RelativeContainer_AnchorPoint_Visibility_Hidden_bt1.left)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Visibility_Hidden_TEST_0100] END');
      done();
    });


  })
}