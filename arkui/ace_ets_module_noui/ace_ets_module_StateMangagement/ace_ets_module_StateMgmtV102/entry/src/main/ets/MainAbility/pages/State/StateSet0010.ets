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
struct StateSet0010 {
  @State set: Set<string> = new Set(['World'])

  build() {
    Column() {
      Text('Hello'+Array.from(this.set.values()).toString()).id('tvStateSet0010Title')
      Button('Add')
        .id('btnStateSet0010Set')
        .onClick(()=>{
          this.set.add('ARKUI')
        })
      Button('Delete')
        .id('btnStateSet0010Delete')
        .onClick(()=>{
          this.set.delete('ARKUI')
        })
      Button('Clear')
        .id('btnStateSet0010Clear')
        .onClick(()=>{
          this.set.clear()
        })
    }
  }
}