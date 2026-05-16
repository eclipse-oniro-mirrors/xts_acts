/**
 * Copyright (c)2026 Huawei Device Co., Ltd.
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
struct TextSelectionProperties {
  build() {
    Column({ space: 2 }) {
      Row() {
        Text('Text Selection Properties Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .height('3%')
      }

      // ==================== selection 属性测试 ====================
      Row() {
        Text('selection(null, null)')
          .id('text_selection_null')
          .selection(null, null)
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('selection(undefined, undefined)')
          .id('text_selection_undefined')
          .selection(undefined, undefined)
          .copyOption(CopyOptions.InApp)
          .height('3%')
      }

      // ==================== caretColor 属性测试 ====================
      Row() {
        Text('caretColor with null')
          .id('text_caretcolor_null')
          .caretColor(null)
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('caretColor with undefined')
          .id('text_caretcolor_undefined')
          .caretColor(undefined)
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('caretColor with empty string')
          .id('text_caretcolor_empty')
          .caretColor('')
          .copyOption(CopyOptions.InApp)
          .height('3%')
      }

      // ==================== selectedBackgroundColor 属性测试 ====================
      Row() {
        Text('selectedBackgroundColor with null')
          .id('text_selectedbackgroundcolor_null')
          .selectedBackgroundColor(null)
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('selectedBackgroundColor with undefined')
          .id('text_selectedbackgroundcolor_undefined')
          .selectedBackgroundColor(undefined)
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('selectedBackgroundColor with empty string')
          .id('text_selectedbackgroundcolor_empty')
          .selectedBackgroundColor('')
          .copyOption(CopyOptions.InApp)
          .height('3%')
      }

      // ==================== shaderStyle 属性测试 ====================
      Row() {
        Text('shaderStyle with null')
          .id('text_shaderstyle_null')
          .shaderStyle(null)
          .height('3%')

        Text('shaderStyle with undefined')
          .id('text_shaderstyle_undefined')
          .shaderStyle(undefined)
          .height('3%')
      }

      // ==================== ellipsisMode 属性测试 ====================
      Row() {
        Text('This is a long text for ellipsisMode testing with null parameter that will be truncated')
          .id('text_ellipsismode_null')
          .ellipsisMode(null)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .height('3%')

        Text('This is a long text for ellipsisMode testing with undefined parameter that will be truncated')
          .id('text_ellipsismode_undefined')
          .ellipsisMode(undefined)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .height('3%')
      }

      // ==================== enableDataDetector 属性测试 ====================
      Row() {
        Text('enableDataDetector with null: Phone 13800138000')
          .id('text_enabledatadetector_null')
          .enableDataDetector(null)
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('enableDataDetector with undefined: Phone 13800138000')
          .id('text_enabledatadetector_undefined')
          .enableDataDetector(undefined)
          .copyOption(CopyOptions.InApp)
          .height('3%')
      }

      // ==================== 默认值参考组件 ====================
      Row() {
        Text('Default selection (for comparison)')
          .id('text_selection_default')
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('Default caretColor (for comparison)')
          .id('text_caretcolor_default')
          .copyOption(CopyOptions.InApp)
          .height('3%')
      }

      Row() {
        Text('Default selectedBackgroundColor (for comparison)')
          .id('text_selectedbackgroundcolor_default')
          .copyOption(CopyOptions.InApp)
          .height('3%')

        Text('Default shaderStyle (for comparison)')
          .id('text_shaderstyle_default')
          .height('3%')
      }

      Row() {
        Text('This is a long text for default ellipsisMode comparison that will be truncated')
          .id('text_ellipsismode_default')
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .height('3%')

        Text('Default enableDataDetector (for comparison): Phone 13800138000')
          .id('text_enabledatadetector_default')
          .copyOption(CopyOptions.InApp)
          .height('3%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
