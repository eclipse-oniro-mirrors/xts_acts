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

import { LengthMetrics, LengthUnit } from '@ohos.arkui.node'

import {Entry,Component,TextStyle,GestureStyle,Color,MutableStyledString,DecorationStyle,TextShadowStyle,BaselineOffsetStyle,LetterSpacingStyle,UrlStyle,SpanStyle,
  ResourceColor,RichEditorStyledStringController,RichEditorStyledStringOptions,ResourceColor,StyledStringKey,Column,Text,RichEditor,Button,
  ColumnOptions,StyleOptions,TextDecorationType,ShadowOptions,ShadowType, Margin
} from '@ohos.arkui.component';
import { PromptAction } from '@ohos.arkui.UIContext';
import { ClickEvent } from '@ohos.arkui.component';

import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct RichEditorStyledStringTest {
  fontStyleAttr1: TextStyle = { fontColor: Color.Blue } as TextStyle;
  clickGestureAttr: GestureStyle = new GestureStyle({
    onClick: () => {
      const promptAction = new PromptAction()
      promptAction.showToast({ message: 'clickGestureAttr object trigger click event' })
      this.backgroundColor1 = Color.Yellow
    }
  })
  mutableStyledString2: MutableStyledString = new MutableStyledString('test hello world',
    [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.GESTURE,
      styledValue: this.clickGestureAttr
    } as StyleOptions, {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({ type: TextDecorationType.LineThrough, color: Color.Blue })
    } as StyleOptions, {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.TEXT_SHADOW,
      styledValue: new TextShadowStyle({
        radius: 5,
        type: ShadowType.COLOR,
        color: Color.Yellow,
        offsetX: 10,
        offsetY: -10
      } as ShadowOptions)
    } as StyleOptions, {
      start: 6,
      length: 5,
      styledKey: StyledStringKey.BASELINE_OFFSET,
      styledValue: new BaselineOffsetStyle(LengthMetrics.fp(10))
    } as StyleOptions, {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.LETTER_SPACING,
      styledValue: new LetterSpacingStyle(new LengthMetrics(10, LengthUnit.VP))
    } as StyleOptions,
      {
        start: 0,
        length: 5,
        styledKey: StyledStringKey.URL,
        styledValue: new UrlStyle('www.spincast.org')
      } as StyleOptions
    ]);
  @State fontColor1: ResourceColor = Color.Red;
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  @State backgroundColor1: ResourceColor | undefined = undefined;
  @State styledKey1: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey2: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey3: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey4: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey5: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey6: StyledStringKey = StyledStringKey.DECORATION

  onPageShow():void{
    this.controller2.setStyledString(this.mutableStyledString2)
  }

  build(){
    Column() {
      Column({ space: 10 } as  ColumnOptions) {
        Text(this.styledKey1 + '').fontSize(12).id('gestureId')
        Text(this.styledKey2 + '').fontSize(12).id('decorationId')
        Text(this.styledKey3 + '').fontSize(12).id('textShadowId')
        Text(this.styledKey4 + '').fontSize(12).id('baselineOffsetId')
        Text(this.styledKey5 + '').fontSize(12).id('letterSpacingId')
        Text(this.styledKey6 + '').fontSize(12).id('urlId')
        RichEditor(this.options).onReady(():void => {
          this.controller.setStyledString(this.mutableStyledString2);
        }).padding(0)
          .height('20%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Black)
        Button('SearchOtherTextStyles').id('searchStyle')
          .onClick((e:ClickEvent):void=> {
            let styles = this.mutableStyledString2.getStyles(0, this.mutableStyledString2.length) as Array<SpanStyle>
            this.styledKey1 = styles[0].styledKey
            this.styledKey2 = styles[1].styledKey
            this.styledKey3 = styles[2].styledKey
            this.styledKey4 = styles[3].styledKey
            this.styledKey5 = styles[4].styledKey
            this.styledKey6 = styles[5].styledKey
          })
          .margin({ top: 10 } as Margin)
      }.width('100%')
    }
  }
}