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
import router from '@ohos.router'
import { afterAll, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import {
  datePickerIsLunarProperty,
  DatePickerKeys,
  datePickerThemeProperty,
  datePickerThemeSetProperty
} from '../../MainAbility/pages/components/DatePickerPage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

const emptyCheck = 'emptyCheck';
const emptyAttr = 'emptyAttr';

export default function datePickerThemeTest() {
  const SUITE: string = `DatePickerThemeTest`;

  const datePickerKeys: string[] = [
    DatePickerKeys.datePickerSystem,
    DatePickerKeys.datePickerSystemCustomAttrs,
    DatePickerKeys.datePickerWithTheme,
    DatePickerKeys.datePickerWithThemeCustomAttrs
  ]

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean | undefined = true
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/DatePickerPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `DatePickerPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(datePickerThemeProperty);
            themeSet = AppStorage.get<boolean>(datePickerThemeSetProperty)
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
      AppStorage.setOrCreate(datePickerThemeSetProperty, themeSet)
      if (changeTheme) {
        if ((AppStorage.get(datePickerThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(datePickerThemeProperty, greenCustomTheme);
        }
        else {
          AppStorage.setOrCreate(datePickerThemeProperty, redCustomTheme);
        }
      }
      localTheme = AppStorage.get<boolean>(datePickerThemeSetProperty) ? AppStorage.get<Theme>(datePickerThemeProperty) : undefined
      changeTheme = false;
    });
    afterAll(() => {
      try {
        router.back();
      }
      catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });

    /**
     * @tc.number    : ActsDatePickerThemeColors_0100
     * @tc.name      : ActsDatePickerThemeColors_0100
     * @tc.desc      : check system colors values of the DatePicker component
     *                 isLunar = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0100`, 0, () => {
      const CASE: string = `ActsDatePickerThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      datePickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsDatePickerThemeColors_0200
     * @tc.name      : ActsDatePickerThemeColors_0200
     * @tc.desc      : check custom colors values of the DatePicker component
     *                 isLunar = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0200`, 0, () => {
      const CASE: string = `ActsDatePickerThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsDatePickerThemeColors_0300
     * @tc.name      : ActsDatePickerThemeColors_0300
     * @tc.desc      : check custom colors values of the DatePicker component after change
     *                 isLunar = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsDatePickerThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsDatePickerThemeColors_0400
     * @tc.name      : ActsDatePickerThemeColors_0400
     * @tc.desc      : check system colors values of the DatePicker component after reset
     *                 isLunar = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0400`, 0, async () => {
      const CASE: string = `ActsDatePickerThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = true
      AppStorage.setOrCreate(datePickerIsLunarProperty, true);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsDatePickerThemeColors_0500
     * @tc.name      : ActsDatePickerThemeColors_0500
     * @tc.desc      : check system colors values of the DatePicker component
     *                 isLunar = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0500`, 0, async () => {
      const CASE: string = `ActsDatePickerThemeColors_0500`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsDatePickerThemeColors_0600
     * @tc.name      : ActsDatePickerThemeColors_0600
     * @tc.desc      : check custom colors values of the DatePicker component
     *                 isLunar = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0600`, 0, async () => {
      const CASE: string = `ActsDatePickerThemeColors_0600`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsDatePickerThemeColors_0700
     * @tc.name      : ActsDatePickerThemeColors_0700
     * @tc.desc      : check custom colors values of the DatePicker component
     *                 after change theme
     *                 isLunar = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0700`, 0, async () => {
      const CASE: string = `ActsDatePickerThemeColors_0700`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsDatePickerThemeColors_0800
     * @tc.name      : ActsDatePickerThemeColors_0800
     * @tc.desc      : check system colors values of the DatePicker component
     *                 after reset theme
     *                 isLunar = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsDatePickerThemeColors_0800`, 0, async () => {
      const CASE: string = `ActsDatePickerThemeColors_0800`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = true
      AppStorage.setOrCreate(datePickerIsLunarProperty, false);
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const datePickerJSON = getInspectorByKey(key)
  const datePickerAttrs: DatePickerAttribute = JSON.parse(datePickerJSON).$attrs;
  const selectedTextStyle: PickerTextStyle = (datePickerAttrs?.selectedTextStyle as PickerTextStyle);
  const selectedColor: string = selectedTextStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkSelectedColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontEmphasize?.toString().toUpperCase()
    ?? colorValues?.get(`fontEmphasize`)
    ?? emptyCheck;
  expect(selectedColor).assertEqual(checkSelectedColor);
  const textStyle: PickerTextStyle = (datePickerAttrs?.textStyle as PickerTextStyle);
  const textColor: string = textStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkTextColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;
  expect(textColor).assertEqual(checkTextColor);
  const disappearTextStyle: PickerTextStyle = (datePickerAttrs?.disappearTextStyle as PickerTextStyle)
  const disappearTextColor: string = disappearTextStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkDisappearTextColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;
  expect(disappearTextColor).assertEqual(checkDisappearTextColor);
}