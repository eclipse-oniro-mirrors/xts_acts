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
import { TextKeys, textThemeProperty } from '../../MainAbility/pages/components/TextPage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { CustomTheme, Theme } from '@ohos.arkui.theme'

export default function textThemeTest() {
  const SUITE: string = `textThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/TextPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `TextPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(textThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    beforeEach(() => {
      if (!changeTheme) return;
      if ((AppStorage.get(textThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(textThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(textThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(textThemeProperty);
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
      * @tc.number    : ActsTextThemeColors_0100 
      * @tc.name      : ActsTextThemeColors_0100
      * @tc.desc      : Check system colors values of Text component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsTextThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsTextThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const textJSON = getInspectorByKey(TextKeys.textSystem);
      const attrsText = (JSON.parse(textJSON)?.$attrs as TextAttribute);
      const fontColor: string = attrsText?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = colorValues?.get("fontPrimary")?.toString().toUpperCase() ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
      * @tc.number    : ActsTextThemeColors_0200 
      * @tc.name      : ActsTextThemeColors_0200
      * @tc.desc      : Check custom colors values of Text component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsTextThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsTextThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const textJSON = getInspectorByKey(TextKeys.textWithTheme);
      const attrsText = (JSON.parse(textJSON)?.$attrs as TextAttribute);
      const fontColor: string = attrsText?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })

    /**
      * @tc.number    : ActsTextThemeColors_0300 
      * @tc.name      : ActsTextThemeColors_0300
      * @tc.desc      : Check custom colors values of Text component
      *                 after changing the theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */    
    it(`ActsTextThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const textJSON = getInspectorByKey(TextKeys.textWithTheme);
      const attrsText = (JSON.parse(textJSON)?.$attrs as TextAttribute);
      const fontColor: string = attrsText?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
      const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase()
        ?? EMPTY_CHECK;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}
