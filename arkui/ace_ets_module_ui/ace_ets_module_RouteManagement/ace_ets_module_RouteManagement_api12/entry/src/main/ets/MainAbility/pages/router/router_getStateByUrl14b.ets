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

@Entry
@Component
struct router_getStateByUrl14b {
  @State str: string = ''

  build() {
    Column({ space: 5 }) {
      Text('getStateByUrl14b')

      Text(this.str).id('router_getStateByUrl14b_text').width('90%')

      Button('getStateByUrl')
        .id('router_getStateByUrl14b_btn')
        .onClick(() => {
          let options: Array<router.RouterState> = router.getStateByUrl('MainAbility/pages/router/router_getStateByUrl14b')
          for (let i: number = 0; i < options.length; i++) {
            let index = 'index=' + options[i].index
            let name = 'name=' + options[i].name
            let path = 'path=' + options[i].path
            let params = 'params=' + JSON.stringify(options[i].params)
            this.str = this.str + index + ';' + name + ';' + path + ';' + params + ';'
          }
        })

    }.width('100%').height('100%')

  }
}