/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct TogglePage {
  @State type: ToggleType = ToggleType.Checkbox
  @State isOn: boolean = true
  @State selectedColor: string = '#FFFF0000'
  @State switchPointColor: string = '#FF008000'
  @State text: string = 'no change'
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('Toggle onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'type') {
        this.type = message.value
      }
      if (message.name == 'isOn') {
        this.isOn = message.value
      }
      if (message.name == 'selectedColor') {
        this.selectedColor = message.value
      }
      if (message.name == 'switchPointColor') {
        this.switchPointColor = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 10 }) {
      Text('type: Switch').fontSize(12).fontColor(0xcccccc).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: ToggleType.Switch})
          .key('toggleSwitch')
          .selectedColor('#007DFF')
          .switchPointColor(this.switchPointColor)
          .onChange((isOn: boolean) => {
            this.text = "switch " + isOn.toString()
            console.info('Component status:' + isOn)
          })

        Toggle({ type: ToggleType.Switch, isOn: true })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
      }

      Text('type: Checkbox').fontSize(12).fontColor(0xcccccc).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: this.type, isOn: this.isOn })
          .key('toggleCheckbox')
          .size({ width: 20, height: 20 })
          .selectedColor(this.selectedColor)
          .onChange((isOn: boolean) => {
            this.text = "checkbox " + isOn.toString()
            console.info('Component status:' + isOn)
          })

        Toggle({ type: ToggleType.Checkbox, isOn: true })
          .size({ width: 20, height: 20 })
          .selectedColor('#007DFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
      }

      Text('type: Button').fontSize(12).fontColor(0xcccccc).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: ToggleType.Button, isOn: false }) {
          Text('status button').fontColor('#182431').fontSize(12)
        }.width(106)
        .key('toggleButton')
        .selectedColor('rgba(0,125,255,0.20)')
        .onChange((isOn: boolean) => {
          this.text = "button " + isOn.toString()
          console.info('Component status:' + isOn)
        })

        Toggle({ type: ToggleType.Button, isOn: true }) {
          Text('status button').fontColor('#182431').fontSize(12)
        }.width(106)
        .selectedColor('rgba(0,125,255,0.20)')
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })
      }
      Text(this.text).fontSize(20).margin(10).key('text')
    }.width('100%').padding(24)
  }
}