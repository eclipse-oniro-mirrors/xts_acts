'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Driver, MouseButton, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { frameTime, sleep } from '../Utils.test';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import {
  SliderKeys,
  sliderThemeProperty,
  sliderThemeSetProperty
} from '../../../ets/MainAbility/pages/components/SliderPage';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

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
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/SliderPage`,
        }
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `SliderPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(`SliderThemeProperty`);
            themeSet = AppStorage.get<boolean>(`SliderThemeSetProperty`)
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
      AppStorage.setOrCreate<boolean | undefined>(`SliderThemeSetProperty`, themeSet)
      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>(`SliderThemeProperty`))?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate<CustomTheme>(`SliderThemeProperty`, greenCustomTheme);
        } else {
          AppStorage.setOrCreate<CustomTheme>(`SliderThemeProperty`, redCustomTheme);
        }
        changeTheme = false;
      }
      localTheme =
        AppStorage.get<boolean>(`SliderThemeSetProperty`) ? AppStorage.get<CustomTheme>(`SliderThemeProperty`) : undefined;
    });

    
    /**
     * @tc.number   ActsSliderThemeColors_static_0100
     * @tc.name     ActsSliderThemeColors_static_0100
     * @tc.desc     ActsSliderThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsSliderThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const CASE: string = `ActsSliderThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      sliderKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return;
        }
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsSliderThemeColors_static_0200
     * @tc.name     ActsSliderThemeColors_static_0200
     * @tc.desc     ActsSliderThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsSliderThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const CASE: string = `ActsSliderThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      sliderKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          done();
          return;
        }
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsSliderThemeColors_static_0300
     * @tc.name     ActsSliderThemeColors_static_0300
     * @tc.desc     ActsSliderThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsSliderThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const CASE: string = `ActsSliderThemeColors_static_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      sliderKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
        }
      });
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsSliderThemeColors_static_0400
     * @tc.name     ActsSliderThemeColors_static_0400
     * @tc.desc     ActsSliderThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ActsSliderThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
      const CASE: string = `ActsSliderThemeColors_static_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      sliderKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      themeSet = true;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
  });
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean,
  colorValues: Map<string, string> | undefined) {
  const datePickerJSON = inspector.getInspectorByKey(key)
  const datePickerAttrs = JSON.parseJsonElement(datePickerJSON).getElement('$attrs');
  const sliderJSON = inspector.getInspectorByKey(key);
  const attrsSlider = JSON.parseJsonElement(sliderJSON).getElement('$attrs');

  const trackColor: string = attrsSlider.getString('trackColor').toString().toUpperCase() ?? emptyAttr;
  const checkTrackColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundSecondary
    ?? colorValues?.get(`compBackgroundSecondary`))?.toString().toUpperCase() ?? emptyCheck;
  expect(trackColor).assertEqual(checkTrackColor);

  const selectedColor: string = attrsSlider.getString('selectedColor').toString().toUpperCase() ?? emptyAttr;
  const checkSelectedColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.backgroundEmphasize
    ?? colorValues?.get(`backgroundEmphasize`))?.toString().toUpperCase() ?? emptyCheck;
  expect(selectedColor).assertEqual(checkSelectedColor);

  const blockColor: string = attrsSlider.getString('blockColor').toString().toUpperCase() ?? emptyAttr;
  const checkBlockColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundPrimaryContrary
    ?? colorValues?.get(`compBackgroundPrimaryContrary`))?.toString().toUpperCase() ?? emptyCheck;
  expect(blockColor).assertEqual(checkBlockColor);

  const stepColor: string = attrsSlider.getString('stepColor').toString().toUpperCase() ?? emptyAttr;
  const checkStepColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundSecondary
    ?? colorValues?.get(`compBackgroundSecondary`))?.toString().toUpperCase() ?? emptyCheck;
  expect(stepColor).assertEqual(checkStepColor);
}