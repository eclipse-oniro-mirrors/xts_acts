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
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { BadgeKeys, badgeThemeProperty } from '../../MainAbility/pages/components/BadgePage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

export default function badgeThemeTest() {
  const SUITE: string = `badgeThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/BadgePage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `BadgePage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(badgeThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          });
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
      if ((AppStorage.get(badgeThemeProperty) as Theme)?.colors?.fontOnPrimary
        == redCustomTheme?.colors?.fontOnPrimary) {
        AppStorage.setOrCreate(badgeThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(badgeThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(badgeThemeProperty);
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
     * @tc.number    : ActsBadgeThemeTest_0100
     * @tc.name      : ActsBadgeThemeTest_0100
     * @tc.desc      : Check system colors values of Badge component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsBadgeThemeTest_0100`, 0, async () => {
      const CASE: string = `ActsBadgeThemeTest_0100`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const badgeJson = getInspectorByKey(BadgeKeys.badgeKeysSystem);
      const badgeStyleJson: string = JSON.parse(badgeJson)?.$attrs?.style?.toString();
      const color: string = JSON.parse(badgeStyleJson)?.color?.toString();
      const badgeColor: string = JSON.parse(badgeStyleJson)?.badgeColor?.toString();
      const borderColor: string = JSON.parse(badgeStyleJson)?.borderColor?.toString();
      const checkColor: string = colorValues?.get(`fontOnPrimary`) ?? emptyCheck
      const CheckBadgeColor: string = colorValues?.get(`warning`) ?? emptyCheck
      const CheckBorderColor: string = colorValues?.get(`warning`) ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      expect(badgeColor).assertEqual(CheckBadgeColor);
      expect(borderColor).assertEqual(CheckBorderColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsBadgeThemeTest_0200
      * @tc.name      : ActsBadgeThemeTest_0200
      * @tc.desc      : Check custom colors values of Badge component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsBadgeThemeTest_0200`, 0, () => {
      const CASE: string = `ActsBadgeThemeTest_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const badgeJson = getInspectorByKey(BadgeKeys.badgeKeysWithTheme)
      const badgeStyleJson: string = JSON.parse(badgeJson)?.$attrs?.style?.toString();
      const color: string = JSON.parse(badgeStyleJson)?.color?.toString().toUpperCase();
      const badgeColor: string = JSON.parse(badgeStyleJson)?.badgeColor?.toString().toUpperCase();
      const borderColor: string = JSON.parse(badgeStyleJson)?.borderColor?.toString().toUpperCase();
      const checkColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
      const CheckBadgeColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      const CheckBorderColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      expect(badgeColor).assertEqual(CheckBadgeColor);
      expect(borderColor).assertEqual(CheckBorderColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
      * @tc.number    : ActsBadgeThemeTest_0300
      * @tc.name      : ActsBadgeThemeTest_0300
      * @tc.desc      : Check custom colors values of Badge component
     *                  after changing the theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsBadgeThemeTest_0300`, 0, async () => {
      const CASE: string = `ActsBadgeThemeTest_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const badgeJson = getInspectorByKey(BadgeKeys.badgeKeysWithTheme);
      const badgeStyleJson: string = JSON.parse(badgeJson)?.$attrs?.style?.toString();
      const color: string = JSON.parse(badgeStyleJson)?.color?.toString().toUpperCase();
      const badgeColor: string = JSON.parse(badgeStyleJson)?.badgeColor?.toString().toUpperCase();
      const borderColor: string = JSON.parse(badgeStyleJson)?.borderColor?.toString().toUpperCase();
      const checkColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
      const CheckBadgeColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      const CheckBorderColor: string = localTheme?.colors?.warning?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      expect(badgeColor).assertEqual(CheckBadgeColor);
      expect(borderColor).assertEqual(CheckBorderColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}