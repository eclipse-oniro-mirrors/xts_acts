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
import { afterAll, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import router from '@ohos.router';
import { CounterKeys, counterThemeProperty } from '../../MainAbility/pages/components/CounterPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function counterThemeTest() {
  const SUITE: string = `CounterThemeTest`;
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
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
      if (!changeTheme) {
        return
      }
      if ((AppStorage.get(counterThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(counterThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(counterThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(counterThemeProperty);
      changeTheme = false;
    })

    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    })
    /**
      * @tc.number    : ActsCounterThemeColors_0100
      * @tc.name      : ActsCounterThemeColors_0100
      * @tc.desc      : Check counter system colors
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsCounterThemeColors_0100`, 0, () => {
      const CASE: string = `ActsCounterThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const counterJSON = getInspectorByKey(CounterKeys.counterSystem);
      const attrsCounter = (JSON.parse(counterJSON)?.$attrs as CounterAttribute);
      const foregroundColor = attrsCounter?.foregroundColor?.toString().toUpperCase();
      const checkForegroundColor = colorValues?.get(`fontPrimary`);
      expect(foregroundColor).assertEqual(checkForegroundColor);
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
      * @tc.number    : ActsCounterThemeColors_0200
      * @tc.name      : ActsCounterThemeColors_0200
      * @tc.desc      : Check counter theme colors
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsCounterThemeColors_0200`, 0, async () => {
      const CASE: string = `ActsCounterThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      localTheme = AppStorage.get<Theme>(counterThemeProperty);
      const counterJSON = getInspectorByKey(CounterKeys.counterWithTheme);
      const attrsCounter = (JSON.parse(counterJSON)?.$attrs as CounterAttribute);
      const foregroundColor = attrsCounter?.foregroundColor?.toString().toUpperCase();
      const checkForegroundColor = localTheme?.colors?.fontPrimary;
      expect(foregroundColor).assertEqual(checkForegroundColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
      * @tc.number    : ActsCounterThemeColors_0300
      * @tc.name      : ActsCounterThemeColors_0300
      * @tc.desc      : Check counter theme colors after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsCounterThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsCounterThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const counterJSON = getInspectorByKey(CounterKeys.counterWithTheme);
      const attrsCounter = (JSON.parse(counterJSON)?.$attrs as CounterAttribute);
      const foregroundColor = attrsCounter?.foregroundColor?.toString().toUpperCase();
      const checkForegroundColor = localTheme?.colors?.fontPrimary;
      expect(foregroundColor).assertEqual(checkForegroundColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
  })
}