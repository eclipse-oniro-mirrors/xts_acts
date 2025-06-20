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
import { describe, it, beforeAll, afterAll, Level,expect } from '@ohos/hypium';
import router from '@ohos.router';
import { systemTheme } from '../../MainAbility/pages/themeTokensPages/SystemThemeTestPage';
import { fillMap } from '../../test/Utils';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { checkColorTokens } from '../../MainAbility/themes/checkSystemTokens/CheckColorTokens.ets';
import { colorTheme } from '../../MainAbility/pages/customComponents/CustomColorList';
import { Theme } from '@ohos.arkui.theme';

export default function systemThemeTest() {
  const SUITE: string = 'SystemTokens';
  let themeLocal: Theme | undefined;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe('ActsSystemTest', () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/themeTokensPages/SystemThemeTestPage",
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== "SystemThemeTestPage") {
          await router.pushUrl(options).then(() => {
            themeLocal = systemTheme;
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });
    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
     * @tc.number    : ActsSystemThemeColors_0100
     * @tc.name      : ActsSystemThemeColors_0100
     * @tc.desc      : Check system light / dark theme colors values
     * @tc.level     ：Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsSystemThemeColors_0100', Level.LEVEL2, () => {
      const CASE: string = 'ActsSystemThemeColors_0100';
      console.info(`${SUITE} ${CASE} START`);
      expect(colorValues?.size).assertLarger(0); // ensure that colorValues is not empty
      colorValues?.forEach((value, key): void => {
        const strJson = getInspectorByKey(`${key}${colorTheme}`);
        const backgroundColor = (JSON.parse(strJson).$attrs.backgroundColor as ResourceColor)
          .toString().toUpperCase();
        const checkColor = value;
        expect(backgroundColor).assertEqual(checkColor);
      })
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    ：ActsSystemThemeColors_0200
     * @tc.name      ：ActsSystemThemeColors_0200
     * @tc.desc      : Check system light / dark theme tokens values
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsSystemThemeColors_0200', Level.LEVEL2, () => {
      const CASE: string = 'ActsSystemThemeColors_0200';
      const checkKeys: string[] = Object.keys(checkColorTokens);
      const checkValues = (Object.values(checkColorTokens) as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal?.colors);
      const themeValues = themeLocal?.colors === undefined ?
        [] : (Object.values(themeLocal?.colors) as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      themeMap.forEach(((value, key) => {
        let themeToken: Resource;
        themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
  })
}