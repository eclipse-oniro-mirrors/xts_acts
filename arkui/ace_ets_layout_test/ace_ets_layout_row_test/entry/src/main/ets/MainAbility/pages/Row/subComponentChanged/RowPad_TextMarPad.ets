/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { MessageManager, Callback } from '../../../common/MessageManager';
@Entry
@Component
struct RowPad_TextMarPad{
  @State rowPadding: number = 0;
  @State firstTextMargin: number = 0;
  @State firstTextPadding: number = 0;
  messageManager:MessageManager = new MessageManager();

  onPageShow() {
    console.info('RowPad_TextMarPad onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'rowPadding') {
        this.rowPadding = message.value;
      }
      if (message.name == 'firstTextMargin') {
        this.firstTextMargin = message.value;
      }
      if (message.name == 'firstTextPadding') {
        this.firstTextPadding = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build(){
    Column({space:30}){
      Row({space:10}){
        Text('1').width(100).height(50).backgroundColor(0xD2B48C)
          .margin(this.firstTextMargin)
          .padding(this.firstTextPadding)
          .key('RowPad_TextMarPad1')
        Text('2').width(100).height(100).backgroundColor(0xF5DEB3).key('RowPad_TextMarPad2')
        Text('3').width(100).height(150).backgroundColor(0xD2B48C).key('RowPad_TextMarPad3')
      }
      .width(350)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .padding(this.rowPadding)
      .key('RowPad_TextMarPad_Container01')
    }
    .width('100%')
    .height('100%')
  }
}