/*
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
import { MessageManager, Callback, Message }from '../../../common/MessageManager';
@Entry
@Component
struct ColumnSetVisibilityTest {
  @State testVisibility1: number = Visibility.Visible
  @State testVisibility2: number = Visibility.Visible
  messageManager: MessageManager<number> = new MessageManager()
  private content: string = "ColumnSetVisibility Page";
  onPageShow() {
    console.info('ColumnSetVisibility onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'testVisibility1') {
        this.testVisibility1 = message.value;
      }
      if (message.name == 'testVisibility2') {
        this.testVisibility2 = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('ColumnSetVisibility page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('ColumnSetVisibility').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Column({
          space: 30,
        }) {
          Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnSetVisibility_1').visibility(this.testVisibility1)
          Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('columnSetVisibility_2').visibility(this.testVisibility2)
          Column(){Text('3')}.width(300).height(150).backgroundColor(0xF5DEB3).key('columnSetVisibility_3')
        }
        .key('columnSetVisibility')
        .height(400)
        .width(350)
        .backgroundColor(0xAFEEEE)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
