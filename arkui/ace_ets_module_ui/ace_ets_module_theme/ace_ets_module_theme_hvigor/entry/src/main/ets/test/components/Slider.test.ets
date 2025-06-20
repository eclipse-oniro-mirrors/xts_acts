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
import router from '@ohos.router';
import { frameTime, sleep } from '../Utils';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { sliderThemeProperty, sliderThemeSetProperty, SliderKeys } from '../../MainAbility/pages/components/SliderPage';
import { greenCustomTheme, redCustomTheme, brownCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

const emptyCheck: string = 'emptyCheck';
const emptyAttr: string = 'emptyAttr';

export default function sliderThemeTest() {
  const SUITE: string = `SliderThemeTest`;

  const sliderKeys: string[] = [
    SliderKeys.sliderOutSetSystem,
    SliderKeys.sliderInSetSystem,
    SliderKeys.sliderOutSetStepsSystem,
    SliderKeys.sliderInSetStepsSystem,
    SliderKeys.sliderOutSetSystemCustomAttrs,
    SliderKeys.sliderInSetSystemCustomAttrs,
    SliderKeys.sliderOutSetStepsSystemCustomAttrs,
    SliderKeys.sliderInSetStepsSystemCustomAttrs,
    SliderKeys.sliderOutSetWithTheme,
    SliderKeys.sliderInSetWithTheme,
    SliderKeys.sliderOutSetStepsWithTheme,
    SliderKeys.sliderInSetStepsWithTheme,
    SliderKeys.sliderOutSetWithThemeCustomAttrs,
    SliderKeys.sliderInSetWithThemeCustomAttrs,
    SliderKeys.sliderOutSetStepsWithThemeCustomAttrs,
    SliderKeys.sliderInSetStepsWithThemeCustomAttrs
  ];

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean | undefined = true
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/SliderPage`,
        }
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `SliderPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(sliderThemeProperty);
            themeSet = AppStorage.get<boolean>(sliderThemeSetProperty)
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    beforeEach(() => {
      AppStorage.setOrCreate(sliderThemeSetProperty, themeSet)
      if (changeTheme) {
        if ((AppStorage.get(sliderThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(sliderThemeProperty, greenCustomTheme);
        } else {
          AppStorage.setOrCreate(sliderThemeProperty, redCustomTheme);
        }
        changeTheme = false;
      }
      localTheme = AppStorage.get<boolean>(sliderThemeSetProperty) ? AppStorage.get<Theme>(sliderThemeProperty) : undefined;
    });

    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
     * @tc.number    : ActsSliderThemeColors_0100
     * @tc.name      : ActsSliderThemeColors_0100
     * @tc.desc      : Check Slider system colors
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsSliderThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsSliderThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      sliderKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsSliderThemeColors_0200
     * @tc.name      : ActsSliderThemeColors_0200
     * @tc.desc      : Check custom colors values of the Slider
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsSliderThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsSliderThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      sliderKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsSliderThemeColors_0300
     * @tc.name      : ActsSliderThemeColors_0300
     * @tc.desc      : Check custom colors values of the Slider
     *                 after change theme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsSliderThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsSliderThemeColors_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      sliderKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    : ActsSliderThemeColors_0400
     * @tc.name      : ActsSliderThemeColors_0400
     * @tc.desc      : Check system colors values of the Slider
     *                 after reset theme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsSliderThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsSliderThemeColors_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      sliderKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      themeSet = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const datePickerJSON = getInspectorByKey(key)
  const datePickerAttrs: DatePickerAttribute = JSON.parse(datePickerJSON).$attrs;
  const sliderJSON = getInspectorByKey(key);
  const attrsSlider: SliderAttribute = JSON.parse(sliderJSON)?.$attrs;

  const trackColor: string = attrsSlider?.trackColor.toString().toUpperCase() ?? emptyAttr;
  const checkTrackColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundSecondary
    ?? colorValues?.get(`compBackgroundSecondary`))?.toString().toUpperCase() ?? emptyCheck;
  expect(trackColor).assertEqual(checkTrackColor);

  const selectedColor: string = attrsSlider?.selectedColor.toString().toUpperCase() ?? emptyAttr;
  const checkSelectedColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.backgroundEmphasize
    ?? colorValues?.get(`backgroundEmphasize`))?.toString().toUpperCase() ?? emptyCheck;
  expect(selectedColor).assertEqual(checkSelectedColor);

  const blockColor: string = attrsSlider?.blockColor.toString().toUpperCase() ?? emptyAttr;
  const checkBlockColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundPrimaryContrary
    ?? colorValues?.get(`compBackgroundPrimaryContrary`))?.toString().toUpperCase() ?? emptyCheck;
  expect(blockColor).assertEqual(checkBlockColor);

  const stepColor: string = attrsSlider?.stepColor.toString().toUpperCase() ?? emptyAttr;
  const checkStepColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundSecondary
    ?? colorValues?.get(`compBackgroundSecondary`))?.toString().toUpperCase() ?? emptyCheck;
  expect(stepColor).assertEqual(checkStepColor);
}