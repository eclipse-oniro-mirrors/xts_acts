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

export default function progressButtonPageTest() {
  describe('progressButtonPage', () => {
    beforeEach(async (done: Function) => {
      console.info('progressButtonPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progressButton/progressButtonPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get progressButtonPage state pages: ' + JSON.stringify(pages));
        if (!('progressButtonPage' == pages.name)) {
          console.info('get progressButtonPage pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push progressButtonPage page result successful');
        }
      } catch (err) {
        console.error('push progressButtonPage page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('progressButtonPage beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('progressButtonPage after each called');
    })

    /**
     * @tc.number progressButtonPageTest
     * @tc.name   progressButtonPageTest_0100
     * @tc.desc   Test progressButtonPage
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('progressButtonPageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('[progressButtonPageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看progressButtonPage是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('下载'));
      expect(itemText !== null).assertTrue();
      console.info('[progressButtonPageTest_0100] END');
      done();
    });
  })
}