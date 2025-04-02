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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function Row_layoutWeight_All() {
  describe('Row_layoutWeight_All', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_layoutWeight_All beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/layoutWeight/Row_layoutWeight_All",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_layoutWeight_All state pages:" + JSON.stringify(pages));
        if (!("Row_layoutWeight_All" == pages.name)) {
          console.info("get Row_layoutWeight_All pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_layoutWeight_All page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_layoutWeight_All page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_layoutWeight_All after each called")
    });

    /**
     * @tc.number SUB_ACE_Row_layoutWeight_All_TEST_0100
     * @tc.name testLayoutWeight
     * @tc.desc row1、row2 and row3 set layoutWeight('3')
     */
    it('SUB_ACE_Row_layoutWeight_All_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_layoutWeight_All_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'layoutWeight1', value: '2'
      });
      globalThis.value.message.notify({
        name: 'layoutWeight2', value: '2'
      });
      globalThis.value.message.notify({
        name: 'layoutWeight3', value: '2'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_layoutWeight_All_011: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_011');
      let Row_layoutWeight_All_012: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_012');
      let Row_layoutWeight_All_013: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_013');
      let Row_layoutWeight_All_01: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_layoutWeight_All_011.top - Row_layoutWeight_All_01.top) - Math.round(Row_layoutWeight_All_01.bottom - Row_layoutWeight_All_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_All_012.top - Row_layoutWeight_All_01.top) - Math.round(Row_layoutWeight_All_01.bottom - Row_layoutWeight_All_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_All_013.top - Row_layoutWeight_All_01.top) - Math.round(Row_layoutWeight_All_01.bottom - Row_layoutWeight_All_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_layoutWeight_All_012.left - Row_layoutWeight_All_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_013.left - Row_layoutWeight_All_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_layoutWeight_All_012.left - Row_layoutWeight_All_011.right', Row_layoutWeight_All_012.left - Row_layoutWeight_All_011.right)
      console.log('Row_layoutWeight_All_013.left - Row_layoutWeight_All_012.right', Row_layoutWeight_All_013.left - Row_layoutWeight_All_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_layoutWeight_All_011.bottom - Row_layoutWeight_All_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_012.bottom - Row_layoutWeight_All_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_013.bottom - Row_layoutWeight_All_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_layoutWeight_All_011.right - Row_layoutWeight_All_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_012.right - Row_layoutWeight_All_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_013.right - Row_layoutWeight_All_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_layoutWeight_All_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_layoutWeight_All_TEST_0200
     * @tc.name testLayoutWeight
     * @tc.desc row1 set layoutWeight('3') , row2 set layoutWeight('2'),row3 set layoutWeight('1')
     */
    it('SUB_ACE_Row_layoutWeight_All_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_layoutWeight_All_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'layoutWeight1', value: '3'
      });
      globalThis.value.message.notify({
        name: 'layoutWeight2', value: '2'
      });
      globalThis.value.message.notify({
        name: 'layoutWeight3', value: '1'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_layoutWeight_All_011: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_011');
      let Row_layoutWeight_All_012: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_012');
      let Row_layoutWeight_All_013: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_013');
      let Row_layoutWeight_All_01: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_All_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_layoutWeight_All_011.top - Row_layoutWeight_All_01.top) - Math.round(Row_layoutWeight_All_01.bottom - Row_layoutWeight_All_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_All_012.top - Row_layoutWeight_All_01.top) - Math.round(Row_layoutWeight_All_01.bottom - Row_layoutWeight_All_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_All_013.top - Row_layoutWeight_All_01.top) - Math.round(Row_layoutWeight_All_01.bottom - Row_layoutWeight_All_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_layoutWeight_All_012.left - Row_layoutWeight_All_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_013.left - Row_layoutWeight_All_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_layoutWeight_All_012.left - Row_layoutWeight_All_011.right', Row_layoutWeight_All_012.left - Row_layoutWeight_All_011.right)
      console.log('Row_layoutWeight_All_013.left - Row_layoutWeight_All_012.right', Row_layoutWeight_All_013.left - Row_layoutWeight_All_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_layoutWeight_All_011.bottom - Row_layoutWeight_All_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_012.bottom - Row_layoutWeight_All_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_013.bottom - Row_layoutWeight_All_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_layoutWeight_All_011.right - Row_layoutWeight_All_011.left)) - (Math.round(vp2px(225)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_012.right - Row_layoutWeight_All_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_All_013.right - Row_layoutWeight_All_013.left)) - (Math.round(vp2px(75)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_layoutWeight_All_TEST_0200] END');
      done();
    });


  })
}