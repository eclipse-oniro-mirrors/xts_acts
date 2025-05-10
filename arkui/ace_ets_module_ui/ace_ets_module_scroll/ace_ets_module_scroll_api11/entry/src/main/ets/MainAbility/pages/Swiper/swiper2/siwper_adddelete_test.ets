/*
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



class MyDataSourceT5 implements IDataSource {
  private list: number[] = []
  private count:number  = 0
  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): number {
    return this.list[index]
  }
  add() {

    this.list.push(this.totalCount() + 1)

  }
  delete() {
    this.list.pop();
  }
  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct SwiperExampleT5 {
  private swiperController: SwiperController = new SwiperController()
  @State data: MyDataSourceT5 = new MyDataSourceT5([])

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceT5(list)
  }

  build() {
    Column({ space: 5 }) {
      Row({ space: 2 }) {
        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext()
          }).key("showNextTT")
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()
          }).key("showPreviousTT")
      }

      Button('changeIndex').id('change_8')
        .onClick(() => {
          this.swiperController.changeIndex(7)
          console.log('change Index 8')
        })

      Row({ space: 2 }) {
        Button('add')
          .onClick(() => {
            this.data.add();
          }).key("addTT")
        Button('delete')
          .onClick(() => {
            this.data.delete()
          }).key("deleteTT")
      }
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('90%')
            .height(160)
            .key('item2S'+item.toString())
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(0)
      .autoPlay(false)
      .interval(4000)
      .key('swiperTestWidth5')
      .loop(true)
      .indicator(
        new DotIndicator()
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue))
      .duration(1000)
      .itemSpace(0)
      .displayMode(SwiperDisplayMode.STRETCH)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })
      .onGestureSwipe((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        console.info("index: " + index)
        console.info("targetIndex: " + targetIndex)
        console.info("current offset: " + extraInfo.currentOffset)
        console.info("target offset: " + extraInfo.targetOffset)
        console.info("velocity: " + extraInfo.velocity)
      })
      .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })

    }.width('100%')
    .margin({ top: 10 }).backgroundColor(Color.Brown)
  }
}