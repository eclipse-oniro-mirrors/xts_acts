/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

@Entry
@Component
struct TextInputPropertiesNullUndefined03Test {
  build() {
    Column() {
      Scroll(){
        Column(){
          // ========== showPasswordIcon tests ==========
          Text('showPasswordIcon Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'showPasswordIcon default', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPasswordIcon_default')

            // True
            TextInput({ placeholder: 'showPasswordIcon true', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPasswordIcon_true')
              .showPasswordIcon(true)

            // False
            TextInput({ placeholder: 'showPasswordIcon false', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPasswordIcon_false')
              .showPasswordIcon(false)

            // Null
            TextInput({ placeholder: 'showPasswordIcon null', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPasswordIcon_null')
              .showPasswordIcon(null)

            // Undefined
            TextInput({ placeholder: 'showPasswordIcon undefined', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPasswordIcon_undefined')
              .showPasswordIcon(undefined)
          }
          .width('100%')

          // ========== showUnderline tests ==========
          Text('showUnderline Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'showUnderline default', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_showUnderline_default')

            // True
            TextInput({ placeholder: 'showUnderline true', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_showUnderline_true')
              .showUnderline(true)

            // False
            TextInput({ placeholder: 'showUnderline false', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_showUnderline_false')
              .showUnderline(false)

            // Null
            TextInput({ placeholder: 'showUnderline null', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_showUnderline_null')
              .showUnderline(null)

            // Undefined
            TextInput({ placeholder: 'showUnderline undefined', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_showUnderline_undefined')
              .showUnderline(undefined)
          }
          .width('100%')

          // ========== enableAutoFill tests ==========
          Text('enableAutoFill Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'enableAutoFill default', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableAutoFill_default')

            // True
            TextInput({ placeholder: 'enableAutoFill true', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableAutoFill_true')
              .enableAutoFill(true)

            // False
            TextInput({ placeholder: 'enableAutoFill false', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableAutoFill_false')
              .enableAutoFill(false)

            // Null
            TextInput({ placeholder: 'enableAutoFill null', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableAutoFill_null')
              .enableAutoFill(null)

            // Undefined
            TextInput({ placeholder: 'enableAutoFill undefined', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableAutoFill_undefined')
              .enableAutoFill(undefined)
          }
          .width('100%')

          // ========== showPassword tests ==========
          Text('showPassword Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'showPassword default', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPassword_default')

            // True
            TextInput({ placeholder: 'showPassword true', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPassword_true')
              .showPassword(true)

            // False
            TextInput({ placeholder: 'showPassword false', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPassword_false')
              .showPassword(false)

            // Null
            TextInput({ placeholder: 'showPassword null', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPassword_null')
              .showPassword(null)

            // Undefined
            TextInput({ placeholder: 'showPassword undefined', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_showPassword_undefined')
              .showPassword(undefined)
          }
          .width('100%')

          // ========== enablePreviewText tests ==========
          Text('enablePreviewText Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'enablePreviewText default', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enablePreviewText_default')

            // True
            TextInput({ placeholder: 'enablePreviewText true', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enablePreviewText_true')
              .enablePreviewText(true)

            // False
            TextInput({ placeholder: 'enablePreviewText false', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enablePreviewText_false')
              .enablePreviewText(false)

            // Null
            TextInput({ placeholder: 'enablePreviewText null', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enablePreviewText_null')
              .enablePreviewText(null)

            // Undefined
            TextInput({ placeholder: 'enablePreviewText undefined', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enablePreviewText_undefined')
              .enablePreviewText(undefined)
          }
          .width('100%')

          // ========== enableHapticFeedback tests ==========
          Text('enableHapticFeedback Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'enableHapticFeedback default', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableHapticFeedback_default')

            // True
            TextInput({ placeholder: 'enableHapticFeedback true', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableHapticFeedback_true')
              .enableHapticFeedback(true)

            // False
            TextInput({ placeholder: 'enableHapticFeedback false', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableHapticFeedback_false')
              .enableHapticFeedback(false)

            // Null
            TextInput({ placeholder: 'enableHapticFeedback null', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableHapticFeedback_null')
              .enableHapticFeedback(null)

            // Undefined
            TextInput({ placeholder: 'enableHapticFeedback undefined', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_enableHapticFeedback_undefined')
              .enableHapticFeedback(undefined)
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
