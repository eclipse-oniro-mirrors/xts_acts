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

import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
  Color,
  $rawfile,
  DragEvent,
  $r,
  ResourceStr,
  SliderOptions,
  Slider,
  Divider,
  SliderStyle,
  SliderInteraction,
  SliderChangeMode
// ContextMenu
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test'
import {
  State
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct sliderInterractionModeTest {
  @State inSetValue: number = 10
  @State inSetValue1: number = 10
  @State inSetValue2: number = 10

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Slider({
        style: SliderStyle.InSet,
        min: 0,
        max: 100,
        value: this.inSetValue
      } as SliderOptions)
        .id('slider1')
        .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK)
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .showTips(true)
        .onChange((value:number,mode: SliderChangeMode)=>{
          this.inSetValue = value
        })
      Divider()
      Slider({
        style: SliderStyle.InSet,
        min: 0,
        max: 100,
        value: this.inSetValue1
      }  as SliderOptions)
        .id('slider2')
        .sliderInteractionMode(SliderInteraction.SLIDE_ONLY)
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .showTips(true)
        .onChange((value:number,mode: SliderChangeMode)=>{
          this.inSetValue1 = value
        })
      Divider()
      Slider({
        style: SliderStyle.InSet,
        min: 0,
        max: 100,
        value: this.inSetValue2
      }  as SliderOptions)
        .id('slider3')
        .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK_UP)
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .showTips(true)
        .onChange((value:number,mode: SliderChangeMode)=>{
          this.inSetValue2 = value
        })
    }
  }
}