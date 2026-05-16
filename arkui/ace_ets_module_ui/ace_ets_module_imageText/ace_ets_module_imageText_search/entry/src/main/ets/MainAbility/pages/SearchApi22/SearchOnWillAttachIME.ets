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

import { SearchModifier } from '@kit.ArkUI'

class MySearchModifierSetExtraConfig extends SearchModifier {
  applyNormalAttribute?(instance: SearchAttribute): void {
    instance.onWillAttachIME((client: IMEClient) => {
      console.log(`Vincent MySearchModifier ${client.nodeId}`)

      AppStorage.setOrCreate('SearchModifier_onWillAttachIME','onWillAttachIME')
      client.setExtraConfig({
        customSettings: {
          type: 'SearchModifier',
          name: this.name,
          id: client.nodeId,
          show: true,
          flag: 10,
        }
      })
    })
  }

  private name: string = ''

  setName(name: string) {
    this.name = name
  }
}


class MySearchModifierUndefiend extends SearchModifier {
  applyNormalAttribute?(instance: SearchAttribute): void {
    instance.onWillAttachIME(undefined)
    }
}


@Entry
@Component
struct SearchOnWillAttachIME {
  @State isHover: boolean = false
  searchModifier: MySearchModifierSetExtraConfig = new MySearchModifierSetExtraConfig()
  searchModifier2: MySearchModifierUndefiend = new MySearchModifierUndefiend()

  build() {
    Column() {
      Search({ value: 'Search onWillAttachIME undefined'})
        .width('90%').height('5%')
        .onChange((value: string) => {
          this.searchModifier.setName(value)
        })
        .onWillAttachIME(undefined)

      Search({ value: 'SearchModifier onWillAttachIME undefined'})
        .width('90%').height('5%')
        .attributeModifier(this.searchModifier2)

      Search({ value: 'SearchModifier onWillAttachIME'}).width('90%').height('5%')
        .id('SearchModifier_onWillAttachIME')
        .attributeModifier(this.searchModifier)
        .onChange((value: string) => {
          this.searchModifier.setName(value)
        })

      Search({ value: 'Search onWillAttachIME'}).width('90%').height('5%')
        .id('Search_onWillAttachIME')
        .onChange((value: string) => {
          this.searchModifier.setName(value)
        })
        .onWillAttachIME((client: IMEClient) => {
          console.log(`Vincent Search ${client.nodeId}`)

          AppStorage.setOrCreate('Search_onWillAttachIME','onWillAttachIME')
          client.setExtraConfig({
            customSettings: {
              name: 'Search',
              show: true,
              flag: 10,
              id: client.nodeId,
            }
          })
        })
    }
  }
}