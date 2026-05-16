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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
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
  LoadingProgress,
  ResourceColor
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct LoadingProgressExample {
  @State color: ResourceColor = Color.Blue
  messageManager: MessageManager<String | Color> = new MessageManager<String| Color>()

  onPageShow() {
    console.info('Gauge onPageShow')
    AppStorage.setOrCreate<MessageManager<String | Color>>("messageManager", this.messageManager);
    let callback: Callback<String | Color> = (message: Message<String | Color>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'color') {
        this.color = message.value as ResourceColor
      }

    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('Orbital LoadingProgress ').fontSize(9).fontColor('0xCCCCCC').width('90%')
      LoadingProgress()
        .color(this.color).key('loadingProgress')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}