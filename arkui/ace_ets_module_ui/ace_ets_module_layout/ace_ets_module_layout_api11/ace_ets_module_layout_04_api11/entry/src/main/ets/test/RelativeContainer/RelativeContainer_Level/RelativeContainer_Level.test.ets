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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function RelativeContainer_Level() {
  describe('RelativeContainer_Level', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainer_Level beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_Level/RelativeContainer_Level",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainer_Level state pages:" + JSON.stringify(pages));
        if (!("RelativeContainer_Level" == pages.name)) {
          console.info("get RelativeContainer_Level pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RelativeContainer_Level page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainer_Level page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RelativeContainer_Level after each called")
    });
    /**
     * @tc.number SUB_ACE_RelativeContainer_Level_TEST_0100
     * @tc.name testRelativeContainer
     * @tc.desc text set align:HorizontalAlign.Start
     */
    it('SUB_ACE_RelativeContainer_Level_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_Level_TEST_0100] START');
      GlobalContext.getContext().getObject<HorizontalAlign>('value').message.notify({
        name: 'addalign', value: HorizontalAlign.Start
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Level_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_bt1');
      let RelativeContainer_Level_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Level_tx2.top - RelativeContainer_Level_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Level_tx2.right - RelativeContainer_Level_bt1.left) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Level_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_RelativeContainer_Level_TEST_0200
     * @tc.name testRelativeContainer
     * @tc.desc text set align:HorizontalAlign.Center
     */
    it('SUB_ACE_RelativeContainer_Level_TEST_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_Level_TEST_0200] START');
      GlobalContext.getContext().getObject<HorizontalAlign>('value').message.notify({
        name: 'addalign', value: HorizontalAlign.Center
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Level_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_bt1');
      let RelativeContainer_Level_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Level_tx2.top - RelativeContainer_Level_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Level_tx2.right - ((RelativeContainer_Level_bt1.right - RelativeContainer_Level_bt1.left) / 2 + RelativeContainer_Level_bt1.left)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Level_TEST_0200] END');
      done();

    });

    /**
     * @tc.number SUB_ACE_RelativeContainer_Level_TEST_0300
     * @tc.name testRelativeContainer
     * @tc.desc text set align:HorizontalAlign.End
     */
    it('SUB_ACE_RelativeContainer_Level_TEST_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_Level_TEST_0300] START');
      GlobalContext.getContext().getObject<HorizontalAlign>('value').message.notify({
        name: 'addalign', value: HorizontalAlign.End
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Level_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_bt1');
      let RelativeContainer_Level_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Level_tx2.top - RelativeContainer_Level_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Level_tx2.right - RelativeContainer_Level_bt1.right) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Level_TEST_0300] END');
      done();

    });
  })
}