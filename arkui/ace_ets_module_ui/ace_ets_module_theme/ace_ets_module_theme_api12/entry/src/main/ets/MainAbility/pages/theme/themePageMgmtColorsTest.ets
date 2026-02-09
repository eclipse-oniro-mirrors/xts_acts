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

import { CustomTheme, CustomColors, CustomDarkColors } from '@ohos.arkui.theme';


class ToggleColors implements CustomColors {
  iconPrimary = '#FFFFFFFF';
  iconOnPrimary = '#FFD53032'
  iconSecondary = "#FF00541F"
  iconTertiary = '#FFD00000'
  iconFourth = '#1111FF11'
  iconEmphasize = '#44FF2222' //高亮图标颜色
  iconSubEmphasize = '#7efca7b1' //高亮辅助图标颜色
  iconOnSecondary = '#FFD00000' //二级图标反转颜色
  iconOnTertiary = '#33FF1111' //三级图标反转颜色，用于彩色背景。
  iconOnFourth = '#ffa9cfa8'
  backgroundPrimary = '#ff5f66a9'
  backgroundSecondary = '#ff6b146a'
  backgroundTertiary = '#ffc396c2'
  backgroundFourth = '#609d9370'
}

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors
  darkColors?: CustomDarkColors

  constructor(colors: CustomColors) {
    this.colors = colors
  }
}

@Entry
@Component
struct themeTogglePage {
  static readonly themeCount = 3;
  themeNames: string[] = ['System', 'Custom (green)'];
  themeArray: (CustomTheme | undefined)[] = [
    undefined, // System
    new PageCustomTheme(new ToggleColors()),
  ]
  @State themeIndex: number = 0;

  build() {
    Column() {
      Column({ space: '8vp' }) {
        Text(`未使用WithTheme`)
        // 点击按钮切换局部换肤
        Button(`切换theme配色：${this.themeNames[this.themeIndex]}`)
          .onClick(() => {
            this.themeIndex = (this.themeIndex + 1) % themeTogglePage.themeCount;
          }).key('themeToggleClick')

        // 系统默认按钮配色
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
      .margin({
        top: '50vp'
      })

      WithTheme({ theme: this.themeArray[this.themeIndex] }) {
        // WithTheme作用域
        Column({ space: '8vp' }) {
          Toggle({ type: ToggleType.Switch, isOn: true }).key('toggleBg')
        }
        .width('100%')
      }
    }
  }
}