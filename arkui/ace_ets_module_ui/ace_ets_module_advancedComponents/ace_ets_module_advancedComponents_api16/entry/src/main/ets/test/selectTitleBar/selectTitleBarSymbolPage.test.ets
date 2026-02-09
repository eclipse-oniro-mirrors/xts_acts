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

export default function selectTitleBarSymbolTest() {
  describe('selectTitleBarSymbolPage', () => {
    beforeEach(async (done: Function) => {
      console.info('selectTitleBarSymbolPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectTitleBar/selectTitleBarSymbolPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectTitleBarSymbolPage state pages: ' + JSON.stringify(pages));
        if (!('selectTitleBarSymbolPage' == pages.name)) {
          console.info('get selectTitleBarSymbolPage pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push selectTitleBarSymbolPage page result successful');
        }
      } catch (err) {
        console.error('push selectTitleBarSymbolPage page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('selectTitleBarSymbolPage beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('selectTitleBarSymbolPage after each called');
    })

    /**
     * @tc.name   selectTitleBarSymbolPage_0100
     * @tc.number selectTitleBarSymbolPage
     * @tc.desc   Test selectTitleBarSymbolPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectTitleBarSymbolPage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('[selectTitleBarSymbolPage_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看selectTitleBarSymbolPage是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('所有照片'));
      expect(itemText !== null).assertTrue();
      console.info('[selectTitleBarSymbolPage_0100] END');
      done();
    });
  })
}