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
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback, Message } from '../../../MainAbility/common/MessageManager';

export default function Column_Space_String() {
  describe('Column_Space_String', () => {
    beforeEach(async () => {
      console.info("Column_Space_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space_String",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Column_Space_String state pages1:" + JSON.stringify(pages));
        if (!("Column_Space_String" == pages.name)) {
          console.info("get Column_Space_String pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          pages = router.getState();
          console.info("get Column_Space_String state pages2:" + JSON.stringify(pages));
          console.info("push Column_Space_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Space_String page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Column_Space_String after each called")
    });

    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0100
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '30'
     */
    it('SUB_ACE_Column_Space_String_TEST_0100', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '30'
      });
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - vp2px(30)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0100] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0200
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50px'
     */
    it('SUB_ACE_Column_Space_String_TEST_0200', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '50px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 50) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 50) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0200] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0300
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50fp'
     */
    it('SUB_ACE_Column_Space_String_TEST_0300', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '50fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - fp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - fp2px(50)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_Space_String_013.bottom - Column_Space_String_01.bottom) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0300] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0400
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50lpx'
     */
    it('SUB_ACE_Column_Space_String_TEST_0400', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '50lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('Column_Space_String_011.left - Column_Space_String_01.left', +(Column_Space_String_011.left - Column_Space_String_01.left))
      console.log('Column_Space_String_012.left - Column_Space_String_01.left', +(Column_Space_String_012.left - Column_Space_String_01.left))
      console.log('Column_Space_String_013.left - Column_Space_String_01.left', +(Column_Space_String_013.left - Column_Space_String_01.left))
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - lpx2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - lpx2px(50)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0400] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0500
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to vp2px(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_0500', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0500] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: vp2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - vp2px(10)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0500] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0600
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2vp(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_0600', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0600] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: px2vp(10) + 'vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0600] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0700
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to fp2px(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_0700', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0700] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: fp2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - fp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - fp2px(10)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0700] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0800
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2fp(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_0800', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0800] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: px2fp(10) + 'fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0800] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_0900
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to lpx2px(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_0900', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0900] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: lpx2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - lpx2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - lpx2px(10)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0900] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_1000
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2lpx(10)
     */
    it('SUB_ACE_Column_Space_String_TEST_1000', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_1000] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: px2lpx(10) + 'lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('Column_Space_String_011.left - Column_Space_String_01.left', +(Column_Space_String_011.left - Column_Space_String_01.left))
      console.log('Column_Space_String_012.left - Column_Space_String_01.left', +(Column_Space_String_012.left - Column_Space_String_01.left))
      console.log('Column_Space_String_013.left - Column_Space_String_01.left', +(Column_Space_String_013.left - Column_Space_String_01.left))
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_01000] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_1100
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '3'+'0'
     */
    it('SUB_ACE_Column_Space_String_TEST_1100', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_01100] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '3' + '0'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - vp2px(30)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_01100] END');
    });
    /**
     * @tc.number SUB_ACE_Column_Space_String_TEST_1200
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50'
     */
    it('SUB_ACE_Column_Space_String_TEST_1200', 0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_1200] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '50'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) - (Column_Space_String_01.right - Column_Space_String_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - (Column_Space_String_013.top - Column_Space_String_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - vp2px(50)) <= 1).assertTrue();
      console.log('Column_Space_String_012.top - Column_Space_String_011.bottom', +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('Column_Space_String_013.top - Column_Space_String_012.bottom', +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_1200] END');
    });

  })
}