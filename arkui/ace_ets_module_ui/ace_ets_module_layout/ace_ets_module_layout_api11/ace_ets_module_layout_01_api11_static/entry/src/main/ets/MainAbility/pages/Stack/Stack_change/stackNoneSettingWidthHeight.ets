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

import { MessageManager, Callback, Message } from '../../../../MainAbility/common/MessageManager';
import {Entry,Component,Column,Text,HorizontalAlign,Alignment,Stack,StackOptions} from '@ohos.arkui.component'
import {State} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct StackNoneSettingWidthHeight {
  @State testAlignContentValue: Alignment = Alignment.Center;
  messageManager: MessageManager<Alignment> = new MessageManager<Alignment>();
  private content: string = "StackNoneSettingWidthHeight Page";

  onPageShow() {
    console.info('StackNoneSettingWidthHeight onPageShow');
    /*globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };*/
    AppStorage.setOrCreate<MessageManager<Alignment>>("messageManager",  this.messageManager);
    let callback: Callback<Alignment> = (message: Message<Alignment>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'alignContent') {
        this.testAlignContentValue = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('StackNoneSettingWidthHeight page build done called');
  }

  build() {
    Column() {
      Stack({ alignContent: this.testAlignContentValue }) {
        Text('1').width(200).height(200).backgroundColor(0xF5DEB3).key('stackSizeDefaultKey01')
      }.backgroundColor(0xAFEEEE).key('stackSizeDefaultKey')
    }.alignItems(HorizontalAlign.Start)
  }
}
