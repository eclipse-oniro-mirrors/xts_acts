/**
 * Copyright (c) 2026 iSoftStone Information Technology (Group) Co.,Ltd.
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
struct StackSyncLoad {

  build() {
    Column({space:2}) {
      Stack({ alignContent: Alignment.Bottom }) {
        Text('show in bottom').width(180).height(37).backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('show in top').width(160).height(20).backgroundColor(0xc1cbac).align(Alignment.Top)
      }
      .id('StackSyncLoad1')
      .syncLoad(true)
      Stack({ alignContent: Alignment.Bottom }) {
        Text('show in bottom').width(180).height(37).backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('show in top').width(160).height(20).backgroundColor(0xc1cbac).align(Alignment.Top)
      }
      .id('StackSyncLoad2')
      .syncLoad(false)
      Stack({ alignContent: Alignment.Bottom }) {
        Text('show in bottom').width(180).height(37).backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('show in top').width(160).height(20).backgroundColor(0xc1cbac).align(Alignment.Top)
      }
      .id('StackSyncLoad3')
      .syncLoad(null)
      Stack({ alignContent: Alignment.Bottom }) {
        Text('show in bottom').width(180).height(37).backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('show in top').width(160).height(20).backgroundColor(0xc1cbac).align(Alignment.Top)
      }
      .id('StackSyncLoad4')
      .syncLoad(undefined)
    }
    .width('100%')
    .height('100%')
  }
}