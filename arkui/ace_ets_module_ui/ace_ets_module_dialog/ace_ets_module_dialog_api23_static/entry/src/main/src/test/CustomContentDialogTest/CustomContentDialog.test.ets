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

export default function CustomContentDialogTest() {
  describe('CustomContentDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] CustomContentDialogTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] CustomContentDialogTest beforeEach start");

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
        url: 'MainAbility/pages/customContentDialog/customContentDialog',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] CustomContentDialogTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] CustomContentDialogTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data
      if (AppStorage.get<string>('customContentDialogPrimaryTitle') != undefined) {
        AppStorage.delete('customContentDialogPrimaryTitle');
      }
      if (AppStorage.get<string>('customContentDialogSecondaryTitle') != undefined) {
        AppStorage.delete('customContentDialogSecondaryTitle');
      }
      if (AppStorage.get<boolean>('customContentDialogContentBuilderCalled') != undefined) {
        AppStorage.delete('customContentDialogContentBuilderCalled');
      }
      if (AppStorage.get<number>('customContentDialogContentAreaPaddingTop') != undefined) {
        AppStorage.delete('customContentDialogContentAreaPaddingTop');
      }
      if (AppStorage.get<number>('customContentDialogContentAreaPaddingRight') != undefined) {
        AppStorage.delete('customContentDialogContentAreaPaddingRight');
      }
      if (AppStorage.get<number>('customContentDialogContentAreaPaddingBottom') != undefined) {
        AppStorage.delete('customContentDialogContentAreaPaddingBottom');
      }
      if (AppStorage.get<number>('customContentDialogContentAreaPaddingLeft') != undefined) {
        AppStorage.delete('customContentDialogContentAreaPaddingLeft');
      }
      if (AppStorage.get<string>('customContentDialogPrimaryButtonValue') != undefined) {
        AppStorage.delete('customContentDialogPrimaryButtonValue');
      }
      if (AppStorage.get<boolean>('customContentDialogPrimaryButtonActionCalled') != undefined) {
        AppStorage.delete('customContentDialogPrimaryButtonActionCalled');
      }
      if (AppStorage.get<string>('customContentDialogSecondaryButtonValue') != undefined) {
        AppStorage.delete('customContentDialogSecondaryButtonValue');
      }
      if (AppStorage.get<boolean>('customContentDialogSecondaryButtonActionCalled') != undefined) {
        AppStorage.delete('customContentDialogSecondaryButtonActionCalled');
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
      console.info("[ARKUI_NEW] CustomContentDialogTest after each called");
    });

    /**
     * @tc.number CustomContentDialogTest_001
     * @tc.name customContentDialogPrimaryTitle
     * @tc.desc Test CustomContentDialog property: primaryTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customContentDialogPrimaryTitle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogPrimaryTitle START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnCustomContentDialog1'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('customContentDialogPrimaryTitle')).assertEqual('Primary Title');

        console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogPrimaryTitle END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogPrimaryTitle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomContentDialogTest_002
     * @tc.name customContentDialogSecondaryTitle
     * @tc.desc Test CustomContentDialog property: secondaryTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customContentDialogSecondaryTitle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogSecondaryTitle START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnCustomContentDialog2'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('customContentDialogSecondaryTitle')).assertEqual('Secondary Title');

        console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogSecondaryTitle END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogSecondaryTitle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomContentDialogTest_003
     * @tc.name customContentDialogContentBuilder
     * @tc.desc Test CustomContentDialog property: contentBuilder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customContentDialogContentBuilder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogContentBuilder START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnCustomContentDialog3'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<boolean>('customContentDialogContentBuilderCalled')).assertTrue();

        console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogContentBuilder END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogContentBuilder error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomContentDialogTest_004
     * @tc.name customContentDialogContentAreaPadding
     * @tc.desc Test CustomContentDialog property: contentAreaPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customContentDialogContentAreaPadding', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogContentAreaPadding START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnCustomContentDialog4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<number>('customContentDialogContentAreaPaddingTop')).assertEqual(20);
        expect(AppStorage.get<number>('customContentDialogContentAreaPaddingRight')).assertEqual(30);
        expect(AppStorage.get<number>('customContentDialogContentAreaPaddingBottom')).assertEqual(20);
        expect(AppStorage.get<number>('customContentDialogContentAreaPaddingLeft')).assertEqual(30);

        console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogContentAreaPadding END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogContentAreaPadding error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomContentDialogTest_005
     * @tc.name customContentDialogButtons
     * @tc.desc Test CustomContentDialog property: buttons
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customContentDialogButtons', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogButtons START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnCustomContentDialog5'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        // Test primaryButton
        let primaryButton = await driver.findComponent(ON.text('Primary Button', MatchPattern.EQUALS));
        if (!primaryButton) {
          primaryButton = await driver.findComponent(ON.text('主按钮', MatchPattern.EQUALS));
        }
        expect(!!primaryButton).assertTrue();
        await (primaryButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('customContentDialogPrimaryButtonValue')).assertEqual('Primary Button');
        expect(AppStorage.get<boolean>('customContentDialogPrimaryButtonActionCalled')).assertTrue();

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

        expect(AppStorage.get<string>('customContentDialogSecondaryButtonValue')).assertEqual('Secondary Button');
        expect(AppStorage.get<boolean>('customContentDialogSecondaryButtonActionCalled')).assertTrue();

        console.info('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogButtons END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CustomContentDialogTest execute: customContentDialogButtons error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
