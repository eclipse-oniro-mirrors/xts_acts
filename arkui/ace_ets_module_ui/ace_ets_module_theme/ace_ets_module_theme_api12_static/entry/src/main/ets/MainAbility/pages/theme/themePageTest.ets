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

import { CustomTheme, CustomColors } from '@ohos.arkui.theme';
import {
  Entry, Component,
  Column, ColumnOptions, 
  Flex, FlexDirection, ItemAlign, FlexAlign, ButtonStyleMode, WithTheme,
  Text, Button, FontWeight, ClickEvent, Margin, Color,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class GreenColors implements CustomColors {
  fontPrimary?:string = '#ff049404';
  fontEmphasize?:string = '#FF00541F';
  fontOnPrimary?:string = '#FFFFFFFF';
  compBackgroundTertiary?:string = '#1111FF11';
  backgroundEmphasize?:string = '#FF00541F';
  compEmphasizeSecondary?:string = '#3322FF22';
}

class RedColors implements CustomColors {
  fontPrimary?:string = '#fff32b3c';
  fontEmphasize?:string = '#FFD53032';
  fontOnPrimary?:string = '#FFFFFFFF';
  compBackgroundTertiary?:string = '#44FF2222';
  backgroundEmphasize?:string = '#FFD00000';
  compEmphasizeSecondary?:string = '#33FF1111';
}

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors

  constructor(colors: CustomColors) {
    this.colors = colors
  }
}

@Entry
@Component
struct themePage {
  static readonly themeCount:int = 3;
  themeNames: Array<string> = new Array<string>('System', 'Custom (green)', 'Custom (red)');
  themeArray: Array<CustomTheme | undefined> = new Array<CustomTheme|undefined>(
    undefined, // System
    new PageCustomTheme(new GreenColors()),
    new PageCustomTheme(new RedColors())
  )
  @State themeIndex: number = 0;

  build() {
    Column(undefined) {
      Column({ space: '8vp' } as ColumnOptions) {
        Text(`未使用WithTheme`)
        // 点击按钮切换局部换肤
        Button(`切换theme配色：${this.themeNames[this.themeIndex as Int]}`)
          .onClick((e:ClickEvent) => {
            this.themeIndex = (this.themeIndex + 1) % themePage.themeCount;
            console.log('++++++++++++++++this.themeIndex',this.themeIndex)
          }).key('themeClick')

        // 系统默认按钮配色
        Button('Button.style(NORMAL) with System Theme')
          .buttonStyle(ButtonStyleMode.NORMAL)
        Button('Button.style(EMP..ED) with System Theme')
          .buttonStyle(ButtonStyleMode.EMPHASIZED)
        Button('Button.style(TEXTUAL) with System Theme')
          .buttonStyle(ButtonStyleMode.TEXTUAL)
      }
      .margin({
        top: '50vp'
      } as Margin)

      WithTheme({ theme: this.themeArray[this.themeIndex as Int] }) {
        // WithTheme作用域
        Column({ space: '8vp' } as ColumnOptions) {
          Text(`使用WithTheme`).key('themeText')
          Button('Button.style(NORMAL) with Custom Theme')
            .buttonStyle(ButtonStyleMode.NORMAL)
          Button('Button.style(EMP..ED) with Custom Theme')
            .buttonStyle(ButtonStyleMode.EMPHASIZED)
          Button('Button.style(TEXTUAL) with Custom Theme')
            .buttonStyle(ButtonStyleMode.TEXTUAL).key("bt") //获取的颜色不对#FF00541F，实际#FF007DFF
        }
        .width('100%')
      }
    }
  }
}