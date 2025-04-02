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
@Entry
@Component
struct TextPickerDialogExample {
  private select: number | number[] = 0
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  @State v:string = '';
  @State AppearText: string = ''

  build() {
    Row() {
      Column() {
        Text(this.AppearText)
          .fontSize(20)
          .margin(10)
          .id('AppearText')
        Button("TextPickerDialog:" + this.v)
          .id('TextPickerDialog')
          .margin(20)
          .onClick(() => {
            TextPickerDialog.show({
              alignment: DialogAlignment.Bottom,
              range: this.fruits,
              selected: this.select,
              disappearTextStyle: {color: Color.Red, font: {size: 15, weight: FontWeight.Lighter}},
              textStyle: {color: Color.Black, font: {size: 20, weight: FontWeight.Normal}},
              selectedTextStyle: {color: Color.Blue, font: {size: 30, weight: FontWeight.Bolder}},
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info("TextPickerDialog:onAccept()" + JSON.stringify(value))
              },
              onCancel: () => {
                console.info("TextPickerDialog:onCancel()")
              },
              onChange: (value: TextPickerResult) => {
                console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
              },
              onDidAppear: () => {
                this.AppearText = this.AppearText + "onDidAppear_"
              },
              onDidDisappear: () => {
                this.AppearText = this.AppearText + "onDidDisappear"
              },
              onWillAppear: () => {
                this.AppearText = this.AppearText + "onWillAppear_"
              },
              onWillDisappear: () => {
                this.AppearText = this.AppearText + "onWillDisappear_"
              }
            })
          })
      }.width('100%')
    }.height('100%').id('row')
  }
}