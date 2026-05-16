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
struct TextAreaMethodsNull {
  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Text('Custom Keyboard')
        .fontSize(20)
    }
  }

  build() {
    Column({ space: 10 }) {
      // onTextSelectionChange null test
      TextArea({ placeholder: 'onTextSelectionChange null test' })
        .id('textArea_onTextSelectionChange_null')
        .onTextSelectionChange(null)
        .height('5%')

      // onTextSelectionChange undefined test
      TextArea({ placeholder: 'onTextSelectionChange undefined test' })
        .id('textArea_onTextSelectionChange_undefined')
        .onTextSelectionChange(undefined)
        .height('5%')

      // showCounter null test
      TextArea({ placeholder: 'showCounter null test' })
        .id('textArea_showCounter_null')
        .maxLength(10)
        .showCounter(null, null)
        .height('5%')

      // showCounter undefined test
      TextArea({ placeholder: 'showCounter undefined test' })
        .id('textArea_showCounter_undefined')
        .maxLength(10)
        .showCounter(undefined, undefined)
        .height('5%')

      // customKeyboard null test
      TextArea({ placeholder: 'customKeyboard null test' })
        .id('textArea_customKeyboard_null')
        .customKeyboard(null, null)
        .height('5%')

      // customKeyboard undefined test
      TextArea({ placeholder: 'customKeyboard undefined test' })
        .id('textArea_customKeyboard_undefined')
        .customKeyboard(undefined, undefined)
        .height('5%')

      // onWillChange null test
      TextArea({ placeholder: 'onWillChange null test' })
        .id('textArea_onWillChange_null')
        .onWillChange(null)
        .height('5%')

      // onWillChange undefined test
      TextArea({ placeholder: 'onWillChange undefined test' })
        .id('textArea_onWillChange_undefined')
        .onWillChange(undefined)
        .height('5%')

      // onWillAttachIME null test
      TextArea({ placeholder: 'onWillAttachIME null test' })
        .id('textArea_onWillAttachIME_null')
        .onWillAttachIME(null)
        .height('5%')

      // onWillAttachIME undefined test
      TextArea({ placeholder: 'onWillAttachIME undefined test' })
        .id('textArea_onWillAttachIME_undefined')
        .onWillAttachIME(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
