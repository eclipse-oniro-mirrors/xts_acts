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
struct SyncMonitor0020 {
  @Local name: string = 'Tom'
  @Local age: number = 0

  @SyncMonitor('name')
  onNameChange(monitor: IMonitor) {
    this.age++;
  }

  build() {
    Column() {
      Text(`${this.age}`)
        .id('textSyncMonitor0020')
      Button(`Change Name ${this.name}`)
        .id('btnSyncMonitor0020')
        .onClick(()=>{
          for(let i = 1; i <= 2; i++){
            this.name += '!'
          }
        })
    }
  }
}