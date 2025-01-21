/*
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
 import {MessageManager,Callback} from '../utils/MessageManager';

class MyDataSourceA implements IDataSource {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): number {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct SwiperAnimationExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSourceA = new MyDataSourceA([])
  @State onAnimationS:string = "s";
  @State onAnimationE:string = "e";
  @State onAnimationGesture:string = "GestureSwipe";
  @State autoPlay:boolean = false;

  messageManager = new MessageManager<boolean>()
  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceA(list)
  }
  
 onPageShow() {
    console.info('swiperAnimation onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<boolean> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'autoPlay') {
        this.autoPlay = message.value
      }
    
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item)
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(this.autoPlay)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(300)
      .itemSpace(0)
      .key('swiperAnimation')
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      }, false)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })
      .onGestureSwipe((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info("GestureSwipe index: " + index)
        this.onAnimationGesture = "GestureSwipe index: " + index;
        console.info("current offset: " + extraInfo.currentOffset)
      })
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        this.onAnimationS = "Start"+ index + "-->" + targetIndex;
        console.info("index: " + index)
        console.info("targetIndex: " + targetIndex)
        console.info("current offset: " + extraInfo.currentOffset)
        console.info("target offset: " + extraInfo.targetOffset)
        console.info("velocity: " + extraInfo.velocity)
      })
      .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
        this.onAnimationE = "End"+ index + "-->";
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })

      Row({ space: 12 }) {
        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext()
          }).key('showNext')
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()
          }).key('showPrevious')
      }.margin(5)
    
      Text(this.onAnimationS).margin({top:20}).key('animationStart')
      Text(this.onAnimationE).margin({top:20}).key('animationEnd')
      Text(this.onAnimationGesture).margin({top:20}).key('GestureSwipe')

    }.width('100%')
    .margin({ top: 5 })
  }
}
