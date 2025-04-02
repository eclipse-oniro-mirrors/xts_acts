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
 
class MyLoadingProgressStyle implements ContentModifier<LoadingProgressConfiguration> {
  public enableLoading: boolean = false
  constructor(enableLoading: boolean){
    this.enableLoading = enableLoading
  }
  applyContent(): WrappedBuilder<[LoadingProgressConfiguration]>{
    return wrapBuilder(buildLoadingProgress)
  }
}
@Builder
function buildLoadingProgress(config: LoadingProgressConfiguration){
  Column() {
    Text('config.enableLoading是：' + (config.contentModifier as MyLoadingProgressStyle).enableLoading).fontColor(0x106836).fontSize(14).id('loadingProgressContentModifierKey01')
  }
}
@Entry
@Component
struct LoadingProgressDemoExample {
  build(){
    Column({ space: 5 }) {
      LoadingProgress()
        .color('#106836')
        .size({ width: 150 })
        .contentModifier(new MyLoadingProgressStyle(true))
    }.width('100%').margin({ top: 5 })
  }
}