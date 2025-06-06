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
import hilog from '@ohos.hilog';

const TAG: string = 'testTag-AnotherAbility-Page1 ';

@Entry
@Component
struct AnotherPage1 {
  @State message: string = 'AnotherAbility首页';
  params: string = 'AnotherAbility recovery params';

  aboutToAppear() {
    hilog.info(0x0000, TAG, '%{public}s', 'EntryAbility index aboutToAppear');
  }

  onPageShow(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'EntryAbility index onPageShow');
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
              url: 'pages/AnotherPage2',
              params: new MyRouterParam(this.params)
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}