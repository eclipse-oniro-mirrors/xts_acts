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
struct getState1 {
  @State str:string = 'getState1'

  build() {
    Column({space:5}) {

      Text(this.str).id('getState1_text')

      Button('go to second')
        .id('getState1_btn')
        .onClick(()=>{
          router.pushUrl({url:'MainAbility/pages/router/getState/getState01', params:{age:18}})
        })


    }.width('100%').height('100%')


  }
}