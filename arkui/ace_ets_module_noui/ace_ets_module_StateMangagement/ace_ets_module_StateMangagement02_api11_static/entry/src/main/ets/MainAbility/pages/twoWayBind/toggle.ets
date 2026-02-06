'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,Flex,
  Text,ContentCoverOptions,Menu,FontWeight,MenuItem,FlexOptions,ItemAlign,Toggle,ToggleType,
  Row,Color,Builder,FlexAlign,$$,MenuItem,MenuItemOptions,ToggleOptions
} from '@ohos.arkui.component'
import {
  State,
  Watch,PropRef,ObjectLink,
  Link,LocalStoragePropRef,LocalStorageLink,Consume,Provide,
  StorageLink,Observed,Track,LocalStorage
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';


@Entry
@Component
struct ToggleExample {
  @State isOn: boolean = true

  build() {
    Column() {
      Text(`isOn: ${this.isOn}`).fontSize(9).width('90%').id('toggleText')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center } as FlexOptions) {
        Toggle({ type: ToggleType.Switch, isOn: $$(this.isOn) } as ToggleOptions)
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .id('toggle')

        Toggle({ type: ToggleType.Switch, isOn: true } as ToggleOptions)
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
      }

      Text('type: Checkbox').fontSize(9).fontColor(0xcccccc).width('90%').height('5%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center } as FlexOptions) {
        Toggle({ type: ToggleType.Checkbox, isOn: false } as ToggleOptions)
          .size({ width: 20, height: 20 })
          .selectedColor('#007DFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })

        Toggle({ type: ToggleType.Checkbox, isOn: true } as ToggleOptions)
          .size({ width: 20, height: 20 })
          .selectedColor('#007DFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
      }

      Text('type: Button').fontSize(9).fontColor(0xcccccc).width('90%').height('5%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center } as FlexOptions) {
        Toggle({ type: ToggleType.Button, isOn: false } as ToggleOptions) {
          Text('status button').fontColor('#182431').fontSize(9).height('5%')
        }.width(106)
        .selectedColor('rgba(0,125,255,0.20)')
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })

        Toggle({ type: ToggleType.Button, isOn: true } as ToggleOptions) {
          Text('status button').fontColor('#182431').fontSize(9).height('5%')
        }.width(106)
        .selectedColor('rgba(0,125,255,0.20)')
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })
      }
    }.width('100%')
  }
}