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
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { frameTime, sleep } from '../Utils';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { buttonThemeProperty } from '../../MainAbility/pages/components/ButtonPage';
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { ButtonKeys } from '../../MainAbility/pages/components/ButtonPage.ets';

const buttonKeysSystemNormal: string[] = [
  ButtonKeys.buttonSystemNormalNormalNormal,
  ButtonKeys.buttonSystemNormalNormalSmall,
  ButtonKeys.buttonSystemErrorNormalNormal,
  ButtonKeys.buttonSystemErrorNormalSmall
];

const buttonKeysSystemEmphasized: string[] = [
  ButtonKeys.buttonSystemNormalEmphasizedNormal,
  ButtonKeys.buttonSystemNormalEmphasizedSmall,
  ButtonKeys.buttonSystemErrorEmphasizedNormal,
  ButtonKeys.buttonSystemErrorEmphasizedSmall
];

const buttonKeysSystemTextual: string[] = [
  ButtonKeys.buttonSystemNormalTextualNormal,
  ButtonKeys.buttonSystemNormalTextualSmall,
  ButtonKeys.buttonSystemErrorTextualNormal,
  ButtonKeys.buttonSystemErrorTextualSmall
];

const buttonKeyWithThemeNormal: string[] = [
  ButtonKeys.buttonWithThemeNormalNormalNormal,
  ButtonKeys.buttonWithThemeNormalNormalSmall,
  ButtonKeys.buttonWithThemeErrorNormalNormal,
  ButtonKeys.buttonWithThemeErrorNormalSmall,
];

const buttonKeyWithThemeEmphasized: string[] = [
  ButtonKeys.buttonWithThemeNormalEmphasizedNormal,
  ButtonKeys.buttonWithThemeNormalEmphasizedSmall,
  ButtonKeys.buttonWithThemeErrorEmphasizedNormal,
  ButtonKeys.buttonWithThemeErrorEmphasizedSmall
];

const buttonKeyWithThemeTextual: string[] = [
  ButtonKeys.buttonWithThemeNormalTextualNormal,
  ButtonKeys.buttonWithThemeNormalTextualSmall,
  ButtonKeys.buttonWithThemeErrorTextualSmall,
  ButtonKeys.buttonWithThemeErrorTextualSmall
];
const opacityColor = '#00000000';

export default function buttonThemeTest() {
  const SUITE: string = 'ButtonThemeTest';
  const errorKey = 'error';
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/ButtonPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `ButtonPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(buttonThemeProperty);
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
      if ((AppStorage.get(buttonThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(buttonThemeProperty, greenCustomTheme);
      }
      else {
        AppStorage.setOrCreate(buttonThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(buttonThemeProperty);
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
     * @tc.name   ActsButtonThemeColors_0100
     * @tc.number ActsButtonThemeColors_0100
     * @tc.desc   Check button system colors ButtonStyleEx.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0100', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0100';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeysSystemNormal.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase() ?? emptyAttr;
        const backgroundColorName: string = `compBackgroundTertiary`;
        const fontColorName: string = buttonKey.includes(errorKey) ? `warning` : `fontEmphasize`;
        const checkBackgroundColor: string = colorValues?.get(backgroundColorName) ?? emptyCheck;
        const checkFontColor: string = colorValues?.get(fontColorName) ?? emptyCheck;
        expect(backgroundColor).assertContain('#');
        expect(fontColor).assertContain('#');
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsButtonThemeColors_0200
     * @tc.number ActsButtonThemeColors_0200
     * @tc.desc   Check button system colors ButtonStyleEx.EMPHASIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0200', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0200';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeysSystemEmphasized.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase();
        const backgroundColorName: string = buttonKey.includes(errorKey) ? `warning` : `fontEmphasize`;
        const fontColorName: string = 'fontOnPrimary';
        const checkBackgroundColor: string = colorValues?.get(backgroundColorName) ?? emptyCheck;
        const checkFontColor: string = colorValues?.get(fontColorName) ?? emptyCheck;
        expect(backgroundColor).assertContain('#');
        expect(fontColor).assertContain('#');
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsButtonThemeColors_0300
     * @tc.number ActsButtonThemeColors_0300
     * @tc.desc   Check button system colors ButtonStyleEx.TEXTUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0300', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0300';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeysSystemTextual.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString()?.toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase() ?? emptyAttr;
        const fontColorName: string = buttonKey.includes(errorKey) ? `warning` : `fontEmphasize`;
        const checkBackgroundColor: string = opacityColor.toUpperCase();
        const checkFontColor: string = colorValues?.get(fontColorName) ?? emptyCheck;
        expect(backgroundColor).assertContain('#');
        expect(fontColor).assertContain('#');
      });
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ActsButtonThemeColors_0400
     * @tc.number ActsButtonThemeColors_0400
     * @tc.desc   Check button withTheme colors ButtonStyleEx.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0400', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0400';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeNormal.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString()?.toUpperCase();
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase();
        const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
          ?? emptyCheck;
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor: string = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsButtonThemeColors_0500
     * @tc.number ActsButtonThemeColors_0500
     * @tc.desc   Check button withTheme colors ButtonStyleEx.EMPHASIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0500', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0500';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeEmphasized.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString()?.toUpperCase();
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase();
        const checkBackgroundColorString: ResourceColor | undefined = buttonKey.includes(errorKey)
          ? localTheme?.colors?.warning : localTheme?.colors?.backgroundEmphasize;
        const checkBackgroundColor: string = checkBackgroundColorString?.toString().toUpperCase() ?? emptyCheck;
        const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsButtonThemeColors_0600
     * @tc.number ActsButtonThemeColors_0600
     * @tc.desc   Check button withTheme colors ButtonStyleEx.TEXTUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0600', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0600';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeTextual.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString()?.toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = opacityColor.toUpperCase();
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor: string = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      changeTheme = true;
    });
    /**
     * @tc.name   ActsButtonThemeColors_0700
     * @tc.number ActsButtonThemeColors_0700
     * @tc.desc   Check button withTheme colors ButtonStyleEx.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsButtonThemeColors_0700', Level.LEVEL0, async () => {
      const CASE: string = 'ActsButtonThemeColors_0700';
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      buttonKeyWithThemeNormal.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString()?.toUpperCase();
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase();
        const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
          ?? emptyCheck;
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsButtonThemeColors_0800
     * @tc.number ActsButtonThemeColors_0800
     * @tc.desc   Check button withTheme colors ButtonStyleEx.EMPHASIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0800', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0800';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeEmphasized.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString()?.toUpperCase();
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase();
        const checkBackgroundColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.backgroundEmphasize;
        const checkBackgroundColor: string = checkBackgroundColorString?.toString().toUpperCase() ?? emptyCheck;
        const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
    });


    /**
     * @tc.name   ActsButtonThemeColors_0900
     * @tc.number ActsButtonThemeColors_0900
     * @tc.desc   Check button withTheme colors ButtonStyleEx.TEXTUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsButtonThemeColors_0900', Level.LEVEL2, () => {
      const CASE: string = 'ActsButtonThemeColors_0900';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeTextual.forEach((buttonKey) => {
        const strJson = getInspectorByKey(buttonKey);
        const attrs: ButtonAttribute = (JSON.parse(strJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString()?.toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs?.fontColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = opacityColor.toUpperCase();
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor: string = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      changeTheme = true;
    });
  })
}