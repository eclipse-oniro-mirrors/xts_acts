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
import { CustomTheme, CustomColors, Theme, ThemeControl } from '@ohos.arkui.theme';

class BlueColors implements CustomColors {
  fontPrimary = Color.White;
  backgroundPrimary = Color.Blue;
}

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}
const BlueColorsTheme = new PageCustomTheme(new BlueColors());
// setDefaultTheme应该在应用入口页面调用或者在Ability中调用。
ThemeControl.setDefaultTheme(BlueColorsTheme);

@Entry
@Component
struct onWillApplyThemeTest {
  @State textColor: ResourceColor = $r('sys.color.font_primary');
  @State columBgColor: ResourceColor = $r('sys.color.background_primary');
  @State text: string = '';

  onWillApplyTheme(theme: Theme) {
    this.text = 'onWillApplyTheme'
    this.textColor = theme.colors.fontPrimary;
    this.columBgColor = theme.colors.backgroundPrimary;
    console.info('IndexComponent onWillApplyTheme');
  }

  build() {
    Column() {

      Column() {
        Text(this.text)
          .fontColor($r('sys.color.font_primary'))
          .fontSize(30)
          .key('onWillApplyThemeText')
      }
      .width('100%')
      .height('25%')
      .borderRadius('10vp')
      .backgroundColor($r('sys.color.background_primary'))

      // 组件颜色生效为onWillApplyTheme中配置颜色。
      Column() {
        Text('onWillApplyTheme')
          .fontColor(this.textColor)
          .fontSize(30)
        Text('Hello World')
          .fontColor(this.textColor)
          .fontSize(30)
      }
      .width('100%')
      .height('25%')
      .borderRadius('10vp')
      .backgroundColor(this.columBgColor)
    }
    .padding('16vp')
    .backgroundColor('#dcdcdc')
    .width('100%')
    .height('100%')
  }
}