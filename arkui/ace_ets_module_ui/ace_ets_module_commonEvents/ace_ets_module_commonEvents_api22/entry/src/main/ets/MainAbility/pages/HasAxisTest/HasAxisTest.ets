/*
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
@Component
struct HasAxis {
  @State hasAxis1: boolean = false
  @State hasAxis2: boolean = false
  build() {
    Column() {
      if (this.hasAxis1) {
        Text('true').id('has1')
      } else {
        Text('false').id('has1')
      }
      if (this.hasAxis2) {
         Text('true').id('has2')
      } else {
        Text('false').id('has2')
      }
      Button('onAxisEvent test')
         .id('button')
         .width('80%')
         .height('80%')
        .onAxisEvent(event => {
          if (event.hasAxis(0)) {
            this.hasAxis1 = true;
          }
          if (event.hasAxis(1)) {
            this.hasAxis2 = true;
          }
        })
    }
  }
}