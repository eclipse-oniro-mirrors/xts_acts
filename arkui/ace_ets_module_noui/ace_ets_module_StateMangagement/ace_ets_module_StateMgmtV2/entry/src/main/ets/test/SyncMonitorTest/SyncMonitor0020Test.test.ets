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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SyncMonitor0020Test() {
  describe('SyncMonitor0020Test', () => {
    beforeEach(async (done: Function) => {
      console.info('SyncMonitor0020Test beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SyncMonitor/SyncMonitor0020',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SyncMonitor0020Test state pages: ' + JSON.stringify(pages));
        if (!('SyncMonitor0020' == pages.name)) {
          console.info('get SyncMonitor0020Test state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push SyncMonitor0020Test success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SyncMonitor0020Test page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   SyncMonitor0020Test_001
     * @tc.number SyncMonitor0020Test_001
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SyncMonitor0020Test_001', Level.LEVEL0, async (done: Function) => {
      console.info('SyncMonitor0020Test_001 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnSyncMonitor0020'));
      await button.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('textSyncMonitor0020'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[SyncMonitor0020Test_001] component text_1: ' + text_1);
      expect(text_1).assertEqual('2')
      console.info('[SyncMonitor0020Test_001] END');
      done();
    });
  })
}

