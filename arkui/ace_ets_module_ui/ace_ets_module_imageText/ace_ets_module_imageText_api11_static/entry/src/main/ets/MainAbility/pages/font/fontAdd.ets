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
import font from '@ohos.font';
import {
  Entry,
  Component,
  Column,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  TextDecorationType,
  Margin,
  ClickEvent,
  Button,
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { Font } from '@ohos.arkui.UIContext'

const Font = new Font();

@Entry
@Component
struct FontExample {
  fontList: Array<string> = new Array<string>();
  Font: Font = this.getUIContext().getFont();
  fontInfo: font.FontInfo | undefined = undefined;
  @State value:string=''
  @State value1:string=''

  aboutToAppear(){
  }

  build() {
    Column() {
      Text(this.value).key('fontList').key('fontlist')
      Text(this.value1).key('fontName').key('fontName')
      
      Button("getSystemFontList")
        .width('60%')
        .height('6%')
        .onClick((e:ClickEvent)=>{
          this.fontList = this.Font.getSystemFontList()
          this.value = this.fontList.toString()
        }).margin({top:20} as Margin).key("getSystemFontList")

      Button("getgetFontByName")
        .width('60%')
        .height('6%')
        .key("getgetFontByName")
        .onClick((e:ClickEvent)=>{
          this.fontInfo = this.Font.getFontByName('HarmonyOS Sans Italic')
          if(this.fontInfo != null) {
             this.value1 = this.fontInfo!.fullName
             console.log("getFontByName(): path = " + this.fontInfo!.path)
             console.log("getFontByName(): postScriptName = " + this.fontInfo!.postScriptName)
             console.log("getFontByName(): fullName = " + this.fontInfo!.fullName)
             console.log("getFontByName(): Family = " + this.fontInfo!.family)
             console.log("getFontByName(): Subfamily = " + this.fontInfo!.subfamily)
             console.log("getFontByName(): weight = " + this.fontInfo!.weight)
             console.log("getFontByName(): width = " + this.fontInfo!.width)
             console.log("getFontByName(): italic = " + this.fontInfo!.italic)
             console.log("getFontByName(): monoSpace = " + this.fontInfo!.monoSpace)
             console.log("getFontByName(): symbolic = " + this.fontInfo!.symbolic)
          }
          
        }).margin({top:20} as Margin)
    }.width('100%').height('100%')
  }
}