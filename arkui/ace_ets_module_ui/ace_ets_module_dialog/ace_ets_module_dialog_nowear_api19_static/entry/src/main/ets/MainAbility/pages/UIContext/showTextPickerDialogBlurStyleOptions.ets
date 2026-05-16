'use static';
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, ColumnOptions, SizeOptions, $r, BackgroundBlurStyleOptions, BlurStyleActivePolicy,
  AdaptiveColor,ThemeColorMode, Color, TextPickerResult,TextPickerDialogOptions} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ShowTextPickerDialog1 {
  private select: undefined|int|Array<int> = 0
  private fruits: Array<string> = new Array<string>('apple1', 'orange2', 'peach3', 'grape4', 'banana5')
  @State v: string = '';
  build() {
    Column({ space: 10 } as ColumnOptions){
      Button('ShowTextPickerDialog_Options001')
        .id('ShowTextPickerDialog_Options001')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            value: this.v,
            defaultPickerItemHeight: 40,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index
              console.log(this.select + '')
              // 点击确定后，被选到的文本数据展示到页面
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            backgroundBlurStyleOptions: {
              policy:BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
              adaptiveColor:AdaptiveColor.AVERAGE,
              scale:0,
              colorMode:ThemeColorMode.LIGHT,
              inactiveColor:Color.Pink,
              blurOptions:{
                grayscale:[20,100]
              }
            } as BackgroundBlurStyleOptions
          } as TextPickerDialogOptions)
        })
      Button('ShowTextPickerDialog_Options002')
        .id('ShowTextPickerDialog_Options002')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            value: this.v,
            defaultPickerItemHeight: 40,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index
              console.log(this.select + '')
              // 点击确定后，被选到的文本数据展示到页面
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            backgroundBlurStyleOptions: {
              policy:undefined,
              adaptiveColor:undefined,
              scale:undefined,
              colorMode:undefined,
              inactiveColor:undefined,
              blurOptions:undefined,
            } as BackgroundBlurStyleOptions
          } as TextPickerDialogOptions)
        })
      Button('ShowTextPickerDialog_Options003')
        .id('ShowTextPickerDialog_Options003')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            value: this.v,
            defaultPickerItemHeight: 40,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index
              console.log(this.select + '')
              // 点击确定后，被选到的文本数据展示到页面
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            // backgroundBlurStyleOptions: {
            //   policy:null,
            //   adaptiveColor:null,
            //   scale:null,
            //   colorMode:null,
            //   inactiveColor:null,
            //   blurOptions:null,
            // } as BackgroundBlurStyleOptions
          } as TextPickerDialogOptions)
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}