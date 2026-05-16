'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, ComponentV2, Local, SyncMonitor, IMonitor, Column, Button,ObservedV2, Trace,Text  } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
 
@ComponentV2
struct SyncMonitorComponentV2 {
  @Local message: string = 'Hello World';
  @Local num: int = 0;
 
  @SyncMonitor(['message'])
  onStrChange(monitor: IMonitor) {
    this.num++
  }
 
  build() {
    Column() {
      Text(`${this.message}:${this.num}`)
        .id('MessageText')
        .height('5%')
      Button('change string')
        .id('componentV2Button')
        .height('5%')
        .onClick(() => {
          this.message += '!';
        })
    }
  }
}
 
 
@ObservedV2
export class Info {
  @Trace public name: string = 'Tom';
  @Trace public num: int = 0;
 
  // name被@Trace装饰，能够监听变化
  @SyncMonitor(['name'])
  onNameChange(monitor: IMonitor): void {
    this.num++
  }
 
}
 
 
@ComponentV2
struct SyncMonitorObservedV2 {
  info: Info = new Info();
 
  build() {
    Column() {
      Text(`${this.info.name}:${this.info.num}`)
        .id('NameText')
        .height('5%')
      Button('change name')
        .id('observedV2Button')
        .height('5%')
        .onClick(() => {
          this.info.name = 'Jack'; // 能够触发onNameChange方法
        })
    }
  }
}
 
 
@ObservedV2
export class ArrMonitor {
  @Trace public dimensionTwo: number[][] = [[1, 1, 1], [2, 2, 2], [3, 3, 3]];
  @Trace public num: int = 0;
 
 
  // dimensionTwo为二维简单类型数组，且被@Trace装饰，能够观测里面的元素变化
  @SyncMonitor(['dimensionTwo.0.0', 'dimensionTwo.1.1'])
  onDimensionTwoChange(monitor: IMonitor): void {
    monitor.dirty.forEach((path: string) => {
      this.num++
    })
  }
 
}
 
@ComponentV2
struct SyncMonitorObservedV2Arr {
  arrMonitor: ArrMonitor = new ArrMonitor();
 
  build() {
    Column() {
      Text(`${ this.arrMonitor.dimensionTwo[0][0]}:${ this.arrMonitor.num}`)
        .id('dimensionTwoText')
        .height('5%')
      Button('Change dimensionTwo')
        .id('arrButton')
        .height('5%')
        .onClick(() => {
          // 能够触发onDimensionTwoChange方法
          this.arrMonitor.dimensionTwo[0][0]++;
          this.arrMonitor.dimensionTwo[1][1]++;
        })
    }
  }
}
 
 
@Entry
@ComponentV2
struct SyncMonitorNotWildcards {
  build() {
    Column() {
      SyncMonitorComponentV2();
      SyncMonitorObservedV2();
      SyncMonitorObservedV2Arr();
    }
    .width('100%')
    .height('100%')
  }
}