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
import CommonFunc from '../../../MainAbility/common/Common';
export default function Row_Space() {
  describe('row_SpaceTest', function () {
    beforeEach(async function (done) {
      console.info("row_SpaceTest beforeEach start");
      let options = {
        url: "MainAbility/pages/Row/spaceChanged/Row_Space",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_Space state pages:" + JSON.stringify(pages));
        if (!("Row_Space" == pages.name)) {
          console.info("get Row_Space pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_Space page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_Space page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("row_SpaceTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Row_Space after each called")
    });
    /**
     * @tc.number    SUB_ACE_ROW_SPACE_TEST_0100
     * @tc.name      testRowSpaceUnfill
     * @tc.desc      The space of parent component set to 10,The child component is not fully filled with
     *               the parent component
     */
    it('testRowSpaceUnfill', 0, async function (done) {
      console.info('[testRowSpaceUnfill] START');
      globalThis.value.message.notify({ name: 'addSpace', value: 10 });
      await CommonFunc.sleep(3000);
      let Row_Space_011 = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012 = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013 = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01 = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1).assertTrue();
      expect(Math.round(Row_Space_012.left - Row_Space_011.right) - vp2px(10) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Row_Space_013.right).assertLess(Row_Space_01.right);
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testRowSpaceUnfill] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SPACE_TEST_0200
     * @tc.name      testRowSpaceFill
     * @tc.desc      The space of parent component set to 25,The child component is filled with
     *               the parent component
     */
    it('testRowSpaceFill', 0, async function (done) {
      console.info('[testRowSpaceFill] START');
      globalThis.value.message.notify({ name: 'addSpace', value: 25 });
      await CommonFunc.sleep(3000);
      let Row_Space_011 = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012 = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013 = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01 = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round((Row_Space_012.left - Row_Space_011.right) * 10) / 10 - Math.round(vp2px(25) * 10) / 10) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.right) - Math.round(Row_Space_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testRowSpaceFill] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SPACE_TEST_0300
     * @tc.name      testRowSpaceOverflow
     * @tc.desc      The space of parent component set to 30,The child component is overflow with
     *               the parent component
     */
    it('testRowSpaceOverflow', 0, async function (done) {
      console.info('[testRowSpaceOverflow] START');
      globalThis.value.message.notify({ name: 'addSpace', value: 30 });
      await CommonFunc.sleep(3000);
      let Row_Space_011 = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012 = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013 = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01 = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1).assertTrue();
      expect(Math.abs(Row_Space_012.left - Row_Space_011.right - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Row_Space_013.right).assertLarger(Row_Space_01.right);
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testRowSpaceOverflow] END');
      done();
    });
  })
}
