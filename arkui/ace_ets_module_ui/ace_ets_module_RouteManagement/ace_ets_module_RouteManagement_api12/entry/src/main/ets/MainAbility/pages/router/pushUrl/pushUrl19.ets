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
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct pushUrl19 {
  @State text1:string = ''

  build() {
    Column() {
      Text('pushUrl19').id('pushUrl19_text1')
      Text(this.text1).id('pushUrl19_text2')
      Button('pushUrl').onClick((event: ClickEvent) => {
        for(let i = 0 ; i <= 33; i++){
          router.pushUrl({
            url: 'MainAbility/pages/router/pushUrl/pushUrl19',
          }, router.RouterMode.Standard, (err) => {
            if (err) {
              this.text1 = '' +  err.code
              return;
            }
            console.info('pushUrl success');
          })
        }
      })
        .id('pushUrl19_btn1')
    }
  }
}