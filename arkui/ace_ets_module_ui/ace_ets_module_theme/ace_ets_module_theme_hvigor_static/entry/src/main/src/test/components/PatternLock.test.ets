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
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { PatternLockKeys, patternLockThemeProperty } from '../../../ets/MainAbility/pages/components/PatternLockPage';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

export default function patternLockThemeTest() {
  const SUITE: string = `patternLockThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/PatternLockPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `PatternLockPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>('PatternLockThemeProperty');
            console.info(`${SUITE} router.pushUrl success`);
          });
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get<CustomTheme>('PatternLockThemeProperty'))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate<CustomTheme>('PatternLockThemeProperty', greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>('PatternLockThemeProperty', redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>('PatternLockThemeProperty');
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsPatternLockThemeColors_static_0100
     * @tc.name     ActsPatternLockThemeColors_static_0100
     * @tc.desc     ActsPatternLockThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsPatternLockThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsPatternLockThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const patternLockJSON = inspector.getInspectorByKey(PatternLockKeys.patternLockSystem);
      const attrsPatternLock = JSON.parseJsonElement(patternLockJSON).getElement('$attrs');
      const regularColor: string = attrsPatternLock.getString('regularColor').toString().toUpperCase() ?? emptyAttr;
      const checkRegularColor: string = colorValues?.get(`compBackgroundNeutral`)?.toString().toUpperCase()
        ?? emptyCheck;
      expect(regularColor).assertEqual(checkRegularColor);
      const activeColor: string = attrsPatternLock.getString('activeColor').toString().toUpperCase() ?? emptyAttr;
      const checkActiveColor: string = colorValues?.get(`compBackgroundNeutral`)?.toString().toUpperCase()
        ?? emptyCheck;
      expect(activeColor).assertEqual(checkActiveColor);
      const selectedColor: string = attrsPatternLock.getString('selectedColor').toString().toUpperCase();
      const checkSelectedColor: string = colorValues?.get(`compBackgroundNeutral`)?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const pathColor: string = attrsPatternLock.getString('pathColor').toString().toUpperCase();
      const checkPathColor: string = colorValues?.get(`compDivider`)?.toString().toUpperCase() ?? emptyCheck;
      expect(pathColor).assertEqual(checkPathColor);
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsPatternLockThemeColors_static_0200
     * @tc.name     ActsPatternLockThemeColors_static_0200
     * @tc.desc     ActsPatternLockThemeColors_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ActsPatternLockThemeColors_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsPatternLockThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const patternLockJSON = inspector.getInspectorByKey(PatternLockKeys.patternLockWithTheme);
      const attrsPatternLock = JSON.parseJsonElement(patternLockJSON).getElement('$attrs');
      const regularColor: string = attrsPatternLock.getString('regularColor').toString().toUpperCase() ?? emptyAttr;
      ;
      const checkRegularColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(regularColor).assertEqual(checkRegularColor);
      const activeColor: string = attrsPatternLock.getString('activeColor').toString().toUpperCase() ?? emptyAttr;
      const checkActiveColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(activeColor).assertEqual(checkActiveColor);
      const selectedColor: string = attrsPatternLock.getString('selectedColor').toString().toUpperCase() ?? emptyAttr;
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const pathColor: string = attrsPatternLock.getString('pathColor').toString().toUpperCase() ?? emptyAttr;
      const checkPathColor: string = localTheme?.colors?.compDivider?.toString().toUpperCase() ?? emptyCheck;
      expect(pathColor).assertEqual(checkPathColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ActsPatternLockThemeColors_static_0300
     * @tc.name     ActsPatternLockThemeColors_static_0300
     * @tc.desc     ActsPatternLockThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsPatternLockThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsPatternLockThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const patternLockJSON = inspector.getInspectorByKey(PatternLockKeys.patternLockWithTheme);
      const attrsPatternLock = JSON.parseJsonElement(patternLockJSON).getElement('$attrs');
      const regularColor: string = attrsPatternLock.getString('regularColor').toString().toUpperCase() ?? emptyAttr;
      ;
      const checkRegularColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(regularColor).assertEqual(checkRegularColor);
      const activeColor: string = attrsPatternLock.getString('activeColor').toString().toUpperCase() ?? emptyAttr;
      const checkActiveColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(activeColor).assertEqual(checkActiveColor);
      const selectedColor: string = attrsPatternLock.getString('selectedColor').toString().toUpperCase() ?? emptyAttr;
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const pathColor: string = attrsPatternLock.getString('pathColor').toString().toUpperCase() ?? emptyAttr;
      const checkPathColor: string = localTheme?.colors?.compDivider?.toString().toUpperCase() ?? emptyCheck;
      expect(pathColor).assertEqual(checkPathColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  });
}