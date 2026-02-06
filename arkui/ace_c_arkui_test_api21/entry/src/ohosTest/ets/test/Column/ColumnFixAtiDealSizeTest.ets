/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, beforeEach, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function ColumnFixAtiDealSizeTest() {
  describe('ColumnFixAtiDealSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ColumnFixAtiDealSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnFixAtiDealSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnFixAtiDealSize state pages:" + JSON.stringify(pages));
        if (!("ColumnFixAtiDealSize" == pages.name)) {
          console.info("get ColumnFixAtiDealSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ColumnFixAtiDealSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnFixAtiDealSize page error:" + err);
      }
      console.info("ColumnFixAtiDealSize beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ColumnFixAtiDealSize after each called");
    });

    /**
     * @tc.name   ColumnFixAtiDealSizeTest_0100
     * @tc.number ColumnFixAtiDealSizeTest_0100
     * @tc.desc   ColumnFixAtiDealSizeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ColumnFixAtiDealSizeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ColumnFixAtiDealSizeTest_0100] START');
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('ColumnFixAtiDealSizeChild');
      let obj: ESObject = JSON.parse(strJson);
      let width = parseFloat(obj.$attrs.width)
      let height = parseFloat(obj.$attrs.height)
      console.info("[ColumnFixAtiDealSizeTest_0100] width is: " + width);
      console.info("[ColumnFixAtiDealSizeTest_0100] height is: " + height);
      
      expect(Math.floor(Math.abs(width - 100)) > 0).assertTrue();
      expect(Math.floor(Math.abs(height - 100)) > 0).assertTrue();
      expect(Math.floor(Math.abs(width - 150)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(height - 150)) <= 1).assertTrue();

      console.info('[ColumnFixAtiDealSizeTest_0100] END');
      done();
    });

  })
}