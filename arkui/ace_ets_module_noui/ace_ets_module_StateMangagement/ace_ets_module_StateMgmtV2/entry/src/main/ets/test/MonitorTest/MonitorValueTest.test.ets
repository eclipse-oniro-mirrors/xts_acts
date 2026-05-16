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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function monitorValueTest() {
  describe('MonitorValueTest', () => {


    beforeEach(async (done: Function) => {
      console.info("Monitor0300Test setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Monitor/MonitorValueTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Monitor0300Test state pages:" + JSON.stringify(pages));
        if (!("Monitor0300" == pages.name)) {
          console.info("get Monitor0300Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Monitor0300Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Monitor0300Test page error:" + err);
      }
      console.info("Monitor0300Test beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'MonitorValueTest', '%{public}s', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'MonitorValueTest', '%{public}s', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   Monitor_value_defaultPath_001
     * @tc.number SUB_ARUI_MONITOR_VALUE_RETURN_001
     * @tc.desc   Test Monitor.value() returns first dirty path when no path specified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Monitor_value_defaultPath_001', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MonitorValueTest', '%{public}s', 'Monitor_value_defaultPath_001 START');
      try {
        const driver: Driver = await Driver.create();
        await CommonFunc.sleep(500);

        // Click name button to trigger change
        const button = await driver.findComponent(ON.id('monitor_change_name'));
        await button.click();
        await CommonFunc.sleep(500);

        // Check if log contains the expected monitor value info
        const path1 = await (await driver.findComponent(ON.id('monitor_path1'))).getText();
        const path2 = await (await driver.findComponent(ON.id('monitor_path2'))).getText();
        const path3 = await (await driver.findComponent(ON.id('monitor_path3'))).getText();
        hilog.info(0x0000, 'MonitorValueTest', '%{public}s', 'logs: ' + path1 + path2 + path3);
        expect(path1).assertEqual('path1: name')
        expect(path2).assertEqual('path2: name')
        expect(path3).assertEqual('path3: name')
        hilog.info(0x0000, 'MonitorValueTest', '%{public}s', 'Monitor_value_defaultPath_001 END');
      } catch (err) {
        hilog.error(0x0000, 'MonitorValueTest', '%{public}s', 'Monitor_value_defaultPath_001 Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

  });
}
