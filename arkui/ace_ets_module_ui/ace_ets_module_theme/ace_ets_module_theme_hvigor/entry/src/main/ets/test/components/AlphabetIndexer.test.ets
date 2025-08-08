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
import { AlphabetIndexerKeys, alphabetIndexerThemeProperty } from '../../MainAbility/pages/components/AlphabetIndexerPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

export default function alphabetIndexerThemeTest() {
  const SUITE: string = `AlphabetIndexerThemeTest`;
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/AlphabetIndexerPage`,
        }
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `AlphabetIndexerPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(alphabetIndexerThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      if (!changeTheme) return;
      if ((AppStorage.get(alphabetIndexerThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(alphabetIndexerThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(alphabetIndexerThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(alphabetIndexerThemeProperty);
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
     * @tc.number    : ActsAlphabetIndexerThemeColors_0100
     * @tc.name      : ActsAlphabetIndexerThemeColors_0100
     * @tc.desc      : Check system colors values of the AlphabetIndexer component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsAlphabetIndexerThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsAlphabetIndexerThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const indexerJSON = getInspectorByKey(AlphabetIndexerKeys.alphabetIndexerSystem);
      const indexerAttrs: AlphabetIndexerAttribute = JSON.parse(indexerJSON).$attrs;
      const color = indexerAttrs?.color.toString().toUpperCase();
      expect(color).assertEqual(colorValues?.get(`fontSecondary`));
      const selectedColor = indexerAttrs?.selectedColor.toString().toUpperCase();
      expect(selectedColor).assertEqual(colorValues?.get(`fontEmphasize`));
      const popupColor = indexerAttrs?.popupColor.toString().toUpperCase();
      expect(popupColor).assertEqual(colorValues?.get(`fontEmphasize`));
      const popupUnselectedColor = indexerAttrs?.popupUnselectedColor.toString().toUpperCase();
      expect(popupUnselectedColor).assertEqual(colorValues?.get(`fontPrimary`));
      const popupTitleBackground = indexerAttrs?.popupTitleBackground.toString().toUpperCase();
      expect(popupTitleBackground).assertEqual(colorValues?.get(`compBackgroundTertiary`));
      const selectedBackgroundColor = indexerAttrs?.selectedBackgroundColor.toString().toUpperCase();
      expect(selectedBackgroundColor).assertEqual(colorValues?.get(`compEmphasizeSecondary`));
      console.info(`${SUITE} ${CASE} END`);
    })
    /** 
     * @tc.number    : ActsAlphabetIndexerThemeColors_0200
     * @tc.name      : ActsAlphabetIndexerThemeColors_0200
     * @tc.desc      : Check custom colors values of the AlphabetIndexer component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsAlphabetIndexerThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsAlphabetIndexerThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const indexerJSON = getInspectorByKey(AlphabetIndexerKeys.alphabetIndexerWithTheme);
      const indexerAttrs: AlphabetIndexerAttribute = JSON.parse(indexerJSON).$attrs;
      const color = indexerAttrs?.color.toString().toUpperCase();
      expect(color).assertEqual(localTheme?.colors?.fontSecondary);
      const selectedColor = indexerAttrs?.selectedColor.toString().toUpperCase();
      expect(selectedColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupColor = indexerAttrs?.popupColor.toString().toUpperCase();
      expect(popupColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupUnselectedColor = indexerAttrs?.popupUnselectedColor.toString().toUpperCase();
      expect(popupUnselectedColor).assertEqual(localTheme?.colors?.fontPrimary);
      const popupTitleBackground = indexerAttrs?.popupTitleBackground.toString().toUpperCase();
      expect(popupTitleBackground).assertEqual(localTheme?.colors?.compBackgroundTertiary);
      const selectedBackgroundColor = indexerAttrs?.selectedBackgroundColor.toString().toUpperCase();
      expect(selectedBackgroundColor).assertEqual(localTheme?.colors?.compEmphasizeSecondary);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
     /** 
     * @tc.number    : ActsAlphabetIndexerThemeColors_0300
     * @tc.name      : ActsAlphabetIndexerThemeColors_0300
     * @tc.desc      : Check system colors values of the AlphabetIndexer component
     *                 after change theme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsAlphabetIndexerThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsAlphabetIndexerThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const indexerJSON = getInspectorByKey(AlphabetIndexerKeys.alphabetIndexerWithTheme);
      const indexerAttrs: AlphabetIndexerAttribute = JSON.parse(indexerJSON).$attrs;
      const color = indexerAttrs?.color.toString().toUpperCase();
      expect(color).assertEqual(localTheme?.colors?.fontSecondary);
      const selectedColor = indexerAttrs?.selectedColor.toString().toUpperCase();
      expect(selectedColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupColor = indexerAttrs?.popupColor.toString().toUpperCase();
      expect(popupColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupUnselectedColor = indexerAttrs?.popupUnselectedColor.toString().toUpperCase();
      expect(popupUnselectedColor).assertEqual(localTheme?.colors?.fontPrimary);
      const popupTitleBackground = indexerAttrs?.popupTitleBackground.toString().toUpperCase();
      expect(popupTitleBackground).assertEqual(localTheme?.colors?.compBackgroundTertiary);
      const selectedBackgroundColor = indexerAttrs?.selectedBackgroundColor.toString().toUpperCase();
      expect(selectedBackgroundColor).assertEqual(localTheme?.colors?.compEmphasizeSecondary);
      console.info(`${SUITE} ${CASE} END`);
    })
  })
}