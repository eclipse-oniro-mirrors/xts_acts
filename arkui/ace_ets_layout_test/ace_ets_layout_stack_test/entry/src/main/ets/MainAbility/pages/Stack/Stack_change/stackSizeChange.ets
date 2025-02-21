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
import { MessageManager,Callback } from '../../../common/MessageManager';
@Entry
@Component
struct StackSizeChange {
  @State testHeight: number = 500
  @State testWidth: number = 500
  @State testAlignContentValue: number = Alignment.Center
  messageManager:MessageManager = new MessageManager()
  private content: string = "StackSizeChange Page";
  onPageShow() {
    console.info('StackSizeChange onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
      if (message.name == 'alignContent') {
        this.testAlignContentValue = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('StackSizeChange page build done called');
  }

  build() {
    Column(){
          Column(){
                Stack({alignContent: this.testAlignContentValue}) {
                Text('1').width(200).height(200).backgroundColor(0xF5DEB3).key('stackSizeKey01')
                }.width(this.testWidth).height(this.testHeight).backgroundColor(0xAFEEEE).key('stackSizeKey')
     }.alignItems(HorizontalAlign.Start)
   }.width(500).height(500).backgroundColor(0xc1cbac)
  }
}
