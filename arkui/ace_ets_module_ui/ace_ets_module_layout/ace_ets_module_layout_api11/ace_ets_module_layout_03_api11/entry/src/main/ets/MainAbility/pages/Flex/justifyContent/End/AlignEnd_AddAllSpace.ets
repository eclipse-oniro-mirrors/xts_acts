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
struct AlignEnd_AddAllSpace {
  @State DadAllSpace: number = 10;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('AlignEnd_AddAllSpace onPageShow');
    let value: Value<number> = {
      name: 'messageManager',
      message: this.messageManager
    };
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'DadAllSpace') {
        this.DadAllSpace = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @State justifyContent: FlexAlign = FlexAlign.End;

  build() {
    Column() {
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row }) {
        Text('1').width(150).height(50).backgroundColor(0xF5DEB3).key("End_AddAllSpace_011");
        Text('2').width(150).height(100).backgroundColor(0xD2B48C).key("End_AddAllSpace_012");
        Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key("End_AddAllSpace_013");
      }
      .key("End_AddAllSpace_01")
      .width(500)
      .height(200)
      .padding(this.DadAllSpace)
      .margin(10)
      .backgroundColor(0xAFEEEE)
    }
    .key("End_AddAllSpace_01_Box")
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }
}
