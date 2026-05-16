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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function getRectangleByIdTest() {
  describe('getRectangleByIdTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] getRectangleByIdTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.uicontext.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] getRectangleByIdTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getRectangleById/getRectangleById',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] getRectangleByIdTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] getRectangleByIdTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] getRectangleByIdTest afterEach start");
      // Clean up AppStorage data
      if (AppStorage.get<number>('info') != undefined) {
        AppStorage.delete('info');
      }
      if (AppStorage.get<number>('info1') != undefined) {
        AppStorage.delete('info1');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] getRectangleByIdTest afterEach end");
    });

    /**
     * @tc.name   getRectangleById
     * @tc.number SUB_ARKUI_API_getRectangleById_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getRectangleById', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] getRectangleByIdTest execute: getRectangleByIdTest START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('getRectangleByIdButton'));
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME * 2); // Toast needs time to show
        
        let toastId: number = AppStorage.get<number>('info') as number;
        expect(toastId >= 0).assertTrue();
        let toastId2: number = AppStorage.get<number>('info1') as number;
        expect(toastId2 >= 0).assertTrue();

        console.info('[ARKUI_NEW] getRectangleByIdTest execute: getRectangleById END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] getRectangleByIdTest execute: getRectangleById error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
