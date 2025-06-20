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

@ComponentV2
struct ChildMonitor0280 {
  @Param val: string = ''
  @Local name: string = 'Hello'

  @Monitor('val')
  onChange(monitor: IMonitor) {
    this.name += monitor.value()?.now
  }

  build() {
    Column() {
      Text(this.name)
        .id('tvChildMonitor0280')
    }
  }
}

@Entry
@ComponentV2
struct Monitor0280 {
  @Local val: string = 'Hello'

  build() {
    Column() {
      Button('Click')
        .id('btnMonitor0280')
        .onClick(() => {
          this.val = 'World'
        })
      ChildMonitor0280({ val: this.val })
    }
  }
}