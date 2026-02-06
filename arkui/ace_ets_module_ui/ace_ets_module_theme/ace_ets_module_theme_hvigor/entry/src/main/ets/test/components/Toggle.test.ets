/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterAll, beforeAll, beforeEach, describe, it, expect , Level} from '@ohos/hypium';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { ToggleKeys, toggleThemeProperty } from '../../MainAbility/pages/components/TogglePage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

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
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/TogglePage`,
        }
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `TogglePage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(toggleThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      }
      catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });
    beforeEach(() => {
      if (!changeTheme) return;
      if ((AppStorage.get(toggleThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(toggleThemeProperty, greenCustomTheme);
      }
      else {
        AppStorage.setOrCreate(toggleThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(toggleThemeProperty);
      changeTheme = false;
    })
    afterAll(() => {
      try {
        router.back()
      }
      catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
      * @tc.number    : ActsToggleThemeColors_0100 
      * @tc.name      : ActsToggleThemeColors_0100
      * @tc.desc      : Check system colors values of the Toggle component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsToggleThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsToggleThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      toggleKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        const toggleJSON = getInspectorByKey(key);
        const toggleAttrs: ToggleAttribute = JSON.parse(toggleJSON).$attrs;
        if (key.toLowerCase().search(`button`) > 0) {
          const backgroundColor: string = toggleAttrs?.backgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkBackgroundColor = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(backgroundColor).assertEqual(checkBackgroundColor);
        }
        if (key.toLowerCase().search(`switch`) > 0) {
          const switchPointColor: string = toggleAttrs?.switchPointColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSwitchPointColor = colorValues?.get(`compBackgroundPrimaryContrary`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(switchPointColor).assertEqual(checkSwitchPointColor);
        }
        if (key.toLowerCase().search('switch') > 0 || key.toLowerCase().search('checkbox') > 0) {
          const selectedColor: string = toggleAttrs?.selectedColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor = colorValues?.get(`compBackgroundEmphasize`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        } else {
          const selectedColor: string = toggleAttrs?.selectedColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = colorValues?.get(`compEmphasizeSecondary`)?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        }
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsToggleThemeColors_0200 
      * @tc.name      : ActsToggleThemeColors_0200
      * @tc.desc      : Check custom colors values of the Toggle component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsToggleThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsToggleThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      toggleKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        const toggleJSON = getInspectorByKey(key);
        const toggleAttrs: ToggleAttribute = JSON.parse(toggleJSON).$attrs;
        if (key.toLowerCase().search(`button`) > 0) {
          const backgroundColor: string = toggleAttrs?.backgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkBackgroundColor = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(backgroundColor).assertEqual(checkBackgroundColor);
        }
        if (key.toLowerCase().search(`switch`) > 0) {
          const switchPointColor: string = toggleAttrs?.switchPointColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSwitchPointColor: string = localTheme?.colors?.compBackgroundPrimaryContrary?.toString().
            toUpperCase() ?? EMPTY_CHECK;
          expect(switchPointColor).assertEqual(checkSwitchPointColor);
        }
        if (key.toLowerCase().search('switch') > 0 || key.toLowerCase().search('checkbox') > 0) {
          const selectedColor: string = toggleAttrs?.selectedColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        } else {
          const selectedColor: string = toggleAttrs?.selectedColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = localTheme?.colors?.compEmphasizeSecondary?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        }
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsToggleThemeColors_0300 
      * @tc.name      : ActsToggleThemeColors_0300
      * @tc.desc      : Check custom colors values of the Toggle component
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsToggleThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsToggleThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      toggleKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        const toggleJSON = getInspectorByKey(key);
        const toggleAttrs: ToggleAttribute = JSON.parse(toggleJSON).$attrs;
        if (key.toLowerCase().search(`button`) > 0) {
          const backgroundColor: string = toggleAttrs?.backgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(backgroundColor).assertEqual(checkBackgroundColor);
        }
        if (key.toLowerCase().search(`switch`) > 0) {
          const switchPointColor: string = toggleAttrs?.switchPointColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSwitchPointColor: string = localTheme?.colors?.compBackgroundPrimaryContrary?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(switchPointColor).assertEqual(checkSwitchPointColor);
        }
        if (key.toLowerCase().search('switch') > 0 || key.toLowerCase().search('checkbox') > 0) {
          const selectedColor: string = toggleAttrs?.selectedColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        } else {
          const selectedColor: string = toggleAttrs?.selectedColor?.toString().toUpperCase() ?? EMPTY_ATTR;
          const checkSelectedColor: string = localTheme?.colors?.compEmphasizeSecondary?.toString().toUpperCase()
            ?? EMPTY_CHECK;
          expect(selectedColor).assertEqual(checkSelectedColor);
        }
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}
