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
import router from '@ohos.router';
import { afterAll, beforeAll, beforeEach, describe, it, expect , Level} from '@ohos/hypium';
import { TextPickerKeys, textPickerThemeProperty, textPickerThemeSetProperty } from '../../MainAbility/pages/components/TextPickerPage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

const emptyCheck: string = 'emptyCheck';
const emptyAttr: string = 'emptyAttr';

export default function textPickerThemeTest() {
  const SUITE: string = `TextPickerThemeTest`;

  const textPickerKeys: string[] = [
    TextPickerKeys.textPickerSingleSystem,
    TextPickerKeys.textPickerMultiSystem,
    TextPickerKeys.textPickerCascadeSystem,
    TextPickerKeys.textPickerSingleSystemCustomAttrs,
    TextPickerKeys.textPickerMultiSystemCustomAttrs,
    TextPickerKeys.textPickerCascadeSystemCustomAttrs,
    TextPickerKeys.textPickerSingleWithTheme,
    TextPickerKeys.textPickerMultiWithTheme,
    TextPickerKeys.textPickerCascadeWithTheme,
    TextPickerKeys.textPickerSingleWithThemeCustomAttrs,
    TextPickerKeys.textPickerMultiWithThemeCustomAttrs,
    TextPickerKeys.textPickerCascadeWithThemeCustomAttrs
  ];

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean | undefined = false
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/TextPickerPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `TextPickerPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(textPickerThemeProperty);
            themeSet = AppStorage.get<boolean>(textPickerThemeSetProperty);
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
      AppStorage.setOrCreate(textPickerThemeSetProperty, themeSet)
      if (changeTheme) {
        if ((AppStorage.get(textPickerThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(textPickerThemeProperty, greenCustomTheme);
        }
        else {
          AppStorage.setOrCreate(textPickerThemeProperty, redCustomTheme);
        }
      }
      localTheme = AppStorage.get<boolean>(textPickerThemeSetProperty) ? AppStorage.get<Theme>(textPickerThemeProperty) : undefined;
      changeTheme = false;
    })
    afterAll(() => {
      try {
        router.back();
      }
      catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    })

    /**
     * @tc.number    : ActsTextPickerThemeColors_0100
     * @tc.name      : ActsTextPickerThemeColors_0100
     * @tc.desc      : Check system colors values of the TextPicker component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextPickerThemeColors_0100`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextPickerThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      textPickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.number    : ActsTextPickerThemeColors_0200
     * @tc.name      : ActsTextPickerThemeColors_0200
     * @tc.desc      : Check custom colors values of the TextPicker component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextPickerThemeColors_0200`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextPickerThemeColors_0200`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      textPickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    });
    /**
     * @tc.number    : ActsTextPickerThemeColors_0300
     * @tc.name      : ActsTextPickerThemeColors_0300
     * @tc.desc      : Check custom colors values of the TextPicker component
     *                 after change theme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextPickerThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextPickerThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      textPickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
     * @tc.number    : ActsTextPickerThemeColors_0400
     * @tc.name      : ActsTextPickerThemeColors_0400
     * @tc.desc      : Check custom colors values of the TextPicker component
     *                 after change theme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextPickerThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextPickerThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      textPickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      themeSet = true;
      console.info(`${SUITE} ${CASE} END`);
    })
  })
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const textPickerJSON = getInspectorByKey(key)
  const textPickerAttrs: TextPickerAttribute = JSON.parse(textPickerJSON).$attrs;
  const selectedTextStyle: PickerTextStyle = (textPickerAttrs?.selectedTextStyle as PickerTextStyle);
  const selectedColor: string = selectedTextStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkSelectedColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontEmphasize?.toString().toUpperCase()
    ?? colorValues?.get(`fontEmphasize`)
    ?? emptyCheck;
  expect(selectedColor).assertEqual(checkSelectedColor);
  const textStyle: PickerTextStyle = (textPickerAttrs?.textStyle as PickerTextStyle);
  const textColor: string = textStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkTextColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;
  expect(textColor).assertEqual(checkTextColor);
  const disappearTextStyle: PickerTextStyle = (textPickerAttrs?.disappearTextStyle as PickerTextStyle)
  const disappearTextColor: string = disappearTextStyle?.color?.toString().toUpperCase() ?? emptyAttr;
  const checkDisappearTextColor: string = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;
  expect(disappearTextColor).assertEqual(checkDisappearTextColor);
}
