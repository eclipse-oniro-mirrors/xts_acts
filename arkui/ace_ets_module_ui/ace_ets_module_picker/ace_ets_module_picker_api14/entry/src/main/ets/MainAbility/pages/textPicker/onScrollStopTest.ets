/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct onScrollStopTest {
  private fruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private select: number | number[] = 0
  @State v: string = ''
  @State canLoop: boolean = true
  @State message: string = ''
  @State message1: string = ''

  build() {
    Column({ space: 20 }) {
      Text(this.message).id('text')
      TextPicker({ range: this.fruits })
        .id('myTextPicker')
        .canLoop(this.canLoop)
        .onScrollStop((value: string | string[], index: number | number[]) => {
          this.message = 'stop'
        })
        .height('50%')
      Divider()
      Text(this.message1).id('text1')
      Button('TextPickerDialog:' + this.v)
        .id('myTextPicker1')
        .margin(20)
        .onClick(() => {
          TextPickerDialog.show({
            range: this.fruits,
            selected: this.select,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TextPickerResult) => {
              this.select = value.index
              console.log(this.select + '')
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            onScrollStop: () => {
              this.message1 = 'stop'
            },
            onDidAppear: () => {
             this.message1 = 'stop'
            },
            onDidDisappear: () => {
              console.info('DatePickerDialog:onDidDisappear()')
            },
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}