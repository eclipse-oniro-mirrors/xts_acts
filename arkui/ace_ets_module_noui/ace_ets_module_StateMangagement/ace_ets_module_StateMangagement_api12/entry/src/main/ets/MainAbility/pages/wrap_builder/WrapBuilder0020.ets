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
import { ChildWrapBuilder0020 } from './ChildWrapBuilder0020'

@Entry
@ComponentV2

struct WrapBuilder0020 {
  globalBuilder: WrappedBuilder<[string, number]> = wrapBuilder(ChildWrapBuilder0020)

  build() {
    Column() {
      this.globalBuilder.builder('HelloWorld', Color.Green)
    }
  }
}