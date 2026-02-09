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
import { textClockFontColor, textClockThemeProperty, textClockThemeSetProperty } from '../../MainAbility/pages/components/TextClockPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

export default function textClockThemeTest() {
  const SUITE: string = `textClockThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  const textClockKeys: string [] = [
    `TextClock_System`,
    `TextClock_WithTheme`,
    `TextClock_System_CustomAttrs`,
    `TextClock_WithTheme_CustomAttrs`
  ]

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean | undefined = true
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/TextClockPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `TextClockPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(textClockThemeProperty);
            themeSet = AppStorage.get<boolean>(textClockThemeSetProperty)
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      if (changeTheme) {
        if ((AppStorage.get(textClockThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(textClockThemeProperty, greenCustomTheme)
        } else {
          AppStorage.setOrCreate(textClockThemeProperty, redCustomTheme)
        }
        changeTheme = false
      }
      AppStorage.setOrCreate(textClockThemeSetProperty, themeSet);
      localTheme = AppStorage.get<boolean>(textClockThemeSetProperty) ? AppStorage.get<Theme>(textClockThemeProperty) : undefined
    })

    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    })

    /**
     * @tc.name   ActsTextClockThemeColors_0100
     * @tc.number ActsTextClockThemeColors_0100
     * @tc.desc   Check system colors values of TextClock component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsTextClockThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsTextClockThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      textClockKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return;
        const textClockJSON = getInspectorByKey(key);
        const attrsTextClock = (JSON.parse(textClockJSON)?.$attrs as TextClockAttribute);
        const fontColor: string = attrsTextClock?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor : colorValues?.get(`fontSecondary`))?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
      })
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ActsTextClockThemeColors_0200
     * @tc.number ActsTextClockThemeColors_0200
     * @tc.desc   Check custom colors values of TextClock component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsTextClockThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsTextClockThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      textClockKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        const textClockJSON = getInspectorByKey(key);
        const attrsTextClock = (JSON.parse(textClockJSON)?.$attrs as TextClockAttribute);
        const fontColor: string = attrsTextClock?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor : localTheme?.colors?.fontSecondary)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
      })
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ActsTextClockThemeColors_0300
     * @tc.number ActsTextClockThemeColors_0300
     * @tc.desc   Check custom colors values of TextClock component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsTextClockThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextClockThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      textClockKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        const textClockJSON = getInspectorByKey(key);
        const attrsTextClock = (JSON.parse(textClockJSON)?.$attrs as TextClockAttribute);
        const fontColor: string = attrsTextClock?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor : localTheme?.colors?.fontSecondary)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
      })
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ActsTextClockThemeColors_0400
     * @tc.number ActsTextClockThemeColors_0400
     * @tc.desc   Check system colors values of TextClock component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsTextClockThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextClockThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      textClockKeys.forEach((key) => {
        const textClockJSON = getInspectorByKey(key);
        const attrsTextClock = (JSON.parse(textClockJSON)?.$attrs as TextClockAttribute);
        const fontColor: string = attrsTextClock?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor : colorValues?.get(`fontSecondary`))?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
      })
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}