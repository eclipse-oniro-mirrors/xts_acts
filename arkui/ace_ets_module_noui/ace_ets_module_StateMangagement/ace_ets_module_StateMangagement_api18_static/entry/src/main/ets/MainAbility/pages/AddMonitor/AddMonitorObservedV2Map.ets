'use static'

/**
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
import { UIUtils, Local, Trace, ObservedV2, IMonitor, IMonitorDecoratedVariable } from '@ohos.arkui.stateManagement';
import { ComponentV2, Entry, Column, Row, Button, Scroll, ForEach, Text, Divider, DatePicker, TextAlign, Color } from '@ohos.arkui.component';

//Map类型
@ObservedV2
class MapInfo {
  @Trace public memberMap: Map<number, string> = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]);
  public memberMapMonitor?: IMonitorDecoratedVariable;
  @Trace public text: string = '';

  constructor(){this.memberMapMonitor = UIUtils.addMonitor(() => this.memberMap, this.memberMapChange, { path: ['Map'] });}
  memberMapChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} has changed from ${m.value<Map<number, string>>(path)?.before} to ${m.value<Map<number, string>>(path)?.now}`);
      this.text = `[addMonitorTest] ${path} has changed from ${m.value<Map<number, string>>(path)?.before} to ${m.value<Map<number, string>>(path)?.now}`
    })
  }
}

@Entry
@ComponentV2
struct Page {
  @Local mapInfo: MapInfo = new MapInfo()

  build() {
    Scroll(undefined) {
      Column(undefined) {
        Text('@Observed/@Trace')
          .width('100%')
          .height('5%')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Pink)
        //监听Map
        Text(`${this.mapInfo.text}`)
          .id('ObservedMap')
          .height('5%')
        Text(`mapInfo: ${this.mapInfo.memberMap}`)
          .height('5%')
          .width('100%')
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
        Row(undefined) {
          Button(`mapInfo`)
            .id('ObservedMap1')
            .height('5%')
            .width('30%')
            .onClick((e) => {
              this.mapInfo.memberMap = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]);
            })
          Button('MapClear')
            .id('ObservedMap2')
            .height('5%')
            .width('30%')
            .onClick(() => {
              this.mapInfo.memberMap.clear();
            })
          Button(`clear Monitor`)
            .id('ObservedMapClear')
            .height('5%')
            .width('30%')
            .onClick((e) => {
              UIUtils.clearMonitor(this.mapInfo.memberMapMonitor!);
              console.info('[addMonitorTest]:clearMonitor success')
            })
        }
        Divider(undefined)
      }
    }
    .width('100%')
    .height('100%')
  }
}