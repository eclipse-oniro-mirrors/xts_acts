/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct WaterflowAddDemo {
  @State minSize: number = 50
  @State maxSize: number = 100
  @State fontSize: number = 24
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller()
  @State  datsSource:number[] = [12,1,0,2,3,4,5,6,7,8,9,12,1,0,2,3,4,5,6,7,8,9]

  aboutToAppear() {

  }

  @Builder itemFoot() {
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
      WaterFlow({ footer: this.itemFoot.bind(this), scroller: this.scroller }) {
        ForEach(this.datsSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item).fontSize(12).height('16')
              Image('res/waterFlowTest(' + item % 5 + ').jpg')
                .objectFit(ImageFit.Fill)
                .width('100%')
                .layoutWeight(1)
            }
          }
          .width('100%')
          .height(20)
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .key('waterflowAdd')
      .itemConstraintSize({
        minWidth: 0,
        maxWidth: '100%',
        minHeight: 0,
        maxHeight: '100%'
      })
      .columnsGap(10)
      .rowsGap(5)
      .onReachStart(() => {
        console.info('onReachStart')
      })
      .onReachEnd(() => {
        console.info('onReachEnd')
      })
      .enableScrollInteraction(true)
      .nestedScroll({
        scrollForward:NestedScrollMode.PARENT_FIRST,
        scrollBackward:NestedScrollMode.SELF_FIRST
      })
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('80%')
      .layoutDirection(FlexDirection.Column)
    }
  }
}
