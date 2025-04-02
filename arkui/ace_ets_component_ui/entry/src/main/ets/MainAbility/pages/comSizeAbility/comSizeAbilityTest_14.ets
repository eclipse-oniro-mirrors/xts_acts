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
import matrix4 from '@ohos.matrix4'
let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])
@Entry
@Component
struct comSizeAbilityTest_14 {
  normalIcon: Resource = $r("app.media.icon")
  selectedIcon: Resource = $r("app.media.icon")
  @State arr: number[] = [1, 2, 3]
  @State current: number = 1
  build() {
    Scroll(){
      Column({ space: 20 }) {
        Column(){
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach(this.arr, (item: number) => {
                Column({ space: 5 }) {
                  Text("Index" + item)
                    .fontSize(16)
                    .fontColor(this.current === item ? '#0A59F7' : '#999')
                    .fontFamily('source-sans-pro,cursive,sans-serif')
                }
              }, (item: string) => item)
            }.width('100%')
            .justifyContent(FlexAlign.SpaceAround)
            .backgroundColor('#19000000')
            Column() {
              Text('侧边栏内容1').fontSize(16)
              Text('侧边栏内容2').fontSize(16)
            }
            .margin({ top: 50, left: 20, right: 30 })
          }
          .key("SideBarContainer_Size")
          .sideBarWidth(100)
          .minSideBarWidth(50)
          .maxSideBarWidth(300)
          .backgroundColor(0XBDDB69)
          .size({ width: 260, height: 130 })
          .translate({ x: 1, y: 1, z: 1 })
          .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
          .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
          .transform(matrix)
        }.key('SideBarContainer_Father')
        Column(){
          Slider()
            .backgroundColor(0XBDDB69)
            .key("Slider_Size")
            .size({ width: 160, height: 120 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
        }.key('Slider_Father')
        Column(){
          Stack({ alignContent: Alignment.Bottom }) {
            Text('容器1,底部展示').width('90%').height('100%').backgroundColor(0xd2cab3).align(Alignment.Top).fontSize(12)
            Text('容器2,底部展示').width('70%').height('60%').backgroundColor(0xc1cb).align(Alignment.Top).fontSize(12)
          }
          .key("Stack_Size")
          .size({ width: 120, height: 100 })
          .translate({ x: 1, y: 1, z: 1 })
          .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
          .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
          .transform(matrix)
        }.key('Stack_Father')
      }.width('100%')
    }.height('100%')
  }
}