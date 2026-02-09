'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  SwiperController,
  Column,
  Text,
  LazyForEach,
  Margin,
  IDataSource,
  DataChangeListener,
  DotIndicator,
  ColumnOptions,
  Swiper,
  TextAlign,
  Color,
  EdgeEffect,
  Visibility,
  ClickEvent,
  SwiperDisplayMode,
  SwiperAnimationEvent,
  Row,
  RowOptions,
  Button,
  Curve,
  SwiperAnimationEvent,
  HorizontalAlign,
  ArrowStyle,
  SwiperAutoFill,
  Padding,
  Indicator,
  FontWeight,
  Flex,
  FlexAlign
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../common/MessageManager1';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

class MyDataSource implements IDataSource<string> {
  private list: string[] = []
  private listener?: DataChangeListener = undefined

  constructor(list: string[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): string {
    return this.list[index as int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])
  @State index: int = 1
  @State displayCount: int = 3
  @State displayMode: SwiperDisplayMode = SwiperDisplayMode.STRETCH
  //SwiperDisplayMode.AutoLinear
  @State edgeEffect: EdgeEffect = EdgeEffect.None
  @State autoPlay: boolean = false
  @State interval: int = 4000
  @State indicator: boolean = true
  @State loop: boolean = false
  @State duration: int = 1000
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
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string, index: int) => {
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
      .autoPlay(this.autoPlay, undefined)
      .interval(this.interval)
      .indicator(this.indicator)
      .loop(this.loop)
      .duration(this.duration)
      .vertical(this.vertical)
      .itemSpace(this.itemSpace)
      .displayMode(this.displayMode)
      .displayCount(this.displayCount)
      .effectMode(this.edgeEffect)
      // .indicator(
      //   new DotIndicator()
      //     .top(20)
      //     .right(20)
      //     .itemWidth(2)
      //     .itemHeight(2)
      //     .color(Color.Blue))  //导致页面白屏 注释掉
      .key('swiper')
      .onChange((index: int): void => {
        console.info(index.toString())
        this.onActionCalledThree = true;
        console.info('onChange current action state is: ' + this.onActionCalledThree);
        try {
          let backData: events_emitter.EventData = {
            data: {
              "ACTION": this.onActionCalledThree,
            } as Record<String,RecordData>
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
          .onClick((e: ClickEvent) => {
            this.swiperController.showNext();
            this.onActionCalledOne = true;
            console.info('button1 current action state is: ' + this.onActionCalledOne);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.onActionCalledOne,
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 205,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("button1 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err: Error) {
              console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        Button('preview')
          .key('button2')
          .onClick((e: ClickEvent) => {
            this.swiperController.showPrevious()
            this.onActionCalledTwo = true;
            console.info('button2 current action state is: ' + this.onActionCalledTwo);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.onActionCalledTwo,
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 206,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("button2 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err: Error) {
              console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
      }
    }.margin({ top: 5 } as Margin)
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

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.log('stateChangCallBack eventData = ',eventData)
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,RecordData>
      if(data['index'] != null) {
        this.index = data['index'] as int;
      }
      if(data['autoPlay'] != null) {
        this.autoPlay = data['autoPlay'] as boolean;
        console.log('stateChangCallBack autoPlay = ',this.autoPlay)

      }
      if(data['interval'] != null) {
        this.interval = Number.parseInt(data['interval'] as string).toInt();
        console.log('stateChangCallBack interval = ' + this.interval)
      }
      if(data['indicator'] != null) {
        this.indicator = data['indicator'] as boolean;
      }
      if(data['loop'] != null) {
        this.loop = data['loop'] as boolean;
      }
      if(data['duration'] != null) {
        this.duration = data['duration'] as int;
        console.log('stateChangCallBack duration = ',this.duration)
      }
      if(data['vertical'] != null) {
        this.vertical = data['vertical'] as boolean;
      }
      if(data['itemSpace'] != null) {
        this.itemSpace = Number.parseInt(data['itemSpace'] as string);
        console.log('stateChangCallBack itemSpace = ' + this.itemSpace)
      }
    }
  }
}