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
import ('./pageOne')

@Entry({ routeName: 'pushNamedRoute24' })
@Component
struct pushNamedRoute24 {
  @State text1:string = ''

  build() {
    Column() {
      Text('pushNamedRoute24').id('pushNamedRoute24_text1')
      Text(this.text1).id('pushNamedRoute24_text2')
      Button('pushNamedRoute').onClick((event: ClickEvent) => {
        router.pushNamedRoute({
          name: 'page2'
        },router.RouterMode.Single, (err) => {
          if (err) {
            this.text1 = '' +  (err as BusinessError).code
            return;
          }
        })
      })
        .id('pushNamedRoute24_btn1')
    }
  }
}