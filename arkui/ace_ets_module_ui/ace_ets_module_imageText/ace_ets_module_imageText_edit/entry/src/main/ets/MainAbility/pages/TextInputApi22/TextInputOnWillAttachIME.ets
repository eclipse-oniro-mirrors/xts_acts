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

import { TextInputModifier } from '@kit.ArkUI'


class MyTextInputModifierSetExtraConfig extends TextInputModifier {
  applyNormalAttribute?(instance: TextInputAttribute): void {
    instance.onWillAttachIME((client: IMEClient) => {
      console.log(`Vincent MyTextInputModifier ${client.nodeId}`)

      AppStorage.setOrCreate('TextInputModifier_onWillAttachIME','onWillAttachIME')
      client.setExtraConfig({
        customSettings: {
          type: 'TextInputModifier',
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


class MyTextInputModifierUndefiend extends TextInputModifier {
  applyNormalAttribute?(instance: TextInputAttribute): void {
    instance.onWillAttachIME(undefined)
    }
}


@Entry
@Component
struct TextInputOnWillAttachIME {
  @State isHover: boolean = false
  textInputModifier: MyTextInputModifierSetExtraConfig = new MyTextInputModifierSetExtraConfig()
  textInputModifier2: MyTextInputModifierUndefiend = new MyTextInputModifierUndefiend()

  build() {
    Column() {
      TextInput({ text: 'TextInput onWillAttachIME undefined'})
        .width('90%').height('5%')
        .onChange((value: string) => {
          this.textInputModifier.setName(value)
        })
        .onWillAttachIME(undefined)

      TextInput({ text: 'TextInputModifier onWillAttachIME undefined'})
        .width('90%').height('5%')
        .attributeModifier(this.textInputModifier2)

      TextInput({ text: 'TextInputModifier onWillAttachIME'}).width('90%').height('5%')
        .id('TextInputModifier_onWillAttachIME')
        .attributeModifier(this.textInputModifier)
        .onChange((value: string) => {
          this.textInputModifier.setName(value)
        })

      TextInput({ text: 'TextInput onWillAttachIME'}).width('90%').height('5%')
        .id('TextInput_onWillAttachIME')
        .onChange((value: string) => {
          this.textInputModifier.setName(value)
        })
        .onWillAttachIME((client: IMEClient) => {
          console.log(`Vincent TextInput ${client.nodeId}`)

          AppStorage.setOrCreate('TextInput_onWillAttachIME','onWillAttachIME')
          client.setExtraConfig({
            customSettings: {
              name: 'TextInput',
              show: true,
              flag: 10,
              id: client.nodeId,
            }
          })
        })
    }
  }
}