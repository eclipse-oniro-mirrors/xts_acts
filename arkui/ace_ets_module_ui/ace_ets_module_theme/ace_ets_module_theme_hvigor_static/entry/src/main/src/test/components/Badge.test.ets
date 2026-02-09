'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Driver, MouseButton, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { BadgeKeys, badgeThemeProperty } from '../../../ets/MainAbility/pages/components/BadgePage';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';

export default function badgeThemeTest() {
  const SUITE: string = `badgeThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {

    beforeAll(() => {
      console.info("BadgePage beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      
    });

    beforeEach(() => {
      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>('badgeThemeProperty'))?.colors?.fontOnPrimary
          == redCustomTheme?.colors?.fontOnPrimary) {
          AppStorage.setOrCreate<CustomTheme>('badgeThemeProperty', greenCustomTheme);
        } else {
          AppStorage.setOrCreate<CustomTheme>('badgeThemeProperty', redCustomTheme);
        }
        localTheme = AppStorage.get<CustomTheme>('badgeThemeProperty');
        changeTheme = false;
      }
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/BadgePage`,
        }
        const routerInstance = AppStorage.get<Router>("router") as Router
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `BadgePage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>('badgeThemeProperty');
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    
    /**
     * @tc.number   ActsBadgeThemeTest_static_0100
     * @tc.name     ActsBadgeThemeTest_static_0100
     * @tc.desc     ActsBadgeThemeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ActsBadgeThemeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsBadgeThemeTest_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const badgeJson = inspector.getInspectorByKey(BadgeKeys.badgeKeysSystem);
      const badgeStyleJson = JSON.parseJsonElement(badgeJson).getElement('$attrs').getString('style').toString();
      const color: string = JSON.parseJsonElement(badgeStyleJson).getString('color').toString();
      const badgeColor: string = JSON.parseJsonElement(badgeStyleJson).getString('badgeColor').toString();
      const borderColor: string = JSON.parseJsonElement(badgeStyleJson).getString('borderColor')
      const checkColor: string = colorValues?.get(`fontOnPrimary`) ?? emptyCheck
      const CheckBadgeColor: string = colorValues?.get(`warning`) ?? emptyCheck
      const CheckBorderColor: string = colorValues?.get(`warning`) ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      expect(badgeColor).assertEqual(CheckBadgeColor);
      expect(borderColor).assertEqual(CheckBorderColor);
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsBadgeThemeTest_static_0200
     * @tc.name     ActsBadgeThemeTest_static_0200
     * @tc.desc     ActsBadgeThemeTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsBadgeThemeTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsBadgeThemeTest_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const badgeJson = inspector.getInspectorByKey(BadgeKeys.badgeKeysWithTheme)
      const badgeStyleJson = JSON.parseJsonElement(badgeJson).getElement('$attrs').getString('style').toString();
      const color: string = JSON.parseJsonElement(badgeStyleJson).getString('color').toString().toUpperCase();
      const badgeColor: string = JSON.parseJsonElement(badgeStyleJson).getString('badgeColor').toString().toUpperCase();
      const borderColor: string =
        JSON.parseJsonElement(badgeStyleJson).getString('borderColor').toString().toUpperCase();
      const checkColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
      const CheckBadgeColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      const CheckBorderColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      expect(badgeColor).assertEqual(CheckBadgeColor);
      expect(borderColor).assertEqual(CheckBorderColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ActsBadgeThemeTest_static_0300
     * @tc.name     ActsBadgeThemeTest_static_0300
     * @tc.desc     ActsBadgeThemeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsBadgeThemeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsBadgeThemeTest_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const badgeJson = inspector.getInspectorByKey(BadgeKeys.badgeKeysWithTheme);
      const badgeStyleJson = JSON.parseJsonElement(badgeJson).getElement('$attrs').getString('style').toString();
      const color: string = JSON.parseJsonElement(badgeStyleJson).getString('color').toString().toUpperCase();
      const badgeColor: string = JSON.parseJsonElement(badgeStyleJson).getString('badgeColor').toString().toUpperCase();
      const borderColor: string =
        JSON.parseJsonElement(badgeStyleJson).getString('borderColor').toString().toUpperCase();
      const checkColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
      const CheckBadgeColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      const CheckBorderColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      expect(badgeColor).assertEqual(CheckBadgeColor);
      expect(borderColor).assertEqual(CheckBorderColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  });
}