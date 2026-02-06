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

@Entry
@ComponentV2
struct MonitorNull {
  @Local class001: MonitonNull001 = new MonitonNull001();
  aboutToAppear(): void {
    this.class001.class002 = null;
  }
  @Monitor ('class001.class002.class003.x')
  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }
  build() {
    Text(`${this.class001.class002 === null ? 'null' : 'ww'}`)
      .id('Monitor_Null_001')
  }
}

@ObservedV2
class MonitonNull001{
  @Trace public class002:MonitonNull002 | null = new MonitonNull002();
}

@ObservedV2
class MonitonNull002{
  @Trace public  class003:MonitonNull003 = new MonitonNull003();
}

@ObservedV2
class MonitonNull003{
  @Trace public  x: number = 0;
}