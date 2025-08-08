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
import { afterAll, beforeAll, beforeEach, describe, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import { SwiperKeys, swiperThemeProperty } from '../../MainAbility/pages/components/SwiperPage'
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme'
import { frameTime, sleep } from '../Utils'
import { Theme, CustomTheme } from '@ohos.arkui.theme'
import { colorValuesKey } from '../../MainAbility/pages/index/index'

export default function swiperThemeTest() {
  const SUITE: string = `SwiperThemeTest`
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        let options: router.RouterOptions = {
          url: `MainAbility/pages/components/SwiperPage`,
        };
        let pages: router.RouterState = router.getState();
        if (pages?.name !== `SwiperPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(swiperThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    beforeEach(() => {
      if (!changeTheme) return
      if ((AppStorage.get(swiperThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(swiperThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(swiperThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(swiperThemeProperty);
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
      * @tc.number    : ActsSwiperThemeColors_0100 
      * @tc.name      : ActsSwiperThemeColors_0100
      * @tc.desc      : Check system colors values of Swiper component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsSwiperThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsSwiperThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      {
        const json = getInspectorByKey(SwiperKeys.dotIndicatorSystem);
        const indicatorJson: string = JSON.parse(json)?.$attrs?.indicator?.toString();
        const indicatorColor: string = JSON.parse(indicatorJson)?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const indicatorSelectedColor: string = JSON.parse(indicatorJson)?.selectedColor?.toString().toUpperCase()
          ?? EMPTY_ATTR;
        const arrowColor: string = JSON.parse(json)?.$attrs?.arrowColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const arrowBackgroundColor: string = JSON.parse(json)?.$attrs?.arrowBackgroundColor?.toString().toUpperCase()
          ?? EMPTY_ATTR;

        const checkIndicatorColor: string = colorValues?.get(`compBackgroundSecondary`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        const checkIndicatorSelectedColor: string = colorValues?.get(`compBackgroundEmphasize`)?.
          toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowColor: string = colorValues?.get(`iconPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowBackgroundColor: string = colorValues?.get(`compBackgroundSecondary`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(indicatorColor).assertEqual(checkIndicatorColor);
        expect(indicatorSelectedColor).assertEqual(checkIndicatorSelectedColor);
        expect(arrowColor).assertEqual(checkArrowColor);
        expect(arrowBackgroundColor).assertEqual(checkArrowBackgroundColor);
      }

      {
        const json = getInspectorByKey(SwiperKeys.digitIndicatorSystem);
        const indicatorJson: string = JSON.parse(json)?.$attrs?.indicator;
        const fontColor: string = JSON.parse(indicatorJson)?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const selectedFontColor: string = JSON.parse(indicatorJson)?.selectedFontColor?.toString().toUpperCase() ?? EMPTY_ATTR;

        const checkFontColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkSelectedFontColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(fontColor).assertEqual(checkFontColor);
        expect(selectedFontColor).assertEqual(checkSelectedFontColor);
      }

      console.info(`${SUITE} ${CASE} END`)
    });

    /**
      * @tc.number    : ActsSwiperThemeColors_0200 
      * @tc.name      : ActsSwiperThemeColors_0200
      * @tc.desc      : Check custom colors values of Swiper component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsSwiperThemeColors_0200`, Level.LEVEL2, () => {
      let CASE: string = `ActsSwiperThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      {
        const json = getInspectorByKey(SwiperKeys.dotIndicatorWithTheme);
        const indicatorJson: string = JSON.parse(json)?.$attrs?.indicator?.toString();
        const indicatorColor: string = JSON.parse(indicatorJson)?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const indicatorSelectedColor: string = JSON.parse(indicatorJson)?.selectedColor?.toString().toUpperCase()
          ?? EMPTY_ATTR;
        const arrowColor: string = JSON.parse(json)?.$attrs?.arrowColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const arrowBackgroundColor: string = JSON.parse(json)?.$attrs?.arrowBackgroundColor?.toString().toUpperCase()
          ?? EMPTY_ATTR;

        const checkIndicatorColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        const checkIndicatorSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.
          toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowColor: string = localTheme?.colors?.iconPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowBackgroundColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(indicatorColor).assertEqual(checkIndicatorColor);
        expect(indicatorSelectedColor).assertEqual(checkIndicatorSelectedColor);
        expect(arrowColor).assertEqual(checkArrowColor);
        expect(arrowBackgroundColor).assertEqual(checkArrowBackgroundColor);
      }

      {
        const json = getInspectorByKey(SwiperKeys.digitIndicatorWithTheme);
        const indicatorJson: string = JSON.parse(json)?.$attrs?.indicator?.toString();
        const fontColor: string = JSON.parse(indicatorJson)?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const selectedFontColor: string = JSON.parse(indicatorJson)?.selectedFontColor?.toString().toUpperCase()
          ?? EMPTY_ATTR;

        const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkSelectedFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(fontColor).assertEqual(checkFontColor);
        expect(selectedFontColor).assertEqual(checkSelectedFontColor);
      }

      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
      * @tc.number    : ActsSwiperThemeColors_0300 
      * @tc.name      : ActsSwiperThemeColors_0300
      * @tc.desc      : Check custom colors values of Swiper component
      *                 after changing the theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsSwiperThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsSwiperThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      {
        const json = getInspectorByKey(SwiperKeys.dotIndicatorWithTheme)
        const indicatorJson: string = JSON.parse(json)?.$attrs?.indicator?.toString()
        const indicatorColor: string = JSON.parse(indicatorJson)?.color?.toString().toUpperCase() ?? EMPTY_ATTR;
        const indicatorSelectedColor: string = JSON.parse(indicatorJson)?.selectedColor?.toString().toUpperCase()
          ?? EMPTY_ATTR;
        const arrowColor: string = JSON.parse(json)?.$attrs?.arrowColor?.toString().toUpperCase() ?? EMPTY_ATTR;
        const arrowBackgroundColor: string = JSON.parse(json)?.$attrs?.arrowBackgroundColor?.toString().toUpperCase()
          ?? EMPTY_ATTR;

        const checkIndicatorColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        const checkIndicatorSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.
          toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowColor: string = localTheme?.colors?.iconPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowBackgroundColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(indicatorColor).assertEqual(checkIndicatorColor);
        expect(indicatorSelectedColor).assertEqual(checkIndicatorSelectedColor);
        expect(arrowColor, checkArrowColor);
        expect(arrowBackgroundColor, checkArrowBackgroundColor);
      }

      {
        const json = getInspectorByKey(SwiperKeys.digitIndicatorWithTheme);
        const indicatorJson: string = JSON.parse(json)?.$attrs?.indicator?.toString();
        const fontColor: string = JSON.parse(indicatorJson)?.fontColor?.toString();
        const selectedFontColor: string = JSON.parse(indicatorJson)?.selectedFontColor?.toString();

        const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkSelectedFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(fontColor, checkFontColor);
        expect(selectedFontColor, checkSelectedFontColor);
      }

      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}