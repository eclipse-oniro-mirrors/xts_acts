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
import router from '@ohos.router'
import { BusinessError } from '@ohos.base'

@Entry
@Component
struct focus1 {
  @State str:string = 'focus1'

  build() {
    Column({space:5}) {

      Text(this.str).id('focus1_text')

      Button('getParams')
        .id('focus1_btn1')
        .onClick(()=>{
          this.str = JSON.stringify(router.getParams()) + ''
        })

      Button('go to second')
        .id('focus1_btn2')
        .onClick(()=>{
          router.pushUrl({url:"MainAbility/pages/router/focus/focus01"})
        })


    }.width('100%').height('100%')
  }
}