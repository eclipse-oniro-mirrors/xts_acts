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
import { PatternLockKeys, patternLockThemeProperty } from '../../MainAbility/pages/components/PatternLockPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

export default function patternLockThemeTest() {
  const SUITE: string = `patternLockThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/PatternLockPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `PatternLockPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(patternLockThemeProperty);
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
      if ((AppStorage.get(patternLockThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(patternLockThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(patternLockThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(patternLockThemeProperty);
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
     * @tc.name   ActsPatternLockThemeColors_0100
     * @tc.number ActsPatternLockThemeColors_0100
     * @tc.desc   Check system colors values of PatternLock component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsPatternLockThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsPatternLockThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const patternLockJSON = getInspectorByKey(PatternLockKeys.patternLockSystem);
      const attrsPatternLock = (JSON.parse(patternLockJSON)?.$attrs as PatternLockAttribute);
      const regularColor: string = attrsPatternLock?.regularColor?.toString().toUpperCase() ?? emptyAttr;
      const checkRegularColor: string = colorValues?.get(`compBackgroundNeutral`)?.toString().toUpperCase()
        ?? emptyCheck;
      expect(regularColor).assertEqual(checkRegularColor);
      const activeColor: string = attrsPatternLock?.activeColor?.toString().toUpperCase() ?? emptyAttr;
      const checkActiveColor: string = colorValues?.get(`compBackgroundNeutral`)?.toString().toUpperCase()
        ?? emptyCheck;
      expect(activeColor, checkActiveColor);
      const selectedColor: string = attrsPatternLock?.selectedColor?.toString().toUpperCase();
      const checkSelectedColor: string = colorValues?.get(`compBackgroundNeutral`)?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor, checkSelectedColor);
      const pathColor: string = attrsPatternLock?.pathColor?.toString().toUpperCase();
      const checkPathColor: string = colorValues?.get(`compDivider`)?.toString().toUpperCase() ?? emptyCheck;
      expect(pathColor).assertEqual(checkPathColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsPatternLockThemeColors_0200
     * @tc.number ActsPatternLockThemeColors_0200
     * @tc.desc   Check custom colors values of PatternLock component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsPatternLockThemeColors_0200`, Level.LEVEL0, async () => {
      const CASE: string = `ActsPatternLockThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const patternLockJSON = getInspectorByKey(PatternLockKeys.patternLockWithTheme);
      const attrsPatternLock = (JSON.parse(patternLockJSON)?.$attrs as PatternLockAttribute);
      const regularColor: string = attrsPatternLock?.regularColor?.toString().toUpperCase() ?? emptyAttr;;
      const checkRegularColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(regularColor).assertEqual(checkRegularColor);
      const activeColor: string = attrsPatternLock?.activeColor?.toString().toUpperCase() ?? emptyAttr;
      const checkActiveColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(activeColor).assertEqual(checkActiveColor);
      const selectedColor: string = attrsPatternLock?.selectedColor?.toString().toUpperCase() ?? emptyAttr;
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const pathColor: string = attrsPatternLock?.pathColor?.toString().toUpperCase() ?? emptyAttr;
      const checkPathColor: string = localTheme?.colors?.compDivider?.toString().toUpperCase() ?? emptyCheck;
      expect(pathColor).assertEqual(checkPathColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ActsPatternLockThemeColors_0300
     * @tc.number ActsPatternLockThemeColors_0300
     * @tc.desc   Check custom colors values of PatternLock component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsPatternLockThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsPatternLockThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const patternLockJSON = getInspectorByKey(PatternLockKeys.patternLockWithTheme);
      const attrsPatternLock = (JSON.parse(patternLockJSON)?.$attrs as PatternLockAttribute);
      const regularColor: string = attrsPatternLock?.regularColor?.toString().toUpperCase() ?? emptyAttr;;
      const checkRegularColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(regularColor).assertEqual(checkRegularColor);
      const activeColor: string = attrsPatternLock?.activeColor?.toString().toUpperCase() ?? emptyAttr;
      const checkActiveColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(activeColor).assertEqual(checkActiveColor);
      const selectedColor: string = attrsPatternLock?.selectedColor?.toString().toUpperCase() ?? emptyAttr;
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundNeutral?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const pathColor: string = attrsPatternLock?.pathColor?.toString().toUpperCase() ?? emptyAttr;
      const checkPathColor: string = localTheme?.colors?.compDivider?.toString().toUpperCase() ?? emptyCheck;
      expect(pathColor).assertEqual(checkPathColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}