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
struct TextSpecialAttributesDemo {
  @State draggableValue: boolean | null | undefined = false;
  @State privacySensitiveValue: boolean | null | undefined = false;
  @State halfLeadingValue: boolean | null | undefined = false;
  @State marqueeState: string = '';

  build() {
    Column({ space: 2 }) {
      // === draggable 属性测试 ===
      Text('This is a draggable text sample for testing null and undefined values.')
        .fontSize(14)
        .copyOption(CopyOptions.InApp)
        .draggable(this.draggableValue)
        .key('textDraggableTest')
        .border({ width: 1 })

      Row({ space: 1 }) {
        Button('draggable: null')
          .onClick(() => { this.draggableValue = null; })
        Button('draggable: undefined')
          .onClick(() => { this.draggableValue = undefined; })
      }

      Text('Test null value for draggable')
        .fontSize(14)
        .copyOption(CopyOptions.InApp)
        .draggable(null)
        .key('textDraggableNull')
        .border({ width: 1 })

      Text('Test undefined value for draggable')
        .fontSize(14)
        .copyOption(CopyOptions.InApp)
        .draggable(undefined)
        .key('textDraggableUndefined')
        .border({ width: 1 })

      // === privacySensitive 属性测试 ===
      Text('Sensitive Information: 123456')
        .fontSize(14)
        .privacySensitive(this.privacySensitiveValue)
        .key('textPrivacySensitiveTest')
        .border({ width: 1 })

      Row({ space: 10 }) {
        Button('privacy: null')
          .onClick(() => { this.privacySensitiveValue = null; })
        Button('privacy: undefined')
          .onClick(() => { this.privacySensitiveValue = undefined; })
      }

      Text('Sensitive Data: 999999')
        .fontSize(14)
        .privacySensitive(null)
        .key('textPrivacySensitiveNull')
        .border({ width: 1 })

      Text('Sensitive Data: 888888')
        .fontSize(14)
        .privacySensitive(undefined)
        .key('textPrivacySensitiveUndefined')
        .border({ width: 1 })

      // === halfLeading 属性测试 ===
      Text('Text with lineHeight for halfLeading test.')
        .fontSize(14)
        .lineHeight(50)
        .halfLeading(this.halfLeadingValue)
        .key('textHalfLeadingTest')
        .border({ width: 1 })

      Row({ space: 1 }) {
        Button('halfLeading: null')
          .onClick(() => { this.halfLeadingValue = null; })
        Button('halfLeading: undefined')
          .onClick(() => { this.halfLeadingValue = undefined; })
      }

      Text('Test null value for halfLeading with lineHeight 50.')
        .fontSize(14)
        .lineHeight(50)
        .halfLeading(null)
        .key('textHalfLeadingNull')
        .border({ width: 1 })

      Text('Test undefined value for halfLeading with lineHeight 50.')
        .fontSize(14)
        .lineHeight(50)
        .halfLeading(undefined)
        .key('textHalfLeadingUndefined')
        .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
  }
}
