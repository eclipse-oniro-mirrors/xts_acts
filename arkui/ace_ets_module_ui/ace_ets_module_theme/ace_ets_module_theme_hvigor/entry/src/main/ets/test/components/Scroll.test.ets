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
import { ScrollKeys, ScrollTextKeys, scrollThemeProperty, scrollThemeSetProperty } from '../../MainAbility/pages/components/ScrollPage';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

const EMPTY_CHECK: string = 'emptyCheck';
const EMPTY_ATTR: string = 'emptyAttr';

export default function scrollThemeTest() {
  const SUITE: string = `ScrollThemeTest`

  let localTheme: CustomTheme | undefined
  let changeTheme: boolean = false
  let themeSet = true

  const scrollTextKeys: string[] = [
    ScrollTextKeys.verticalScrollTextSystem,
    ScrollTextKeys.verticalScrollTextWithTheme,
    ScrollTextKeys.verticalScrollBarTextSystem,
    ScrollTextKeys.verticalScrollBarTextWithTheme,
    ScrollTextKeys.horizontalScrollTextSystem,
    ScrollTextKeys.horizontalScrollTextWithTheme,
    ScrollTextKeys.horizontalScrollBarTextSystem,
    ScrollTextKeys.horizontalScrollBarTextWithTheme
  ]

  const scrollKeys: string[] = [
    ScrollKeys.verticalScrollSystem,
    ScrollKeys.verticalScrollWithTheme,
    ScrollKeys.verticalScrollSystemCustomAttrs,
    ScrollKeys.verticalScrollWithThemeCustomAttrs,
    ScrollKeys.horizontalScrollSystem,
    ScrollKeys.horizontalScrollWithTheme,
    ScrollKeys.horizontalScrollSystemCustomAttrs,
    ScrollKeys.horizontalScrollWithThemeCustomAttrs
  ]

  let colorValues: Map<string, string> | undefined = new Map<string, string>()

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/ScrollPage`,
        }
        const pages: router.RouterState = router.getState()
        if (pages?.name !== `ScrollPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(scrollThemeProperty)
            console.info(`${SUITE} router.pushUrl success`)
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err))
      }
    })

    beforeEach(() => {
      AppStorage.setOrCreate(scrollThemeSetProperty, themeSet)
      if (changeTheme) {
        if ((AppStorage.get(scrollThemeProperty) as Theme)?.colors?.fontPrimary
          == redCustomTheme?.colors?.fontPrimary) {
          AppStorage.setOrCreate(scrollThemeProperty, greenCustomTheme)
        } else {
          AppStorage.setOrCreate(scrollThemeProperty, redCustomTheme)
        }
        changeTheme = false
      }
      localTheme = AppStorage.get<boolean>(scrollThemeSetProperty) ? AppStorage.get<Theme>(scrollThemeProperty) : undefined
    })

    afterAll(() => {
      try {
        router.back()
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err))
      }
    })
    /**
      * @tc.number    : ActsScrollThemeColors_0100
      * @tc.name      : ActsScrollThemeColors_0100
      * @tc.desc      : Сheck system colors values of the Scroll
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsScrollThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsScrollThemeColors_0100`
      console.info(`${SUITE} ${CASE} START`)
      scrollKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return
        checkScrollWithTheme(key, undefined, key.search(`CustomAttrs`) > 0, colorValues)
      })
      scrollTextKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return
        checkTextWithTheme(key, undefined, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsScrollThemeColors_0200
      * @tc.name      : ActsScrollThemeColors_0200
      * @tc.desc      : Сheck custom colors values of the Scroll
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsScrollThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsScrollThemeColors_0200`
      console.info(`${SUITE} ${CASE} START`)
      scrollKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkScrollWithTheme(key, localTheme, key.search(`CustomAttrs`) > 0, colorValues)
      })
      scrollTextKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkTextWithTheme(key, localTheme, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsScrollThemeColors_0300
      * @tc.name      : ActsScrollThemeColors_0300
      * @tc.desc      : Сheck custom colors values of the Scroll
                        after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsScrollThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsScrollThemeColors_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      scrollKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkScrollWithTheme(key, localTheme, key.search(`CustomAttrs`) > 0, colorValues)
      })
      scrollTextKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkTextWithTheme(key, localTheme, colorValues)
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsScrollThemeColors_0400
      * @tc.name      : ActsScrollThemeColors_0400
      * @tc.desc      : Сheck system colors values of the Scroll
                        after reset theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsScrollThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsScrollThemeColors_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      scrollKeys.forEach((key) => {
        checkScrollWithTheme(key, undefined, key.search(`CustomAttrs`) > 0, colorValues)
      })
      scrollTextKeys.forEach((key) => {
        checkTextWithTheme(key, undefined, colorValues)
      })
      themeSet = true
      console.info(`${SUITE} ${CASE} END`)
    })
  })
}

function checkScrollWithTheme(key: string, localTheme: CustomTheme | undefined, customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const ScrollJSON = getInspectorByKey(key)
  const attrsScroll: ScrollAttribute = JSON.parse(ScrollJSON)?.$attrs
  const scrollBarColor = attrsScroll.scrollBarColor?.toString().toUpperCase() ?? EMPTY_ATTR
  const checkScrollBarColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compFocusedTertiary
    ?? colorValues?.get(`compFocusedTertiary`))?.toString().toUpperCase()
    ?? EMPTY_CHECK
  expect(scrollBarColor).assertEqual(checkScrollBarColor)
}

function checkTextWithTheme(key: string, localTheme: CustomTheme | undefined, colorValues: Map<string, string> | undefined) {
  const textJSON = getInspectorByKey(key)
  const attrsText = (JSON.parse(textJSON)?.$attrs as TextAttribute)
  const fontColor: ResourceColor = attrsText?.fontColor?.toString().toUpperCase() ?? EMPTY_ATTR;
  const checkFontColor = (localTheme?.colors?.fontPrimary
    ?? colorValues?.get(`fontPrimary`))?.toString().toUpperCase()
    ?? EMPTY_CHECK
  expect(fontColor).assertEqual(checkFontColor)
}