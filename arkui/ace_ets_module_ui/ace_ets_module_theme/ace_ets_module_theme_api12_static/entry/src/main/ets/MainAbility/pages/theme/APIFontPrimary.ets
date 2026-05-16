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
import { CustomTheme, CustomColors, ThemeControl } from '@ohos.arkui.theme';
import {
  Entry, Component,
  Column, ColumnOptions, 
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, WithTheme, Divider,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

class BlueColors1 implements CustomColors {
  fontPrimary?:string = '#FFBA1414';
  fontSecondary?:string = '#FF398D0C';
  fontTertiary?:string = '#FF0A2AFA';
  fontFourth?:string = '#FFEFE05B';
  brand?:Color = Color.Orange;
  warning?:Color = Color.Pink;
  fontOnSecondary?:string = '#FF0A2AFA';
  fontOnTertiary?:string = '#ff0afa22';
  fontOnFourth?:string= '#fffa5e0a';
  compCommonContrary?:string = '#ff2ba4a4';
  compEmphasizeTertiary?:string = '#ff1c1f5d';
  compBackgroundFocus?:string = '#ff9295d9';
  compFocusedPrimary?:string = '#ffcd72de';
  compFocusedSecondary?:string = '#ff621e6e';
  compFocusedTertiary?:string = '#ffd0334a';
}

class BlueColors3 implements CustomColors {
  compDivider?:string = '#FFBA1414';
}



class PageCustomTheme implements CustomTheme {
  colors?: CustomColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}

@Entry
@Component
struct APIFontPrimary {
  @State text1: string = 'Text01Start'
  @State text2: string = 'Text02Start'
  @State text3: string = 'Text03Start'
  @State text4: string = 'Text04Start'

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('get').key('APIFontPrimary_Button')
        .width(200).height(40)
        .onClick((e:ClickEvent) => {
          try{
            let strJson1 = inspector.getInspectorByKey('APIFontPrimary_Text01');
            console.log('++++++++++++++++++fontColor', JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
            console.log('++++++++++++++++++APIFontPrimary_Text01-backgroundColor',JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
            this.text1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor') + ''; //获取的字体颜色和设置的不一样
            this.text4 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('backgroundColor') + '';
            let strJson2 = inspector.getInspectorByKey('APIFontPrimary_Divider');
            this.text3 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('color') + '';
          }catch(err:Error){
            console.log('ClickError:',err)
          }

        })
      WithTheme({ theme: new PageCustomTheme(new BlueColors1()) }) {
        Text(this.text1)
          .fontWeight(700)
          .fontSize(24)
          .width('100%')
          .key('APIFontPrimary_Text01')
          .backgroundColor('#FF9A2AC3')
      }

      Text(`${this.text1 == '#FFBA1414' ? 'true' : 'false'}`) //实际的text1的fontColor是#FF182431，预期是'#FFBA1414'
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text02')
      Text(`${this.text1 !== '#FF398D0C' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text03')
      Text(`${this.text1 !== '#FF0A2AFA' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text04')
      Text(`${this.text1 !== '#FFEFE05B' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text05')
      // 反转颜色
      Text(`${this.text1 !== '#FF0A2AFA' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text07')
      Text(`${this.text1 !== '#ff0afa22' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text08')
      Text(`${this.text1 !== '#fffa5e0a' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text09')
      Text(`${this.text1 !== '#ff2ba4a4' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text10')
      // 背景色
      Text(`${this.text4 == '#FF9A2AC3' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text11')
      Text(`${this.text4 !== '#ff1c1f5d' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text12')
      Text(`${this.text4 !== '#ff9295d9' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text13')
      Text(`${this.text4 !== '#ffcd72de' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text14')
      Text(`${this.text4 !== '#ff621e6e' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text15')
      Text(`${this.text4 !== '#ffd0334a' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text16')

      WithTheme({ theme: new PageCustomTheme(new BlueColors3()) }) {
        Divider().strokeWidth(8).key('APIFontPrimary_Divider')
      }

      Text(`${this.text3 == '#FFBA1414' ? 'true' : 'false'}`)
        .fontWeight(700)
        .fontSize(30)
        .width('100%')
        .key('APIFontPrimary_Text06')

    }.width('100%').height('100%')
  }
}