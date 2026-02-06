/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct ListOffSet01 {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1];
  @State startText: string = '';
  @State endText: string = '';
  @State objtext: string = '';
  @State startSize: number = 0;
  @State endSize: number = 0;
  @State paddingSize: number = 0;
  @State t: number = 0;

  build() {
    Column(){
      Column(){
        Row(){
          Button('back top')
            .id('ListoffSet01_Top')
            .height('6%')
            .onClick(() => { // 点击后回到顶部
              this.scroller.scrollEdge(Edge.Top)
            })
            .backgroundColor(Color.Orange)

          Button('back bottom')
            .id('ListoffSet01_Bottom')
            .height('6%')
            .onClick(() => { // 点击后回到顶部
              this.scroller.scrollEdge(Edge.Bottom)
            })
            .backgroundColor(Color.Orange)
        }
        Row(){
          Button('start0').id('ListoffSet01_Start0')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.startSize = 0
            })
          Button('start-2').id('ListoffSet01_Start_Negative2')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.startSize = -2
            })
          Button('start5').id('ListoffSet01_Start5')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.startSize = 5
            })
          Button('start10').id('ListoffSet01_Start10')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.startSize = 10
            })
        }
        Row(){
          Button('end0').id('ListoffSet01_End0')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.endSize = 0
            })
          Button('end-2').id('ListoffSet01_End_Negative2')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.endSize = -2
            })
          Button('end5').id('ListoffSet01_End5')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.endSize = 5
            })
          Button('end10').id('ListoffSet01_End10')
            .width('20%')
            .height('6%')
            .onClick(() => {
              this.endSize = 10
            })
        }
        Row(){
          Button('padding:0').id('ListoffSet01_Padding0')
            .height('6%')
            .onClick(() => {
              this.paddingSize = 0
            })

          Button('padding:5').id('ListoffSet01_Padding5')
            .height('6%')
            .onClick(() => {
              this.paddingSize = 5
            })
        }
        Button('get')
          .key('ListoffSet01_Get')
          .height('6%')
          .onClick(() => {
            this.t = this.scroller.currentOffset().yOffset
          })
          .backgroundColor(Color.Orange)

        Row(){
          Text(`${Math.round(Math.abs(Number(this.startText)))}`)
            .key('ListoffSet01_Text01')
            .fontWeight(700)
            .fontSize(24)
            .fontColor(Color.Red)

          Text(`${Math.round(Math.abs(Number(this.endText)))}`)
            .key('ListoffSet01_Textend')
            .margin({ left: 30, right: 30 })
            .fontWeight(700)
            .fontSize(24)
            .fontColor(Color.Blue)

          Text(`${this.t}`).key('ListoffSet01_Text02')
            .fontSize(24).fontColor(Color.Red)
        }

        Scroll(){
          Text(this.objtext).fontWeight(700).border({ width: 1 })
        }
        .width('100%')
        .height('20%')
      }

      Stack({ alignContent: Alignment.TopStart }) {
        Column() {
          List({ scroller: this.scroller }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .width('100%')
                  .height(100)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .borderRadius(40)
                  .backgroundColor(0xFFFFFF)
              }
              .onAreaChange((oldValue: Area, newValue: Area) => {
                if (item == 0) {
                  this.startText = JSON.stringify(newValue.position.y)
                } else if (item == 1) {
                  this.endText = JSON.stringify(newValue.position.y)
                }
                this.objtext = JSON.stringify(newValue)
              })
            }, (item: string) => item)
          }
          .height(200)
          .listDirection(Axis.Vertical) // 排列方向
          .scrollBar(BarState.On)
          .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
          .backgroundColor(Color.Green)
          .contentStartOffset(this.startSize)
          .contentEndOffset(this.endSize)
          .padding(this.paddingSize)
        }
        .width('90%')
        .height(200)
        .margin(10)

      }.width('100%').height('100%').backgroundColor(0xDCDCDC)
    }
  }
}