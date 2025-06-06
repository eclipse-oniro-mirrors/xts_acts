/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import GlobalContext from '../../../../common/GlobalContext';
import { Value } from '../../../../common/Value';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct FlexHeightModify_Stretch {
  @State testHeight: number = 50;
  messageManager: MessageManager<number> = new MessageManager();
  private content: string = 'FlexHeightModify_Stretch Page';

  onPageShow() {
    console.info('FlexHeightModify_Stretch onPageShow');
    let value: Value<number> = {
      name: 'messageManager',
      message: this.messageManager
    };
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + '--' + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexHeightModify_Stretch page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexHeightModify').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.Stretch,
          wrap: FlexWrap.NoWrap,
        }) {
          Text('1').width(150).height(this.testHeight).backgroundColor(0xF5DEB3).key('ItemAlign_Stretch_textHeightModify01')
          Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('ItemAlign_Stretch_textHeightModify02')
          Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key('ItemAlign_Stretch_textHeightModify03')
        }
        .key('ItemAlign_Stretch_flexHeightModify')
        .height(200)
        .width(500)
        .backgroundColor(0xAFEEEE)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
