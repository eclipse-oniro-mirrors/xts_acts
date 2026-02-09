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

export default function toolBarV2ItemStateTest() {
  describe('toolBarV2ItemState', () => {
    beforeEach(async (done: Function) => {
      console.info('toolBarV2ItemState beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toolBarV2/toolBarV2ItemState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get toolBarV2ItemState state pages: ' + JSON.stringify(pages));
        if ('toolBarV2ItemState' !== pages.name) {
          console.info('get toolBarV2ItemState pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push toolBarV2ItemState Test result successful');
        }
      } catch (err) {
        console.error('push toolBarV2ItemStateTest  error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('toolBarV2ItemStateTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('toolBarV2ItemStateTest after each called');
    })

    /**
     * @tc.name   toolBarV2ItemStateTest_0100
     * @tc.number toolBarV2ItemStateTest
     * @tc.desc   Test toolBarV2ItemState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('toolBarV2ItemStateTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[toolBarV2ItemStateTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let disableItem = await driver.findComponent(ON.text('Copy'));
      let enableItem = await driver.findComponent(ON.text('Share'));
      expect(disableItem !== null).assertTrue();
      expect(enableItem !== null).assertTrue();
      console.info('[toolBarV2ItemStateTest_0100] END');
      done();
    });
  })
}