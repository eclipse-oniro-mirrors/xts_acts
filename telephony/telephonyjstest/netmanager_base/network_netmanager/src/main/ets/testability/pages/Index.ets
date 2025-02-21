/*
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

import testNapi from 'libconnectionndktest.so';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            console.log("getNetCapabilities---------------->" + testNapi.getNetCapabilities(11111));
            console.log("getNetCapabilities---------------->" + testNapi.getNetCapabilities(-1));
            console.log("getDefaultNet---------------->" + testNapi.getDefaultNet(-1));
            console.log("getDefaultNet---------------->" + testNapi.getDefaultNet(11111));
            console.log("getAllNets---------------->" + testNapi.getAllNets(-1));
            console.log("getAllNets---------------->" + testNapi.getAllNets(11111));
            console.log("getConnectionProperties---------------->" + testNapi.getConnectionProperties(-1));
            console.log("getConnectionProperties---------------->" + testNapi.getConnectionProperties(111111));
            console.log("getDefaultHttpProxy---------------->" + testNapi.getDefaultHttpProxy(-1));
            console.log("getDefaultHttpProxy---------------->" + testNapi.getDefaultHttpProxy(11111));
            console.log("isDefaultNetMetered---------------->" + testNapi.isDefaultNetMetered(-1));
            console.log("isDefaultNetMetered---------------->" + testNapi.isDefaultNetMetered(111111));
            console.log("hasDefaultNet---------------->" + testNapi.hasDefaultNet(-1));
            console.log("hasDefaultNet---------------->" + testNapi.hasDefaultNet(11111));
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}