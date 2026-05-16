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
// Add short delay after router navigation to reduce race with inspector cleanup (avoid GlobalObjectStorage::Get crash)
const ROUTER_STABILIZE_MS = 300;
const DELAY_AFTER_TEST_MS = 300;

export default function UIObserverTest() {
  describe('UIObserverTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.uicontext.api23.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] UIObserverTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uiObserver/uiObserver',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] UIObserverTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        // Wait for page load and route/uiContext ready
        await Utils.sleep(1500);
        // Extra delay for page and inspector to stabilize (reduce SIGSEGV race)
        await Utils.sleep(ROUTER_STABILIZE_MS);
      } catch (err) {
        console.error("[ARKUI_NEW] UIObserverTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] UIObserverTest afterEach start");
      // Delay after test before cleanup to avoid tight race with next beforeEach
      await Utils.sleep(DELAY_AFTER_TEST_MS);
      // Clean up AppStorage result keys
      if (AppStorage.get<boolean>('uiObserverOnTabChange') != undefined) {
        AppStorage.delete('uiObserverOnTabChange');
      }
      if (AppStorage.get<string>('uiObserverTabContentLastIndex') != undefined) {
        AppStorage.delete('uiObserverTabContentLastIndex');
      }
      if (AppStorage.get<boolean>('uiObserverOnTabChangeRegistered') != undefined) {
        AppStorage.delete('uiObserverOnTabChangeRegistered');
      }
      if (AppStorage.get<boolean>('uiObserverOffTabChange') != undefined) {
        AppStorage.delete('uiObserverOffTabChange');
      }
      if (AppStorage.get<boolean>('uiObserverOnRouterPageSizeChange') != undefined) {
        AppStorage.delete('uiObserverOnRouterPageSizeChange');
      }
      if (AppStorage.get<string>('uiObserverRouterPageInfoSize') != undefined) {
        AppStorage.delete('uiObserverRouterPageInfoSize');
      }
      if (AppStorage.get<boolean>('uiObserverOnRouterPageSizeChangeRegistered') != undefined) {
        AppStorage.delete('uiObserverOnRouterPageSizeChangeRegistered');
      }
      if (AppStorage.get<boolean>('uiObserverOffRouterPageSizeChange') != undefined) {
        AppStorage.delete('uiObserverOffRouterPageSizeChange');
      }
      if (AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChange') != undefined) {
        AppStorage.delete('uiObserverOnNavDestinationSizeChange');
      }
      if (AppStorage.get<string>('uiObserverNavDestinationInfoSize') != undefined) {
        AppStorage.delete('uiObserverNavDestinationInfoSize');
      }
      if (AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChangeRegistered') != undefined) {
        AppStorage.delete('uiObserverOnNavDestinationSizeChangeRegistered');
      }
      if (AppStorage.get<boolean>('uiObserverOffNavDestinationSizeChange') != undefined) {
        AppStorage.delete('uiObserverOffNavDestinationSizeChange');
      }
      if (AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueId') != undefined) {
        AppStorage.delete('uiObserverOnNavDestinationSizeChangeByUniqueId');
      }
      if (AppStorage.get<string>('uiObserverNavDestinationInfoByUniqueIdSize') != undefined) {
        AppStorage.delete('uiObserverNavDestinationInfoByUniqueIdSize');
      }
      if (AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered') != undefined) {
        AppStorage.delete('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered');
      }
      if (AppStorage.get<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId') != undefined) {
        AppStorage.delete('uiObserverOffNavDestinationSizeChangeByUniqueId');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] UIObserverTest afterEach end");
    });

    /**
     * @tc.number UIObserverTest_001
     * @tc.name uiObserverOnTabChange
     * @tc.desc Test UIObserver method: onTabChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOnTabChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnTabChange START');
      try {
        const driver = Driver.create();
        const title = await driver.findComponent(ON.id('uiObserverTitle'));
        expect(!!title).assertEqual(true);
        const button = await driver.findComponent(ON.id('btnOnTabChange'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let registered = AppStorage.get<boolean>('uiObserverOnTabChangeRegistered');
        expect(registered !== undefined).assertTrue();
        if (registered !== undefined) {
          expect(registered).assertEqual(true);
        }

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnTabChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOnTabChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UIObserverTest_002
     * @tc.name uiObserverOffTabChange
     * @tc.desc Test UIObserver method: offTabChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOffTabChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffTabChange START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOffTabChange'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let offResult = AppStorage.get<boolean>('uiObserverOffTabChange');
        expect(offResult !== undefined).assertTrue();
        if (offResult !== undefined) {
          expect(offResult).assertEqual(true);
        }

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffTabChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOffTabChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UIObserverTest_005
     * @tc.name uiObserverOnRouterPageSizeChange
     * @tc.desc Test UIObserver method: onRouterPageSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOnRouterPageSizeChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnRouterPageSizeChange START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOnRouterPageSizeChange'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let registered = AppStorage.get<boolean>('uiObserverOnRouterPageSizeChangeRegistered');
        expect(registered !== undefined).assertTrue();
        if (registered !== undefined) {
          expect(registered).assertEqual(true);
        }

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnRouterPageSizeChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOnRouterPageSizeChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UIObserverTest_006
     * @tc.name uiObserverOffRouterPageSizeChange
     * @tc.desc Test UIObserver method: offRouterPageSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOffRouterPageSizeChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffRouterPageSizeChange START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOffRouterPageSizeChange'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let offResult = AppStorage.get<boolean>('uiObserverOffRouterPageSizeChange');
        expect(offResult !== undefined).assertTrue();
        if (offResult !== undefined) {
          expect(offResult).assertEqual(true);
        }

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffRouterPageSizeChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOffRouterPageSizeChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UIObserverTest_007
     * @tc.name uiObserverOnNavDestinationSizeChange
     * @tc.desc Test UIObserver method: onNavDestinationSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOnNavDestinationSizeChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnNavDestinationSizeChange START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOnNavDestinationSizeChange'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let registered = AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChangeRegistered');
        expect(registered).assertEqual(true);

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnNavDestinationSizeChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOnNavDestinationSizeChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UIObserverTest_008
     * @tc.name uiObserverOffNavDestinationSizeChange
     * @tc.desc Test UIObserver method: offNavDestinationSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOffNavDestinationSizeChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffNavDestinationSizeChange START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOffNavDestinationSizeChange'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let offResult = AppStorage.get<boolean>('uiObserverOffNavDestinationSizeChange');
        expect(offResult !== undefined).assertTrue();
        if (offResult !== undefined) {
          expect(offResult).assertEqual(true);
        }

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffNavDestinationSizeChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOffNavDestinationSizeChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UIObserverTest_009
     * @tc.name uiObserverOnNavDestinationSizeChangeByUniqueId
     * @tc.desc Test UIObserver method: onNavDestinationSizeChangeByUniqueId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOnNavDestinationSizeChangeByUniqueId', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnNavDestinationSizeChangeByUniqueId START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnOnNavDestinationSizeChangeByUniqueId'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let registered = AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered');
        expect(registered).assertEqual(true);

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOnNavDestinationSizeChangeByUniqueId END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOnNavDestinationSizeChangeByUniqueId error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UIObserverTest_010
     * @tc.name uiObserverOffNavDestinationSizeChangeByUniqueId
     * @tc.desc Test UIObserver method: offNavDestinationSizeChangeByUniqueId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverOffNavDestinationSizeChangeByUniqueId', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffNavDestinationSizeChangeByUniqueId START');
      try {
        const driver = Driver.create();
        // Click on then off to avoid framework crash (app died) when calling off without prior registration
        const onButton = await driver.findComponent(ON.id('btnOnNavDestinationSizeChangeByUniqueId'));
        expect(!!onButton).assertEqual(true);
        await (onButton?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        const offButton = await driver.findComponent(ON.id('btnOffNavDestinationSizeChangeByUniqueId'));
        expect(!!offButton).assertEqual(true);
        await (offButton?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let offResult = AppStorage.get<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId');
        expect(offResult !== undefined).assertTrue();
        if (offResult !== undefined) {
          expect(offResult).assertEqual(true);
        }

        console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverOffNavDestinationSizeChangeByUniqueId END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] UIObserverTest execute: uiObserverOffNavDestinationSizeChangeByUniqueId error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
