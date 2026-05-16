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
struct image15 {
  @State imageLoadingResult: string = 'loading failed';

  build() {
    Column() {
      Text(this.imageLoadingResult)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .id('loadingResult15')

      Image('http://images.openharmony.cn/330-%E8%BF%90%E8%90%A5%E5%9B%BE/%E5%B0%81%E9%9D%A2/%E5%8D%9A%E5%AE%A2' +
        '/%E7%B3%BB%E5%88%97%E8%A7%A3%E8%AF%BB.png')
        .width(150)
        .height(150)
        .borderWidth(1)
        .onComplete((event?: ImageCompleteEvent) => {
          if(event) {
            this.imageLoadingResult = 'loading success'
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}