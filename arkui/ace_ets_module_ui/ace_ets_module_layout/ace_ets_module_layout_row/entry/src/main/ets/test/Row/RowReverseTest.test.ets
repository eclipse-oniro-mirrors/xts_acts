/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function RowReverseTest() {
  describe('RowReverseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RowReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowReversePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowReverseTest state pages:" + JSON.stringify(pages));
        if (!("RowReverseTest" == pages.name)) {
          console.info("get RowReverseTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RowReverseTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowReverseTest page error:" + err);
      }
      console.info("RowReverseTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   RowReverseTest_0100
     * @tc.number RowReverseTest_0100
     * @tc.desc   test Row reverse is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RowReverseTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[RowReverseTest_0100] START');
      await CommonFunc.sleep(1000);

      let Row_1 = CommonFunc.getComponentRect('RowReverse_Row_1');
      let Row_01 = CommonFunc.getComponentRect('RowReverse_Row_01');
      let Row_02 = CommonFunc.getComponentRect('RowReverse_Row_02');

      console.log('[RowReverseTest_0100] Row_01.left - Row_02.right', +(Row_01.left - Row_02.right));
      console.log('[RowReverseTest_0100] Row_01.right - Row_1.right', +(Row_01.right - Row_1.right));
      expect(Math.floor(Math.abs(Row_01.left - Row_02.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row_01.right - Row_1.right)) <= 1).assertTrue();

      console.info('[RowReverseTest_0100] END');
      done();
    });

    /**
     * @tc.name   RowReverseTest_0200
     * @tc.number RowReverseTest_0200
     * @tc.desc   test Row reverse is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RowReverseTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[RowReverseTest_0200] START');
      await CommonFunc.sleep(1000);

      let Row_2 = CommonFunc.getComponentRect('RowReverse_Row_2');
      let Row_03 = CommonFunc.getComponentRect('RowReverse_Row_03');
      let Row_04 = CommonFunc.getComponentRect('RowReverse_Row_04');

      console.log('[RowReverseTest_0200] Row_03.left - Row_2.left', +(Row_03.left - Row_2.left));
      console.log('[RowReverseTest_0200] Row_03.right - Row_04.left', +(Row_03.right - Row_04.left));
      expect(Math.floor(Math.abs(Row_03.left - Row_2.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row_03.right - Row_04.left)) <= 1).assertTrue();

      console.info('[RowReverseTest_0200] END');
      done();
    });
  })
}