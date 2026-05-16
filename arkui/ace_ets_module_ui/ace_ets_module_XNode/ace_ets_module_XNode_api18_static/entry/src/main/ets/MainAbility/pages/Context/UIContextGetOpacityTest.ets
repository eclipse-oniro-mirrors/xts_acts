'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { FrameNode } from '@ohos.arkui.node';
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Row,
  Margin,
  TextAlign,
  Button,
  ClickEvent,
  Stack,
  Visibility
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct MyStateSample {
  @State getFrameNodeByIdValue: string = '0';
  @State getOpacityValue1: string = '0';
  @State getOpacityValue2: string = '0';
  @State getOpacityValue3: string = '0';
  @State getOpacityValue4: string = '0';
  @State getOpacityValue5: string = '0';
  @State getTransformValue: string = '0';

  build() {
    Column() {
      Text('opacity：1.5').id('text003').opacity(1.5).height('5%')
      Text('opacity：-1').id('text001').opacity(-1).height('5%')
      Text('opacity：0').id('text002').opacity(0).height('5%')
      Text('opacity：1.5').id('text003').opacity(1.5).height('5%')
      Text('opacity：10').id('text004').opacity(10).height('5%')
      Text('opacity：0.45').id('text005').opacity(0.5).height('5%')
      Text('Hello World').height('5%')

      Button('click')
        .id('btn_click_id')
        .backgroundColor('#FFFF00FF')
        .height('5%')
        .onClick((e: ClickEvent) => {
          let uicontext = this.getUIContext();
          if (uicontext) {
            let text001 = uicontext.getFrameNodeById('text001');
            this.getOpacityValue1 = text001?.getOpacity() + '';
            let text002 = uicontext.getFrameNodeById('text002');
            this.getOpacityValue2 = text002?.getOpacity() + '';
            let text003 = uicontext.getFrameNodeById('text003');
            this.getOpacityValue3 = text003?.getOpacity() + '';
            let text004 = uicontext.getFrameNodeById('text004');
            this.getOpacityValue4 = text004?.getOpacity() + '';
            let text005 = uicontext.getFrameNodeById('text005');
            this.getOpacityValue5 = text005?.getOpacity() + '';
            this.getTransformValue = text003?.getPositionToWindowWithTransform().x.toString().split('.')[0] + '';
          }
        })
      Text(this.getOpacityValue1).height('5%').id('getOpacityValue1')
      Text(this.getOpacityValue2).height('5%').id('getOpacityValue2')
      Text(this.getOpacityValue3).height('5%').id('getOpacityValue3')
      Text(this.getOpacityValue4).height('5%').id('getOpacityValue4')
      Text(this.getOpacityValue5).height('5%').id('getOpacityValue5')
      Text(this.getTransformValue).height('5%').id('getTransformValue')
    }
    .height('100%')
  }
}