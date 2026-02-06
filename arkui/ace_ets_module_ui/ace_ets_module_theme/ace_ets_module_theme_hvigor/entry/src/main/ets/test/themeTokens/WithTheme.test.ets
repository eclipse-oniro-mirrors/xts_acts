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
import { afterAll, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { ThemeControl } from '@ohos.arkui.theme';
import { Theme } from '@ohos.arkui.theme';

import { greenThemeColors } from '../../MainAbility/themes/customTheme/GreenCustomThemeColor';
import { customButtonTheme } from '../../MainAbility/pages/customComponents/CustomButton';
import { brownThemeColors } from '../../MainAbility/themes/customTheme/BrownCustomThemeColor';
import { customButtonNestedTheme } from '../../MainAbility/pages/customComponents/CustomButtonNested';
import { postfixDark, postfixLight, withThemeProperty } from '../../MainAbility/pages/themeTokensPages/WithThemeTestPage';
import { redThemeColors } from '../../MainAbility/themes/customTheme/RedCustomThemeColor';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { fillMap, frameTime, sleep } from '../../test/Utils.ets';
import { customButtonSystemTheme } from '../../MainAbility/pages/customComponents/CustomButtonSystem';
import { customButtonLightTheme } from '../../MainAbility/pages/customComponents/CustomColorsLight';
import { customButtonDarkTheme } from '../../MainAbility/pages/customComponents/CustomColorsDark';
import { checkColorTokens } from '../../MainAbility/themes/checkSystemTokens/CheckColorTokens';
import { Colors } from '../../MainAbility/themes/checkSystemTokens/colorValues/ColorsTokens';
import { colorsForCheck } from '../../MainAbility/pages/themeTokensPages/SystemColorsForCheck';

export default function withThemeTest() {
  const SUITE: string = 'WithTheme';
  let themeLocal: Theme | undefined;
  let themeLocalNested: Theme | undefined;
  let themeLocalSystem: Theme | undefined;
  let themeLocalLight: Theme | undefined;
  let themeLocalDark: Theme | undefined;
  let changeTheme: boolean = false;

  describe('ActsWithThemeTest', () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/themeTokensPages/WithThemeTestPage",
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== "WithThemeTestPage") {
          await router.pushUrl(options).then(() => {
            themeLocal = customButtonTheme;
            themeLocalNested = customButtonNestedTheme;
            themeLocalSystem = customButtonSystemTheme;
            themeLocalLight = customButtonLightTheme;
            themeLocalDark = customButtonDarkTheme;
            console.info(`${SUITE} router.pushUrl success`);
          });
        }
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      if (!changeTheme) return;
      if ((AppStorage.get(withThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(withThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(withThemeProperty, redCustomTheme);
      }
      changeTheme = false;
    });

    afterAll(() => {
      try {
        ThemeControl.setDefaultTheme(undefined);
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
     * @tc.number    ：ActsWithThemeColors_0100
     * @tc.name      ：ActsWithThemeColors_0100
     * @tc.desc      : Check initial theme values using WithTheme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0100', Level.LEVEL2, () => {
      const CASE: string = 'ActsWithThemeColors_0100';
      console.info(`${SUITE} ${CASE} START`);
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
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
    * @tc.number    ：ActsWithThemeColors_0200
    * @tc.name      ：ActsWithThemeColors_0200
    * @tc.desc      : Check initial theme values using WithTheme into the nested CustomComponent
    * @tc.level     : Level 2
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsWithThemeColors_0200', Level.LEVEL2, () => {
      const CASE: string = 'ActsWithThemeColors_0200';
      console.info(`${SUITE} ${CASE} START`);
      const checkKeys: string[] = Object.keys(brownThemeColors);
      const checkValues = (Object.values(brownThemeColors) as string[]);
      const themeKeys: string[] = themeLocalNested?.colors === undefined ?
        [] : Object.keys(themeLocalNested?.colors);
      const themeValues = themeLocalNested?.colors === undefined ?
        [] : (Object.values(themeLocalNested?.colors) as string[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
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
     * @tc.number    ：ActsWithThemeColors_0300
     * @tc.name      ：ActsWithThemeColors_0300
     * @tc.desc      : Check initial theme values in WithTheme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0300', Level.LEVEL2, async () => {
      const CASE: string = 'ActsWithThemeColors_0300';
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      themeLocal = customButtonTheme;
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
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    ：ActsWithThemeColors_0400
     * @tc.name      ：ActsWithThemeColors_0400
     * @tc.desc      : Check changed theme values using WithTheme into the nested CustomComponent
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0400', Level.LEVEL2, () => {
      const CASE: string = 'ActsWithThemeColors_0400';
      console.info(`${SUITE} ${CASE} START`);
      const checkKeys: string[] = Object.keys(brownThemeColors);
      const checkValues = (Object.values(brownThemeColors) as string[]);
      const themeKeys: string[] = themeLocalNested?.colors === undefined ?
        [] : Object.keys(themeLocalNested?.colors);
      const themeValues = themeLocalNested?.colors === undefined ?
        [] : (Object.values(themeLocalNested?.colors) as string[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
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
     * @tc.number    ：ActsWithThemeColors_0500
     * @tc.name      ：ActsWithThemeColors_0500
     * @tc.desc      : Check tokens for WithTheme({ colorMode: ThemeColorMode.SYSTEM }) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0500', Level.LEVEL2, () => {
      let CASE: string = 'ActsWithThemeColors_0500';
      console.info(`${SUITE} ${CASE} START`);
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = (Object.values(checkColorTokens) as string[]);
      let themeKeys: string[] = themeLocalSystem?.colors === undefined ?
        [] : Object.keys(themeLocalSystem?.colors);
      let themeValues = themeLocalSystem?.colors === undefined ?
        [] : (Object.values(themeLocalSystem?.colors) as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: Resource;
        themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
     /**
     * @tc.number    ：ActsWithThemeColors_0600
     * @tc.name      ：ActsWithThemeColors_0600
     * @tc.desc      : Check tokens for WithTheme({ colorMode: ThemeColorMode.LIGHT }) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0600', Level.LEVEL2, () => {
      let CASE: string = 'ActsWithThemeColors_0600';
      console.info(`${SUITE} ${CASE} START`);
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = (Object.values(checkColorTokens) as string[]);
      let themeKeys: string[] = themeLocalLight?.colors === undefined ?
        [] : Object.keys(themeLocalLight?.colors);
      let themeValues = themeLocalLight?.colors === undefined ?
        [] : (Object.values(themeLocalLight?.colors) as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: Resource;
        themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    ：ActsWithThemeColors_0700
     * @tc.name      ：ActsWithThemeColors_0700
     * @tc.desc      : Check tokens for WithTheme({ colorMode: ThemeColorMode.DARK }) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0700', Level.LEVEL2, () => {
      let CASE: string = 'ActsWithThemeColors_0700';
      console.info(`${SUITE} ${CASE} START`);
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = (Object.values(checkColorTokens) as string[]);
      let themeKeys: string[] = themeLocalDark?.colors === undefined ?
        [] : Object.keys(themeLocalDark?.colors);
      let themeValues = themeLocalDark?.colors === undefined ?
        [] : (Object.values(themeLocalDark?.colors) as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: Resource;
        themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    ：ActsWithThemeColors_0800
     * @tc.name      ：ActsWithThemeColors_0800
     * @tc.desc      : Check tokens for WithTheme({ colorMode: ThemeColorMode.SYSTEM }) interface
     *                 with ThemeControl.setDefaultTheme(undefined) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0800', Level.LEVEL2, () => {
      let CASE: string = 'ActsWithThemeColors_0800'
      console.info(`${SUITE} ${CASE} START`);
      ThemeControl.setDefaultTheme(undefined);
      themeLocalSystem = customButtonSystemTheme;
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = (Object.values(checkColorTokens) as string[]);
      let themeKeys: string[] = themeLocalSystem?.colors === undefined ?
        [] : Object.keys(themeLocalSystem?.colors);
      let themeValues = themeLocalSystem?.colors === undefined ?
        [] : (Object.values(themeLocalSystem?.colors) as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: Resource;
        themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    ：ActsWithThemeColors_0900
     * @tc.name      ：ActsWithThemeColors_0900
     * @tc.desc      : Check tokens for WithTheme({ colorMode: ThemeColorMode.LIGHT }) interface
     *                 with ThemeControl.setDefaultTheme(undefined) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_0900', Level.LEVEL2, () => {
      let CASE: string = 'ActsWithThemeColors_0900';
      console.info(`${SUITE} ${CASE} START`);
      ThemeControl.setDefaultTheme(undefined);
      themeLocalLight = customButtonLightTheme;
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = (Object.values(checkColorTokens) as string[]);
      let themeKeys: string[] = themeLocalLight?.colors === undefined ?
        [] : Object.keys(themeLocalLight?.colors);
      let themeValues = themeLocalLight?.colors === undefined ?
        [] : (Object.values(themeLocalLight?.colors) as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: Resource;
        themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    ：ActsWithThemeColors_1000
     * @tc.name      ：ActsWithThemeColors_1000
     * @tc.desc      : check tokens for WithTheme({ colorMode: ThemeColorMode.DARK }) interface
     *                 with ThemeControl.setDefaultTheme(undefined) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_1000', Level.LEVEL2, () => {
      let CASE: string = 'ActsWithThemeColors_1000';
      console.info(`${SUITE} ${CASE} START`);
      ThemeControl.setDefaultTheme(undefined);
      themeLocalDark = customButtonDarkTheme;
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = (Object.values(checkColorTokens) as string[]);
      let themeKeys: string[] = themeLocalDark?.colors === undefined ?
        [] : Object.keys(themeLocalDark?.colors);
      let themeValues = themeLocalDark?.colors === undefined ?
        [] : (Object.values(themeLocalDark?.colors) as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: Resource;
        themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
     /**
     * @tc.number    ：ActsWithThemeColors_1100
     * @tc.name      ：ActsWithThemeColors_1100
     * @tc.desc      : Check color values for WithTheme({ colorMode: ThemeColorMode.LIGHT }) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_1100', Level.LEVEL2, () => {
      const CASE: string = 'ActsWithThemeColors_1100';
      console.info(`${SUITE} ${CASE} START`);
      Colors.colors.forEach((item, key): void => {
        const strJson = getInspectorByKey(`${key}${colorsForCheck}${postfixLight}`);
        const checkColor = (JSON.parse(strJson).$attrs.backgroundColor as ResourceColor)
          .toString().toUpperCase();
        const themeJson = getInspectorByKey(`${key}${postfixLight}`);
        const themeColor = (JSON.parse(themeJson).$attrs.backgroundColor as ResourceColor)
          .toString().toUpperCase();
        expect(themeColor).assertEqual(checkColor);
      })
      console.info(`${SUITE} ${CASE} END`);
    });
     /**
     * @tc.number    ：ActsWithThemeColors_1200
     * @tc.name      ：ActsWithThemeColors_1200
     * @tc.desc      : Check color values for WithTheme({ colorMode: ThemeColorMode.DARK }) interface
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsWithThemeColors_1200', Level.LEVEL0, async () => {
      const CASE: string = 'ActsWithThemeColors_1200';
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      Colors.colors.forEach((item, key): void => {
        const strJson = getInspectorByKey(`${key}${colorsForCheck}${postfixDark}`);
        const checkColor = (JSON.parse(strJson).$attrs.backgroundColor as ResourceColor)
          .toString().toUpperCase();
        const themeJson = getInspectorByKey(`${key}${postfixDark}`);
        const themeColor = (JSON.parse(themeJson).$attrs.backgroundColor as ResourceColor)
          .toString().toUpperCase();
        expect(themeColor).assertEqual(checkColor);
      })
      console.info(`${SUITE} ${CASE} END`);
    });
  })
}
