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
import { TextClockKeys, textClockThemeProperty } from '../../MainAbility/pages/components/TextClockPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

export default function textClockThemeTest() {
  const SUITE: string = `textClockThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
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
      if ((AppStorage.get(textClockThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(textClockThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(textClockThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(textClockThemeProperty);
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
      * @tc.number    : ActsTextClockThemeColors_0100 
      * @tc.name      : ActsTextClockThemeColors_0100
      * @tc.desc      : Check system colors values of TextClock component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsTextClockThemeColors_0100`, 0, () => {
      const CASE: string = `ActsTextClockThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const textClockJSON = getInspectorByKey(TextClockKeys.textClockSystem);
      const attrsTextClock = (JSON.parse(textClockJSON)?.$attrs as TextClockAttribute);
      const fontColor: string = attrsTextClock?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = colorValues?.get(`fontSecondary`)?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
      * @tc.number    : ActsTextClockThemeColors_0200 
      * @tc.name      : ActsTextClockThemeColors_0200
      * @tc.desc      : Check custom colors values of TextClock component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsTextClockThemeColors_0200`, 0, () => {
      const CASE: string = `ActsTextClockThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const textClockJSON = getInspectorByKey(TextClockKeys.textClockWithTheme);
      const attrsTextClock = (JSON.parse(textClockJSON)?.$attrs as TextClockAttribute);
      const fontColor: string = attrsTextClock?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
      * @tc.number    : ActsTextClockThemeColors_0300 
      * @tc.name      : ActsTextClockThemeColors_0300
      * @tc.desc      : Check custom colors values of TextClock component
      *                 after changing the theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsTextClockThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsTextClockThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      const textClockJSON = getInspectorByKey(TextClockKeys.textClockWithTheme);
      const attrsTextClock = (JSON.parse(textClockJSON)?.$attrs as TextClockAttribute);
      const fontColor: string = attrsTextClock?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontSecondary?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}