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
import { ThemeColorMode } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const LOG_CHUNK_SIZE = 500;
const SLEEP_TIME = 1000;

export default function AlertDialogTest() {
  describe('AlertDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] AlertDialogTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] AlertDialogTest beforeEach start");

      // Ensure any open dialogs are closed before starting new test
      try {
        const driver = Driver.create();
        const confirmButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (confirmButton) {
          await (confirmButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
      } catch (err) {
        // Dialog may not be open, ignore error
      }

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/alertDialog/alertDialog',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] AlertDialogTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] AlertDialogTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data
      if (AppStorage.get<string>('alertDialogPrimaryTitle') != undefined) {
        AppStorage.delete('alertDialogPrimaryTitle');
      }
      if (AppStorage.get<string>('alertDialogSecondaryTitle') != undefined) {
        AppStorage.delete('alertDialogSecondaryTitle');
      }
      if (AppStorage.get<string>('alertDialogContent') != undefined) {
        AppStorage.delete('alertDialogContent');
      }
      if (AppStorage.get<string>('alertDialogPrimaryButtonValue') != undefined) {
        AppStorage.delete('alertDialogPrimaryButtonValue');
      }
      if (AppStorage.get<boolean>('alertDialogPrimaryButtonActionCalled') != undefined) {
        AppStorage.delete('alertDialogPrimaryButtonActionCalled');
      }
      if (AppStorage.get<string>('alertDialogSecondaryButtonValue') != undefined) {
        AppStorage.delete('alertDialogSecondaryButtonValue');
      }
      if (AppStorage.get<boolean>('alertDialogSecondaryButtonActionCalled') != undefined) {
        AppStorage.delete('alertDialogSecondaryButtonActionCalled');
      }
      if (AppStorage.get<boolean>('alertDialogThemeSet') != undefined) {
        AppStorage.delete('alertDialogThemeSet');
      }
      if (AppStorage.get<number>('alertDialogThemeColorMode') != undefined) {
        AppStorage.delete('alertDialogThemeColorMode');
      }

      // Ensure any open dialogs are closed after test
      try {
        const driver = Driver.create();
        const confirmButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (confirmButton) {
          await (confirmButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
        const cancelButton = await driver.findComponent(ON.text('Cancel', MatchPattern.EQUALS));
        if (cancelButton) {
          await (cancelButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
      } catch (err) {
        // Dialog may not be open, ignore error
      }

      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] AlertDialogTest after each called");
    });

    /**
     * @tc.number AlertDialogTest_001
     * @tc.name alertDialogPrimaryTitle
     * @tc.desc Test AlertDialog property: primaryTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogPrimaryTitle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogPrimaryTitle START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog1'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('alertDialogPrimaryTitle')).assertEqual('Primary Title');

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogPrimaryTitle END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogPrimaryTitle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_002
     * @tc.name alertDialogSecondaryTitle
     * @tc.desc Test AlertDialog property: secondaryTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogSecondaryTitle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogSecondaryTitle START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog2'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('alertDialogSecondaryTitle')).assertEqual('Secondary Title');

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogSecondaryTitle END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogSecondaryTitle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_003
     * @tc.name alertDialogContent
     * @tc.desc Test AlertDialog property: content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogContent START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog3'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('alertDialogContent')).assertEqual('Test Content');

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogContent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogContent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_004
     * @tc.name alertDialogPrimaryButton
     * @tc.desc Test AlertDialog property: primaryButton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogPrimaryButton', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogPrimaryButton START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        let primaryButton = await driver.findComponent(ON.text('Primary Button', MatchPattern.EQUALS));
        if (!primaryButton) {
          primaryButton = await driver.findComponent(ON.text('主按钮', MatchPattern.EQUALS));
        }
        expect(!!primaryButton).assertTrue();
        await (primaryButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('alertDialogPrimaryButtonValue')).assertEqual('Primary Button');
        expect(AppStorage.get<boolean>('alertDialogPrimaryButtonActionCalled')).assertTrue();

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogPrimaryButton END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogPrimaryButton error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_005
     * @tc.name alertDialogSecondaryButton
     * @tc.desc Test AlertDialog property: secondaryButton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogSecondaryButton', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogSecondaryButton START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog5'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        let secondaryButton = await driver.findComponent(ON.text('Secondary Button', MatchPattern.EQUALS));
        if (!secondaryButton) {
          secondaryButton = await driver.findComponent(ON.text('次按钮', MatchPattern.EQUALS));
        }
        expect(!!secondaryButton).assertTrue();
        await (secondaryButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('alertDialogSecondaryButtonValue')).assertEqual('Secondary Button');
        expect(AppStorage.get<boolean>('alertDialogSecondaryButtonActionCalled')).assertTrue();

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogSecondaryButton END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogSecondaryButton error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_006
     * @tc.name alertDialogTheme
     * @tc.desc Test AlertDialog property: theme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogTheme', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogTheme START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog6'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1500);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(1500);

        const themeSet = AppStorage.get<boolean>('alertDialogThemeSet');
        console.info('[ARKUI_NEW] AlertDialogTest: alertDialogTheme - themeSet from AppStorage: ' + themeSet);
        if (themeSet === undefined || themeSet === null) {
          console.error('[ARKUI_NEW] AlertDialogTest: themeSet is undefined/null, action callback may not have been called');
          expect().assertFail();
        } else {
          expect(themeSet).assertTrue();
        }

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogTheme END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogTheme error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_007
     * @tc.name alertDialogThemeColorModeSystem
     * @tc.desc Test AlertDialog property: themeColorMode(SYSTEM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogThemeColorModeSystem', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeSystem START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog7'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('alertDialogThemeColorMode');
        console.info('[ARKUI_NEW] AlertDialogTest: alertDialogThemeColorModeSystem - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.SYSTEM);

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeSystem END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeSystem error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_008
     * @tc.name alertDialogThemeColorModeLight
     * @tc.desc Test AlertDialog property: themeColorMode(LIGHT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogThemeColorModeLight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeLight START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog8'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('alertDialogThemeColorMode');
        console.info('[ARKUI_NEW] AlertDialogTest: alertDialogThemeColorModeLight - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.LIGHT);

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeLight END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeLight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AlertDialogTest_009
     * @tc.name alertDialogThemeColorModeDark
     * @tc.desc Test AlertDialog property: themeColorMode(DARK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alertDialogThemeColorModeDark', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeDark START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnAlertDialog9'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('alertDialogThemeColorMode');
        console.info('[ARKUI_NEW] AlertDialogTest: alertDialogThemeColorModeDark - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.DARK);

        console.info('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeDark END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AlertDialogTest execute: alertDialogThemeColorModeDark error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
