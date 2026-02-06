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
class SelectedValue{
  private select: number = 2
  set(val:number){
    this.select = val
  }
}
class SelectedArray{
  private select: number[] = []
  set(val:number[]){
    this.select = val
  }
}
@Entry
@Component
struct TextPickerDialogSelectedAreaExample {
  @State selectTime: Date = new Date('2023-12-25T08:30:00');
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  private select: number  = 0;
  @State selectedFlag: string = ''
  build() {
    Column() {
      Button('showTextPickerDialog ' + this.selectedFlag)
        .id('showTextPickerDialog')
        .margin(30)
        .onClick(() => {
          this.selectedFlag = ''
          this.getUIContext().showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              let selectedVal = new SelectedValue()
              let selectedArr = new SelectedArray()
              if(value.index){
                value.index instanceof Array?selectedArr.set(value.index) : selectedVal.set(value.index)
              }
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            onCancel: () => {
              console.info('TextPickerDialog:onCancel()')
            },
            onChange: (value: TextPickerResult) => {
              console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
            },
            onEnterSelectedArea: (value: TextPickerResult) => {
              this.selectedFlag = 'enter'
              console.info('TextPickerDialog:onEnterSelectedArea()' + JSON.stringify(value))
            }
          })
        })
      Text(this.selectedFlag).id('textFlag').height('5%').width('90%').margin({ top: 10, bottom: 10 }).textAlign(TextAlign.Center)
    }.width('100%').height('100%').margin({ top: 5 }).id('colComponent')
  }
}