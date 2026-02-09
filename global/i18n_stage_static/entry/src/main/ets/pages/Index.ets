/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Entry, Text, Column, Component, Button, ClickEvent, TextController,
  TextStyle, StyledString, Color, FontWeight, FontStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { i18n, intl } from '@kit.LocalizationKit';
import hilog from '@ohos.hilog'

@Entry
@Component
struct MyStateSample {
  integerTextStyle: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontFamily: 'Arial',
    fontWeight: FontWeight.Lighter,
    fontStyle: FontStyle.Italic
  });
  decimalTextStyle: TextStyle = new TextStyle({
    fontColor: Color.Black,
    fontFamily: 'Arial',
    fontWeight: FontWeight.Normal,
    fontStyle: FontStyle.Normal
  });
  fractionTextStyle: TextStyle = new TextStyle({
    fontColor: Color.Green,
    fontFamily: 'Arial',
    fontWeight: FontWeight.Regular,
    fontStyle: FontStyle.Normal
  });
  unitTextStyle: TextStyle = new TextStyle({
    fontColor: Color.Blue,
    fontFamily: 'Arial',
    fontWeight: FontWeight.Medium,
    fontStyle: FontStyle.Italic
  });
  numberFormat: Intl.NumberFormat = new Intl.NumberFormat('en-GB', {
    style: 'currency',
    currency: 'EUR',
    currencyDisplay: 'name',
    currencySign: 'accounting',
    signDisplay: 'always'
  });
  styledNumberFormat: i18n.StyledNumberFormat = new i18n.StyledNumberFormat(this.numberFormat, {
    integer: this.integerTextStyle,
    decimal: this.decimalTextStyle,
    fraction:this.fractionTextStyle,
    unit: this.unitTextStyle
  });
  @State html : string = StyledString.toHtml(this.styledNumberFormat.format(123456.789));


  build() {
    Column() {
      Text(this.html).id('i18nStageStaticText').height('10%')
    }
  }
}
