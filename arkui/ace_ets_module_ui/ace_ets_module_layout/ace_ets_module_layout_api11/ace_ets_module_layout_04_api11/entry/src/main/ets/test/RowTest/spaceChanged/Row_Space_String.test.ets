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

export default function Row_Space_String() {
  describe('Row_Space_String', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_Space_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/spaceChanged/Row_Space_String",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_Space_String state pages:" + JSON.stringify(pages));
        if (!("Row_Space_String" == pages.name)) {
          console.info("get Row_Space_String pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_Space_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_Space_String page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_Space_String after each called")
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0100
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '30vp'
     */
    it('SUB_ACE_Row_Space_String_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '30vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0100] END');
      done();
    });


    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0200
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '30'
     */
    it('SUB_ACE_Row_Space_String_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '30'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0300
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '50px'
     */
    it('SUB_ACE_Row_Space_String_TEST_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '50px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (50)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (50)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0400
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '70fp'
     */
    it('SUB_ACE_Row_Space_String_TEST_0400', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '70fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(fp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(fp2px(70)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0500
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '70lpx'
     */
    it('SUB_ACE_Row_Space_String_TEST_0500', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0500] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '70lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();
      console.log('Row_Space_String_011.top - Row_Space_String_01.top', Row_Space_String_011.top - Row_Space_String_01.top)
      console.log('Row_Space_String_012.top - Row_Space_String_01.top', Row_Space_String_012.top - Row_Space_String_01.top)
      console.log('Row_Space_String_013.top - Row_Space_String_01.top', Row_Space_String_013.top - Row_Space_String_01.top)

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(lpx2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(lpx2px(70)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0600
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to vp2px(10)
     */
    it('SUB_ACE_Row_Space_String_TEST_0600', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0600] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: vp2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0700
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2vp(10)
     */
    it('SUB_ACE_Row_Space_String_TEST_0700', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0700] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: px2vp(10) + 'vp'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (10)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0700] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0800
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to fp2px(10)
     */
    it('SUB_ACE_Row_Space_String_TEST_0800', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0800] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: fp2px(10) + 'px'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(fp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(fp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0800] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_0900
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2fp(10)
     */
    it('SUB_ACE_Row_Space_String_TEST_0900', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_0900] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: px2fp(10) + 'fp'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (10)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_0900] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_1000
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to lpx2px(10)
     */
    it('SUB_ACE_Row_Space_String_TEST_1000', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_1000] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: lpx2px(10) + 'px'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(lpx2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(lpx2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_1000] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_1100
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to px2lpx(10)
     */
    it('SUB_ACE_Row_Space_String_TEST_1100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_1100] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: px2lpx(10) + 'lpx'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();
      console.log('Row_Space_String_011.top - Row_Space_String_01.top', Row_Space_String_011.top - Row_Space_String_01.top)
      console.log('Row_Space_String_012.top - Row_Space_String_01.top', Row_Space_String_012.top - Row_Space_String_01.top)
      console.log('Row_Space_String_013.top - Row_Space_String_01.top', Row_Space_String_013.top - Row_Space_String_01.top)

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (10)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_1100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_Space_String_TEST_1200
     * @tc.name testColumnSpace
     * @tc.desc The value of space is set to '3' + '0'
     */
    it('SUB_ACE_Row_Space_String_TEST_1200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_Space_String_TEST_1200] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: '3' + '0'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_1200] END');
      done();
    });

  })
}