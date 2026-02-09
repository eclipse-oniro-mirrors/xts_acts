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
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { SearchKeys, searchThemeProperty } from '../../../ets/MainAbility/pages/components/SearchPage';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

export default function SearchThemeTest() {
  const SUITE: string = `SearchThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/SearchPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `SearchPage`) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
          await UtilsTest.msSleep(1000)
          localTheme = AppStorage.get<CustomTheme>(`SearchThemeProperty`);
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get<CustomTheme>(`SearchThemeProperty`))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate<CustomTheme>(`SearchThemeProperty`, greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>(`SearchThemeProperty`, redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>(`SearchThemeProperty`);
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsSearchThemeColors_static_0100
     * @tc.name     ActsSearchThemeColors_static_0100
     * @tc.desc     ActsSearchThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsSearchThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsSearchThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const SearchJSON = inspector.getInspectorByKey(SearchKeys.searchSystem);
      const attrsSearch = JSON.parseJsonElement(SearchJSON).getElement('$attrs');
      const backgroundColor: string = attrsSearch.getString('backgroundColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = attrsSearch.getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      const placeholderColor: string = attrsSearch.getString('placeholderColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkPlaceholderColor: string = colorValues?.get(`fontSecondary`)?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(placeholderColor).assertEqual(checkPlaceholderColor);
      const iconOption = attrsSearch.getElement('searchIcon')
      const iconColor: string =
        iconOption.getString('color')?.toString().toUpperCase().replace('[', '').replace(',]', '')
          ?? EMPTY_ATTR;
      const checkIconColor: string = colorValues?.get(`fontSecondary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(iconColor).assertEqual(checkIconColor);
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsSearchThemeColors_static_0200
     * @tc.name     ActsSearchThemeColors_static_0200
     * @tc.desc     ActsSearchThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsSearchThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsSearchThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const SearchJSON = inspector.getInspectorByKey(SearchKeys.searchWithTheme);
      const attrsSearch = JSON.parseJsonElement(SearchJSON).getElement('$attrs');
      const backgroundColor: string = attrsSearch.getString('backgroundColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      const fontColor: string = attrsSearch.getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      const placeholderColor: string = attrsSearch.getString('placeholderColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkPlaceholderColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(placeholderColor).assertEqual(checkPlaceholderColor);
      const iconOption = attrsSearch.getElement('searchIcon')
      const iconColor: string =
        iconOption.getString('color')?.toString().toUpperCase().replace('[', '').replace(',]', '') ?? EMPTY_ATTR;
      const checkIconColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(iconColor).assertEqual(checkIconColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsSearchThemeColors_static_0300
     * @tc.name     ActsSearchThemeColors_static_0300
     * @tc.desc     ActsSearchThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsSearchThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsSearchThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const SearchJSON = inspector.getInspectorByKey(SearchKeys.searchWithTheme);
      const attrsSearch = JSON.parseJsonElement(SearchJSON).getElement('$attrs');
      const backgroundColor: string = attrsSearch.getString('backgroundColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      const fontColor: string = attrsSearch.getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      const placeholderColor: string = attrsSearch.getString('placeholderColor').toString().toUpperCase() ?? EMPTY_ATTR;
      const checkPlaceholderColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(placeholderColor).assertEqual(checkPlaceholderColor);
      const iconOption = attrsSearch.getElement('searchIcon')
      const iconColor: string =
        iconOption.getString('color')?.toString().toUpperCase().replace('[', '').replace(',]', '')
          ?? EMPTY_ATTR;
      const checkIconColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(iconColor).assertEqual(checkIconColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  });
}