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

const TAG: string = 'testTag-ProtectAbility-Page1 ';

@Entry
@Component
struct ProtectPage1 {
  @State message: string = '不允许备份的ability-页面';
  params: string = 'ProtectAbility recovery params';

  aboutToAppear(): void {
    console.log(TAG + 'aboutToAppear');
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

        Button('router跳转到二级页面')
          .fontSize('16fp')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ProtectPage2',
              params: new MyRouterParam(this.params)
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
