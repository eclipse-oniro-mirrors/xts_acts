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
import {MessageManager,Callback} from '../../../utils/MessageManager';

type Message = string|number|Axis

@Entry
@Component
struct getListItemGroupRect5 {
  private arr: number[] = [0,1, 2, 3, 4, 5, 6, 7]
  private listScroller: ListScroller = new ListScroller()
  @State space1: number = 20
  @State space2: number = 0
  @State index: number = 0
  @State indexInGroup: number = 0
  @State listDirection1: Axis = Axis.Vertical
  @State width2: string = '100%'
  @State height2: string = '100'

  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0

  @Builder itemHead(text:string){
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width(this.width2)
      .height(this.height2)
  }
  @Builder itemFoot(num:number){
    Text('共' + num + "个")
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width(this.width2)
      .height(this.height2)
  }

  messageManager = new MessageManager<Message>()
  onPageShow() {
    console.info('getListItemGroupRect5 onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value as number;
      }else if (message.name == 'indexInGroup') {
        this.indexInGroup = message.value as number;
      }else if (message.name == 'listDirection1') {
        this.listDirection1 = message.value as Axis;
      }else if (message.name == 'width2') {
        this.width2 = message.value as string;
      }else if (message.name == 'height2') {
        this.height2 = message.value as string;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      List({ space: this.space1, initialIndex: 0 ,scroller:this.listScroller}) {
        ListItemGroup({header:this.itemHead('0'),footer:this.itemFoot(this.arr.length),space:this.space2}){
          ForEach(this.arr,(item:number) => {
            ListItem(){
              Text('listItemGroup'+ item)
                .width('100%')
                .height("100%")
                .fontSize(16)
                .borderRadius(10)
                .textAlign(TextAlign.Center)
                .backgroundColor('#3366CC')
            }
            .width(this.width2).height(this.height2)
            .key('getListItemGroupRect5_listItemGroup_' + item)
          })
        }
        .key('getListItemGroupRect5_listItemGroup_1')
      }
      .key('getListItemGroupRect5_list_1')
      .listDirection(this.listDirection1) // 排列方向
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .width(300)
      .height(500)

      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.listScroller.getItemRectInGroup(this.index,this.indexInGroup).x
        this.y = this.listScroller.getItemRectInGroup(this.index,this.indexInGroup).y
        this.width1 = this.listScroller.getItemRectInGroup(this.index,this.indexInGroup).width
        this.height1 = this.listScroller.getItemRectInGroup(this.index,this.indexInGroup).height
      }).id('getListItemGroupRect5_button')
      Text('' + this.x).key('getListItemGroupRect5_text1')
      Text('' + this.y).key('getListItemGroupRect5_text2')
      Text('' + this.width1).key('getListItemGroupRect5_text3')
      Text('' + this.height1).key('getListItemGroupRect5_text4')

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin(5)
  }
}
