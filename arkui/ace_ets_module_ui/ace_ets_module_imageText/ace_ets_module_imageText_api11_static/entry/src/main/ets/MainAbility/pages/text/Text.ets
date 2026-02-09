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
import {
  Entry,
  Component,
  Flex,
  Text,
  Padding,
  Margin,
  TextAlign,
  TextOverflow,
  TextCase,
  Color,
  Length,
  Alignment,
  Direction,
  Position,
  ItemAlign,
  BorderStyle,
  ImageSize,
  Visibility,
  FontStyle,
  FontWeight,
  FlexDirection,
  FlexAlign,
  FontWeight,
  TextDecorationType
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
const router = AppStorage.get<Router>("router") as Router

let paramInfo:Object = router.getParams();
console.info("cd paramInfo" + JSON.stringify(paramInfo))

@Entry
@Component
struct text_textcase {
  @State textAlign: TextAlign = TextAlign.End
  @State lineHeight: string = '15fp'
  @State overflow: TextOverflow = TextOverflow.Ellipsis
  @State maxLines: number = 2
  @State baselineOffset: number = 0
  @State textCase: TextCase = TextCase.Normal
  @State color: Color = Color.Red
  @State myWidth: Length = "200"
  @State myHeight: Length = "100"
  @State marginBottom: string = "10px"
  @State marginTop: string = "10px"
  @State marginLeft: string = "10px"
  @State marginRingt: string = "10px"
  @State paddingBottom: string = "5"
  @State paddingTop: string = "5"
  @State paddingLeft: string = "5"
  @State paddingRingt: string = "5"
  @State layoutPriority: string = "9px"
  @State myAlign: Alignment = Alignment.Center
  @State myDirection: Direction = Direction.Auto
  @State myPosition: Position = { x: "50", y: "50" } as Position
  @State myFlexGrow: number = 5
  @State myFlexShrink: number = 2
  @State myFlexBasis: number = 0
  @State myAlignSelf: ItemAlign = ItemAlign.Auto
  @State myBorderStyle: BorderStyle = BorderStyle.Dashed
  @State myBorderRadius: number = 10
  @State myBorderWidth: string = "4px"
  @State myBorderColor: Color = Color.Blue
  @State myBackgroundColor: Color = Color.Pink
  @State myBackgroundImageSize: ImageSize = ImageSize.Cover
  @State myBackgroundImagePosition: Alignment = Alignment.Center
  @State myOpacity: number = 1
  @State myVisibility: Visibility = Visibility.Visible
  @State myEnabled: boolean = false
  @State myZIndex: int = 1
  @State fontStyle: FontStyle = FontStyle.Italic
  @State fontSize: number = 15
  @State minFontSize: number = 15
  @State maxFontSize: number = 15
  @State letterSpacing: number = 10
  @State fontWeight: FontWeight = FontWeight.Bold
  @State fontColor: Color = Color.Black
  @State active: boolean = false
  private content: string = "Text Page";

  onPageShow() {
    console.info('Text page show called');
  }

  onBuildDone() {
    console.info('Text page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Text('Text Anto test,Text Anto test,Text Anto test,Text Anto test,test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test')
        .width(this.myWidth)
        .height(this.myHeight)
        .padding({ bottom: this.paddingBottom, top: this.paddingTop, right: this.paddingRingt, left: this.paddingLeft } as Padding)
        .margin({ bottom: this.marginBottom, top: this.marginTop, right: this.marginRingt, left: this.marginLeft } as Margin)
        .constraintSize({ minWidth: 20, maxWidth: 200, minHeight: 0, maxHeight: 50 })
        .layoutWeight("10px")
        .align(this.myAlign)
        .direction(this.myDirection)
        .position(this.myPosition)
        .markAnchor({ x: "50", y: "50" } as Position)
        .offset({ x: "50", y: "50" } as Position)
        .flexBasis(this.myFlexBasis)
        .flexGrow(this.myFlexGrow)
        .flexShrink(this.myFlexShrink)
        .alignSelf(this.myAlignSelf)
        .borderStyle(this.myBorderStyle)
        .borderRadius(this.myBorderRadius)
        .borderWidth(this.myBorderWidth)
        .borderColor(this.myBorderColor)
        .backgroundColor(this.myBackgroundColor)
        .opacity(this.myOpacity)
        .visibility(this.myVisibility)
        .enabled(this.myEnabled)
        .zIndex(this.myZIndex)
        .fontColor(this.fontColor)
        .fontSize(this.fontSize)
        .maxFontSize(this.maxFontSize)
        .fontWeight(this.fontWeight)
        .fontStyle(this.fontStyle)
        .fontFamily("sans-serif")
        .textAlign(this.textAlign)
        .textOverflow({ overflow: this.overflow })
        .lineHeight(this.lineHeight)
        .baselineOffset(this.baselineOffset)
        .maxLines(2)
        .textCase(this.textCase)
        .decoration({ type: TextDecorationType.Underline, color: Color.Red })
        .aspectRatio(1)
        .fontColor(Color.Black)
        .key('Text')
      Text('Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test')
        .size({ width: 100, height: 50 })
        .padding({ bottom: 5, top: 5, right: 5, left: 10 } as Padding)
        .margin({ bottom: 15, top: 10, right: 10, left: 10 } as Margin)
        .fontSize('13')
        .textAlign(TextAlign.Start)
        .align(Alignment.Start)
        .direction(Direction.Ltr)
        .alignSelf(ItemAlign.Start)
        .borderStyle(BorderStyle.Dotted)
        .borderWidth(2)
        .visibility(Visibility.Hidden)
        .enabled(true)
        .fontWeight(FontWeight.Normal)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Clip })
        .maxLines(2)
        .textCase(TextCase.LowerCase)
        .decoration({ "type": TextDecorationType.LineThrough, "color": Color.Red })
        .fontColor(Color.White)
        .key('Text1')
      Text('Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test,Text Anto test')
        .fontSize(13)
        .width('100%')
        .textAlign(TextAlign.Center)
        .align(Alignment.TopEnd)
        .direction(Direction.Rtl)
        .alignSelf(ItemAlign.Center)
        .borderStyle(BorderStyle.Solid)
        .borderWidth(2)
        .visibility(Visibility.None)
        .fontWeight(FontWeight.Bolder)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .textCase(TextCase.UpperCase)
        .decoration({ "type": TextDecorationType.None, "color": Color.Red })
        .fontColor(Color.Blue)
        .key('Text2')
      Text('Text Anto test,Text Anto test,Text Anto test,Text Anto test')
        .fontSize(13)
        .align(Alignment.Top)
        .alignSelf(ItemAlign.End)
        .borderWidth(2)
        .width('100%')
        .fontWeight(FontWeight.Lighter)
        .decoration({ type: TextDecorationType.Overline, color: Color.Red })
        .fontColor(Color.Gray)
        .key('Text3')
      Text('Text Anto test,Text Anto test')
        .fontSize(13)
        .align(Alignment.TopStart)
        .alignSelf(ItemAlign.Baseline)
        .borderWidth(2)
        .width('100%')
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.Brown)
        .key('Text4')
      Text('Text Anto test,Text Anto test,Text Anto test')
        .fontSize(13)
        .align(Alignment.End)
        .alignSelf(ItemAlign.Stretch)
        .borderWidth(2)
        .width('100%')
        .fontWeight(FontWeight.Regular)
        .fontColor(Color.Grey)
        .key('Text5')
      Text('Text Anto test,Text Anto test,Text Anto test')
        .fontSize(13)
        .align(Alignment.BottomEnd)
        .width('100%')
        .fontColor(Color.Orange)
        .key('Text6')
      Text('Text Anto test,Text Anto test,Text Anto test')
        .fontSize(13)
        .align(Alignment.Bottom)
        .width('100%')
        .fontColor(Color.Yellow)
        .key('Text7')
      Text('Text Anto test,Text Anto test,Text Anto test')
        .fontSize(13)
        .align(Alignment.BottomStart)
        .width('100%')
        .key('Text8')

    }
    .key('flex')
    .width('100%')
    .height('100%')
  }
}


