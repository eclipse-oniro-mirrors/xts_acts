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

export default function progressButtonV2PageTest() {
  describe('progressButtonV2Page', () => {
    beforeEach(async (done: Function) => {
      console.info('progressButtonV2Page beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progressButtonV2/progressButtonV2Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get progressButtonV2Page state pages: ' + JSON.stringify(pages));
        if (!('progressButtonV2Page' == pages.name)) {
          console.info('get progressButtonV2Page pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push progressButtonV2Page page result successful');
        }
      } catch (err) {
        console.error('push progressButtonV2Page page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('progressButtonV2Page beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('progressButtonV2Page after each called');
    })

    /**
     * @tc.name   progressButtonV2PageTest_0100
     * @tc.number progressButtonV2PageTest
     * @tc.desc   Test progressButtonV2Page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('progressButtonV2PageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[progressButtonV2PageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看progressButtonV2Page是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('下载'));
      expect(itemText !== null).assertTrue();
      console.info('[progressButtonV2PageTest_0100] END');
      done();
    });
  })
}