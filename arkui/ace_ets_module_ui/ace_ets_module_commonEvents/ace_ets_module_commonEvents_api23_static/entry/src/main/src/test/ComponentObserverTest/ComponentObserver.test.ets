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
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function ComponentObserverTest() {
  describe('ComponentObserverTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ComponentObserverTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.common.componentSnapshot.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ComponentObserverTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentObserver/componentObserver',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] ComponentObserverTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ComponentObserverTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ComponentObserverTest afterEach start");
      // Clean up AppStorage data
      if (AppStorage.get<inspector.ComponentObserver>('componentObserver') != undefined) {
        AppStorage.delete('componentObserver');
      }
      if (AppStorage.get<boolean>('componentObserverOnLayout') != undefined) {
        AppStorage.delete('componentObserverOnLayout');
      }
      if (AppStorage.get<boolean>('componentObserverOnLayoutRegistered') != undefined) {
        AppStorage.delete('componentObserverOnLayoutRegistered');
      }
      if (AppStorage.get<boolean>('componentObserverOnDraw') != undefined) {
        AppStorage.delete('componentObserverOnDraw');
      }
      if (AppStorage.get<boolean>('componentObserverOnDrawRegistered') != undefined) {
        AppStorage.delete('componentObserverOnDrawRegistered');
      }
      if (AppStorage.get<boolean>('componentObserverOnLayoutChildren') != undefined) {
        AppStorage.delete('componentObserverOnLayoutChildren');
      }
      if (AppStorage.get<boolean>('componentObserverOnLayoutChildrenRegistered') != undefined) {
        AppStorage.delete('componentObserverOnLayoutChildrenRegistered');
      }
      if (AppStorage.get<boolean>('componentObserverOffLayoutChildren') != undefined) {
        AppStorage.delete('componentObserverOffLayoutChildren');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] ComponentObserverTest afterEach end");
    });

    /**
     * @tc.number ComponentObserverTest_001
     * @tc.name componentObserverOnLayout
     * @tc.desc Test ComponentObserver method: onLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('componentObserverOnLayout', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnLayout START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOnLayout'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let registered = AppStorage.get<boolean>('componentObserverOnLayoutRegistered');
        expect(registered).assertEqual(true);

        console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnLayout END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnLayout error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ComponentObserverTest_002
     * @tc.name componentObserverOnDraw
     * @tc.desc Test ComponentObserver method: onDraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('componentObserverOnDraw', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnDraw START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOnDraw'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let registered = AppStorage.get<boolean>('componentObserverOnDrawRegistered');
        expect(registered).assertEqual(true);

        console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnDraw END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnDraw error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ComponentObserverTest_003
     * @tc.name componentObserverOnLayoutChildren
     * @tc.desc Test ComponentObserver method: onLayoutChildren
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('componentObserverOnLayoutChildren', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnLayoutChildren START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOnLayoutChildren'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let registered = AppStorage.get<boolean>('componentObserverOnLayoutChildrenRegistered');
        expect(registered).assertEqual(true);

        console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnLayoutChildren END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOnLayoutChildren error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ComponentObserverTest_004
     * @tc.name componentObserverOffLayoutChildren
     * @tc.desc Test ComponentObserver method: offLayoutChildren
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('componentObserverOffLayoutChildren', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOffLayoutChildren START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOffLayoutChildren'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let offResult = AppStorage.get<boolean>('componentObserverOffLayoutChildren');
        expect(offResult).assertEqual(true);

        console.info('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOffLayoutChildren END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ComponentObserverTest execute: componentObserverOffLayoutChildren error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
