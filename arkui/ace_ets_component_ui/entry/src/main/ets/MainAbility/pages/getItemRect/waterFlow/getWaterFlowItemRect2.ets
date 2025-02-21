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
import { WaterFlowDataSource } from './WaterFlowDataSource'

@Entry
@Component
struct getWaterFlowItemRect2 {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State fontSize: number = 24
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller()
  datasource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []

  @State x1: number = 0
  @State y1: number = 0

  @State index: number = 0
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0

  messageManager = new MessageManager<number>()
  onPageShow() {
    console.info('getWaterFlowItemRect2 onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<number> = message => {
      console.error('message = ' + message.name + "--" + message.value);
      if(message.name == 'index') {
        this.index = message.value;
      }else if (message.name == 'x1') {
        this.x1 = message.value;
      }else if (message.name == 'y1') {
        this.y1 = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  // 计算flow item宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 保存flow item宽/高
  getItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.getItemSizeArray()
  }

  @Builder
  itemFoot() {
    Column() {
      Text(`Footer`)
        .fontSize(10)
        .backgroundColor(Color.Red)
        .width(50)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }
  }

  build() {
    Column({ space: 2 }) {
      WaterFlow({ scroller:this.scroller }) {
        FlowItem() {
          Column() {
            Text("0" ).fontSize(12).height('16')
          }
        }
        .width(170)
        .height(100)
        .offset({x:this.x1,y:this.y1})
        .backgroundColor(this.colors[0 % 5])

        FlowItem() {
          Column() {
            Text("1" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[1 % 100])
        .backgroundColor(this.colors[1 % 5])


        FlowItem() {
          Column() {
            Text("2" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[2 % 100])
        .backgroundColor(this.colors[2 % 5])


        FlowItem() {
          Column() {
            Text("3" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[3 % 100])
        .backgroundColor(this.colors[3 % 5])


        FlowItem() {
          Column() {
            Text("4" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[4 % 100])
        .backgroundColor(this.colors[4 % 5])


        FlowItem() {
          Column() {
            Text("5" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[5 % 100])
        .backgroundColor(this.colors[5 % 5])


        FlowItem() {
          Column() {
            Text("6" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[6 % 100])
        .backgroundColor(this.colors[6 % 5])


        FlowItem() {
          Column() {
            Text("7" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[7 % 100])
        .backgroundColor(this.colors[7 % 5])


        FlowItem() {
          Column() {
            Text("8" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[8 % 100])
        .backgroundColor(this.colors[8 % 5])


        FlowItem() {
          Column() {
            Text("9" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[9 % 100])
        .backgroundColor(this.colors[9 % 5])


        FlowItem() {
          Column() {
            Text("10" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[10 % 100])
        .backgroundColor(this.colors[10 % 5])


        FlowItem() {
          Column() {
            Text("11" ).fontSize(12).height('16')
          }
        }
        .width('100%')
        .height(this.itemHeightArray[11 % 100])
        .backgroundColor(this.colors[11 % 5])


      }
      .columnsTemplate("1fr 1fr")
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height(500)

      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.scroller.getItemRect(this.index).x
        this.y = this.scroller.getItemRect(this.index).y
        this.width1 = this.scroller.getItemRect(this.index).width
        this.height1 = this.scroller.getItemRect(this.index).height
      }).id('getWaterFlowItemRect2_button')
      Text('' + this.x).key('getWaterFlowItemRect2_text1')
      Text('' + this.y).key('getWaterFlowItemRect2_text2')
      Text('' + this.width1).key('getWaterFlowItemRect2_text3')
      Text('' + this.height1).key('getWaterFlowItemRect2_text4')
    }
  }
}