/**
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

@Entry
@ComponentV2
struct MonitorValueTest {
  @Local name: string = 'Tom';
  @Local path1: string | undefined = '';
  @Local path2: string | undefined = '';
  @Local path3: string | undefined = '';
  @Monitor('name')
  onNameChange(monitor: IMonitor) {
    this.path1 = monitor.value('')?.path;
    this.path2 = monitor.value(null)?.path;
    this.path3 = monitor.value(undefined)?.path;
    // value的返回值为IMonitorValue类型，可以通过该返回值获取变量变化的信息
    console.info(`path: ${monitor.value()?.path} change from ${monitor.value()?.before} to ${monitor.value()?.now}`);
  }

  build() {
    Column() {
      Text(`name: ${this.name}`)
      Button('change name')
        .height('5%')
        .id('monitor_change_name')
        .onClick(() => {
          this.name = 'Bob'; // 输出日志：path: name change from Tom to Bob
        })
      Text(`path1: ${this.path1}`)
        .height('5%')
        .id('monitor_path1')
      Text(`path2: ${this.path2}`)
        .height('5%')
        .id('monitor_path2')
      Text(`path3: ${this.path3}`)
        .height('5%')
        .id('monitor_path3')
    }
  }
}