/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct TextPickerDialogOptions111 {
  private select: number | number[] = 2
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button('TextPickerDialog')
        .margin(20)
        .onClick(() => {
          TextPickerDialog.show({
            range: this.fruits,
            selected: this.select,
            alignment: DialogAlignment.TopStart,
            offset: { dx: 10, dy: 100 },
            maskRect: { x: 0, y: 90, width: 1000, height: 250  },
            onAccept: (value: TextPickerResult)=> {
              this.select = value.index
              console.info("TextPickerDialog: onAccept()" + JSON.stringify(value))
            },
            onCancel:()=> {
              console.info("TextPickerDialog: onCancel()")
            },
            onChange: (value: TextPickerResult)=> {
              console.info("TextPickerDialog: onChange()" + JSON.stringify(value))
            }
          })
        }).key('TextPickerDialog')
    }.width('100%')
  }
}