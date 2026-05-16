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
import { NavPushPathHelper } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct NavigationExample {
  pageInfo: NavPathStack = new NavPathStack()
  helper: NavPushPathHelper = new NavPushPathHelper(this.pageInfo)

  build() {
    Navigation(this.pageInfo) {
      Column() {
        Button('StartTest', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.helper.pushPath('hsptest1', { name: 'pageOne' }, false)
              .catch((error: BusinessError) => {
                console.error(`[pushPath]failed, error code = ${error.code}, error.message = ${error.message}.`);
              }).then(() => {
              console.error('[pushPath]success.');
            }); // 将name指定的NavDestination页面信息入栈。
          })
      }
    }.title('NavIndex')
  }
}