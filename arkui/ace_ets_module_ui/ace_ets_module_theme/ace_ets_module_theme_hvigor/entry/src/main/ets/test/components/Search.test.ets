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
import { SearchKeys, searchThemeProperty } from '../../MainAbility/pages/components/SearchPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function SearchThemeTest() {
  const SUITE: string = `SearchThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/SearchPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `SearchPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(searchThemeProperty);
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
      if ((AppStorage.get(searchThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(searchThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(searchThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(searchThemeProperty);
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
      * @tc.number    : ActsSearchThemeColors_0100
      * @tc.name      : ActsSearchThemeColors_0100
      * @tc.desc      : Сheck system colors values of the Search
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsSearchThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsSearchThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const SearchJSON = getInspectorByKey(SearchKeys.searchSystem);
      const attrsSearch: SearchAttribute = JSON.parse(SearchJSON)?.$attrs;
      const backgroundColor: string = attrsSearch?.backgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = attrsSearch?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      const placeholderColor: string = attrsSearch?.placeholderColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkPlaceholderColor: string = colorValues?.get(`fontSecondary`)?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(placeholderColor).assertEqual(checkPlaceholderColor);
      const iconOption: IconOptions = (attrsSearch?.searchIcon as IconOptions)
      const iconColor: string = iconOption?.color?.toString().toUpperCase().replace('[', '').replace(',]', '')
        ?? EMPTY_ATTR;
      const checkIconColor: string = colorValues?.get(`fontSecondary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(iconColor).assertEqual(checkIconColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsSearchThemeColors_0200
      * @tc.name      : ActsSearchThemeColors_0200
      * @tc.desc      : Сheck custom colors values of the Search
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsSearchThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsSearchThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const SearchJSON = getInspectorByKey(SearchKeys.searchWithTheme);
      const attrsSearch: SearchAttribute = JSON.parse(SearchJSON)?.$attrs;
      const backgroundColor: string = attrsSearch?.backgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      const fontColor: string = attrsSearch?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      const placeholderColor: string = attrsSearch?.placeholderColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkPlaceholderColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(placeholderColor).assertEqual(checkPlaceholderColor);
      const iconOption: IconOptions = (attrsSearch?.searchIcon as IconOptions)
      const iconColor: string = iconOption?.color?.toString().toUpperCase().replace('[', '').replace(',]', '')
        ?? EMPTY_ATTR;
      const checkIconColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(iconColor).assertEqual(checkIconColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsSearchThemeColors_0300
      * @tc.name      : ActsSearchThemeColors_0300
      * @tc.desc      : Сheck system colors values of the Search
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsSearchThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsSearchThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const SearchJSON = getInspectorByKey(SearchKeys.searchWithTheme);
      const attrsSearch: SearchAttribute = JSON.parse(SearchJSON)?.$attrs;
      const backgroundColor: string = attrsSearch?.backgroundColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      const fontColor: string = attrsSearch?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      const placeholderColor: string = attrsSearch?.placeholderColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkPlaceholderColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(placeholderColor).assertEqual(checkPlaceholderColor);
      const iconOption: IconOptions = (attrsSearch?.searchIcon as IconOptions)
      const iconColor: string = iconOption?.color?.toString().toUpperCase().replace('[', '').replace(',]', '')
        ?? EMPTY_ATTR;
      const checkIconColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(iconColor).assertEqual(checkIconColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}