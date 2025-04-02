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
import { RadioKeys, radioThemeProperty } from '../../MainAbility/pages/components/RadioPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function RadioThemeTest() {
  const SUITE: string = `RadioThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
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
      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get(radioThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(radioThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(radioThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(radioThemeProperty);
      changeTheme = false;
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
      const RadioJSON = getInspectorByKey(RadioKeys.radioSystem);
      const attrsRadio: RadioAttribute = JSON.parse(RadioJSON)?.$attrs;
      const style: RadioStyle = JSON.parse(attrsRadio?.radioStyle.toString());
      const checkedBackgroundColor : string = style?.checkedBackgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkCheckedBackgroundColor = colorValues?.get(`compBackgroundEmphasize`)?.toString().toUpperCase()
       ?? EMPTY_CHECK;
      expect(checkedBackgroundColor).assertEqual(checkCheckedBackgroundColor);
      const uncheckedBorderColor : string = style?.uncheckedBorderColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkUncheckedBackgroundColor = colorValues?.get(`iconFourth`)?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(uncheckedBorderColor).assertEqual(checkUncheckedBackgroundColor);
      const indicatorColor : string = style?.indicatorColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkIndicatorColor = colorValues?.get(`iconOnPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(indicatorColor).assertEqual(checkIndicatorColor);
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
      const RadioJSON = getInspectorByKey(RadioKeys.radioWithTheme);
      const attrsRadio: RadioAttribute = JSON.parse(RadioJSON)?.$attrs;
      const style: RadioStyle = JSON.parse(attrsRadio?.radioStyle.toString());
      expect(style.checkedBackgroundColor).assertEqual(localTheme?.colors?.compBackgroundEmphasize);
      expect(style.uncheckedBorderColor).assertEqual(localTheme?.colors?.iconFourth);
      expect(style.indicatorColor).assertEqual(localTheme?.colors?.iconOnPrimary);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsRadioThemeColors_0300
      * @tc.name      : ActsRadioThemeColors_0300
      * @tc.desc      : Сheck system colors values of the Radio
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsRadioThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsRadioThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const RadioJSON = getInspectorByKey(RadioKeys.radioWithTheme);
      const attrsRadio: RadioAttribute = JSON.parse(RadioJSON)?.$attrs;
      const style: RadioStyle = JSON.parse(attrsRadio?.radioStyle.toString());
      const checkedBackgroundColor : string = style?.checkedBackgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkCheckedBackgroundColor : string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
       ?? EMPTY_CHECK;
      expect(checkedBackgroundColor).assertEqual(checkCheckedBackgroundColor);
      const uncheckedBorderColor : string = style.uncheckedBorderColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkunCheckedBackgroundColor : string = localTheme?.colors?.iconFourth?.toString().toUpperCase()
       ?? EMPTY_CHECK;
      expect(uncheckedBorderColor).assertEqual(checkunCheckedBackgroundColor);
      const indicatorColor : string = style?.indicatorColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkIndicatorColor : string = localTheme?.colors?.iconOnPrimary?.toString().toUpperCase()
       ?? EMPTY_CHECK;
      expect(indicatorColor).assertEqual(checkIndicatorColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}