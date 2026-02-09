/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct TextAreaSpecialAttrsTest {
  build() {
    Column() {
      Row(){
        // enablePreviewText - null test
        TextArea({ placeholder: 'enablePreviewText null test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_enablePreviewText_null')
          .enablePreviewText(null)

        // enablePreviewText - undefined test
        TextArea({ placeholder: 'enablePreviewText undefined test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_enablePreviewText_undefined')
          .enablePreviewText(undefined)
      }
      Row() {
        // fontColor - null test
        TextArea({ placeholder: 'default' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontColor_default')

        // fontColor - null test
        TextArea({ placeholder: 'null' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontColor_null')
          .fontColor(null)

        // fontColor - undefined test
        TextArea({ placeholder: 'undefined' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontColor_undefined')
          .fontColor(undefined)

        // fontColor - empty string test
        TextArea({ placeholder: 'empty string' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontColor_emptyString')
          .fontColor('')
      }
      Row() {
        // fontSize - null test
        TextArea({ placeholder: 'fontSize null test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontSize_null')
          .fontSize(null)

        // fontSize - undefined test
        TextArea({ placeholder: 'fontSize undefined test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontSize_undefined')
          .fontSize(undefined)

        // fontSize - empty string test
        TextArea({ placeholder: 'fontSize empty string test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontSize_emptyString')
          .fontSize('')
      }
      Row() {
        // fontWeight - null test
        TextArea({ placeholder: 'fontWeight null test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontWeight_null')
          .fontWeight(null)

        // fontWeight - undefined test
        TextArea({ placeholder: 'fontWeight undefined test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontWeight_undefined')
          .fontWeight(undefined)

        // fontWeight - empty string test
        TextArea({ placeholder: 'fontWeight empty string test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_fontWeight_emptyString')
          .fontWeight('')
      }
      Row() {
        // enableKeyboardOnFocus - default test
        TextArea({ placeholder: 'default' })
          .width('100%')
          .height('3%')
          .key('key_textArea_enableKeyboardOnFocus_default')

        // enableKeyboardOnFocus - null test
        TextArea({ placeholder: 'null' })
          .width('100%')
          .height('3%')
          .key('key_textArea_enableKeyboardOnFocus_null')
          .enableKeyboardOnFocus(null)

        // enableKeyboardOnFocus - undefined test
        TextArea({ placeholder: 'undefined' })
          .width('100%')
          .height('3%')
          .key('key_textArea_enableKeyboardOnFocus_undefined')
          .enableKeyboardOnFocus(undefined)
      }
      Row() {
        // type - null test
        TextArea({ placeholder: 'type null test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_type_null')
          .type(null)

        // type - undefined test
        TextArea({ placeholder: 'type undefined test' })
          .width('100%')
          .height('3%')
          .key('key_textArea_type_undefined')
          .type(undefined)
      }
    }
    .width('100%')
    .height('100%')
  }
}
