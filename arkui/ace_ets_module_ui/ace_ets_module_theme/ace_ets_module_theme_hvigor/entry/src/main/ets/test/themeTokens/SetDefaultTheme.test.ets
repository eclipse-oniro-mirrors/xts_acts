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
import { describe, it, beforeAll, afterAll, beforeEach, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import { ThemeControl } from '@ohos.arkui.theme';
import { defaultThemeProperty } from '../../MainAbility/pages/themeTokensPages/SetDefaultThemeTestPage';
import { redThemeColors } from '../../MainAbility/themes/customTheme/RedCustomThemeColor';
import { Theme } from '@ohos.arkui.theme';
import { fillMap } from '../../test/Utils';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { greenThemeColors } from '../../MainAbility/themes/customTheme/GreenCustomThemeColor';

export default function setDefaultThemeTest() {
  const SUITE: string = 'SetDefaultTheme';
  let themeLocal: Theme | undefined;
  let changeTheme: boolean = false;

  describe('ActsSetDefaultThemeTest', () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/themeTokensPages/SetDefaultThemeTestPage",
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== "SetDefaultThemeTestPage") {
          await router.pushUrl(options).then(() => {
            themeLocal = AppStorage.get<Theme>(defaultThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          });
        }
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })
    beforeEach(() => {
      if (!changeTheme) return;
      if ((AppStorage.get(defaultThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        ThemeControl.setDefaultTheme(greenCustomTheme);
      } else {
        ThemeControl.setDefaultTheme(redCustomTheme);
      }
      themeLocal = AppStorage.get<Theme>(defaultThemeProperty);
      changeTheme = false;
    })
    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
     * @tc.name   ActsSetDefaultThemeColors_0100
     * @tc.number ActsSetDefaultThemeColors_0100
     * @tc.desc   Check initial theme values use API setDefaultTheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsSetDefaultThemeColors_0100', Level.LEVEL2, () => {
      const CASE: string = 'ActsSetDefaultThemeColors_0100';
      const checkKeys: string[] = Object.keys(redThemeColors);
      const checkValues = (Object.values(redThemeColors) as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal?.colors);
      const themeValues = themeLocal?.colors === undefined ?
        [] : (Object.values(themeLocal?.colors) as string[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsSetDefaultThemeColors_0200
     * @tc.number ActsSetDefaultThemeColors_0200
     * @tc.desc   Check changed theme values using API setDefaultTheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsSetDefaultThemeColors_0200', Level.LEVEL2, () => {
      const CASE: string = 'ActsSetDefaultThemeColors_0200';
      const checkKeys: string[] = Object.keys(greenThemeColors);
      const checkValues = (Object.values(greenThemeColors) as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal?.colors);
      const themeValues = themeLocal?.colors === undefined ?
        [] : (Object.values(themeLocal?.colors) as string[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
        changeTheme = true;
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
  })
}