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

import { RichEditorModifier } from '@kit.ArkUI'


class MyRichEditorModifierSetExtraConfig extends RichEditorModifier {
  applyNormalAttribute?(instance: RichEditorAttribute): void {
    instance.onWillAttachIME((client: IMEClient) => {
      console.log(`Vincent MyRichEditorModifier ${client.nodeId}`)

      AppStorage.setOrCreate('RichEditorModifier_onWillAttachIME','onWillAttachIME')
      client.setExtraConfig({
        customSettings: {
          type: 'RichEditorModifier',
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


class MyRichEditorModifierUndefiend extends RichEditorModifier {
  applyNormalAttribute?(instance: RichEditorAttribute): void {
    instance.onWillAttachIME(undefined)
    }
}


@Entry
@Component
struct RichEditorOnWillAttachIME {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  options2: RichEditorOptions = { controller: this.controller2 };
  options3: RichEditorOptions = { controller: this.controller3 };
  options4: RichEditorOptions = { controller: this.controller4 };
  richEditorModifier: MyRichEditorModifierSetExtraConfig = new MyRichEditorModifierSetExtraConfig()
  richEditorModifier2: MyRichEditorModifierUndefiend = new MyRichEditorModifierUndefiend()

  build() {
    Column() {
      RichEditor(this.options1)
        .width('90%').height('5%')
        .onWillAttachIME(undefined)
        .onReady(() => {
          this.controller1.addTextSpan('RichEditor:onWillAttachIME undefined',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })

      RichEditor(this.options2)
        .width('90%').height('5%')
        .attributeModifier(this.richEditorModifier2)
        .onReady(() => {
          this.controller2.addTextSpan('RichEditorModifier:onWillAttachIME undefined',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })

      RichEditor(this.options3)
        .width('90%').height('7%')
        .id('RichEditorModifier_onWillAttachIME')
        .attributeModifier(this.richEditorModifier)
        .onReady(() => {
          this.controller3.addTextSpan('RichEditorModifier:onWillAttachIME',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })

      RichEditor(this.options4)
        .width('90%').height('5%')
        .id('RichEditor_onWillAttachIME')
        .onReady(() => {
          this.controller4.addTextSpan('RichEditor:onWillAttachIME',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 15
              }
            })
        })
        .onWillAttachIME((client: IMEClient) => {
          console.log(`Vincent RichEditor ${client.nodeId}`)

          AppStorage.setOrCreate('RichEditor_onWillAttachIME','onWillAttachIME')
          client.setExtraConfig({
            customSettings: {
              name: 'RichEditor',
              show: true,
              flag: 10,
              id: client.nodeId,
            }
          })
        })
    }
  }
}