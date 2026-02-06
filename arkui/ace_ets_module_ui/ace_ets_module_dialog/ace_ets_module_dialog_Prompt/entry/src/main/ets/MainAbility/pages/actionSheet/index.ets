/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';

interface ListCategories {
  title: string,
  utl: string
}

@Entry
@Component
struct Index {
  @State message: string = ''
  private items: ListCategories[] = [
    { title: 'actionSheet', utl: 'pages/actionSheet' },
  ]

  build() {
    Column() {
      Text('')
        .fontSize(22)
        .fontColor(0xFFFFFF)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .height(50)
        .backgroundColor('#2ebd82')
      List({ space: '10vp' }) {
        ForEach(this.items, (item: ListCategories) => {
          ListItem() {
            Text(item.title).fontSize(16).fontWeight(FontWeight.Bold)
          }
          .width('90%')
          .height('40vp')
          .backgroundColor('#ff53ecd9')
          .borderRadius(10)
          .onClick(() => {
            this.message = 'Page:' + item.utl
            router.pushUrl({ url: item.utl })
          })
        })
      }.alignListItem(ListItemAlign.Center).margin({ top: '10vp' }).width('100%').height('80%')

      Text(this.message).fontSize(20)
    }.width('100%').height('100%')
  }
}
