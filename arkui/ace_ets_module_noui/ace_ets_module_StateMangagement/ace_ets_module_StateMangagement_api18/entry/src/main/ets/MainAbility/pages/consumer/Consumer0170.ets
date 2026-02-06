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
struct Consumer0170 {
  @Provider() valOne: number = 10
  build() {
    Column() {
      ChildConsumer01701()
    }
  }
}

@ComponentV2
struct ChildConsumer01701 {
  @Provider() valTwo: number = 100
  @Consumer('val') valOne: number = 5

  build() {
    Column() {
      Text(this.valOne.toString())
        .id('tvChildConsumer01701')
        .height('5%')
      ChildConsumer01702()
    }
  }
}

@ComponentV2
struct ChildConsumer01702 {
  @Consumer() val: number = 1000


  build() {
    Column() {
      Text(this.val.toString())
        .id('tvChildConsumer01702')
        .height('5%')
    }
  }
}