/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function GlobalReusePool002Test() {
  let driver: Driver;
  describe('GlobalReusePool002Test', () => {
    beforeAll(async () => {
      driver = Driver.create();
      await driver.delayMs(1000)
    });
    beforeEach(async (done: Function) => {
      console.info("GlobalReusePool002Test setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/GlobalReusePool002",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("GlobalReusePool002" == pages.name)) {
          console.info("get GlobalReusePool002Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GlobalReusePool002Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GlobalReusePool002Test page error:" + err);
      }
      console.info("GlobalReusePool002Test beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'GlobalReusePool002Test', 'afterEach: test case finished');
    });

    afterAll(async () => {
      AppStorage.delete('GlobalReuse002')
      hilog.info(0x0000, 'GlobalReusePool002Test', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   globalReusePool_poolAccepts_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_0100
     * @tc.desc   Test getReusePool API returns valid pool when configured
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('globalReusePool_poolAccepts_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'GlobalReusePool002Test', 'globalReusePool_poolAccepts_0100 START');
      let globalReuse002: boolean | undefined = AppStorage.get('GlobalReuse002')
      expect(globalReuse002).assertUndefined();
      let button = await driver.findComponent(ON.id('GlobalReuse002Change'));
      await button.click();
      await driver.delayMs(500);
      globalReuse002  = AppStorage.get('GlobalReuse002')
      expect(globalReuse002).assertTrue()
      hilog.info(0x0000, 'GlobalReusePool002Test', 'globalReusePool_poolAccepts_0100 END');
    });
  });
}
