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


import {
  Entry,
  Component,
  Column,
  Text,
  Search,
  TextController,
  SearchController,
  Color,
  TextStyle,
  StyledString,
  MutableStyledString,
  CancelButtonOptions,
  ClickEvent,
  CancelButtonStyle,
  StyledStringKey,
  $r,
} from '@ohos.arkui.component'
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { State } from '@ohos.arkui.stateManagement'
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct searchButtonDemo {
  @State color: Color = Color.Pink
  @State isShow: boolean = false
  @State isShow2: boolean = false
  @State sheetHeight: number = 300;
  @State isShowdialog: boolean = false
  @State handlePopup: boolean = false
  @State customPopup: boolean = false
  @State text1: string = ''
  @State text2: string = ''
  controller1: TextController = new TextController();
  styledString2: StyledString = new StyledString('运动45分钟');
  mutableStyledString2: MutableStyledString = new MutableStyledString('test hello world', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({ fontColor: Color.Blue })
  }]);
  searchController: SearchController = new SearchController()
  @State changeValue: string = ''
  @State submitValue: string = ''

  onPageShow() {
    this.controller1.setStyledString(this.mutableStyledString2)
  }

  build() {
    Column() {
      Column() {
        Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.searchController })
          .id('search1')
          .searchIcon(new SymbolGlyphModifier($r('sys.symbol.magnifyingglass')).fontColor([Color.Red]))
          .cancelButton({
            style: CancelButtonStyle.CONSTANT,
            // icon: new SymbolGlyphModifier($r('sys.symbol.xmark')).fontColor([Color.Green])
          } as CancelButtonOptions)
          .searchButton('SEARCH', {
            fontSize: '16fp',
            fontColor: '#ff3f97e9',
            autoDisable: true
          })
          .width('95%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .margin(10)
          .onClick((e: ClickEvent) => {
            console.log('preventDefault')
          })

        Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.searchController })
          .id('search2')
          .searchIcon(new SymbolGlyphModifier($r('sys.symbol.magnifyingglass')).fontColor([Color.Red]))
          .cancelButton({
              style: CancelButtonStyle.CONSTANT,
              //icon: new SymbolGlyphModifier($r('sys.symbol.xmark')).fontColor([Color.Green])
            } as CancelButtonOptions)
          .searchButton('SEARCH', {
            fontSize: '16fp',
            fontColor: '#ff3f97e9',
            autoDisable: false
          })
          .width('95%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .margin(10)
          .onClick((e: ClickEvent) => {
            console.log('preventDefault222')
          })

        Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.searchController })
          .id('search3')
          .searchIcon(new SymbolGlyphModifier($r('sys.symbol.magnifyingglass')).fontColor([Color.Red]))
          .cancelButton({
              style: CancelButtonStyle.CONSTANT,
              // icon: new SymbolGlyphModifier($r('sys.symbol.xmark')).fontColor([Color.Green])
            } as CancelButtonOptions)
          .searchButton('SEARCH', {
            fontSize: '16fp',
            fontColor: '#ff3f97e9',
            autoDisable: undefined
          })
          .width('95%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .margin(10)
          .onClick((e: ClickEvent) => {
            console.log('preventDefault222')
          })

      }
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width('100%')
    .height('100%')
  }
}