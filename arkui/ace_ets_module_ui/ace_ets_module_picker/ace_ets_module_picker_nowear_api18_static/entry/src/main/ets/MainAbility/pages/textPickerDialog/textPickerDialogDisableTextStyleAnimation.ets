'use static';
/*
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
import { Entry, Column, ColumnOptions, Component, Row, Button, ClickEvent, BlurStyle, Flex, FlexWrap, Color, TextPickerResult, TextOverflow, TextPickerDialogOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextPickerDialogDisableTextStyleAnimationExample {
  private select: Int | Int[] = 0
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  @State v: string = '';

  build() {
    Row() {
      Column({ space: 5 } as ColumnOptions) {
        Button('true')
          .id('true')
          .onClick((e: ClickEvent) => {
            this.getUIContext().showTextPickerDialog({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              disableTextStyleAnimation: true,
              defaultTextStyle: { minFontSize: 10, maxFontSize: 20, overflow: TextOverflow.Ellipsis },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            } as TextPickerDialogOptions)
          })
        Button('false')
          .id('false')
          .onClick((e: ClickEvent) => {
            this.getUIContext().showTextPickerDialog({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              disableTextStyleAnimation: false,
              defaultTextStyle: { minFontSize: 10, maxFontSize: 20, overflow: TextOverflow.Ellipsis },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            } as TextPickerDialogOptions)
          })
        Button('undefined')
          .id('undefined')
          .onClick((e: ClickEvent) => {
            this.getUIContext().showTextPickerDialog({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              disableTextStyleAnimation: undefined,
              defaultTextStyle: { minFontSize: 10, maxFontSize: 20, overflow: TextOverflow.Ellipsis },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            } as TextPickerDialogOptions)
          })
        Button('null')
          .id('null')
          .onClick((e: ClickEvent) => {
            this.getUIContext().showTextPickerDialog({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              // disableTextStyleAnimation: null,
              defaultTextStyle: { minFontSize: 10, maxFontSize: 20, overflow: TextOverflow.Ellipsis },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            } as TextPickerDialogOptions)
          })
      }.width('100%')
    }.height('100%')
  }
}