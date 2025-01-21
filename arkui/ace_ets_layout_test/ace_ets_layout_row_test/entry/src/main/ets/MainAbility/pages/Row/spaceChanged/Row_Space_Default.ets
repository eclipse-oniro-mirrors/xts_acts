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
struct Row_Space_Default {
  @State addSpace1:number=0
  @State addSpace2:string='0'
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('Row_Space_Default onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addSpace1') {
        this.addSpace1 = message.value;
      }else if(message.name == 'addSpace2'){
        this.addSpace2 = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Row(){
      Row({space:this.addSpace1}) {
        Row(){Text('1')}.width(50).height(50).backgroundColor(0xF5DEB3).key('Row_Space_Default_011')
        Row(){Text('2')}.width(100).height(100).backgroundColor(0xD2B48C).key('Row_Space_Default_012')
        Row(){Text('3')}.width(150).height(150).backgroundColor(0xF5DEB3).key('Row_Space_Default_013')
      }.key('Row_Space_Default_01').width(400).height(400).backgroundColor(0xAFEEEE)

      Row({space:this.addSpace2}) {
        Row(){Text('1')}.width(50).height(50).backgroundColor(0xF5DEB3).key('Row_Space_Default_021')
        Row(){Text('2')}.width(100).height(100).backgroundColor(0xD2B48C).key('Row_Space_Default_022')
        Row(){Text('3')}.width(150).height(150).backgroundColor(0xF5DEB3).key('Row_Space_Default_023')
      }.key('Row_Space_Default_02').width(400).height(400).backgroundColor(0xAFEEEE)

    }

  }
}