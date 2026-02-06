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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent,
  Image,ImageFit, Scroller, Row, Scroll, VerticalAlign, ForEach, Search, SafeAreaType, ScrollDirection,
  BarState, Color, EdgeEffect, TextAlign, Margin, IconOptions, CancelButtonStyle, CancelButtonOptions, $r,
  CaretStyle, Font} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct search_center {
  private arr:Array<Number> = new Array<Number>(0,1,2,3);
  scroll: Scroller = new Scroller()
  messageManager:MessageManager<string> = new MessageManager<string>()

  onPageShow() {
    console.info('search_center onPageShow')
    AppStorage.setOrCreate<MessageManager<string>>("messageManager",  this.messageManager);
  }

  build(){
    Row(){
      Column(){
        Scroll(this.scroll){
          Column(){
            ForEach(this.arr,(item:number) => {
              Text(String(item))
                .width('90%')
                .height('17%')
                .backgroundColor(Color.Red)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({top:10} as Margin)
                .key('search_center_text_1' + item)
            })

            Search({placeholder:'search位于滚动容器中部'})
              .searchButton('SEARCH')
              .searchIcon({
                src: $r('app.media.icon')
              } as IconOptions)
              .cancelButton({
                style:CancelButtonStyle.CONSTANT,
                icon: {
                  src: $r('app.media.icon')
                } as IconOptions
              } as CancelButtonOptions)
              .width('90%')
              .height(40)
              .placeholderColor(Color.Grey)
              .placeholderFont({size:14,weight:400} as Font)
              .caretStyle({width:2,color:Color.Orange} as CaretStyle)
              .textFont({size:14,weight:400} as Font)
              .selectionMenuHidden(false)
              .backgroundColor("#7ebfe76e")
              .cancelButton({
                style: CancelButtonStyle.CONSTANT,
                icon: {
                  src: $r('app.media.icon')
                } as IconOptions
              } as CancelButtonOptions)
              .caretStyle({
                width: 10,
                color:'#007DFF'
              } as CaretStyle)
              .margin({top:10} as Margin)
              .enableKeyboardOnFocus(false)
              .key('search_center_search_01')

            ForEach(this.arr,(item:number) => {
              Text(String(item))
                .width('90%')
                .height(150)
                .backgroundColor(Color.Red)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({top:10} as Margin)
                .key('search_center_text_2' + item)

            })

          }.width('100%').key('search_center_Column_1')
        }.expandSafeArea([SafeAreaType.KEYBOARD])
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .edgeEffect(EdgeEffect.None)
        .backgroundColor('#f9eff6')
      }
      .width('100%')
      .height('98%')
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
  }

}