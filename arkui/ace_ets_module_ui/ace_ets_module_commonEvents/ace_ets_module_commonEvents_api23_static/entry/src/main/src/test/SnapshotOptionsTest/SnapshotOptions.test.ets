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

export default function SnapshotOptionsTest() {
  describe('SnapshotOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] SnapshotOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.common.componentSnapshot.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] SnapshotOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/snapshotOptions/snapshotOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] SnapshotOptionsTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] SnapshotOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] SnapshotOptionsTest afterEach start");
      // Clean up AppStorage data
      if (AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsColorModeIsAutoTrue') != undefined) {
        AppStorage.delete('snapshotOptionsColorModeIsAutoTrue');
      }
      if (AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsColorModeIsAutoFalse') != undefined) {
        AppStorage.delete('snapshotOptionsColorModeIsAutoFalse');
      }
      if (AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeHigh') != undefined) {
        AppStorage.delete('snapshotOptionsDynamicRangeModeHigh');
      }
      if (AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeConstraint') != undefined) {
        AppStorage.delete('snapshotOptionsDynamicRangeModeConstraint');
      }
      if (AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeStandard') != undefined) {
        AppStorage.delete('snapshotOptionsDynamicRangeModeStandard');
      }
      if (AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeIsAutoTrue') != undefined) {
        AppStorage.delete('snapshotOptionsDynamicRangeModeIsAutoTrue');
      }
      if (AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeIsAutoFalse') != undefined) {
        AppStorage.delete('snapshotOptionsDynamicRangeModeIsAutoFalse');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] SnapshotOptionsTest afterEach end");
    });

    /**
     * @tc.number SnapshotOptionsTest_001
     * @tc.name snapshotOptionsColorModeIsAutoTrue
     * @tc.desc Test SnapshotOptions property: colorMode isAuto true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapshotOptionsColorModeIsAutoTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SnapshotOptionsTest execute: snapshotOptionsColorModeIsAutoTrue START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSnapshotColorModeIsAutoTrue'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let snapshotOptions = AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsColorModeIsAutoTrue');
        expect(snapshotOptions !== undefined).assertTrue();
        if (snapshotOptions) {
          expect(snapshotOptions.colorMode?.isAuto).assertEqual(true);
        }

        console.info('SnapshotOptionsTest execute: snapshotOptionsColorModeIsAutoTrue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SnapshotOptionsTest execute: snapshotOptionsColorModeIsAutoTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SnapshotOptionsTest_002
     * @tc.name snapshotOptionsColorModeIsAutoFalse
     * @tc.desc Test SnapshotOptions property: colorMode isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapshotOptionsColorModeIsAutoFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SnapshotOptionsTest execute: snapshotOptionsColorModeIsAutoFalse START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSnapshotColorModeIsAutoFalse'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let snapshotOptions = AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsColorModeIsAutoFalse');
        expect(snapshotOptions !== undefined).assertTrue();
        if (snapshotOptions) {
          expect(snapshotOptions.colorMode?.isAuto).assertEqual(false);
        }

        console.info('SnapshotOptionsTest execute: snapshotOptionsColorModeIsAutoFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SnapshotOptionsTest execute: snapshotOptionsColorModeIsAutoFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SnapshotOptionsTest_003
     * @tc.name snapshotOptionsDynamicRangeModeHigh
     * @tc.desc Test SnapshotOptions property: dynamicRangeMode HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapshotOptionsDynamicRangeModeHigh', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeHigh START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSnapshotDynamicRangeModeHigh'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let snapshotOptions = AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeHigh');
        expect(snapshotOptions !== undefined).assertTrue();
        if (snapshotOptions) {
          expect(snapshotOptions.dynamicRangeMode?.dynamicRangeMode).assertEqual(0); // HIGH = 0
        }

        console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeHigh END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeHigh error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SnapshotOptionsTest_004
     * @tc.name snapshotOptionsDynamicRangeModeConstraint
     * @tc.desc Test SnapshotOptions property: dynamicRangeMode CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapshotOptionsDynamicRangeModeConstraint', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeConstraint START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSnapshotDynamicRangeModeConstraint'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let snapshotOptions = AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeConstraint');
        expect(snapshotOptions !== undefined).assertTrue();
        if (snapshotOptions) {
          expect(snapshotOptions.dynamicRangeMode?.dynamicRangeMode).assertEqual(1); // CONSTRAINT = 1
        }

        console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeConstraint END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeConstraint error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SnapshotOptionsTest_005
     * @tc.name snapshotOptionsDynamicRangeModeStandard
     * @tc.desc Test SnapshotOptions property: dynamicRangeMode STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapshotOptionsDynamicRangeModeStandard', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeStandard START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSnapshotDynamicRangeModeStandard'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let snapshotOptions = AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeStandard');
        expect(snapshotOptions !== undefined).assertTrue();
        if (snapshotOptions) {
          expect(snapshotOptions.dynamicRangeMode?.dynamicRangeMode).assertEqual(2); // STANDARD = 2
        }

        console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeStandard END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeStandard error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SnapshotOptionsTest_006
     * @tc.name snapshotOptionsDynamicRangeModeIsAutoTrue
     * @tc.desc Test SnapshotOptions property: dynamicRangeMode isAuto true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapshotOptionsDynamicRangeModeIsAutoTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeIsAutoTrue START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSnapshotDynamicRangeModeIsAutoTrue'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let snapshotOptions = AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeIsAutoTrue');
        expect(snapshotOptions !== undefined).assertTrue();
        if (snapshotOptions) {
          expect(snapshotOptions.dynamicRangeMode?.isAuto).assertEqual(true);
        }

        console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeIsAutoTrue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeIsAutoTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SnapshotOptionsTest_007
     * @tc.name snapshotOptionsDynamicRangeModeIsAutoFalse
     * @tc.desc Test SnapshotOptions property: dynamicRangeMode isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapshotOptionsDynamicRangeModeIsAutoFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeIsAutoFalse START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSnapshotDynamicRangeModeIsAutoFalse'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let snapshotOptions = AppStorage.get<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeIsAutoFalse');
        expect(snapshotOptions !== undefined).assertTrue();
        if (snapshotOptions) {
          expect(snapshotOptions.dynamicRangeMode?.isAuto).assertEqual(false);
        }

        console.info('SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeIsAutoFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] SnapshotOptionsTest execute: snapshotOptionsDynamicRangeModeIsAutoFalse error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
