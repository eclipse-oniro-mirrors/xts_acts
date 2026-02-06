/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { MyDataSource } from './BasicDataSource';
@Entry
@Component
struct maintainContentPositionSwiper {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource()
  @State maintainContentPosition: boolean = false
  @State index: number = 5

  build() {
    Column() {
      Button('maintainVisibleContentPosition ' + this.maintainContentPosition)
        .id('maintain_swiper_true')
        .height('5%')
        .margin({top:5})
        .onClick(() => {
          this.maintainContentPosition = true
        })
      Row(){
        Button('addData')
          .id('maintain_swiper_add')
          .height('5%')
          .onClick(() => {
            this.data.addData(1, 'addData')
          })
        Button('add reset')
          .id('maintain_swiper_del')
          .height('5%')
          .onClick(() => {
            this.data.deleteData(1)
          })
      }
      Text('Swiper: ' + this.index).id('swiper_maintain_index')
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('90%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .index(this.index)
      .maintainVisibleContentPosition(this.maintainContentPosition)
      .onChange((index) => {
        this.index = index
        console.error('Swiper onChange ' + index)
      })

    }.width('100%')
  }
}