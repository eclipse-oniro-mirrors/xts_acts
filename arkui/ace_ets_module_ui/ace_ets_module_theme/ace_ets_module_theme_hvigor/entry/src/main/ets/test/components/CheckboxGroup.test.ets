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
import { CheckBoxKeys, checkBoxThemeProperty } from '../../MainAbility/pages/components/CheckboxPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function checkboxGroupThemeTest() {
  const SUITE: string = `CheckboxGroupThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/CheckboxPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `CheckboxPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(checkBoxThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          });
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get(checkBoxThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(checkBoxThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(checkBoxThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(checkBoxThemeProperty);
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
     * @tc.name   ActsCheckBoxGroupThemeColors_0100
     * @tc.number ActsCheckBoxGroupThemeColors_0100
     * @tc.desc   Check checkboxGroup system colors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsCheckBoxGroupThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsCheckBoxGroupThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const checkboxJSON: string = getInspectorByKey(CheckBoxKeys.checkboxGroupSystem);
      const attrsCheckBox: CheckboxAttribute = (JSON.parse(checkboxJSON)?.$attrs as CheckboxAttribute);
      const selectedColor: string = attrsCheckBox?.selectedColor?.toString().toUpperCase();
      const checkSelectedColor: string = colorValues?.get(`compBackgroundEmphasize`) ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const unselectedColor: string = attrsCheckBox?.unselectedColor?.toString().toUpperCase();
      const checkUnselectedColor: string = colorValues?.get(`iconFourth`) ?? emptyCheck;
      expect(unselectedColor).assertEqual(checkUnselectedColor);
      const markObject: MarkStyle = JSON.parse(attrsCheckBox?.mark.toString());
      const strokeColor: string = markObject?.strokeColor?.toString().toUpperCase() ?? emptyCheck;
      const checkStrokeColor: string = colorValues?.get(`iconOnPrimary`) ?? emptyCheck;
      expect(strokeColor).assertEqual(checkStrokeColor);
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
     * @tc.name   ActsCheckBoxGroupThemeColors_0200
     * @tc.number ActsCheckBoxGroupThemeColors_0200
     * @tc.desc   Check checkboxGroup theme colors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsCheckBoxGroupThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsCheckBoxGroupThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const checkboxJSON = getInspectorByKey(CheckBoxKeys.checkboxGroupWithTheme);
      const attrsCheckBox: CheckboxAttribute = (JSON.parse(checkboxJSON)?.$attrs as CheckboxAttribute);
      const selectedColor: string = attrsCheckBox?.selectedColor?.toString().toUpperCase();
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const unselectedColor: string = attrsCheckBox?.unselectedColor?.toString().toUpperCase();
      const checkUnselectedColor: string = localTheme?.colors?.iconFourth?.toString().toUpperCase()
        ?? emptyCheck;
      expect(unselectedColor).assertEqual(checkUnselectedColor);
      const markObject: MarkStyle = JSON.parse(attrsCheckBox?.mark.toString());
      const strokeColor: string = markObject?.strokeColor?.toString().toUpperCase() ?? emptyAttr;
      const checkStrokeColor: string = localTheme?.colors?.iconOnPrimary?.toString().toUpperCase()
        ?? emptyCheck;
      expect(strokeColor).assertEqual(checkStrokeColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
     * @tc.name   ActsCheckBoxGroupThemeColors_0300
     * @tc.number ActsCheckBoxGroupThemeColors_0300
     * @tc.desc   Check checkboxGroup theme colors after change theme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsCheckBoxGroupThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsCheckBoxGroupThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const checkboxJSON: string = getInspectorByKey(CheckBoxKeys.checkboxGroupWithTheme);
      const attrsCheckBox: CheckboxAttribute = (JSON.parse(checkboxJSON)?.$attrs as CheckboxAttribute);
      const selectedColor: string = attrsCheckBox?.selectedColor?.toString().toUpperCase();
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const unselectedColor: string = attrsCheckBox?.unselectedColor?.toString().toUpperCase();
      const checkUnselectedColor: string = localTheme?.colors?.iconFourth?.toString().toUpperCase()
        ?? emptyCheck;
      expect(unselectedColor).assertEqual(checkUnselectedColor);
      const markObject: MarkStyle = JSON.parse(attrsCheckBox?.mark.toString());
      const strokeColor: string = markObject?.strokeColor?.toString().toUpperCase() ?? emptyAttr;
      const checkStrokeColor: string = localTheme?.colors?.iconOnPrimary?.toString().toUpperCase()
        ?? emptyCheck;
      expect(strokeColor).assertEqual(checkStrokeColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
  })
}