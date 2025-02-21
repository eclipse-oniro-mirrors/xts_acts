/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from './../../../common/MessageManager';
@Entry
@Component
struct Row_flexGrow_Default {
  @State addflexGrow: number = 0
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('Row_flexGrow_Default onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addflexGrow') {
        this.addflexGrow = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Row(){
      Row({space:10}) {
        Row(){Text('1')}.width(100).height(100).flexGrow(this.addflexGrow).backgroundColor(0xF5DEB3).key('Row_flexGrow_Default_011')
        Row(){Text('2')}.width(100).height(100).flexGrow(this.addflexGrow).backgroundColor(0xD2B48C).key('Row_flexGrow_Default_012')
        Row(){Text('3')}.width(100).height(100).flexGrow(this.addflexGrow).backgroundColor(0xF5DEB3).key('Row_flexGrow_Default_013')
      }.key('Row_flexGrow_Default_01').width(450).height(450).backgroundColor(0xAFEEEE)
      Row({space:10}) {
        Row(){Text('1')}.width(100).height(100).backgroundColor(0xF5DEB3).key('Row_flexGrow_Default_021')
        Row(){Text('2')}.width(100).height(100).backgroundColor(0xD2B48C).key('Row_flexGrow_Default_022')
        Row(){Text('3')}.width(100).height(100).backgroundColor(0xF5DEB3).key('Row_flexGrow_Default_023')
      }.key('Row_flexGrow_Default_02').width(450).height(450).backgroundColor(0xAFEEEE)
    }
  }
}