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
struct List_SpaceChange{
  @State testSpace: number = 0;
  messageManager:MessageManager = new MessageManager();

  onPageShow() {
    console.info('Grid_RowCol_ItemContentSize onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'Space') {
        this.testSpace = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build(){
    Column({ space:30 }){
      List({ space:this.testSpace }){
        ListItem() {
          Text('1').width('100%').height('100%').backgroundColor(0xF5DEB3);
        }
        .width(300)
        .height(100)
        .key('List_SpaceChange01')
        ListItem() {
          Text('2').width('100%').height('100%').backgroundColor(0xD2B48C);
        }
        .width(300)
        .height(100)
        .key('List_SpaceChange02')
        ListItem() {
          Text('3').width('100%').height('100%').backgroundColor(0xF5DEB3);
        }
        .width(300)
        .height(100)
        .key('List_SpaceChange03')
        ListItem() {
          Text('4').width('100%').height('100%').backgroundColor(0xD2B48C);
        }
        .width(300)
        .height(100)
        .key('List_SpaceChange04')
      }
      .width(350)
      .height(520)
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .backgroundColor(0xAFEEEE)
      .key('List_SpaceChange_Container01')
    }
    .width('100%')
    .height('100%')
  }
}