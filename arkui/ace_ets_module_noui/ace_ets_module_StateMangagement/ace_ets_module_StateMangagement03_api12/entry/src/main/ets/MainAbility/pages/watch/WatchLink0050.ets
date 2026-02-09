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

@Component
struct ChildWatchLink0050 {
  @State watchValue: string = 'hello'
  @Watch('watchLink') @Link value: boolean
  watchLink() {
    this.watchValue = 'HelloArkUI'
  }

  build() {
    Text(this.watchValue)
      .id('tvChildWatchLink0050')
  }
}

@Entry
@Component
struct WatchLink0050 {
  @State value: boolean = false

  build() {
    Column() {
      Button('ChangeValue')
        .id('btnWatchLink0050')
        .onClick(()=>{
          this.value = !this.value
        })
      ChildWatchLink0050({value: this.value})
    }
  }
}