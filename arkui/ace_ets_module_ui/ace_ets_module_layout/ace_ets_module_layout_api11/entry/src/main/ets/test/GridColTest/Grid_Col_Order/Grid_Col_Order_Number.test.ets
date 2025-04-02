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
import GlobalContext from '../../../MainAbility/common/GlobalContext'
export default function Grid_Col_Order_Number() {
  describe('Grid_Col_Order_Number', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Col_Order_Number beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GridCol/Grid_Col_Order/Grid_Col_Order_Number",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Col_Order_Number state pages:" + JSON.stringify(pages));
        if (!("Grid_Col_Order_Number" == pages.name)) {
          console.info("get Grid_Col_Order_Number pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Col_Order_Number page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Col_Order_Number page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Order_Number after each called")
    });
    /**
     * @tc.number SUB_ACE_Grid_Col_Order_Number_TEST_0100
     * @tc.name testGridColOrder
     * @tc.desc GridCol sets order to -1
     */
    it('SUB_ACE_Grid_Col_Order_Number_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_0100] START');

      GlobalContext.getContext().getObject<number>('value').message.notify({
                    name: 'addOrder', value: -1
                });
    

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_01');
      let Grid_Col_Order_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_02');
      let Grid_Col_Order_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_03');
      let Grid_Col_Order_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_04');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_Number_02.top - Grid_Col_Order_Number_01.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_03.top - Grid_Col_Order_Number_02.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_04.top - Grid_Col_Order_Number_03.bottom) - vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Order_Number_TEST_0200
     * @tc.name testGridColOrder
     * @tc.desc GridCol sets order to 0
     */
    it('SUB_ACE_Grid_Col_Order_Number_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_0200] START');
      
       GlobalContext.getContext().getObject<number>('value').message.notify({
                    name: 'addOrder', value: 0
                });


      
   

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_01');
      let Grid_Col_Order_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_02');
      let Grid_Col_Order_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_03');
      let Grid_Col_Order_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_04');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_Number_02.top - Grid_Col_Order_Number_01.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_03.top - Grid_Col_Order_Number_02.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_04.top - Grid_Col_Order_Number_03.bottom) - vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Order_Number_TEST_0300
     * @tc.name testGridColOrder
     * @tc.desc GridCol sets order to 2
     */
    it('SUB_ACE_Grid_Col_Order_Number_TEST_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_0300] START');

       GlobalContext.getContext().getObject<number>('value').message.notify({
                    name: 'addOrder', value: 2
                });

      

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_01');
      let Grid_Col_Order_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_02');
      let Grid_Col_Order_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_03');
      let Grid_Col_Order_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number_04');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_Number_03.top - Grid_Col_Order_Number_02.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_04.top - Grid_Col_Order_Number_03.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_01.top - Grid_Col_Order_Number_04.bottom) - vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_0300] END');
      done();
    });

  })
}