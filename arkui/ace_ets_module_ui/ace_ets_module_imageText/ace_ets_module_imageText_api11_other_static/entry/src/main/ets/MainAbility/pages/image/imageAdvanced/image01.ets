'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Resource,
  FontWeight,
  $rawfile,
  ImageCompleteEvent
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
@Entry
@Component
struct image01 {
  @State imageLoadingResult: string = 'loading failed';
  @State src: Resource = $r('app.media.icon50_50');
  @State loadingStatus:number = 1
  @State contentWidth:number = 1
  @State contentHeight:number = 1
  @State contentOffsetX:number = 1
  @State contentOffsetY:number = 1

  build() {
    Row() {
      Column() {
        Text(this.imageLoadingResult)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .id('loadingResult01')
        Text('' + this.loadingStatus).id('loadingStatus01')
        Text('' + this.contentWidth).id('contentWidth01')
        Text('' + this.contentHeight).id('contentHeight01')
        Text('' + this.contentOffsetX).id('contentOffsetX01')
        Text('' + this.contentOffsetY).id('contentOffsetY01')

        Image(this.src)
          .width(100)
          .height(100)
          .aspectRatio(1.5)
          .borderWidth(1)
          .onComplete((event?: ImageCompleteEvent) => {
            if(event!=undefined){
              this.imageLoadingResult = 'loading success'
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus )
              console.log('onComplete:event.contentWidth ' + event.contentWidth )
              console.log('onComplete:event.contentHeight ' + event.contentHeight )
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX )
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY )
              this.loadingStatus =  event.loadingStatus
              this.contentWidth =  event.contentWidth
              this.contentHeight =  event.contentHeight
              this.contentOffsetX =  event.contentOffsetX
              this.contentOffsetY =  event.contentOffsetY
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}