/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

export default function CalcJsunit02() {
  describe('CalcJsunit02', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Calc/Calc02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CalcJsunit02 state pages:" + JSON.stringify(pages));
        if (!("Calc02" == pages.name)) {
          console.info("get CalcJsunit02 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CalcJsunit02 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CalcJsunit02 page error:" + err);
      }
      console.info("CalcJsunit02 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("CalcJsunit02 after each called");
    });
    /**
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HTP26_017;SUB_ACE_FUNCTION_JICHU_SR000HTP26_004;SUB_ACE_FUNCTION_JICHU_SR000HTP26_003;
     * SUB_ACE_FUNCTION_JICHU_SR000HTP26_002;SUB_ACE_FUNCTION_JICHU_SR000HTP26_001;SUB_ACE_FUNCTION_JICHU_SR000HTP26_009;
     * SUB_ACE_FUNCTION_JICHU_SR000HTP26_007;SUB_ACE_FUNCTION_JICHU_SR000HTP26_006;SUB_ACE_FUNCTION_JICHU_SR000HTP26_005;
     * @tc.name CalcJsunit02
     * @tc.desc
     *
     * 11-19
     Row set height calc(45% + 45%)
     multiplication
     subtraction
     addition
     Single-valued operations
     Anomalies
     Hybrid operations
     Scientific notation
     division
     */
    it('CalcJsunit02_0100', 0, async (done: Function) => {
      console.info('[CalcJsunit02_0100] START');
      await CommonFunc.sleep(4000);
      let calc0201: RectValue = CommonFunc.getComponentRect('calc02key01');
      let calc0202: RectValue = CommonFunc.getComponentRect('calc02key02');
      let calc0203: RectValue = CommonFunc.getComponentRect('calc02key03');
      let calc0204: RectValue = CommonFunc.getComponentRect('calc02key04');
      let calc0205: RectValue = CommonFunc.getComponentRect('calc02key05');
      let calc0206: RectValue = CommonFunc.getComponentRect('calc02key06');
      let calc0207: RectValue = CommonFunc.getComponentRect('calc02key07');
      let calc0208: RectValue = CommonFunc.getComponentRect('calc02key08');
      let calc0209: RectValue = CommonFunc.getComponentRect('calc02key09');
      await CommonFunc.sleep(2000);
      console.log('1111', calc0201.top, calc0201.bottom, calc0201.bottom - calc0201.top)
      console.log('2222', calc0202.right, calc0202.left, calc0201.right - calc0201.left)
      console.log('3333', calc0203.right, calc0203.left, calc0203.right - calc0203.left)
      console.log('4444', calc0204.right, calc0204.left, calc0204.right - calc0204.left)
      console.log('5555', calc0205.right, calc0205.left, calc0205.right - calc0205.left)
      console.log('6666', calc0206.right, calc0206.left, calc0206.right - calc0206.left)
      console.log('7777', calc0207.right, calc0207.left, calc0207.right - calc0207.left)
      console.log('8888', calc0208.right, calc0208.left, calc0208.right - calc0208.left)
      console.log('9999', calc0209.right, calc0209.left, calc0209.right - calc0209.left)
      expect(Math.abs(Math.round(calc0201.bottom - calc0201.top) - Math.round(vp2px(54))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0202.right - calc0202.left) - Math.round(vp2px(120))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0203.right - calc0203.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0204.right - calc0204.left) - Math.round(vp2px(140))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0205.right - calc0205.left) - Math.round(vp2px(120))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0206.right - calc0206.left) - Math.round(vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0207.right - calc0207.left) - Math.round(vp2px(90))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0208.right - calc0208.left) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(calc0209.right - calc0209.left) - Math.round(vp2px(90))) <= 1).assertTrue();
      done();
    });
  })
}
