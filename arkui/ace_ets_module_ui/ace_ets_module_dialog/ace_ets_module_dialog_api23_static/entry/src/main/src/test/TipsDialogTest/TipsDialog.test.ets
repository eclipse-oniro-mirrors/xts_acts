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

export default function TipsDialogTest() {
  describe('TipsDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] TipsDialogTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] TipsDialogTest beforeEach start");

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
        url: 'MainAbility/pages/tipsDialog/tipsDialog',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] TipsDialogTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "tipsDialog") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] TipsDialogTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data
      if (AppStorage.get<string>('tipsDialogImageRes') != undefined) {
        AppStorage.delete('tipsDialogImageRes');
      }
      if (AppStorage.get<number>('tipsDialogImageSizeWidth') != undefined) {
        AppStorage.delete('tipsDialogImageSizeWidth');
      }
      if (AppStorage.get<number>('tipsDialogImageSizeHeight') != undefined) {
        AppStorage.delete('tipsDialogImageSizeHeight');
      }
      if (AppStorage.get<string>('tipsDialogTitle') != undefined) {
        AppStorage.delete('tipsDialogTitle');
      }
      if (AppStorage.get<string>('tipsDialogContent') != undefined) {
        AppStorage.delete('tipsDialogContent');
      }
      if (AppStorage.get<string>('tipsDialogCheckTips') != undefined) {
        AppStorage.delete('tipsDialogCheckTips');
      }
      if (AppStorage.get<boolean>('tipsDialogIsChecked') != undefined) {
        AppStorage.delete('tipsDialogIsChecked');
      }
      if (AppStorage.get<boolean>('tipsDialogCheckActionCalled') != undefined) {
        AppStorage.delete('tipsDialogCheckActionCalled');
      }
      if (AppStorage.get<boolean>('tipsDialogOnCheckedChangeCalled') != undefined) {
        AppStorage.delete('tipsDialogOnCheckedChangeCalled');
      }
      if (AppStorage.get<boolean>('tipsDialogOnCheckedChangeValue') != undefined) {
        AppStorage.delete('tipsDialogOnCheckedChangeValue');
      }
      if (AppStorage.get<boolean>('tipsDialogInitialIsChecked') != undefined) {
        AppStorage.delete('tipsDialogInitialIsChecked');
      }
      if (AppStorage.get<number>('tipsDialogThemeColorMode') != undefined) {
        AppStorage.delete('tipsDialogThemeColorMode');
      }
      if (AppStorage.get<boolean>('tipsDialogThemeSet') != undefined) {
        AppStorage.delete('tipsDialogThemeSet');
      }
      if (AppStorage.get<string>('tipsDialogPrimaryButtonValue') != undefined) {
        AppStorage.delete('tipsDialogPrimaryButtonValue');
      }
      if (AppStorage.get<boolean>('tipsDialogPrimaryButtonActionCalled') != undefined) {
        AppStorage.delete('tipsDialogPrimaryButtonActionCalled');
      }
      if (AppStorage.get<string>('tipsDialogSecondaryButtonValue') != undefined) {
        AppStorage.delete('tipsDialogSecondaryButtonValue');
      }
      if (AppStorage.get<boolean>('tipsDialogSecondaryButtonActionCalled') != undefined) {
        AppStorage.delete('tipsDialogSecondaryButtonActionCalled');
      }

      // Ensure any open dialogs are closed after test
      try {
        const driver = Driver.create();
        const confirmButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (confirmButton) {
          await (confirmButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
        // Also try to close with cancel button if exists
        const cancelButton = await driver.findComponent(ON.text('Cancel', MatchPattern.EQUALS));
        if (cancelButton) {
          await (cancelButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
      } catch (err) {
        // Dialog may not be open, ignore error
      }

      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] TipsDialogTest after each called");
    });


    /**
     * @tc.number TipsDialogTest_002
     * @tc.name tipsDialogThemeColorModeSystem
     * @tc.desc Test TipsDialog property: themeColorMode(SYSTEM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogThemeColorModeSystem', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeSystem START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('tipsDialogThemeColorMode');
        console.info('[ARKUI_NEW] TipsDialogTest: tipsDialogThemeColorModeSystem - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.SYSTEM);

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeSystem END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeSystem error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_003
     * @tc.name tipsDialogThemeColorModeLight
     * @tc.desc Test TipsDialog property: themeColorMode(LIGHT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogThemeColorModeLight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeLight START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog5'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('tipsDialogThemeColorMode');
        console.info('[ARKUI_NEW] TipsDialogTest: tipsDialogThemeColorModeLight - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.LIGHT);

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeLight END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeLight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_004
     * @tc.name tipsDialogThemeColorModeDark
     * @tc.desc Test TipsDialog property: themeColorMode(DARK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogThemeColorModeDark', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeDark START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog6'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('tipsDialogThemeColorMode');
        console.info('[ARKUI_NEW] TipsDialogTest: tipsDialogThemeColorModeDark - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.DARK);

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeDark END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeDark error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_001
     * @tc.name tipsDialogImageResImageSizeTitleContent
     * @tc.desc Test TipsDialog properties: imageRes, imageSize, title, content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogImageResImageSizeTitleContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogImageResImageSizeTitleContent START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog1'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('tipsDialogImageRes')).assertEqual('sys.media.ohos_ic_public_voice');
        expect(AppStorage.get<number>('tipsDialogImageSizeWidth')).assertEqual(100);
        expect(AppStorage.get<number>('tipsDialogImageSizeHeight')).assertEqual(100);
        expect(AppStorage.get<string>('tipsDialogTitle')).assertEqual('Test Title');
        expect(AppStorage.get<string>('tipsDialogContent')).assertEqual('Test Content');

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogImageResImageSizeTitleContent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogImageResImageSizeTitleContent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_005
     * @tc.name tipsDialogThemeCustomTheme
     * @tc.desc Test TipsDialog property: theme(CustomTheme)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogThemeCustomTheme', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeCustomTheme START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog7'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1500); // Wait for dialog to fully open

        // 点击确认按钮触发 action 回调，存储 themeSet
        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        console.info('[ARKUI_NEW] TipsDialogTest: Found confirm button, clicking to trigger action');
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(1500); // Extra wait for action callback and dialog close

        // Assert themeSet stored
        const themeSet = AppStorage.get<boolean>('tipsDialogThemeSet');
        console.info('[ARKUI_NEW] TipsDialogTest: tipsDialogThemeCustomTheme - themeSet from AppStorage: ' + themeSet);
        if (themeSet === undefined || themeSet === null) {
          console.error('[ARKUI_NEW] TipsDialogTest: themeSet is undefined/null, action callback may not have been called');
          expect().assertFail();
        } else {
          expect(themeSet).assertTrue();
        }

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeCustomTheme END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeCustomTheme error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_006
     * @tc.name tipsDialogPrimaryButtonSecondaryButton
     * @tc.desc Test TipsDialog properties: primaryButton, secondaryButton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogPrimaryButtonSecondaryButton', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogPrimaryButtonSecondaryButton START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog8'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        // 与页面 primaryButton.value 「主按钮」一致（系统可能展示为自定义文案）
        let primaryButton = await driver.findComponent(ON.text('主按钮', MatchPattern.EQUALS));
        if (!primaryButton) {
          primaryButton = await driver.findComponent(ON.text('Primary Button', MatchPattern.EQUALS));
        }
        expect(!!primaryButton).assertTrue();
        await (primaryButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('tipsDialogPrimaryButtonValue')).assertEqual('主按钮');
        expect(AppStorage.get<boolean>('tipsDialogPrimaryButtonActionCalled')).assertTrue();

        // Reopen dialog to test secondaryButton
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        let secondaryButton = await driver.findComponent(ON.text('Secondary Button', MatchPattern.EQUALS));
        if (!secondaryButton) {
          secondaryButton = await driver.findComponent(ON.text('次按钮', MatchPattern.EQUALS));
        }
        expect(!!secondaryButton).assertTrue();
        await (secondaryButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('tipsDialogSecondaryButtonValue')).assertEqual('Secondary Button');
        expect(AppStorage.get<boolean>('tipsDialogSecondaryButtonActionCalled')).assertTrue();

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogPrimaryButtonSecondaryButton END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogPrimaryButtonSecondaryButton error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_007
     * @tc.name tipsDialogCheckTipsIsCheckedTrueCheckActionOnCheckedChange
     * @tc.desc Test TipsDialog properties: checkTips, isChecked(true), checkAction, onCheckedChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogCheckTipsIsCheckedTrueCheckActionOnCheckedChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogCheckTipsIsCheckedTrueCheckActionOnCheckedChange START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog2'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1500);

        // Step 1: Verify checkTips text exists and store initial state
        let checkTipsText = await driver.findComponent(ON.text('禁止后不再提示', MatchPattern.EQUALS));
        if (!checkTipsText) {
          checkTipsText = await driver.findComponent(ON.text('不再提示', MatchPattern.CONTAINS));
        }
        expect(!!checkTipsText).assertTrue();
        console.info('[ARKUI_NEW] TipsDialogTest: Found checkTips text component');

        // Click confirm button to store initial state（系统语言下可能为「确定」）
        let dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (!dialogButton) {
          dialogButton = await driver.findComponent(ON.text('确定', MatchPattern.EQUALS));
        }
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        // Verify checkTips and initial isChecked state
        expect(AppStorage.get<string>('tipsDialogCheckTips')).assertEqual('禁止后不再提示');
        expect(AppStorage.get<boolean>('tipsDialogInitialIsChecked')).assertTrue();

        // Step 2: Reopen dialog to test checkbox interaction
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1500);

        // Step 3: Try to find and click checkbox to trigger checkAction and onCheckedChange
        let checkTipsComponent = await driver.findComponent(ON.text('禁止后不再提示', MatchPattern.EQUALS));
        if (!checkTipsComponent) {
          checkTipsComponent = await driver.findComponent(ON.text('不再提示', MatchPattern.CONTAINS));
        }
        expect(!!checkTipsComponent).assertTrue();

        await (checkTipsComponent?.click() as Promise<void>);
        await Utils.sleep(600);
        let checkActionCalled = AppStorage.get<boolean>('tipsDialogCheckActionCalled');
        if (checkActionCalled !== true) {
          await (checkTipsComponent?.click() as Promise<void>);
          await Utils.sleep(600);
          checkActionCalled = AppStorage.get<boolean>('tipsDialogCheckActionCalled');
        }
        console.info('[ARKUI_NEW] TipsDialogTest: checkActionCalled = ' + checkActionCalled);
        expect(checkActionCalled).assertTrue();

        // Verify onCheckedChange was called
        const onCheckedChangeCalled = AppStorage.get<boolean>('tipsDialogOnCheckedChangeCalled');
        console.info('[ARKUI_NEW] TipsDialogTest: onCheckedChangeCalled = ' + onCheckedChangeCalled);
        expect(onCheckedChangeCalled).assertTrue();

        // Verify isChecked value changed (from true to false after click)
        const isCheckedAfterClick = AppStorage.get<boolean>('tipsDialogIsChecked');
        console.info('[ARKUI_NEW] TipsDialogTest: isChecked after click = ' + isCheckedAfterClick);
        expect(isCheckedAfterClick).assertFalse();

        // Verify onCheckedChange value
        const onCheckedChangeValue = AppStorage.get<boolean>('tipsDialogOnCheckedChangeValue');
        console.info('[ARKUI_NEW] TipsDialogTest: onCheckedChangeValue = ' + onCheckedChangeValue);
        expect(onCheckedChangeValue).assertFalse();

        // Ensure dialog is closed before test ends
        let confirmButtonClose = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (!confirmButtonClose) {
          confirmButtonClose = await driver.findComponent(ON.text('确定', MatchPattern.EQUALS));
        }
        if (confirmButtonClose) {
          await (confirmButtonClose?.click() as Promise<void>);
          await Utils.sleep(500);
          console.info('[ARKUI_NEW] TipsDialogTest: Dialog closed');
        }

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogCheckTipsIsCheckedTrueCheckActionOnCheckedChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogCheckTipsIsCheckedTrueCheckActionOnCheckedChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_008
     * @tc.name tipsDialogIsCheckedFalse
     * @tc.desc Test TipsDialog property: isChecked(false) and checkbox interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogIsCheckedFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogIsCheckedFalse START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog3'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        // Step 1: Verify initial state is false
        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<boolean>('tipsDialogInitialIsChecked')).assertFalse();

        // Step 2: Reopen dialog and click checkbox to change state from false to true
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        // Try to find and click checkbox by clicking on checkTips text area
        const checkTipsText = await driver.findComponent(ON.text('Test Checkbox', MatchPattern.EQUALS));
        expect(!!checkTipsText).assertTrue();
        await (checkTipsText?.click() as Promise<void>);
        await Utils.sleep(500);

        // Verify checkAction was called and isChecked changed from false to true
        expect(AppStorage.get<boolean>('tipsDialogIsChecked')).assertTrue();

        // Ensure dialog is closed before test ends
        const confirmButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (confirmButton) {
          await (confirmButton?.click() as Promise<void>);
          await Utils.sleep(500);
          console.info('[ARKUI_NEW] TipsDialogTest: Dialog closed');
        }

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogIsCheckedFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogIsCheckedFalse error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
