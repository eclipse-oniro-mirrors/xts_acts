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
import { sliderThemeProperty, SliderKeys } from '../../MainAbility/pages/components/SliderPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function sliderThemeTest() {
  const SUITE: string = `SliderThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  const sliderKeys: string[] = [
    SliderKeys.sliderOutSetSystem,
    SliderKeys.sliderInSetSystem,
    SliderKeys.sliderOutSetStepsSystem,
    SliderKeys.sliderInSetStepsSystem,
    SliderKeys.sliderOutSetWithTheme,
    SliderKeys.sliderInSetWithTheme,
    SliderKeys.sliderOutSetStepsWithTheme,
    SliderKeys.sliderInSetStepsWithTheme,
  ];
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
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
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    beforeEach(() => {
      if (!changeTheme) return
      if ((AppStorage.get(sliderThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(sliderThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(sliderThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(sliderThemeProperty);
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
     * @tc.number    : ActsSliderThemeColors_0100
     * @tc.name      : ActsSliderThemeColors_0100
     * @tc.desc      : Check Slider system colors
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsSliderThemeColors_0100`, 0, () => {
      const CASE: string = `ActsSliderThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      sliderKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        const sliderJSON = getInspectorByKey(key);
        const attrsSlider: SliderAttribute = JSON.parse(sliderJSON)?.$attrs;

        const trackColor: string = attrsSlider?.trackColor.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkTrackColor = colorValues?.get(`compBackgroundSecondary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(trackColor).assertEqual(checkTrackColor);

        const selectedColor: ResourceColor = attrsSlider?.selectedColor.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkSelectedColor = colorValues?.get(`backgroundEmphasize`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(selectedColor).assertEqual(checkSelectedColor);

        const blockColor: string = attrsSlider?.blockColor.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkBlockColor = colorValues?.get(`compBackgroundPrimaryContrary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(blockColor).assertEqual(checkBlockColor);

        const stepColor: string = attrsSlider?.stepColor.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkStepColor = colorValues?.get(`compBackgroundSecondary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(stepColor).assertEqual(checkStepColor);
      })
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}