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
import router from '@ohos.router'

@Entry
@Component
struct routerParams_1 {
  @State str: string = '1'

  aboutToAppear() {
    this.str = JSON.stringify(router.getParams())
  }

  build() {
    Column({ space: 5 }) {
      Text(this.str).id('text_Params1').margin({ top: 50 })
    }
    .width('100%')
    .height('100%')
  }
}