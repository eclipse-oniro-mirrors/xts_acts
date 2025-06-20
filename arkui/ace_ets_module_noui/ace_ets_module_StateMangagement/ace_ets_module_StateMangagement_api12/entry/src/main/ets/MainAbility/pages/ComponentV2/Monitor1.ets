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
//监听的变量未被装饰器修饰，被@Local修饰
@Entry
@ComponentV2
struct MonitorLocal {
  message: string = 'Hello World';
  @Local name: string = 'Tom';
  @Monitor('message', 'name')
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      console.log(`${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`)
    })
  }
  build() {
    Column() {
      Text(`${this.message}`).id('null_mes')
      Text(`${this.name}`).id('local_name')
      Button('change string').id('change_monitor_text')
        .onClick(() => {
          this.message += '!!!';
          this.name = 'Jack';
        })
    }
  }
}