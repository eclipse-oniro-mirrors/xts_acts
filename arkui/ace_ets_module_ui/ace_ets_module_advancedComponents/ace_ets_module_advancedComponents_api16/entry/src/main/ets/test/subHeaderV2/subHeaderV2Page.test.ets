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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function subHeaderV2PageTest() {
  describe('subHeaderV2Page', () => {
    beforeEach(async (done: Function) => {
      console.info('subHeaderV2Page beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeaderV2/subHeaderV2Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subHeaderV2Page state pages: ' + JSON.stringify(pages));
        if (!('subHeaderV2Page' == pages.name)) {
          console.info('get subHeaderV2Page pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push subHeaderV2Page page result successful');
        }
      } catch (err) {
        console.error('push subHeaderV2Page page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('subHeaderV2Page beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('subHeaderV2Page after each called');
    })

    /**
     * @tc.number subHeaderV2PageTest
     * @tc.name   subHeaderV2PageTest_0100
     * @tc.desc   Test subHeaderV2Page
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderV2PageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderV2PageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看subHeaderV2Page是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('操作'));
      expect(itemText !== null).assertTrue();
      console.info('[subHeaderV2PageTest_0100] END');
      done();
    });
  })
}
