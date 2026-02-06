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
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function RelativeContainer_AnchorPoint_Interdependence() {
  describe('RelativeContainer_AnchorPoint_Interdependence', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainer_AnchorPoint_Interdependence beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Interdependence",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainer_AnchorPoint_Interdependence state pages:" + JSON.stringify(pages));
        if (!("RelativeContainer_AnchorPoint_Interdependence" == pages.name)) {
          console.info("get RelativeContainer_AnchorPoint_Interdependence pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RelativeContainer_AnchorPoint_Interdependence page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainer_AnchorPoint_Interdependence page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RelativeContainer_AnchorPoint_Interdependence after each called")
    });

    /**
     * @tc.number SUB_ACE_RelativeContainer_AnchorPoint_Interdependence_TEST_0100
     * @tc.name testRelativeContainer
     * @tc.desc Subcomponent interdependence
     */
    it('SUB_ACE_RelativeContainer_AnchorPoint_Interdependence_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Interdependence_TEST_0100] START');

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_AnchorPoint_Interdependence_row3: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Interdependence_row3');

      let RelativeContainer_AnchorPoint_Interdependence_re1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Interdependence_re1');

      console.log('assert position')

      expect(Math.abs(RelativeContainer_AnchorPoint_Interdependence_row3.left - RelativeContainer_AnchorPoint_Interdependence_re1.left) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Interdependence_row3.top - RelativeContainer_AnchorPoint_Interdependence_re1.top) <= 1)
        .assertTrue();
      //      expect(RelativeContainer_AnchorPoint_Interdependence_row3.bottom).assertEqual(RelativeContainer_AnchorPoint_Interdependence_re1.bottom);


      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Interdependence_TEST_0100] END');
      done();
    });


  })
}