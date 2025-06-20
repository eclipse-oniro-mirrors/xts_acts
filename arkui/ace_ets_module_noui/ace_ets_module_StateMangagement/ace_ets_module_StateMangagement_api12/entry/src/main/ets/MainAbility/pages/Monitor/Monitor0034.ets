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
import prompt from '@system.prompt';

@ObservedV2
class Monitor0034Class {
  @Trace
  private _name: string = 'Tom';

  public set name(value: string) {
    this._name = value;
  }

  public get name(): string {
    return this._name;
  }
}

@ObservedV2
class Monitor0034ChildClass extends Monitor0034Class {
  @Monitor('name')
  onNameChange(monitor: IMonitor) {
    prompt.showToast({ message: `name: ${monitor.value()?.now}`, duration: 2000 })
  }
}

@Entry
@ComponentV2
struct Monitor0034 {
  cls: Monitor0034ChildClass = new Monitor0034ChildClass()

  build() {
    Column() {
      Button(`Change Name ${this.cls.name}`)
        .id('btnMonitor0034')
        .onClick(()=>{
          this.cls.name = 'Jack'
        })
    }
  }
}