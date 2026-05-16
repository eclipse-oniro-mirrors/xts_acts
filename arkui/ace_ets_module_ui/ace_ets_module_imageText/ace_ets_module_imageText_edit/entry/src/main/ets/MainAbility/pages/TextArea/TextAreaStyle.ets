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

/**
 * TextArea Style Test Page
 * 测试TextArea组件的style属性
 */
@Entry
@Component
struct TextAreaStyle {
  build() {
    Column({ space: 10 }) {
      Text('TextArea Style Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('5%')

      // 测试1: style设置为null，应恢复为默认值TextContentStyle.DEFAULT
      TextArea({ placeholder: 'TextArea style null test' })
        .id('textArea_style_null')
        .key('key_textArea_style_null')
        .style(null)
        .height('5%')

      // 测试2: style设置为undefined，应恢复为默认值TextContentStyle.DEFAULT
      TextArea({ placeholder: 'TextArea style undefined test' })
        .id('textArea_style_undefined')
        .key('key_textArea_style_undefined')
        .style(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
