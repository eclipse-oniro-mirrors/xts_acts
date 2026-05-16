'use static';
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
import { WaterFlowDataSource } from './WaterFlowDataSource';
import matrix4 from '@ohos.matrix4';
import {
  $r,
  Alignment,
  Builder,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FlexDirection,
  FlowItem,
  Image,
  ImageFit,
  LazyForEach,
  List,
  ListItem,
  Margin,
  PlaybackSpeed,
  Resource,
  Scroll,
  Scroller,
  Text,
  TimePicker,
  Toggle,
  ToggleType,
  Video,
  VideoController,
  WaterFlow
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

@Entry
@Component
struct comSizeAbilityTest_18 {
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  controller: VideoController = new VideoController()
  @State minSize: number = 50
  @State maxSize: number = 100
  @State fontSize: number = 24
  @State colors: String[] = ['0xFFC0CB', '0xDA70D6', '0x6B8E23', '0x6A5ACD', '0x00FFFF', '0x00FF7F']
  scroller: Scroller = new Scroller()
  datasource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = [] as number[]
  private itemHeightArray: number[] = [] as number[]

  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  getItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
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
        .margin({ top: 2 } as Margin)
    }
  }

  build() {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Column() {
          TimePicker()
            .key("TimePicker_Size")
            .backgroundColor('0XBDDB69')
            .size({ width: 125, height: 110 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({
              x: 1,
              y: 1,
              z: 1,
              centerX: 1,
              centerY: 1
            })
            .rotate({
              x: 1,
              y: 1,
              z: 1,
              angle: 0,
              centerX: 1,
              centerY: 1
            })
            .transform(matrix)
        }.key('TimePicker_Father')

        Column() {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor('#007DFF')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
            .key("Toggle_Size")
            .backgroundColor('0XBDDB69')
            .size({ width: 120, height: 100 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({
              x: 1,
              y: 1,
              z: 1,
              centerX: 1,
              centerY: 1
            })
            .rotate({
              x: 1,
              y: 1,
              z: 1,
              angle: 0,
              centerX: 1,
              centerY: 1
            })
            .transform(matrix)
        }.key('Toggle_Father')

        Column() {
          Video({
            previewUri: this.previewUri,
            currentProgressRate: this.curRate,
            controller: this.controller
          })
            .key("Video_Size")
            .backgroundColor('0XBDDB69')
            .size({ width: 100, height: 100 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({
              x: 1,
              y: 1,
              z: 1,
              centerX: 1,
              centerY: 1
            })
            .rotate({
              x: 1,
              y: 1,
              z: 1,
              angle: 0,
              centerX: 1,
              centerY: 1
            })
            .transform(matrix)
        }.key('Video_Father')

        Column() {
          List(
            {
              // footer: () => {
              //   this.itemFoot()
              // },
              scroller: this.scroller
            }
          ) {
            LazyForEach(this.datasource, (item: Double, index: Int) => {
              ListItem() {
                Column() {
                  Text("N" + item).fontSize(12).height('16')
                  Image('res/waterFlowTest(' + item % 5 + ').jpg')
                    .objectFit(ImageFit.Fill)
                    .width('100%')
                    .layoutWeight(1)
                }
              }
              .width('100%')
              .height(this.itemHeightArray[item as Int])

              .backgroundColor(this.colors[(item % 5) as Int])
            }, (item: Double, index: Int) => item.toString())
          }

          // .columnsTemplate("1fr 1fr 1fr 1fr")
          // .itemConstraintSize({
          //   minWidth: 0,
          //   maxWidth: '100%',
          //   minHeight: 0,
          //   maxHeight: '100%'
          // })
          // .columnsGap(10)
          // .rowsGap(5)
          .backgroundColor('0xFAEEE0')
          // .layoutDirection(FlexDirection.Column)
          .key("WaterFlow_Size")
          .backgroundColor('0XBDDB69')
          .size({ width: 220, height: 140 })
          .translate({ x: 1, y: 1, z: 1 })
          .scale({
            x: 1,
            y: 1,
            z: 1,
            centerX: 1,
            centerY: 1
          })
          .rotate({
            x: 1,
            y: 1,
            z: 1,
            angle: 0,
            centerX: 1,
            centerY: 1
          })
          .transform(matrix)
        }.key('WaterFlow_Father')
      }.width('100%')
    }.height('100%')
  }
}


