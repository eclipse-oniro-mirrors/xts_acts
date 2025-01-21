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
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
export default function rowNesting_Space() {
  describe('rowNesting_Space', function () {
    beforeEach(async function (done) {
      console.info("rowNesting_Space beforeEach start");
      let options = {
        url: "MainAbility/pages/Row/RowNesting/rowNesting_Space",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rowNesting_Space state pages:" + JSON.stringify(pages));
        if (!("rowNesting_Space" == pages.name)) {
          console.info("get rowNesting_Space pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push rowNesting_Space page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rowNesting_Space page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("rowNesting_Space after each called")
    });

    /**
     * @tc.number    SUB_ACE_rowNesting_Space_TEST_0100
     * @tc.name      testColumnSpace
     * @tc.desc      The value of space is set to '10vp'
     */
    it('SUB_ACE_rowNesting_Space_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_rowNesting_Space_TEST_0100] START');
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let rowNesting_Space_011 = CommonFunc.getComponentRect('rowNesting_Space_011');
      let rowNesting_Space_012 = CommonFunc.getComponentRect('rowNesting_Space_012');
      let rowNesting_Space_013 = CommonFunc.getComponentRect('rowNesting_Space_013');
      let rowNesting_Space_01 = CommonFunc.getComponentRect('rowNesting_Space_01');

      console.log('assert position')
      expect(Math.abs(Math.round(rowNesting_Space_011.top - rowNesting_Space_01.top) - Math.round(rowNesting_Space_01.bottom - rowNesting_Space_011.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(rowNesting_Space_012.top - rowNesting_Space_01.top) - Math.round(rowNesting_Space_01.bottom - rowNesting_Space_012.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(rowNesting_Space_013.top - rowNesting_Space_01.top) - Math.round(rowNesting_Space_01.bottom - rowNesting_Space_013.bottom)) <= 1).assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(rowNesting_Space_012.left - rowNesting_Space_011.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(rowNesting_Space_013.left - rowNesting_Space_012.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      console.log('rowNesting_Space_012.left - rowNesting_Space_011.right', + rowNesting_Space_012.left - rowNesting_Space_011.right)
      console.log('rowNesting_Space_013.left - rowNesting_Space_012.right', + rowNesting_Space_013.left - rowNesting_Space_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(rowNesting_Space_011.bottom - rowNesting_Space_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(rowNesting_Space_012.bottom - rowNesting_Space_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(rowNesting_Space_013.bottom - rowNesting_Space_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(rowNesting_Space_011.right - rowNesting_Space_011.left)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(rowNesting_Space_012.right - rowNesting_Space_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(rowNesting_Space_013.right - rowNesting_Space_013.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      console.info('[SUB_ACE_rowNesting_Space_TEST_0100] END');
      done();
    });

  })
}