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
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct Grid_RowCol_LayoutDirection {
  @State addLayoutDirection: number = GridDirection.RowReverse;
  messageManager: MessageManager<number> = new MessageManager();
  private content: string = "Grid_RowCol_LayoutDirection Page";

  onPageShow() {
    console.info('Grid_RowCol_LayoutDirection page show called');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'addLayoutDirection') {
        this.addLayoutDirection = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('Grid_RowCol_LayoutDirection page build done called');
  }

  build() {
    Column() {
      Grid() {
        GridItem() {
          Text('1').fontSize(16).backgroundColor(0xF9CF93).width('100%').height('100%');
        }.key('Grid_RowCol_LayoutDirection_011')

        GridItem() {
          Text('2').fontSize(16).backgroundColor(0xF5DEB3).width('100%').height('100%');
        }.key('Grid_RowCol_LayoutDirection_012')

        GridItem() {
          Text('3').fontSize(16).backgroundColor(0xD2B48C).width('100%').height('100%');
        }.key('Grid_RowCol_LayoutDirection_013')

        GridItem() {
          Text('4').fontSize(16).backgroundColor(0xffa500).width('100%').height('100%');
        }.key('Grid_RowCol_LayoutDirection_014')
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .width(300)
      .height(300)
      .backgroundColor(0xFAEEE0)
      .key('Grid_RowCol_LayoutDirection_01')
      .layoutDirection(this.addLayoutDirection)
    }.width('100%')
  }
}