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
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import router from '@ohos.router';
import { afterAll, beforeAll, beforeEach, describe, it, expect , Level} from '@ohos/hypium';
import { MenuKeys, menuThemeProperty } from '../../MainAbility/pages/components/MenuPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function menuThemeTest() {
  const SUITE: string = `MenuThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/MenuPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `MenuPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(menuThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          });
        }
        colorValues = AppStorage.get(colorValuesKey);
      }
      catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })
    beforeEach(() => {
      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get(menuThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(menuThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(menuThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(menuThemeProperty);
      changeTheme = false;
    });
    afterAll(() => {
      try {
        router.back();
      }
      catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
      * @tc.number    : ActsMenuThemeColors_0100
      * @tc.name      : ActsMenuThemeColors_0100
      * @tc.desc      : check system colors values of the Menu component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsMenuThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsMenuThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const menuJSON = getInspectorByKey(MenuKeys.menuSystem);
      const menuAttrs: MenuAttribute = JSON.parse(menuJSON).$attrs;
      const fontColor: string = menuAttrs?.fontColor?.toString().toUpperCase() ?? emptyAttr;
      const checkFontColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? emptyCheck;
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsMenuThemeColors_0200
      * @tc.name      : ActsMenuThemeColors_0200
      * @tc.desc      : check custom colors values of the Menu component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsMenuThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsMenuThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const menuJSON = getInspectorByKey(MenuKeys.menuWithTheme);
      const menuAttrs: MenuAttribute = JSON.parse(menuJSON).$attrs;
      const fontColor: string = menuAttrs?.fontColor?.toString().toUpperCase() ?? emptyAttr;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? emptyCheck;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsMenuThemeColors_0300
      * @tc.name      : ActsMenuThemeColors_0300
      * @tc.desc      : check system colors values of the Menu component
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsMenuThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsMenuThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const menuJSON = getInspectorByKey(MenuKeys.menuWithTheme);
      const menuAttrs: MenuAttribute = JSON.parse(menuJSON).$attrs;
      const fontColor: string = menuAttrs?.fontColor?.toString().toUpperCase() ?? emptyAttr;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? emptyCheck;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}