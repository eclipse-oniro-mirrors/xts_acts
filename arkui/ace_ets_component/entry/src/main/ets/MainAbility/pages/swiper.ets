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

import events_emitter from '@ohos.events.emitter'

class MyDataSource implements IDataSource {
  private list: string[] = []
  private listener?: DataChangeListener

  constructor(list: string[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): string {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])
  @State index: number = 1
  @State displayCount: number = 3
  @State displayMode: number = SwiperDisplayMode.AutoLinear
  @State edgeEffect: number = EdgeEffect.None
  @State autoPlay: boolean = false
  @State interval: number = 4000
  @State indicator: boolean = true
  @State loop: boolean = false
  @State duration: number = 1000
  @State vertical: boolean = false
  @State itemSpace: number = 0
  @State onActionCalledOne: boolean = false;
  @State onActionCalledTwo: boolean = false;
  @State onActionCalledThree: boolean = false;

  aboutToAppear(): void {
    let list: string[] = []
    for (let i: number = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
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
            .fontSize(20)
        })
      }
      .cachedCount(2)
      .index(this.index)
      .autoPlay(this.autoPlay)
      .interval(this.interval)
      .indicator(this.indicator)
      .loop(this.loop)
      .duration(this.duration)
      .vertical(this.vertical)
      .itemSpace(this.itemSpace)
      .displayMode(this.displayMode)
      .displayCount(this.displayCount)
      .effectMode(this.edgeEffect)
      .indicatorStyle({ top: 20, right: 20, size: 2, color: Color.Blue })
      .key('swiper')
      .onChange((index: number) => {
        console.info(index.toString())
        this.onActionCalledThree = true;
        console.info('onChange current action state is: ' + this.onActionCalledThree);
        try {
          let backData: events_emitter.EventData = {
            data: {
              "ACTION": this.onActionCalledThree,
            }
          }
          let backEvent: events_emitter.InnerEvent = {
            eventId: 204,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("onChange start to emit action state")
          events_emitter.emit(backEvent, backData)
        } catch (err) {
          console.info("onChange emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('next')
          .key('button1')
          .onClick(() => {
            this.swiperController.showNext();
            this.onActionCalledOne = true;
            console.info('button1 current action state is: ' + this.onActionCalledOne);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.onActionCalledOne,
                }
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 205,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("button1 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        Button('preview')
          .key('button2')
          .onClick(() => {
            this.swiperController.showPrevious()
            this.onActionCalledTwo = true;
            console.info('button2 current action state is: ' + this.onActionCalledTwo);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.onActionCalledTwo,
                }
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 206,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("button2 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
      }
    }.margin({ top: 5 })
  }

  onPageShow() {
    console.info('swiper page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 207,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 208,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 209,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 210,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("swiper page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.index != null) {
        this.index = eventData.data.index;
      }
      if (eventData.data?.autoPlay != null) {
        this.autoPlay = eventData.data.autoPlay;
      }
      if (eventData.data?.interval != null) {
        this.interval = eventData.data.interval;
      }
      if (eventData.data?.indicator != null) {
        this.indicator = eventData.data.indicator;
      }
      if (eventData.data?.loop != null) {
        this.loop = eventData.data.loop;
      }
      if (eventData.data?.duration != null) {
        this.duration = eventData.data.duration;
      }
      if (eventData.data?.vertical != null) {
        this.vertical = eventData.data.vertical;
      }
      if (eventData.data?.itemSpace != null) {
        this.itemSpace = eventData.data.itemSpace;
      }
    }
  }
}