/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct waterExample {
  @State arr: number[] = [0, 1]
  @State arrIndex: number = 10;
  @State contentWidth: number = -1;
  @State contentHeight: number = -1;
  scroller: Scroller = new Scroller();
  build() {
    Scroll() {
      Column() {
        Button('GetContentSize')
          .id('GetContentSize')
          .width('20%')
          .height('10%')
          .onClick(()=> {
            this.contentWidth=this.scroller.contentSize().width;
            this.contentHeight=this.scroller.contentSize().height;
          })
        WaterFlow({ scroller:this.scroller }) {
          ForEach(this.arr, (item: number,  index?: number) => {
            FlowItem() {
              Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                Text('' + item)
                  .width(200)
                  .height(50)
              }
            }
          }, (item: number) => item.toString())
        }
        .height('50%')
        .width(200)
        Text(''+ this.contentWidth)
          .fontColor(Color.Red)
          .key('WaterFlowContentWidth')
        Text(''+ this.contentHeight)
          .fontColor(Color.Red)
          .key('WaterFlowContentHeight')
      }
    }
  }
}