/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct TextPickerExample {
  @State sensitivity: CrownSensitivity = CrownSensitivity.HIGH
  private select: number = 1
  private apfruits: string[] = ['a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'a10', 'a11']
  private orfruits: string[] = ['o1', 'o2', 'o3', 'o4']
  private pefruits: string[] = ['p1', 'p2', 'p3', 'p4']
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]

  build() {
    Column() {
      TextPicker({ range: this.multi })
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('TextPicker 多列:onChange ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index))
        })
        .key('textpicker01')
        .digitalCrownSensitivity(CrownSensitivity.HIGH)
        .margin(50)
        .focusable(true)
        .focusOnTouch(true)
        .defaultFocus(true)
        .disappearTextStyle({ color: Color.Green, font: { size: '16fp', weight: FontWeight.Bold } })
        .textStyle({ color: Color.Red, font: { size: '18fp', weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Orange, font: { size: '26fp', weight: FontWeight.Regular } })

      TextPicker({ range: this.multi })
        .key('textpicker02')
        .digitalCrownSensitivity(CrownSensitivity.LOW)

      TextPicker({ range: this.multi })
        .key('textpicker03')
        .digitalCrownSensitivity(CrownSensitivity.MEDIUM)

      TextPicker({ range: this.multi })
        .key('textpicker04')

      TextPicker({ range: this.multi })
        .key('textpicker05')
        .digitalCrownSensitivity(-1)

      TextPicker({ range: this.multi })
        .key('textpicker06')
        .digitalCrownSensitivity(null)

      TextPicker({ range: this.multi })
        .key('textpicker07')
        .digitalCrownSensitivity(undefined)
    }
  }
}