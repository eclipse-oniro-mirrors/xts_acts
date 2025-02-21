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
import { afterAll, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { ifArgumentProperty, IfKeys, ifThemeProperty } from '../../MainAbility/pages/components/IfPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function ifThemeTest() {
  const SUITE: string = `IfThemeTest`;
  const emptyAttr = 'emptyAttr';
  const emptyCheck = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/IfPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `IfPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(ifThemeProperty);
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
      if ((AppStorage.get(ifThemeProperty) as Theme)?.colors?.backgroundEmphasize
        == redCustomTheme?.colors?.backgroundEmphasize) {
        AppStorage.setOrCreate(ifThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(ifThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(ifThemeProperty);
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
      * @tc.number    : ActsIfThemeColors_0100
      * @tc.name      : ActsIfThemeColors_0100
      * @tc.desc      : check system colors values of child component inside if-else body
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsIfThemeColors_0100`, 0, async () => {
      const CASE: string = `ActsIfThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      AppStorage.setOrCreate(ifArgumentProperty, true);
      await sleep(frameTime);
      {
        const buttonJson = getInspectorByKey(IfKeys.ifSystem);
        const attrs: ButtonAttribute = (JSON.parse(buttonJson)?.$attrs as ButtonAttribute);
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = colorValues?.get(`backgroundEmphasize`)?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }

      AppStorage.setOrCreate(ifArgumentProperty, false);
      await sleep(frameTime);
      {
        const buttonJson = getInspectorByKey(IfKeys.elseSystem);
        const attrs: ButtonAttribute = JSON.parse(buttonJson)?.$attrs;
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsIfThemeColors_0200
      * @tc.name      : ActsIfThemeColors_0200
      * @tc.desc      : check custom colors values of child component inside if-else body
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsIfThemeColors_0200`, 0, async () => {
      const CASE: string = `ActsIfThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);

      AppStorage.setOrCreate(ifArgumentProperty, true);
      await sleep(frameTime);
      {
        const ifJSON = getInspectorByKey(IfKeys.ifWithTheme);
        const attrs: ButtonAttribute = JSON.parse(ifJSON)?.$attrs;
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }

      AppStorage.setOrCreate(ifArgumentProperty, false);
      await sleep(frameTime);
      {
        const ifJSON = getInspectorByKey(IfKeys.elseWithTheme);
        const attrs: ButtonAttribute = JSON.parse(ifJSON)?.$attrs;
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsIfThemeColors_0300
      * @tc.name      : ActsIfThemeColors_0300
      * @tc.desc      : check custom colors values of child component inside if-else body
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsIfThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsIfThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);

      AppStorage.setOrCreate(ifArgumentProperty, true);
      await sleep(frameTime);
      {
        const ifJSON = getInspectorByKey(IfKeys.ifWithTheme);
        const attrs: ButtonAttribute = JSON.parse(ifJSON)?.$attrs;
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }

      AppStorage.setOrCreate(ifArgumentProperty, false);
      await sleep(frameTime);
      {
        const ifJSON = getInspectorByKey(IfKeys.elseWithTheme);
        const attrs: ButtonAttribute = JSON.parse(ifJSON)?.$attrs;
        const backgroundColor: string = attrs?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}
