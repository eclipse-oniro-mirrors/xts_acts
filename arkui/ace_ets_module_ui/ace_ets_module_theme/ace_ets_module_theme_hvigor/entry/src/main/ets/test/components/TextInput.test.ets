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
import { afterAll, beforeAll, beforeEach, afterEach, describe, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { textInputThemeProperty, textInputThemeSetProperty, textInputBackgroundColor, 
  textInputPlaceholderColor } from '../../MainAbility/pages/components/TextInputPage'
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme'
import { frameTime, sleep } from '../Utils'

export default function textInputThemeTest() {
  const SUITE: string = `TextInputThemeTest`
  const textInputKeys: string [] = [
    'TextInput_Others_System',
    `TextInput_Password_System`,
    `TextInput_Inline_System`,
    `TextInput_Others_System_CustomAttrs`,
    `TextInput_Password_System_CustomAttrs`,
    `TextInput_Inline_System_CustomAttrs`,
    `TextInput_Others_WithTheme`,
    `TextInput_Password_WithTheme`,
    `TextInput_Inline_WithTheme`,
    `TextInput_Others_WithTheme_CustomAttrs`,
    `TextInput_Password_WithTheme_CustomAttrs`,
    `TextInput_Inline_WithTheme_CustomAttrs`
  ]
  let colorValues: Map<string, string> | undefined = new Map<string, string>();
  let localTheme: CustomTheme | undefined
  let changeTheme: boolean = false
  let themeSet: boolean | undefined = true

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/components/TextInputPage"
        }
        const pages: router.RouterState = router.getState()
        if (pages?.name !== `TextInputPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(textInputThemeProperty)
            themeSet = AppStorage.get<boolean>(textInputThemeSetProperty)
            console.info(`${SUITE} router.pushUrl success`)
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err))
      }
    })

    beforeEach(() => {
      if (changeTheme) {
        if ((AppStorage.get(textInputThemeProperty) as Theme)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(textInputThemeProperty, greenCustomTheme)
        } else {
          AppStorage.setOrCreate(textInputThemeProperty, redCustomTheme)
        }
        changeTheme = false
      }
      if (themeSet) {
        AppStorage.setOrCreate(textInputThemeSetProperty, true)
      } else {
        AppStorage.setOrCreate(textInputThemeSetProperty, false)
      }
      localTheme = AppStorage.get<boolean>(textInputThemeSetProperty) ? 
        AppStorage.get<Theme>(textInputThemeProperty) : undefined
    })

    afterEach(async () => {
      await sleep(frameTime)
      console.info("Prop after each called");
    })

    afterAll(() => {
      try {
        router.back()
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err))
      }
    })
    /**
     * @tc.number    : ActsTextInputThemeColors_0100
     * @tc.name      : ActsTextInputThemeColors_0100
     * @tc.desc      : Check system colors values of the TextInput component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextInputThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsTextInputThemeColors_0100`
      console.info(`${SUITE} ${CASE} START`)
      textInputKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) return
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
     * @tc.number    : ActsTextInputThemeColors_0200
     * @tc.name      : ActsTextInputThemeColors_0200
     * @tc.desc      : Check custom theme colors values of the TextInput component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextInputThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsTextInputThemeColors_0200`
      console.info(`${SUITE} ${CASE} START`)
      textInputKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
     * @tc.number    : ActsTextInputThemeColors_0300
     * @tc.name      : ActsTextInputThemeColors_0300
     * @tc.desc      : Check custom theme colors values of the TextInput component after theme change
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextInputThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextInputThemeColors_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      textInputKeys.forEach((key) => {
        if (key.search(`System`) > 0) return
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
     * @tc.number    : ActsTextInputThemeColors_0400
     * @tc.name      : ActsTextInputThemeColors_0400
     * @tc.desc      : Check system colors values of the TextInput component after theme reset
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsTextInputThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsTextInputThemeColors_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      textInputKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    })
  })
}

function checkWithTheme(localTheme: CustomTheme | undefined, key : string, 
  customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const TextInputJSON = getInspectorByKey(key)
  const attrsTextInput: TextInputAttribute = JSON.parse(TextInputJSON)?.$attrs
  const fontColor: ResourceColor = attrsTextInput?.fontColor?.toString()
  expect(fontColor).assertEqual(localTheme?.colors?.fontPrimary ?? colorValues?.get(`fontPrimary`))
  const placeholderColor: ResourceColor = attrsTextInput?.placeholderColor?.toString()
  expect(placeholderColor).assertEqual(customAttrs ? 
    textInputPlaceholderColor : localTheme?.colors?.fontSecondary ?? colorValues?.get(`fontSecondary`))
  const caretColor: ResourceColor = attrsTextInput?.caretColor?.toString()
  expect(caretColor).assertEqual(localTheme?.colors?.brand ?? colorValues?.get(`brand`))
  const backgroundColor: ResourceColor = attrsTextInput?.backgroundColor?.toString()
  expect(backgroundColor).assertEqual(customAttrs ? textInputBackgroundColor : 
    localTheme?.colors?.compBackgroundTertiary ?? colorValues?.get(`compBackgroundTertiary`))
}