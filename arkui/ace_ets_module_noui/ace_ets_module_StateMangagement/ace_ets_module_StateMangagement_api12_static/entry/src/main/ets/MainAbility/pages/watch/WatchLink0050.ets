'use static';
/*
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
  Color,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local,Provider
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Component
struct ChildWatchLink0050 {
  @State watchValue: string = 'hello'
  @Watch('watchLink') @Link value: boolean = true
  watchLink(Str:string) {
    this.watchValue = 'HelloArkUI'
  }

  build() {
    Text(this.watchValue)
      .id('tvChildWatchLink0050')
  }
}

@Entry
@Component
struct WatchLink0050 {
  @State value: boolean = false
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('WatchLink0050', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Button('ChangeValue')
        .id('btnWatchLink0050')
        .onClick((e: ClickEvent)=>{
          this.value = !this.value
        })
      ChildWatchLink0050({value: this.value})
    }
  }
}