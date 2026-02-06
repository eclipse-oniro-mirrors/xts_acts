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
 
import { TextAreaModifier } from '@kit.ArkUI'


class MyTextAreaModifierSetExtraConfig extends TextAreaModifier {
  applyNormalAttribute?(instance: TextAreaAttribute): void {
    instance.onWillAttachIME((client: IMEClient) => {
      console.log(`Vincent MyTextAreaModifier ${client.nodeId}`)

      AppStorage.setOrCreate('TextAreaModifier_onWillAttachIME','onWillAttachIME')
      client.setExtraConfig({
        customSettings: {
          type: 'TextAreaModifier',
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


class MyTextAreaModifierUndefiend extends TextAreaModifier {
  applyNormalAttribute?(instance: TextAreaAttribute): void {
    instance.onWillAttachIME(undefined)
    }
}


@Entry
@Component
struct TextAreaOnWillAttachIME {
  @State isHover: boolean = false
  textAreaModifier: MyTextAreaModifierSetExtraConfig = new MyTextAreaModifierSetExtraConfig()
  textAreaModifier2: MyTextAreaModifierUndefiend = new MyTextAreaModifierUndefiend()

  build() {
    Column() {
      TextArea({ text: 'TextArea onWillAttachIME undefined'})
        .width('90%').height('5%')
        .onChange((value: string) => {
          this.textAreaModifier.setName(value)
        })
        .onWillAttachIME(undefined)

      TextArea({ text: 'TextAreaModifier onWillAttachIME undefined'})
        .width('90%').height('5%')
        .attributeModifier(this.textAreaModifier2)

      TextArea({ text: 'TextAreaModifier onWillAttachIME'}).width('90%').height('5%')
        .id('TextAreaModifier_onWillAttachIME')
        .attributeModifier(this.textAreaModifier)
        .onChange((value: string) => {
          this.textAreaModifier.setName(value)
        })

      TextArea({ text: 'TextArea onWillAttachIME'}).width('90%').height('5%')
        .id('TextArea_onWillAttachIME')
        .onChange((value: string) => {
          this.textAreaModifier.setName(value)
        })
        .onWillAttachIME((client: IMEClient) => {
          console.log(`Vincent TextArea ${client.nodeId}`)

          AppStorage.setOrCreate('TextArea_onWillAttachIME','onWillAttachIME')
          client.setExtraConfig({
            customSettings: {
              name: 'TextArea',
              show: true,
              flag: 10,
              id: client.nodeId,
            }
          })
        })
    }
  }
}