/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { MyRouterParam } from '../common/common';

const TAG: string = 'testTag-EntryAbility-Page3 ';

@Entry
@Component
struct EntryPage3 {
  @State message: string = 'EntryAbility三级页面';
  @State params: string = 'origin param';
  myArray: number[] = new Array(1024);

  aboutToAppear(): void {
    console.log(TAG + 'aboutToAppear');
    this.params = (router.getParams() as MyRouterParam).fromPage;
    console.log(TAG + 'aboutToAppear ' + this.params + 'array' + this.myArray);
  }

  onPageShow(): void {
    console.log(TAG + 'onPageShow');
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)

        Text(this.params)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}