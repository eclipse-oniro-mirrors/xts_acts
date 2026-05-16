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

import { describe, it, expect, beforeAll, afterEach, afterAll, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { ButtonStyleMode, ButtonRole } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;
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

export default function ButtonOptionsTest() {
  describe('ButtonOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ButtonOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ButtonOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonOptions/buttonOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] ButtonOptionsTest state pages: " + JSON.stringify(pages));
        console.info("[ARKUI_NEW] ButtonOptionsTest state pages.name: " + pages.name);
        if (!('TextLineSpacing' == pages.name)) {
          console.info('[ARKUI_NEW] get ButtonOptionsTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ButtonOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data after each test
      if (AppStorage.get<string>('buttonValue') != undefined) {
        AppStorage.delete('buttonValue');
      }
      if (AppStorage.get<boolean>('buttonActionCalled') != undefined) {
        AppStorage.delete('buttonActionCalled');
      }
      if (AppStorage.get<number>('buttonStyle') != undefined) {
        AppStorage.delete('buttonStyle');
      }
      if (AppStorage.get<number>('buttonRole') != undefined) {
        AppStorage.delete('buttonRole');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] ButtonOptionsTest after each called");
    });

    /**
     * @tc.number ButtonOptionsTest_001
     * @tc.name buttonOptionsNormalNormal
     * @tc.desc Test ButtonOptions with ButtonStyleMode.NORMAL and ButtonRole.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonOptionsNormalNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsNormalNormal START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnButtonOptions1'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Cancel', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('buttonValue')).assertEqual('Cancel');
        expect(AppStorage.get<boolean>('buttonActionCalled')).assertTrue();
        expect(AppStorage.get<number>('buttonStyle')).assertEqual(ButtonStyleMode.NORMAL);
        expect(AppStorage.get<number>('buttonRole')).assertEqual(ButtonRole.NORMAL);

        console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsNormalNormal END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsNormalNormal error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ButtonOptionsTest_002
     * @tc.name buttonOptionsNormalError
     * @tc.desc Test ButtonOptions with ButtonStyleMode.NORMAL and ButtonRole.ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonOptionsNormalError', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsNormalError START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnButtonOptions2'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Delete', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('buttonValue')).assertEqual('Delete');
        expect(AppStorage.get<boolean>('buttonActionCalled')).assertTrue();
        expect(AppStorage.get<number>('buttonStyle')).assertEqual(ButtonStyleMode.NORMAL);
        expect(AppStorage.get<number>('buttonRole')).assertEqual(ButtonRole.ERROR);

        console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsNormalError END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsNormalError error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ButtonOptionsTest_003
     * @tc.name buttonOptionsEmphasizedNormal
     * @tc.desc Test ButtonOptions with ButtonStyleMode.EMPHASIZED and ButtonRole.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonOptionsEmphasizedNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsEmphasizedNormal START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnButtonOptions3'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        let dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (!dialogButton) {
          dialogButton = await driver.findComponent(ON.text('确认', MatchPattern.EQUALS));
        }
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('buttonValue')).assertEqual('Confirm');
        expect(AppStorage.get<boolean>('buttonActionCalled')).assertTrue();
        expect(AppStorage.get<number>('buttonStyle')).assertEqual(ButtonStyleMode.EMPHASIZED);
        expect(AppStorage.get<number>('buttonRole')).assertEqual(ButtonRole.NORMAL);

        console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsEmphasizedNormal END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsEmphasizedNormal error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ButtonOptionsTest_004
     * @tc.name buttonOptionsEmphasizedError
     * @tc.desc Test ButtonOptions with ButtonStyleMode.EMPHASIZED and ButtonRole.ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonOptionsEmphasizedError', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsEmphasizedError START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnButtonOptions4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        let dialogButtonErr = await driver.findComponent(ON.text('Danger', MatchPattern.EQUALS));
        if (!dialogButtonErr) {
          dialogButtonErr = await driver.findComponent(ON.text('危险操作', MatchPattern.EQUALS));
        }
        expect(!!dialogButtonErr).assertTrue();
        await (dialogButtonErr?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('buttonValue')).assertEqual('Danger');
        expect(AppStorage.get<boolean>('buttonActionCalled')).assertTrue();
        expect(AppStorage.get<number>('buttonStyle')).assertEqual(ButtonStyleMode.EMPHASIZED);
        expect(AppStorage.get<number>('buttonRole')).assertEqual(ButtonRole.ERROR);

        console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsEmphasizedError END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsEmphasizedError error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ButtonOptionsTest_005
     * @tc.name buttonOptionsTextualNormal
     * @tc.desc Test ButtonOptions with ButtonStyleMode.TEXTUAL and ButtonRole.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonOptionsTextualNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsTextualNormal START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnButtonOptions5'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Text Button', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('buttonValue')).assertEqual('Text Button');
        expect(AppStorage.get<boolean>('buttonActionCalled')).assertTrue();
        expect(AppStorage.get<number>('buttonStyle')).assertEqual(ButtonStyleMode.TEXTUAL);
        expect(AppStorage.get<number>('buttonRole')).assertEqual(ButtonRole.NORMAL);

        console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsTextualNormal END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsTextualNormal error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ButtonOptionsTest_006
     * @tc.name buttonOptionsTextualError
     * @tc.desc Test ButtonOptions with ButtonStyleMode.TEXTUAL and ButtonRole.ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonOptionsTextualError', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsTextualError START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnButtonOptions6'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Text Error', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('buttonValue')).assertEqual('Text Error');
        expect(AppStorage.get<boolean>('buttonActionCalled')).assertTrue();
        expect(AppStorage.get<number>('buttonStyle')).assertEqual(ButtonStyleMode.TEXTUAL);
        expect(AppStorage.get<number>('buttonRole')).assertEqual(ButtonRole.ERROR);

        console.info('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsTextualError END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ButtonOptionsTest execute: buttonOptionsTextualError error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
