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
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { ToggleKeys, toggleThemeProperty } from '../../../ets/MainAbility/pages/components/TogglePage';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';

const toggleKeys: string[] = [
  ToggleKeys.toggleButtonSystem,
  ToggleKeys.toggleSwitchSystem,
  ToggleKeys.toggleCheckBoxSystem,
  ToggleKeys.toggleButtonWithTheme,
  ToggleKeys.toggleSwitchWithTheme,
  ToggleKeys.toggleCheckBoxWithTheme
];

export default function toggleThemeTest() {
  const SUITE: string = `ToggleThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

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
          url: `MainAbility/pages/components/TogglePage`,
        }
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `TogglePage`) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
          await UtilsTest.msSleep(1000)
          localTheme = AppStorage.get<CustomTheme>(`toggleThemeProperty`);
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get<CustomTheme>(`toggleThemeProperty`))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate<CustomTheme>(`toggleThemeProperty`, greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>(`toggleThemeProperty`, redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>(`toggleThemeProperty`);
      changeTheme = false;
    })

    
    /**
     * @tc.number   ActsToggleThemeColors_static_0100
     * @tc.name     ActsToggleThemeColors_static_0100
     * @tc.desc     ActsToggleThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsToggleThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsToggleThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      toggleKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return;
        }
        const toggleJSON = inspector.getInspectorByKey(key);
        const toggleAttrs = JSON.parseJsonElement(toggleJSON).getElement('$attrs');
        if (key.toLowerCase().search(`button`) > 0) {
          const backgroundColor: string =
            toggleAttrs.getString('backgroundColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkBackgroundColor = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(backgroundColor).assertEqual(checkBackgroundColor);
        }
        if (key.toLowerCase().search(`switch`) > 0) {
          const switchPointColor: string =
            toggleAttrs.getString('switchPointColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSwitchPointColor = colorValues?.get(`compBackgroundPrimaryContrary`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(switchPointColor).assertEqual(checkSwitchPointColor);
        }
        if (key.toLowerCase().search('switch') > 0 || key.toLowerCase().search('checkbox') > 0) {
          const selectedColor: string = toggleAttrs.getString('selectedColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor = colorValues?.get(`compBackgroundEmphasize`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        } else {
          const selectedColor: string = toggleAttrs.getString('selectedColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = colorValues?.get(`compEmphasizeSecondary`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        }
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsToggleThemeColors_static_0200
     * @tc.name     ActsToggleThemeColors_static_0200
     * @tc.desc     ActsToggleThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsToggleThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsToggleThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      toggleKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          return;
        }
        const toggleJSON = inspector.getInspectorByKey(key);
        const toggleAttrs = JSON.parseJsonElement(toggleJSON).getElement('$attrs');
        if (key.toLowerCase().search(`button`) > 0) {
          const backgroundColor: string =
            toggleAttrs.getString('backgroundColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkBackgroundColor = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(backgroundColor).assertEqual(checkBackgroundColor);
        }
        if (key.toLowerCase().search(`switch`) > 0) {
          const switchPointColor: string =
            toggleAttrs.getString('switchPointColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSwitchPointColor: string =
            localTheme?.colors?.compBackgroundPrimaryContrary?.toString().toUpperCase() ?? EMPTY_CHECK;
          expect(switchPointColor).assertEqual(checkSwitchPointColor);
        }
        if (key.toLowerCase().search('switch') > 0 || key.toLowerCase().search('checkbox') > 0) {
          const selectedColor: string = toggleAttrs.getString('selectedColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        } else {
          const selectedColor: string = toggleAttrs.getString('selectedColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = localTheme?.colors?.compEmphasizeSecondary?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        }
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsToggleThemeColors_static_0300
     * @tc.name     ActsToggleThemeColors_static_0300
     * @tc.desc     ActsToggleThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsToggleThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsToggleThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      toggleKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          const toggleJSON = inspector.getInspectorByKey(key);
          const toggleAttrs = JSON.parseJsonElement(toggleJSON).getElement('$attrs');
          if (key.toLowerCase().search(`button`) > 0) {
            const backgroundColor: string =
              toggleAttrs.getString('backgroundColor').toString().toUpperCase() ?? EMPTY_ATTR;
            const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
              ?? EMPTY_CHECK;
            expect(backgroundColor).assertEqual(checkBackgroundColor);
          }
          if (key.toLowerCase().search(`switch`) > 0) {
            const switchPointColor: string =
              toggleAttrs.getString('switchPointColor').toString().toUpperCase() ?? EMPTY_ATTR;
            const checkSwitchPointColor: string =
              localTheme?.colors?.compBackgroundPrimaryContrary?.toString().toUpperCase()
                ?? EMPTY_CHECK;
            expect(switchPointColor).assertEqual(checkSwitchPointColor);
          }
          if (key.toLowerCase().search('switch') > 0 || key.toLowerCase().search('checkbox') > 0) {
            const selectedColor: string = toggleAttrs.getString('selectedColor').toString().toUpperCase() ?? EMPTY_ATTR;
            const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
              ?? EMPTY_CHECK;
            expect(selectedColor).assertEqual(checkSelectedColor);
          } else {
            const selectedColor: string = toggleAttrs.getString('selectedColor').toString().toUpperCase() ?? EMPTY_ATTR;
            const checkSelectedColor: string = localTheme?.colors?.compEmphasizeSecondary?.toString().toUpperCase()
              ?? EMPTY_CHECK;
            expect(selectedColor).assertEqual(checkSelectedColor);
          }
        }
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  });
}
