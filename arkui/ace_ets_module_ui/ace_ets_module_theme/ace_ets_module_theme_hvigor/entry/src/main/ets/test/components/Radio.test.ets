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
import router from '@ohos.router';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { RadioKeys, radioThemeProperty, radioThemeSetProperty } from '../../MainAbility/pages/components/RadioPage';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

const EMPTY_CHECK: string = 'emptyCheck';
const EMPTY_ATTR: string = 'emptyAttr';

export default function RadioThemeTest() {
  const SUITE: string = `RadioThemeTest`;

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet = true;

  const radioKeys: string [] = [
    RadioKeys.radioSystem,
    RadioKeys.radioSystemCustomAttrs,
    RadioKeys.radioWithTheme,
    RadioKeys.radioWithThemeCustomAttrs
  ]

  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/RadioPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `RadioPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(radioThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    beforeEach(() => {
      AppStorage.setOrCreate(radioThemeSetProperty, themeSet)
      if (changeTheme) {
        if ((AppStorage.get(radioThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(radioThemeProperty, greenCustomTheme);
        } else {
          AppStorage.setOrCreate(radioThemeProperty, redCustomTheme);
        }
        changeTheme = false;
      }
      localTheme = AppStorage.get<boolean>(radioThemeSetProperty) ? AppStorage.get<Theme>(radioThemeProperty) : undefined;
    });

    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
      * @tc.number    : ActsRadioThemeColors_0100
      * @tc.name      : ActsRadioThemeColors_0100
      * @tc.desc      : Сheck system colors values of the Radio
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsRadioThemeColors_0100`, 0, () => {
      const CASE: string = `ActsRadioThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      radioKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsRadioThemeColors_0200
      * @tc.name      : ActsRadioThemeColors_0200
      * @tc.desc      : Сheck custom colors values of the Radio
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsRadioThemeColors_0200`, 0, () => {
      const CASE: string = `ActsRadioThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      radioKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsRadioThemeColors_0300
      * @tc.name      : ActsRadioThemeColors_0300
      * @tc.desc      : Сheck custom colors values of the Radio
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsRadioThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsRadioThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      radioKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsRadioThemeColors_0400
      * @tc.name      : ActsRadioThemeColors_0400
      * @tc.desc      : Сheck system colors values of the Radio
      *                 after reset theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsRadioThemeColors_0400`, 0, async () => {
      const CASE: string = `ActsRadioThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      radioKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      themeSet = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const RadioJSON = getInspectorByKey(key);
  const attrsRadio: RadioAttribute = JSON.parse(RadioJSON)?.$attrs;
  const style: RadioStyle = JSON.parse(attrsRadio?.radioStyle.toString());
  const checkedBackgroundColor : string = style?.checkedBackgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
  const checkCheckedBackgroundColor : string = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundEmphasize
    ?? colorValues?.get(`compBackgroundEmphasize`))?.toString().toUpperCase()
    ?? EMPTY_CHECK;
  expect(checkedBackgroundColor).assertEqual(checkCheckedBackgroundColor);
  const uncheckedBorderColor : string = style.uncheckedBorderColor?.toString().toUpperCase() ?? EMPTY_ATTR;
  const checkunCheckedBackgroundColor : string = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.iconFourth
    ?? colorValues?.get(`iconFourth`))?.toString().toUpperCase()
    ?? EMPTY_CHECK;
  expect(uncheckedBorderColor).assertEqual(checkunCheckedBackgroundColor);
  const indicatorColor : string = style?.indicatorColor?.toString().toUpperCase() ?? EMPTY_ATTR;
  const checkIndicatorColor : string = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.iconOnPrimary
    ?? colorValues?.get(`iconOnPrimary`))?.toString().toUpperCase()
    ?? EMPTY_CHECK;
  expect(indicatorColor).assertEqual(checkIndicatorColor);
}