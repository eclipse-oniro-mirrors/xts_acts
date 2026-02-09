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

@Entry
@Component
struct StateMap0010 {
  @State map: Map<string, string> = new Map()

  aboutToAppear(): void {
    this.map.set('map1', 'World')
  }

  build() {
    Column() {
      Text('Hello'+Array.from(this.map.values()).toString()).id('tvStateMap0010Title')
      Button('Set')
        .id('btnStateMap0010Set')
        .onClick(()=>{
          this.map.set('map2', 'ARKUI')
        })
      Button('Delete')
        .id('btnStateMap0010Delete')
        .onClick(()=>{
          this.map.delete('map2')
        })
      Button('Clear')
        .id('btnStateMap0010Clear')
        .onClick(()=>{
          this.map.clear()
        })
    }
  }
}