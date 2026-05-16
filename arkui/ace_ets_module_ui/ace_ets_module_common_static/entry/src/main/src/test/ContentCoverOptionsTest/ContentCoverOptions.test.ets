'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON, Rect } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/ContentCoverOptions/ContentCoverOptionsIndex';
const PAGE_NAME = 'ContentCoverOptionsIndex';

export default function ContentCoverOptionsTest() {
  describe('ContentCoverOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number safeArea_0010
     * @tc.name safeArea_0010
     * @tc.desc test assertTrue is SafeArea.top > 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('safeArea_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('safeArea_0010 START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        await CommonFunc.sleep(500);
        const button = await driver.findComponent(ON.id('Button'));
        expect(button !== null).assertTrue();
        if (button === null) {
          throw new Error('Button not found');
        }
        await CommonFunc.sleep(500);
        await (button.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        const safeAreaButton = await driver.findComponent(ON.id('SafeArea'));
        const safeArea = await (safeAreaButton?.getBounds() as Promise<Rect>)
        console.info('safeArea_0010 enableSafeArea: ' + JSON.stringify(safeArea));
        console.info('safeArea_0010 top: ' + safeArea.top);
        expect(Math.round(safeArea.top) > 0).assertTrue();
        console.info('[safeArea_0010] END');
      } catch (error) {
        console.error('safeArea_0010 error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
