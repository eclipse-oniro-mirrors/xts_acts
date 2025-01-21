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
struct ImageExample1 {
  @State top: number = 10
  @State bottom: number = 10
  @State left: number = 10
  @State right: number = 10
  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
        Text('' + this.top ).id('top_test')
        Text('' +  this.bottom).id('bottom_test')
        Text('' +  this.left).id('left_test')
        Text('' +  this.right).id('right_test')
        Row() {
          // 加载png格式图片
          Image($r('app.media.icon'))
            .width(110).height(110).margin(15).resizable({slice:{top: this.top,bottom: this.bottom, left: this.left, right: this.right}})
            .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        }

        Button('changeTop').onClick(() => {
          this.top = 30
        }).id('changeTop')

        Button('changeBottom').onClick(() => {
          this.bottom = 0
        }).id('changeBottom')


        Button('changeleft').onClick(() => {
          this.left = 30
        }).id('changeleft')

        Button('changeright').onClick(() => {
          this.right = 0
        }).id('changeright')


      }
    }.height(320).width(360).padding({ right: 10, top: 10 })
  }
}