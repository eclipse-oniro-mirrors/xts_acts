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

import { GlobalContext } from '../../../../common/GlobalContext';
import { Value1 } from '../../../../common/Value';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';
import { Entry, Component,Color, Column,ColumnOptions,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexHeightModify_Start {
  @State testHeight: number = 50;
  messageManager: MessageManager<number> = new MessageManager<number>();
  private content: string = "FlexHeightModify_Start Page";

  onPageShow() {
    console.info('FlexHeightModify_Start onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexHeightModify_Start page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexHeightModify').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.Start,
          wrap: FlexWrap.NoWrap,
        } as FlexOptions) {
          Text('1').width(150).height(this.testHeight).backgroundColor(Color.Red).key('textHeightModify01')
          Text('2').width(150).height(100).backgroundColor(Color.Red).key('textHeightModify02')
          Text('3').width(150).height(150).backgroundColor(Color.Red).key('textHeightModify03')
        }
        .key('flexHeightModify')
        .height(150)
        .width(500)
        .backgroundColor(Color.Red)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
