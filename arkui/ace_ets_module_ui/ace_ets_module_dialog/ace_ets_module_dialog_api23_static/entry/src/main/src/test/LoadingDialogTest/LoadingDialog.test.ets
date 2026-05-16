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
import { ThemeColorMode, CustomDialogController } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const LOG_CHUNK_SIZE = 500;

function logLongString(tag: string, longStr: string): void {
  let len = longStr.length;
  let part = 1;
  for (let i = 0; i < len; i += LOG_CHUNK_SIZE) {
    let end = i + LOG_CHUNK_SIZE;
    if (end > len) {
      end = len;
    }
    console.info(`${tag} [${part}] ${longStr.substring(i, end)}`);
    part++;
  }
}

const SLEEP_TIME = 1000;

export default function LoadingDialogTest() {
  describe('LoadingDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] LoadingDialogTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] LoadingDialogTest beforeEach start");

      // Ensure any open dialogs are closed before starting new test
      try {
        const dialogController1 = AppStorage.get<CustomDialogController>('loadingDialogController1');
        const dialogController2 = AppStorage.get<CustomDialogController>('loadingDialogController2');
        const dialogController3 = AppStorage.get<CustomDialogController>('loadingDialogController3');
        const dialogController4 = AppStorage.get<CustomDialogController>('loadingDialogController4');
        const dialogController5 = AppStorage.get<CustomDialogController>('loadingDialogController5');

        if (dialogController1) {
          dialogController1.close();
        }
        if (dialogController2) {
          dialogController2.close();
        }
        if (dialogController3) {
          dialogController3.close();
        }
        if (dialogController4) {
          dialogController4.close();
        }
        if (dialogController5) {
          dialogController5.close();
        }
        await Utils.sleep(300);
      } catch (err) {
        // Dialog may not be open, ignore error
      }

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/loadingDialog/loadingDialog',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] LoadingDialogTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] LoadingDialogTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data
      if (AppStorage.get<string>('loadingDialogContent') != undefined) {
        AppStorage.delete('loadingDialogContent');
      }
      if (AppStorage.get<boolean>('loadingDialogThemeSet') != undefined) {
        AppStorage.delete('loadingDialogThemeSet');
      }
      if (AppStorage.get<number>('loadingDialogThemeColorMode') != undefined) {
        AppStorage.delete('loadingDialogThemeColorMode');
      }

      // Ensure any open dialogs are closed after test
      try {
        const dialogController1 = AppStorage.get<CustomDialogController>('loadingDialogController1');
        const dialogController2 = AppStorage.get<CustomDialogController>('loadingDialogController2');
        const dialogController3 = AppStorage.get<CustomDialogController>('loadingDialogController3');
        const dialogController4 = AppStorage.get<CustomDialogController>('loadingDialogController4');
        const dialogController5 = AppStorage.get<CustomDialogController>('loadingDialogController5');

        if (dialogController1) {
          dialogController1.close();
        }
        if (dialogController2) {
          dialogController2.close();
        }
        if (dialogController3) {
          dialogController3.close();
        }
        if (dialogController4) {
          dialogController4.close();
        }
        if (dialogController5) {
          dialogController5.close();
        }
        await Utils.sleep(300);
      } catch (err) {
        // Dialog may not be open, ignore error
      }

      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] LoadingDialogTest after each called");
    });

    /**
     * @tc.number LoadingDialogTest_001
     * @tc.name loadingDialogContent
     * @tc.desc Test LoadingDialog property: content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadingDialogContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogContent START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnLoadingDialog1'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000); // Wait for dialog to open

        // LoadingDialog has no button; verify by stored data
        expect(AppStorage.get<string>('loadingDialogContent')).assertEqual('Loading...');

        // Close dialog（通过 dialogController.close()）
        const dialogController1 = AppStorage.get<CustomDialogController>('loadingDialogController1');
        if (dialogController1) {
          dialogController1.close();
          await Utils.sleep(500);
        }

        console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogContent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogContent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LoadingDialogTest_002
     * @tc.name loadingDialogTheme
     * @tc.desc Test LoadingDialog property: theme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadingDialogTheme', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogTheme START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnLoadingDialog2'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000); // Wait for dialog to open

        const themeSet = AppStorage.get<boolean>('loadingDialogThemeSet');
        console.info('[ARKUI_NEW] LoadingDialogTest: loadingDialogTheme - themeSet from AppStorage: ' + themeSet);
        if (themeSet === undefined || themeSet === null) {
          console.error('[ARKUI_NEW] LoadingDialogTest: themeSet is undefined/null');
          expect().assertFail();
        } else {
          expect(themeSet).assertTrue();
        }

        // Close dialog
        const dialogController2 = AppStorage.get<CustomDialogController>('loadingDialogController2');
        if (dialogController2) {
          dialogController2.close();
          await Utils.sleep(500);
        }

        console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogTheme END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogTheme error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LoadingDialogTest_003
     * @tc.name loadingDialogThemeColorModeSystem
     * @tc.desc Test LoadingDialog property: themeColorMode(SYSTEM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadingDialogThemeColorModeSystem', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeSystem START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnLoadingDialog3'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000); // Wait for dialog to open

        const themeColorMode = AppStorage.get<number>('loadingDialogThemeColorMode');
        console.info('[ARKUI_NEW] LoadingDialogTest: loadingDialogThemeColorModeSystem - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.SYSTEM);

        // Close dialog
        const dialogController3 = AppStorage.get<CustomDialogController>('loadingDialogController3');
        if (dialogController3) {
          dialogController3.close();
          await Utils.sleep(500);
        }

        console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeSystem END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeSystem error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LoadingDialogTest_004
     * @tc.name loadingDialogThemeColorModeLight
     * @tc.desc Test LoadingDialog property: themeColorMode(LIGHT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadingDialogThemeColorModeLight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeLight START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnLoadingDialog4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000); // Wait for dialog to open

        const themeColorMode = AppStorage.get<number>('loadingDialogThemeColorMode');
        console.info('[ARKUI_NEW] LoadingDialogTest: loadingDialogThemeColorModeLight - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.LIGHT);

        // Close dialog
        const dialogController4 = AppStorage.get<CustomDialogController>('loadingDialogController4');
        if (dialogController4) {
          dialogController4.close();
          await Utils.sleep(500);
        }

        console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeLight END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeLight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LoadingDialogTest_005
     * @tc.name loadingDialogThemeColorModeDark
     * @tc.desc Test LoadingDialog property: themeColorMode(DARK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadingDialogThemeColorModeDark', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeDark START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnLoadingDialog5'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000); // Wait for dialog to open

        const themeColorMode = AppStorage.get<number>('loadingDialogThemeColorMode');
        console.info('[ARKUI_NEW] LoadingDialogTest: loadingDialogThemeColorModeDark - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.DARK);

        // Close dialog
        const dialogController5 = AppStorage.get<CustomDialogController>('loadingDialogController5');
        if (dialogController5) {
          dialogController5.close();
          await Utils.sleep(500);
        }

        console.info('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeDark END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LoadingDialogTest execute: loadingDialogThemeColorModeDark error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
