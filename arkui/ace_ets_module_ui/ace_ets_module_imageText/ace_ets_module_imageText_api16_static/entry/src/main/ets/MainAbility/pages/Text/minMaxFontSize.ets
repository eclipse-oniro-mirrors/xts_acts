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
  Column,
  Row,
  Text,
  Component,
  Search,
  SymbolGlyph,
  Margin,
  $r,
  ColumnOptions,
  CopyOptions,
  TextArea,
  Color,
  TextController,
  StyledString,
  MutableStyledString,
  TextStyle,
  SearchController,
  Span,
  TextOverflow,
  TextHeightAdaptivePolicy,
  StyledStringKey
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct minMaxFontSizeDemo {
  @State color:Color = Color.Pink
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
    Column({space:20} as ColumnOptions) {
      Column() {
        Text(){
          Span('This is the text with the height adaptive policy set.')
        }
          .id('text1')
          .width('80%')
          .height(90)
          .borderWidth(1)
          .minFontSize(10)
          .maxFontSize('30')
          .maxLines(2)
          .margin(5)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .heightAdaptivePolicy(TextHeightAdaptivePolicy.MAX_LINES_FIRST)

        Text(){
          Span('This is the text with the height adaptive policy set.')
        }
        .id('text2')
        .width('80%')
        .height(90)
        .borderWidth(1)
        .minFontSize($r('app.string.fontSize_10'))
        .maxFontSize($r('app.string.fontSize_30'))
        .maxLines(2)
        .margin(5)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST)

        Text(this.text1)

        Text(undefined, { controller: this.controller1 })
          .id('text3')
          .width('80%')
          .height(90)
          .borderWidth(1)
          .minFontSize(undefined)
          .maxFontSize(undefined)
          .maxLines(2)
          .margin(5)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .heightAdaptivePolicy(TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST)

        Text(this.text2)

      }
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width('100%')
    .height('100%')
  }
}