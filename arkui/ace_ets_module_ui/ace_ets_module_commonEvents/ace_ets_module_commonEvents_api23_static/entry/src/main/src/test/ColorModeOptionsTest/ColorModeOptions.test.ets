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
import componentSnapshot from '@ohos.arkui.componentSnapshot';

const SLEEP_TIME = 1000;

export default function ColorModeOptionsTest() {
  describe('ColorModeOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ColorModeOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.common.componentSnapshot.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ColorModeOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/colorModeOptions/colorModeOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("ColorModeOptionsTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ColorModeOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ColorModeOptionsTest afterEach start");
      // Clean up AppStorage data
      if (AppStorage.get<componentSnapshot.ColorModeOptions>('colorModeOptionsColorSpace') != undefined) {
        AppStorage.delete('colorModeOptionsColorSpace');
      }
      if (AppStorage.get<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoTrue') != undefined) {
        AppStorage.delete('colorModeOptionsIsAutoTrue');
      }
      if (AppStorage.get<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoFalse') != undefined) {
        AppStorage.delete('colorModeOptionsIsAutoFalse');
      }
      if (AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsHigh') != undefined) {
        AppStorage.delete('dynamicRangeModeOptionsHigh');
      }
      if (AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsConstraint') != undefined) {
        AppStorage.delete('dynamicRangeModeOptionsConstraint');
      }
      if (AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsStandard') != undefined) {
        AppStorage.delete('dynamicRangeModeOptionsStandard');
      }
      if (AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoTrue') != undefined) {
        AppStorage.delete('dynamicRangeModeOptionsIsAutoTrue');
      }
      if (AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoFalse') != undefined) {
        AppStorage.delete('dynamicRangeModeOptionsIsAutoFalse');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] ColorModeOptionsTest afterEach end");
    });

    /**
     * @tc.number ColorModeOptionsTest_001
     * @tc.name colorModeOptionsColorSpace
     * @tc.desc Test ColorModeOptions property: colorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorModeOptionsColorSpace', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsColorSpace START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnColorModeColorSpace'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let colorModeOptions = AppStorage.get<componentSnapshot.ColorModeOptions>('colorModeOptionsColorSpace');
        expect(colorModeOptions !== undefined).assertTrue();
        if (colorModeOptions) {
          expect(colorModeOptions.colorSpace !== undefined).assertTrue();
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsColorSpace END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsColorSpace error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ColorModeOptionsTest_002
     * @tc.name colorModeOptionsIsAutoTrue
     * @tc.desc Test ColorModeOptions property: isAuto true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorModeOptionsIsAutoTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsIsAutoTrue START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnColorModeIsAutoTrue'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let colorModeOptions = AppStorage.get<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoTrue');
        expect(colorModeOptions !== undefined).assertTrue();
        if (colorModeOptions) {
          expect(colorModeOptions.isAuto).assertEqual(true);
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsIsAutoTrue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsIsAutoTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ColorModeOptionsTest_003
     * @tc.name colorModeOptionsIsAutoFalse
     * @tc.desc Test ColorModeOptions property: isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorModeOptionsIsAutoFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsIsAutoFalse START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnColorModeIsAutoFalse'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let colorModeOptions = AppStorage.get<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoFalse');
        expect(colorModeOptions !== undefined).assertTrue();
        if (colorModeOptions) {
          expect(colorModeOptions.isAuto).assertEqual(false);
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsIsAutoFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: colorModeOptionsIsAutoFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ColorModeOptionsTest_004
     * @tc.name dynamicRangeModeOptionsHigh
     * @tc.desc Test DynamicRangeModeOptions property: dynamicRangeMode HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicRangeModeOptionsHigh', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsHigh START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnDynamicRangeModeHigh'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let dynamicRangeModeOptions = AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsHigh');
        expect(dynamicRangeModeOptions !== undefined).assertTrue();
        if (dynamicRangeModeOptions) {
          expect(dynamicRangeModeOptions.dynamicRangeMode).assertEqual(0); // HIGH = 0
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsHigh END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsHigh error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ColorModeOptionsTest_005
     * @tc.name dynamicRangeModeOptionsConstraint
     * @tc.desc Test DynamicRangeModeOptions property: dynamicRangeMode CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicRangeModeOptionsConstraint', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsConstraint START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnDynamicRangeModeConstraint'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let dynamicRangeModeOptions = AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsConstraint');
        expect(dynamicRangeModeOptions !== undefined).assertTrue();
        if (dynamicRangeModeOptions) {
          expect(dynamicRangeModeOptions.dynamicRangeMode).assertEqual(1); // CONSTRAINT = 1
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsConstraint END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsConstraint error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ColorModeOptionsTest_006
     * @tc.name dynamicRangeModeOptionsStandard
     * @tc.desc Test DynamicRangeModeOptions property: dynamicRangeMode STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicRangeModeOptionsStandard', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsStandard START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnDynamicRangeModeStandard'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let dynamicRangeModeOptions = AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsStandard');
        expect(dynamicRangeModeOptions !== undefined).assertTrue();
        if (dynamicRangeModeOptions) {
          expect(dynamicRangeModeOptions.dynamicRangeMode).assertEqual(2); // STANDARD = 2
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsStandard END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsStandard error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ColorModeOptionsTest_007
     * @tc.name dynamicRangeModeOptionsIsAutoTrue
     * @tc.desc Test DynamicRangeModeOptions property: isAuto true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicRangeModeOptionsIsAutoTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsIsAutoTrue START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnDynamicRangeIsAutoTrue'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let dynamicRangeModeOptions = AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoTrue');
        expect(dynamicRangeModeOptions !== undefined).assertTrue();
        if (dynamicRangeModeOptions) {
          expect(dynamicRangeModeOptions.isAuto).assertEqual(true);
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsIsAutoTrue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsIsAutoTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ColorModeOptionsTest_008
     * @tc.name dynamicRangeModeOptionsIsAutoFalse
     * @tc.desc Test DynamicRangeModeOptions property: isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dynamicRangeModeOptionsIsAutoFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsIsAutoFalse START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnDynamicRangeIsAutoFalse'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let dynamicRangeModeOptions = AppStorage.get<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoFalse');
        expect(dynamicRangeModeOptions !== undefined).assertTrue();
        if (dynamicRangeModeOptions) {
          expect(dynamicRangeModeOptions.isAuto).assertEqual(false);
        }

        console.info('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsIsAutoFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ColorModeOptionsTest execute: dynamicRangeModeOptionsIsAutoFalse error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
