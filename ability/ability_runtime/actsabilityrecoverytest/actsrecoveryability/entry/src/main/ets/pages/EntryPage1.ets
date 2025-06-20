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
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';

const TAG: string = 'testTag-EntryAbility-Page1 ';

function sleep(s: number): Promise<void> {
  return new Promise((resolve, reject) => {
    setTimeout(resolve, s * 1000);
  });
}

@Entry
@Component
struct EntryPage1 {
  @State message: string = 'EntryAbility首页';
  params: string = 'EntryAbility recovery params';
  subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

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
              url: 'pages/EntryPage2',
              params: new MyRouterParam(this.params)
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}