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

export default function RelativeContainer_Vertical() {
  describe('RelativeContainer_Vertical', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainer_Vertical beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_Vertical/RelativeContainer_Vertical",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainer_Vertical state pages:" + JSON.stringify(pages));
        if (!("RelativeContainer_Vertical" == pages.name)) {
          console.info("get RelativeContainer_Vertical pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RelativeContainer_Vertical page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainer_Vertical page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RelativeContainer_Vertical after each called")
    });
    /**
     * @tc.number SUB_ACE_RelativeContainer_Vertical_TEST_0100
     * @tc.name testRelativeContainer
     * @tc.desc text set align:VerticalAlign.Top
     */
    it('SUB_ACE_RelativeContainer_Vertical_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addalign', value: VerticalAlign.Top
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Vertical_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_bt1');
      let RelativeContainer_Vertical_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Vertical_tx2.top - RelativeContainer_Vertical_bt1.top) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Vertical_tx2.left - RelativeContainer_Vertical_bt1.right) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_RelativeContainer_Vertical_TEST_0200
     * @tc.name testRelativeContainer
     * @tc.desc text set align:VerticalAlign.Center
     */
    it('SUB_ACE_RelativeContainer_Vertical_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addalign', value: VerticalAlign.Center
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Vertical_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_bt1');
      let RelativeContainer_Vertical_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Vertical_tx2.top - ((RelativeContainer_Vertical_bt1.bottom - RelativeContainer_Vertical_bt1.top) / 2 + RelativeContainer_Vertical_bt1.top)) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_Vertical_tx2.left - RelativeContainer_Vertical_bt1.right) <= 1).assertTrue();


      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_0200] END');
      done();

    });

    /**
     * @tc.number SUB_ACE_RelativeContainer_Vertical_TEST_0300
     * @tc.name testRelativeContainer
     * @tc.desc text set align:VerticalAlign.Bottom
     */
    it('SUB_ACE_RelativeContainer_Vertical_TEST_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addalign', value: VerticalAlign.Bottom
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Vertical_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_bt1');
      let RelativeContainer_Vertical_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_tx2');


      console.log('assert position')

      expect(Math.abs(RelativeContainer_Vertical_tx2.top - RelativeContainer_Vertical_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Vertical_tx2.left - RelativeContainer_Vertical_bt1.right) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_0300] END');
      done();

    });
  })
}