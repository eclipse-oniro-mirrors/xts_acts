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
import { MenuKeys, menuThemeProperty } from '../../MainAbility/pages/components/MenuPage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function menuItemThemeTest() {
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
      * @tc.number    : ActsMenuItemThemeColors_0100
      * @tc.name      : ActsMenuItemThemeColors_0100
      * @tc.desc      : check system colors values of the MenuItem component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsMenuItemThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsMenuItemThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const menuJSON = getInspectorByKey(MenuKeys.menuItemSystem)
      const menuAttrs: MenuItemAttribute = JSON.parse(menuJSON).$attrs
      const color: string = menuAttrs?.labelFontColor?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsMenuItemThemeColors_0200
      * @tc.name      : ActsMenuItemThemeColors_0200
      * @tc.desc      : check custom colors values of the MenuItem component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsMenuItemThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsMenuItemThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const menuJSON = getInspectorByKey(MenuKeys.menuItemWithTheme);
      const menuAttrs: MenuItemAttribute = JSON.parse(menuJSON).$attrs;
      const color: string = menuAttrs?.labelFontColor?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsMenuItemThemeColors_0300
      * @tc.name      : ActsMenuItemThemeColors_0300
      * @tc.desc      : check custom colors values of the MenuItem component
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsMenuItemThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsMenuItemThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const menuJSON = getInspectorByKey(MenuKeys.menuItemWithTheme);
      const menuAttrs: MenuItemAttribute = JSON.parse(menuJSON).$attrs;
      const color: string = menuAttrs?.labelFontColor?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}