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
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import router from '@ohos.router';
import { afterAll, beforeAll, beforeEach, describe, it, expect , Level} from '@ohos/hypium';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import {
  timePickerIsMilitaryProperty,
  TimePickerKeys, timePickerThemeProperty,
  timePickerThemeSetProperty
} from '../../MainAbility/pages/components/TimePickerPage';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

const emptyCheck: string = 'emptyCheck';
const emptyAttr: string = 'emptyAttr';


export default function timePickerThemeTest() {
  const SUITE: string = `TimePickerThemeTest`;

  const timePickerKeys: string[] = [
    TimePickerKeys.timePickerSystem,
    TimePickerKeys.timePickerSystemCustomAttrs,
    TimePickerKeys.timePickerWithTheme,
    TimePickerKeys.timePickerWithThemeCustomAttrs
  ]

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean | undefined = true
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/TimePickerPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `TimePickerPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(timePickerThemeProperty);
            themeSet = AppStorage.get<boolean>(timePickerThemeSetProperty)
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      }
      catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })
    beforeEach(() => {
      AppStorage.setOrCreate(timePickerThemeSetProperty, themeSet)
      if (changeTheme) {
        if ((AppStorage.get(timePickerThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(timePickerThemeProperty, greenCustomTheme);
        } else {
          AppStorage.setOrCreate(timePickerThemeProperty, redCustomTheme);
        }
      }
      localTheme = AppStorage.get<boolean>(timePickerThemeSetProperty) ? AppStorage.get<Theme>(timePickerThemeProperty) : undefined;
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
     * @tc.number    : ActsTimePickerThemeColors_0100
     * @tc.name      : ActsTimePickerThemeColors_0100
     * @tc.desc      : check system colors values of the TimePicker component
     *                 isMilitary = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0100`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsTimePickerThemeColors_0200
     * @tc.name      : ActsTimePickerThemeColors_0200
     * @tc.desc      : check custom colors values of the TimePicker component
     *                 isMilitary = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0200`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsTimePickerThemeColors_0300
     * @tc.name      : ActsTimePickerThemeColors_0300
     * @tc.desc      : check custom colors values of the TimePicker component
     *                 after change theme
     *                 isMilitary = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`)
    });
    /**
     * @tc.number    : ActsTimePickerThemeColors_0400
     * @tc.name      : ActsTimePickerThemeColors_0400
     * @tc.desc      : check colors values of the TimePicker component
     *                 after reset theme
     *                 isMilitary = false
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = true
      AppStorage.setOrCreate(timePickerIsMilitaryProperty, true);
      console.info(`${SUITE} ${CASE} END`)
    });
    /**
     * @tc.number    : ActsTimePickerThemeColors_0500
     * @tc.name      : ActsTimePickerThemeColors_0500
     * @tc.desc      : check system colors values of the TimePicker component
     *                 isMilitary = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0500`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0500`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`)
    });
    /**
     * @tc.number    : ActsTimePickerThemeColors_0600
     * @tc.name      : ActsTimePickerThemeColors_0600
     * @tc.desc      : Check custom colors values of the TimePicker component
     *                 isMilitary = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0600`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0600`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    });
    /**
     * @tc.number    : ActsTimePickerThemeColors_0700
     * @tc.name      : ActsTimePickerThemeColors_0700
     * @tc.desc      : Check custom colors values of the TimePicker component
     *                 after change theme
     *                 isMilitary = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0700`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0700`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = false
      AppStorage.setOrCreate(timePickerIsMilitaryProperty, false)
      console.info(`${SUITE} ${CASE} END`)
    });
    /**
     * @tc.number    : ActsTimePickerThemeColors_0800
     * @tc.name      : ActsTimePickerThemeColors_0800
     * @tc.desc      : Check system colors values of the TimePicker component
     *                 after reset theme
     *                 isMilitary = true
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTimePickerThemeColors_0800`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTimePickerThemeColors_0800`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = false
      AppStorage.setOrCreate(timePickerIsMilitaryProperty, false)
      console.info(`${SUITE} ${CASE} END`)
    });
  });
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const timePickerJSON = getInspectorByKey(key)
  const timePickerAttrs: TimePickerAttribute = JSON.parse(timePickerJSON).$attrs;
  const selectedTextStyle: PickerTextStyle = (timePickerAttrs?.selectedTextStyle as PickerTextStyle);
  const selectedColor: string = selectedTextStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkSelectedColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontEmphasize?.toString().toUpperCase()
    ?? colorValues?.get(`fontEmphasize`)
    ?? emptyCheck;
  expect(selectedColor).assertEqual(checkSelectedColor);
  const textStyle: PickerTextStyle = (timePickerAttrs?.textStyle as PickerTextStyle);
  const textColor: string = textStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkTextColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;
  expect(textColor).assertEqual(checkTextColor);
  const disappearTextStyle: PickerTextStyle = (timePickerAttrs?.disappearTextStyle as PickerTextStyle)
  const disappearTextColor: string = disappearTextStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkDisappearTextColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;
  expect(disappearTextColor).assertEqual(checkDisappearTextColor);
}
