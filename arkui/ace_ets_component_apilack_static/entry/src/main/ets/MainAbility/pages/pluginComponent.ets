'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  $rawfile,
  Alignment,
  Button,
  ClickEvent,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  Image,
  ItemAlign,
  Margin,
  Path,
  PluginComponent,
  PluginErrorData,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { State, StorageLink } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

// import plugin from "../common/plugin_component.js"
class ObjPlugin {
  source: string = '';
  bundleName: string = '';
}

@Entry
@Component
struct PluginUserExample {
  @StorageLink("plugincount") plugincount: ObjPlugin[] = [
    { source: 'plugincomponent1', bundleName: 'com.example.plugin' },
    { source: 'plugintemplate', bundleName: 'com.example.myapplication' },
    { source: 'plugintemplate', bundleName: 'com.example.myapplication' }]

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('Register Request Listener')
        .fontSize(30)
        .width(400)
        .height(100)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          // plugin.onListener()
          console.log("Button('Register Request Listener')")
        })
      Button('Request')
        .fontSize(50)
        .width(400)
        .height(100)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          // plugin.Request()
          console.log("Button('Request')")
        })
      ForEach(this.plugincount, (item: ObjPlugin) => {
        PluginComponent({
          template: { source: 'plugincomponent1', bundleName: 'com.example.plugin' },
          data: { 'countDownStartValue': 'new countDownStartValue' } as Record<String, RecordData>
        }).size({ width: 500, height: 100 })
          .onComplete(() => {
            console.log("onComplete")
          })
          .onError((error: PluginErrorData) => {
            console.log("onComplete" + error.errcode + ":" + error.msg)
          })
      })
    }
    .width('100%')
    .height('100%')
  }
}

