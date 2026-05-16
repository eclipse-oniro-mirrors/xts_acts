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
import { CustomTheme } from '@ohos.arkui.theme';

const SLEEP_TIME = 1000;

export default function OtherInterfacesTest() {
  describe('OtherInterfacesTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] OtherInterfacesTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.common.componentSnapshot.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] OtherInterfacesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/otherInterfaces/otherInterfaces',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] OtherInterfacesTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] OtherInterfacesTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] OtherInterfacesTest afterEach start");
      // Clean up AppStorage data
      if (AppStorage.get<object>('font') != undefined) {
        AppStorage.delete('font');
      }
      if (AppStorage.get<boolean>('globalSendKeyEvent') != undefined) {
        AppStorage.delete('globalSendKeyEvent');
      }
      if (AppStorage.get<boolean>('globalSendMouseEvent') != undefined) {
        AppStorage.delete('globalSendMouseEvent');
      }
      if (AppStorage.get<CustomTheme>('customThemeDarkColors') != undefined) {
        AppStorage.delete('customThemeDarkColors');
      }
      if (AppStorage.get<boolean>('fontRegisterFont') != undefined) {
        AppStorage.delete('fontRegisterFont');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] OtherInterfacesTest afterEach end");
    });

    // sendKeyEvent/sendMouseEvent are called in page but not covered by tests (mock causes ClassCastError; API requires framework-created events)

    /**
     * @tc.number OtherInterfacesTest_001
     * @tc.name customThemeDarkColors
     * @tc.desc Test CustomTheme property: darkColors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customThemeDarkColors', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('OtherInterfacesTest execute: customThemeDarkColors START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnCustomThemeDarkColors'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let customTheme = AppStorage.get<CustomTheme>('customThemeDarkColors');
        expect(customTheme !== undefined).assertTrue();
        if (customTheme) {
          expect(customTheme.darkColors !== undefined).assertTrue();
        }

        console.info('OtherInterfacesTest execute: customThemeDarkColors END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] OtherInterfacesTest execute: customThemeDarkColors error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number OtherInterfacesTest_002
     * @tc.name fontRegisterFont
     * @tc.desc Test Font method: registerFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fontRegisterFont', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('OtherInterfacesTest execute: fontRegisterFont START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnFontRegisterFont'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let result = AppStorage.get<boolean>('fontRegisterFont');
        expect(result).assertEqual(true);

        console.info('OtherInterfacesTest execute: fontRegisterFont END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] OtherInterfacesTest execute: fontRegisterFont error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
