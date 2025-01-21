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
import { afterAll, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import { TextPickerKeys, textPickerThemeProperty } from '../../MainAbility/pages/components/TextPickerPage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function textPickerThemeTest() {
  const SUITE: string = `TextPickerThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  const textPickerKeys: string[] = [
    TextPickerKeys.textPickerSingleSystem,
    TextPickerKeys.textPickerMultiSystem,
    TextPickerKeys.textPickerCascadeSystem,
    TextPickerKeys.textPickerSingleWithTheme,
    TextPickerKeys.textPickerMultiWithTheme,
    TextPickerKeys.textPickerCascadeWithTheme
  ];

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
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
      if (!changeTheme) return;
      if ((AppStorage.get(textPickerThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(textPickerThemeProperty, greenCustomTheme);
      }
      else {
        AppStorage.setOrCreate(textPickerThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(textPickerThemeProperty);
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
    it(`ActsTextPickerThemeColors_0100`, 0, () => {
      const CASE: string = `ActsTextPickerThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      textPickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        const textPickerJSON = getInspectorByKey(key);
        const textPickerAttrs: TextPickerAttribute = JSON.parse(textPickerJSON).$attrs;
        const selectedTextStyle: PickerTextStyle = (textPickerAttrs?.selectedTextStyle as PickerTextStyle);
        const selectedTextColor: string = selectedTextStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkSelectedTextColor: string = colorValues?.get(`fontEmphasize`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        expect(selectedTextColor).assertEqual(checkSelectedTextColor);
        const textStyle: PickerTextStyle = (textPickerAttrs?.textStyle as PickerTextStyle)
        const textColor: string = textStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkTextColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(textColor).assertEqual(checkTextColor);
        const disappearTextStyle: PickerTextStyle = (textPickerAttrs?.disappearTextStyle as PickerTextStyle)
        const disappearTextColor: string = disappearTextStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkDisappearTextColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        expect(disappearTextColor).assertEqual(checkDisappearTextColor);
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
    it(`ActsTextPickerThemeColors_0200`, 0, () => {
      const CASE: string = `ActsTextPickerThemeColors_0200`
      console.info(`${SUITE} ${CASE} START`)
      textPickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        const textPickerJSON = getInspectorByKey(key);
        const textPickerAttrs: TextPickerAttribute = JSON.parse(textPickerJSON).$attrs;
        const selectedTextStyle: PickerTextStyle = (textPickerAttrs?.selectedTextStyle as PickerTextStyle);
        const selectedTextColor: string = selectedTextStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkSelectedTextColor: string = localTheme?.colors?.fontEmphasize?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(selectedTextColor).assertEqual(checkSelectedTextColor);
        const textStyle: PickerTextStyle = (textPickerAttrs?.textStyle as PickerTextStyle)
        const textColor: string = textStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkTextColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(textColor).assertEqual(checkTextColor);
        const disappearTextStyle: PickerTextStyle = (textPickerAttrs?.disappearTextStyle as PickerTextStyle)
        const disappearTextColor: string = disappearTextStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkDisappearTextColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(disappearTextColor).assertEqual(checkDisappearTextColor);
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
    it(`ActsTextPickerThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsTextPickerThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      textPickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) return;
        const textPickerJSON = getInspectorByKey(key);
        const textPickerAttrs: TextPickerAttribute = JSON.parse(textPickerJSON).$attrs;
        const selectedTextStyle: PickerTextStyle = (textPickerAttrs?.selectedTextStyle as PickerTextStyle);
        const selectedTextColor: string = selectedTextStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkSelectedTextColor: string = localTheme?.colors?.fontEmphasize?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(selectedTextColor).assertEqual(checkSelectedTextColor);
        const textStyle: PickerTextStyle = (textPickerAttrs?.textStyle as PickerTextStyle)
        const textColor: string = textStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkTextColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(textColor).assertEqual(checkTextColor);
        const disappearTextStyle: PickerTextStyle = (textPickerAttrs?.disappearTextStyle as PickerTextStyle)
        const disappearTextColor: string = disappearTextStyle?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkDisappearTextColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(disappearTextColor).assertEqual(checkDisappearTextColor);
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
  })
}
