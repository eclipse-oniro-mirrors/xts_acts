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

export default function SelectDialogTest() {
  describe('SelectDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] SelectDialogTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] SelectDialogTest beforeEach start");

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
        url: 'MainAbility/pages/selectDialog/selectDialog',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] SelectDialogTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] SelectDialogTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data
      if (AppStorage.get<string>('selectDialogTitle') != undefined) {
        AppStorage.delete('selectDialogTitle');
      }
      if (AppStorage.get<string>('selectDialogContent') != undefined) {
        AppStorage.delete('selectDialogContent');
      }
      if (AppStorage.get<number>('selectDialogSelectedIndex') != undefined) {
        AppStorage.delete('selectDialogSelectedIndex');
      }
      if (AppStorage.get<string>('selectDialogConfirmValue') != undefined) {
        AppStorage.delete('selectDialogConfirmValue');
      }
      if (AppStorage.get<boolean>('selectDialogConfirmActionCalled') != undefined) {
        AppStorage.delete('selectDialogConfirmActionCalled');
      }
      if (AppStorage.get<string>('selectDialogRadioContent') != undefined) {
        AppStorage.delete('selectDialogRadioContent');
      }
      if (AppStorage.get<boolean>('selectDialogThemeSet') != undefined) {
        AppStorage.delete('selectDialogThemeSet');
      }
      if (AppStorage.get<number>('selectDialogThemeColorMode') != undefined) {
        AppStorage.delete('selectDialogThemeColorMode');
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
      console.info("[ARKUI_NEW] SelectDialogTest after each called");
    });

    /**
     * @tc.number SelectDialogTest_001
     * @tc.name selectDialogTitle
     * @tc.desc Test SelectDialog property: title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogTitle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogTitle START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog1'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('selectDialogTitle')).assertEqual('Test Title');

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogTitle END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogTitle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_002
     * @tc.name selectDialogContent
     * @tc.desc Test SelectDialog property: content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogContent START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog2'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('selectDialogContent')).assertEqual('Test Content');

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogContent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogContent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_003
     * @tc.name selectDialogSelectedIndex
     * @tc.desc Test SelectDialog property: selectedIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogSelectedIndex', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogSelectedIndex START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog3'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<number>('selectDialogSelectedIndex')).assertEqual(0);

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogSelectedIndex END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogSelectedIndex error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_004
     * @tc.name selectDialogConfirm
     * @tc.desc Test SelectDialog property: confirm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogConfirm', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogConfirm START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const confirmButton = await driver.findComponent(ON.text('Confirm Button', MatchPattern.EQUALS));
        expect(!!confirmButton).assertTrue();
        await (confirmButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('selectDialogConfirmValue')).assertEqual('Confirm Button');
        expect(AppStorage.get<boolean>('selectDialogConfirmActionCalled')).assertTrue();

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogConfirm END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogConfirm error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_005
     * @tc.name selectDialogRadioContent
     * @tc.desc Test SelectDialog property: radioContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogRadioContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogRadioContent START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog5'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('selectDialogRadioContent')).assertEqual('Option A,Option B,Option C');

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogRadioContent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogRadioContent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_006
     * @tc.name selectDialogTheme
     * @tc.desc Test SelectDialog property: theme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogTheme', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogTheme START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog6'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1500);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(1500);

        const themeSet = AppStorage.get<boolean>('selectDialogThemeSet');
        console.info('[ARKUI_NEW] SelectDialogTest: selectDialogTheme - themeSet from AppStorage: ' + themeSet);
        if (themeSet === undefined || themeSet === null) {
          console.error('[ARKUI_NEW] SelectDialogTest: themeSet is undefined/null, action callback may not have been called');
          expect().assertFail();
        } else {
          expect(themeSet).assertTrue();
        }

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogTheme END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogTheme error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_007
     * @tc.name selectDialogThemeColorModeSystem
     * @tc.desc Test SelectDialog property: themeColorMode(SYSTEM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogThemeColorModeSystem', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeSystem START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog7'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('selectDialogThemeColorMode');
        console.info('[ARKUI_NEW] SelectDialogTest: selectDialogThemeColorModeSystem - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.SYSTEM);

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeSystem END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeSystem error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_008
     * @tc.name selectDialogThemeColorModeLight
     * @tc.desc Test SelectDialog property: themeColorMode(LIGHT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogThemeColorModeLight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeLight START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog8'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('selectDialogThemeColorMode');
        console.info('[ARKUI_NEW] SelectDialogTest: selectDialogThemeColorModeLight - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.LIGHT);

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeLight END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeLight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectDialogTest_009
     * @tc.name selectDialogThemeColorModeDark
     * @tc.desc Test SelectDialog property: themeColorMode(DARK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDialogThemeColorModeDark', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeDark START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnSelectDialog9'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('selectDialogThemeColorMode');
        console.info('[ARKUI_NEW] SelectDialogTest: selectDialogThemeColorModeDark - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.DARK);

        console.info('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeDark END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SelectDialogTest execute: selectDialogThemeColorModeDark error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
