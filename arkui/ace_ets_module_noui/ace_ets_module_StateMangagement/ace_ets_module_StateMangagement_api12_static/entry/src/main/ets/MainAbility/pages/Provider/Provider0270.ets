'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,DragEvent,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,Param,Provider,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

@ComponentV2
struct ChildProvider0270 {
  @Local childX: number = 0
  @Local childY: number = 0
  @Consumer onDrag: (x: number, y: number) => void = (x: number, y: number):void => {
  }

  build() {
    Column() {
      Text(`x: ${this.childX}, y: ${this.childY}`)
        .id('tvChildProvider0270')
      Button('DragStart')
        .id('btnChildProvider0270')
        .draggable(true)
        .onDragStart((event:DragEvent,extraParams?:string):(()=>void) => {
          this.onDrag(event.getDisplayX(), event.getDisplayY())
          this.childX = event.getDisplayX()
          this.childY = event.getDisplayY()
          return ()=>{}
        })
    }
  }
}

@Entry
@ComponentV2
struct Provider0270 {
  @Local childX: number = 0
  @Local childY: number = 0
  @Provider onDrag: (x: number, y: number) => void = (x: number, y: number):void => {
    this.childX = x
    this.childY = y
  }

  build() {
    Column() {
      Text(`x: ${this.childX}, y: ${this.childY}`)
        .id('tvProvider0270')
      ChildProvider0270()
    }
    .width('100%')
    .height('100%')
  }
}