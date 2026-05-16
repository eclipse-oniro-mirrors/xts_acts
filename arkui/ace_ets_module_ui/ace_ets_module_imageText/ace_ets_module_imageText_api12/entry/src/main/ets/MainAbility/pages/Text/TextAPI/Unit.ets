/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { LengthMetrics, LengthUnit } from '@ohos.arkui.node'

@Entry
@Component
struct LineSpacingExample {
  @State lengthUnit: LengthMetrics = { value: 20, unit: LengthUnit.PX }
  @State unit: string = ""
  @State value: string = ""
  build() {
    Row() {
      Column({ space: 12 }) {
        Text(this.unit)
          .id("unit")
        Text(this.value)
          .id("value")
        Text( 'This is a context with lineSpacing set to 20_px.\nThis is a context with lineSpacing set to 20_px.')
          .fontSize(12)
          .border({ width: 1 })
          .lineSpacing(this.lengthUnit)
        Button("click to show")
          .id("btn")
          .onClick(() => {
            if (this.lengthUnit.unit == LengthUnit.PX) {
              this.unit = "PX"
            }
            if (this.lengthUnit.value == 20) {
              this.value = "20"
            }
          })
      }.width("100%")
    }.height("100%")
  }
}