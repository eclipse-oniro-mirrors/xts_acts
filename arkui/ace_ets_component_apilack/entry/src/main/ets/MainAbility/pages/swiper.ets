/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';

class MyDataSource implements IDataSource {
  private list: number[] = []
  private listener: DataChangeListener

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}


const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SwiperCurve {

  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    Log.showInfo(TAG, `aboutToAppear SwiperCurve start`)
    let list = []
    for (var i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear SwiperCurve end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Column({ space: 5 }) {

        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: string) => {
            Text(item).width('90%').height(160).backgroundColor(0xAFEEEE).textAlign(TextAlign.Center).fontSize(20)
          }, item => item)
        }
        .key("swiper")
        .cachedCount(2)
        .index(1)
        .autoPlay(true)
        .interval(4000)
        .indicator(true) // 默认开启指示点
        .loop(false) // 默认开启循环播放
        .duration(1000)
        .vertical(false) // 默认横向切换
        .itemSpace("0px")
        .curve(Curve.Linear) // 动画曲线
        .onChange((index: number) => {
          console.info(index.toString())
        })
        .onAnimationStart((index: number) => {
          console.info(index.toString())
        })
        .onAnimationEnd((index: number) => {
          console.info(index.toString())
        })

        Flex({ justifyContent: FlexAlign.SpaceAround }) {
          Button('next')
            .onClick(() => {
              this.swiperController.showNext()
            })
          Button('preview')
            .onClick(() => {
              this.swiperController.showPrevious()
            })
        }
      }.margin({ top: 5 })


      Text("swiper-Curve")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("curveText")

    }.width("100%").height("100%")

  }
}

