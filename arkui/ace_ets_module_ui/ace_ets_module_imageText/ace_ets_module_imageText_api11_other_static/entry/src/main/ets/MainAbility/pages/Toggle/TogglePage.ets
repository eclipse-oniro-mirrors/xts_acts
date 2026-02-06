'use static';
/**
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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ToggleType,
  Toggle
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TogglePage {
  @State type: ToggleType = ToggleType.Checkbox
  @State isOn: boolean = true
  @State selectedColor: string | int = '#FFFF0000'
  @State switchPointColor: string = '#FF008000'
  @State text: string = 'no change'
  messageManager: MessageManager<ToggleType | boolean | string | number> = new MessageManager<ToggleType | boolean | string | number>()

  onPageShow() {
    console.info('Toggle onPageShow')
    AppStorage.setOrCreate<MessageManager<ToggleType | boolean | string | number>>("messageManager", this.messageManager);
    let callback: Callback<ToggleType | boolean | string | number> = (message: Message<ToggleType | boolean | string | number>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'type' && !(message.value instanceof number)) {
        this.type = message.value as ToggleType
      }
      if (message.name == 'isOn' && !(message.value instanceof string)) {
        this.isOn = message.value as Boolean
      }
      if (message.name == 'selectedColor') {
        if (message.value instanceof string) {
          this.selectedColor = message.value as String
        } else {
          this.selectedColor = (message.value as number).toInt()
        }
      }
      if (message.name == 'switchPointColor' ) {
        console.log('switchPointColor=====' + message.value)
        this.switchPointColor = message.value as String
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('type: Switch').fontSize(12).fontColor('0xcccccc').width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: ToggleType.Switch })
          .key('toggleSwitch')
          .id('toggleSwitch')
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

      Text('type: Checkbox' + this.type).fontSize(12).fontColor('0xcccccc').width('90%')
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

      Text('type: Button').fontSize(12).fontColor('0xcccccc').width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: ToggleType.Button, isOn: false }) {
          Text('status button').fontColor('#182431').fontSize(12)
        }.width(106)
        .key('toggleButton')
        .id('toggleButton')
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

      Text(this.text).fontSize(20).margin(10).key('text').id('text')
    }.width('100%').padding(24)
  }
}