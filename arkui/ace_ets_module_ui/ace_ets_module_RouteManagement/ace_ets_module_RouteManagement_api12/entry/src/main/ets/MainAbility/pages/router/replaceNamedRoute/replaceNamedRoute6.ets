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
import('./nameDetail5');


class routerParams20 {
  data1:string

  constructor(str:string) {
    this.data1 = str
  }
}

@Entry
@Component
struct replaceNamedRoute6 {
  @State str:string = 'replaceNamedRoute6'
  @State code:string = ''

  build() {
    Column({space:5}) {

      Text(this.str + 'code' + this.code).id('replaceNamedRoute6_text')

      Button('replaceNamedRoute6')
        .id('replaceNamedRoute6_btn')
        .onClick(()=>{
          router.replaceNamedRoute({
            name: 'nameDetail666666666',
            params: new routerParams20('message')
          })
            .then(() => {
            })
            .catch((err:BusinessError) => {
              this.code = err.code + ''
              console.error(`replaceNamedRoute failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%').height('100%')


  }
}