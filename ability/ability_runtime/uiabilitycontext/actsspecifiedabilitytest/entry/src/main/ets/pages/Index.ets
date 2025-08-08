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
import { common } from '@kit.AbilityKit';

const demo3BundleName = 'com.acts.ability.specifiedability.demo3';

@Entry
@Component
struct Index {
  @State message: string = 'Hello Entry';

  build() {
    Column() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message = 'Welcome';
        })
      Button() {
        Text('start crash')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
      }
      .onClick(async () => {
        let context = getContext(this) as common.UIAbilityContext;
        await context.startAbility({
          bundleName: demo3BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            triggerCrash: true
          }
        });
        await context.startAbility({
          bundleName: demo3BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            noexit: true
          }
        });
      })
    }
    .height('100%')
    .width('100%')
  }
}