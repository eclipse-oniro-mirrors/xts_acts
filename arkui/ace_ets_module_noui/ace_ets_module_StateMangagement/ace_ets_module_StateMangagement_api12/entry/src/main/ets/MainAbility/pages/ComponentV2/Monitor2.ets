/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
//继承场景被@Trace修饰
@ObservedV2
class MonitorObject {
  @Trace name: string;
  constructor(name: string) {
    this.name = name;
  }
}
@ObservedV2
class LogClassTrace {
  @Trace logStr: string[] = []
}
let log:LogClassTrace = new LogClassTrace()
@ObservedV2
class MonitorInfo extends MonitorObject {
  @Monitor('name')
  onNameChange(monitor: IMonitor) {
    log.logStr.push(`1-Info name change to ${monitor.value()?.now}`);
  }
}
@Entry
@ComponentV2
struct extendsMonitor {
  @Local info: MonitorInfo = new MonitorInfo('Tom');
  @Monitor('info')
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      log.logStr.push(`2-struct: ${path} change to ${monitor.value(path)?.now}`);
    })
  }
  build() {
    Row(){
      Column(){
        ForEach(log.logStr,(item:string)=>{
          Text(`${item}`).id('extends_mes')
        })
        Button('change name').id('extends_btn')
          .onClick(() => {
            this.info.name = 'Jack'
          })
      }.width('100%')
    }
    .height('100%')
  }
}