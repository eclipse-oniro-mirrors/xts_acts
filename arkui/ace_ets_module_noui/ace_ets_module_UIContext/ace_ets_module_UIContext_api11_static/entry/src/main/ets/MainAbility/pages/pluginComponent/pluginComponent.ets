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
  Entry, Component, Flex, FlexDirection, ItemAlign, FlexAlign,
  Alignment, TextAlign, TextOverflow, PluginErrorData,
  Column, ColumnOptions, Row, Builder, TouchEvent,Color,
  WrappedBuilder, NodeContainer, ForEach, PluginComponent, PluginComponentTemplate, PluginComponentOptions,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint, CustomBuilderT
} from '@ohos.arkui.component'

import { RecordData } from '@ohos.base';
import { StorageLink } from '@ohos.arkui.stateManagement';

interface plugincountObj {
  source: string;
  bundleName: string
}

@Entry
@Component
struct PluginUserExample {
  @StorageLink("plugincount") plugincount: plugincountObj[] = [
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
        .onClick((e:ClickEvent) => {
          // plugin.onListener()
          console.log("Button('Register Request Listener')")
        })
      Button('Request')
        .fontSize(50)
        .width(400)
        .height(100)
        .margin({ top: 20 } as Margin)
        .onClick((e:ClickEvent) => {
          // plugin.Request()
          console.log("Button('Request')")
        })
      ForEach(this.plugincount, (item: plugincountObj) => {
        PluginComponent({
          template: { source: 'plugincomponent1', bundleName: 'com.example.plugin' as string } as PluginComponentTemplate,
          data: { 'countDownStartValue': 'new countDownStartValue' } as Record<string, RecordData>
        } as PluginComponentOptions).size({ width: 500, height: 100 })
          .onComplete(():void => {
            console.log("onComplete")
          })
          .onError((error:PluginErrorData) => {
            const errcode = error.errcode;
            const msg = error.msg;
            console.log("onComplete" + errcode + ":" + msg)
          })
      })
    }
    .width('100%')
    .height('100%')
  }
}

