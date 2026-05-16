
/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
let storage = new LocalStorage();
@Entry(storage)
@Component
struct WidgetCard {
  @LocalStorageProp('detail') detail: string = 'init';

  build() {
    Column() {
      Button('跳转')
        .margin('20%')
        .onClick(() => {
          console.info('postCardAction to EntryAbility');
          postCardAction(this, {
            'action': 'router',
            'abilityName': 'EntryAbility', // 只能跳转到当前应用下的UIAbility
            'params': {
              'detail': 'RouterFromCard'
            }
          });
        })
      Text(`${this.detail}`).margin('20%')
    }
    .width('100%')
    .height('100%')
  }
}