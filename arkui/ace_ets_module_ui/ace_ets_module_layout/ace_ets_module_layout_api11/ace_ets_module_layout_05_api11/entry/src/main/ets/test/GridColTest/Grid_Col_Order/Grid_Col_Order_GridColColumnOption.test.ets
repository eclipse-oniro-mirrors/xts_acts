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

export default function Grid_Col_Order_GridColColumnOption() {
  describe('Grid_Col_Order_GridColColumnOption', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Col_Order_GridColColumnOption beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GridCol/Grid_Col_Order/Grid_Col_Order_GridColColumnOption",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Col_Order_GridColColumnOption state pages:" + JSON.stringify(pages));
        if (!("Grid_Col_Order_GridColColumnOption" == pages.name)) {
          console.info("get Grid_Col_Order_GridColColumnOption pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Col_Order_GridColColumnOption page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Col_Order_GridColColumnOption page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Order_GridColColumnOption after each called")
    });
    /**
     * @tc.number SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0100
     * @tc.name testGridColOrder
     * @tc.desc Set the width of Column to 40vp
     */
    it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0100] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addOrder', value: "40vp"
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0200
     * @tc.name testGridColOrder
     * @tc.desc Set the width of Column to 80vp
     */
    it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0200] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addWidth', value: '80vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0300
     * @tc.name testGridColOrder
     * @tc.desc Set the width of Column to 120vp
     */
    it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0300] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addWidth', value: '130vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0400
     * @tc.name testGridColOrder
     * @tc.desc Set the width of Column to 180vp
     */
    it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0400] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addWidth', value: '180vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0500
     * @tc.name testGridColOrder
     * @tc.desc Set the width of Column to 220vp
     */
    it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0500] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addWidth', value: '230vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0600
     * @tc.name testGridColOrder
     * @tc.desc Set the width of Column to 320vp
     */
    it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0600] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addWidth', value: '330vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_0600] END');
      done();
    });
  })
}