/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LengthMetrics } from '@kit.ArkUI'
@Entry
@Component
struct TextPickerExample {
  @State columnWidths1: (LengthMetrics|undefined|null)[] = [
    LengthMetrics.vp(100)
  ]
  @State columnWidths2: (LengthMetrics|undefined|null)[] = [
    LengthMetrics.vp(20),
    LengthMetrics.vp(40),
    LengthMetrics.vp(60)
  ]
  @State message: string = 'mess'
  private apfruits: string[] = ['apple123456789', 'apple2', 'apple3', 'apple4']
  private orfruits: string[] = ['orange123456789', 'orange2', 'orange3', 'orange4']
  private pefruits: string[] = ['peach123456789', 'peach2', 'peach3', 'peach4']
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]

  build() {
          Column({ space: 10 }) {
            TextPicker({ range: this.apfruits, columnWidths: this.columnWidths1 })
              .id('columnWidths_001')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed, value: ' + value + ', index: ' + index)
              })
            TextPicker({ range: this.multi, columnWidths: this.columnWidths2 })
              .id('columnWidths_002')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed, value: ' + value + ', index: ' + index)
              })
            TextPicker({ range: this.multi, columnWidths: undefined })
              .id('columnWidths_003')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed, value: ' + value + ', index: ' + index)
              })
            TextPicker({ range: this.multi, columnWidths: null })
              .id('columnWidths_004')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed, value: ' + value + ', index: ' + index)
              })
          }
  }
}