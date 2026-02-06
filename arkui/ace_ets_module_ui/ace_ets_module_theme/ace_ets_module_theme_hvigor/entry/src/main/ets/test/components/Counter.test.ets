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
import { afterAll, beforeAll, beforeEach, describe, it, expect , Level} from '@ohos/hypium';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import router from '@ohos.router';
import { CounterKeys, counterThemeProperty, counterThemeSetProperty } from '../../MainAbility/pages/components/CounterPage';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

const emptyCheck: string = 'emptyCheck';
const emptyAttr: string = 'emptyAttr';

export default function counterThemeTest() {
  const SUITE: string = `CounterThemeTest`;
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean = true;

  const counterKeys: string [] = [
    CounterKeys.counterSystem,
    CounterKeys.counterSystemCustomAttrs,
    CounterKeys.counterWithTheme,
    CounterKeys.counterWithThemeCustomAttrs
  ]
  
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/CounterPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `CounterPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(counterThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey)
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      AppStorage.setOrCreate(counterThemeSetProperty, themeSet)
      if (changeTheme) {
        if ((AppStorage.get(counterThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(counterThemeProperty, greenCustomTheme);
        } else {
          AppStorage.setOrCreate(counterThemeProperty, redCustomTheme);
        }
        changeTheme = false;
      }
      localTheme = AppStorage.get<boolean>(counterThemeSetProperty) ? AppStorage.get<Theme>(counterThemeProperty) : undefined;
    })

    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    })
    /**
     * @tc.name   ActsCounterThemeColors_0100
     * @tc.number ActsCounterThemeColors_0100
     * @tc.desc   Check counter system colors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsCounterThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsCounterThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      counterKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
     * @tc.name   ActsCounterThemeColors_0200
     * @tc.number ActsCounterThemeColors_0200
     * @tc.desc   Check counter theme colors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsCounterThemeColors_0200`, Level.LEVEL0, async () => {
      const CASE: string = `ActsCounterThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      counterKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
     * @tc.name   ActsCounterThemeColors_0300
     * @tc.number ActsCounterThemeColors_0300
     * @tc.desc   Check counter theme colors after change theme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsCounterThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsCounterThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      counterKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
    })

    /**
     * @tc.name   ActsCounterThemeColors_0400
     * @tc.number ActsCounterThemeColors_0400
     * @tc.desc   Check counter system colors after reset theme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsCounterThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsCounterThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      counterKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      themeSet = true;
      console.info(`${SUITE} ${CASE} END`);
    })
  })
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const counterJSON = getInspectorByKey(key);
  const attrsCounter = (JSON.parse(counterJSON)?.$attrs as CounterAttribute);
  const foregroundColor = attrsCounter?.foregroundColor?.toString().toUpperCase() ?? emptyAttr;
  const checkForegroundColor = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;;
  expect(foregroundColor).assertEqual(checkForegroundColor);
}