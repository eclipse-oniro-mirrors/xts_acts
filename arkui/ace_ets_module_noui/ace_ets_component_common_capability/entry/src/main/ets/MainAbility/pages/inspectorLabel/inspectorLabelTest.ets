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
struct InspectorLabelTest {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        // 测试 inspectorLabel 正常入参
        Text('inspectorLabel valid')
          .width('90%')
          .height('10%')
          .id('text_inspectorLabel_valid')
          .fontSize(16)
          .maxLines(1)
          .inspectorLabel('TEST_LABEL')

        // 测试 inspectorLabel null 参数
        Text('inspectorLabel null')
          .width('90%')
          .height('10%')
          .id('text_inspectorLabel_null')
          .fontSize(16)
          .maxLines(1)
          .inspectorLabel(null)

        // 测试 inspectorLabel undefined 参数
        Text('inspectorLabel undefined')
          .width('90%')
          .height('10%')
          .id('text_inspectorLabel_undefined')
          .fontSize(16)
          .maxLines(1)
          .inspectorLabel(undefined)

        // 测试 inspectorLabel 空字符串参数
        Text('inspectorLabel empty')
          .width('90%')
          .height('10%')
          .id('text_inspectorLabel_empty')
          .fontSize(16)
          .maxLines(1)
          .inspectorLabel('')
      }
      .width('100%')
      .padding({ left: 10, right: 10, top: 10, bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
  }
}