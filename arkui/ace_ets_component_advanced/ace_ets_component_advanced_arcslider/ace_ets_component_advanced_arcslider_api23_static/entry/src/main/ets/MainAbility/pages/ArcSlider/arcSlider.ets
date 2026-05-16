'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Text,
  Column,
  TouchEvent,
  ComponentV2,
  CrownSensitivity,
  Row,
  Button,
  Stack,
  ClickEvent,
  ListItem,
  List,
  Scroll,
  Scroller,
  ColumnOptions,
  ListOptions,
  Color
} from '@ohos.arkui.component'
import { State, ObservedV2, Trace, Param, Local, Monitor, IMonitor } from '@ohos.arkui.stateManagement'
import {
  ArcSlider,
  ArcSliderPosition,
  ArcSliderOptions,
  ArcSliderValueOptions,
  ArcSliderLayoutOptions,
  ArcSliderStyleOptions,
  ArcSliderValueOptionsConstructorOptions,
  ArcSliderLayoutOptionsConstructorOptions,
  ArcSliderStyleOptionsConstructorOptions,
  ArcSliderOptionsConstructorOptions
} from '@ohos.arkui.advanced.ArcSlider';

@Entry
@ComponentV2
struct ArcSliderExample {
  scroll: Scroller = new Scroller()
  valueOptionsConstructorOptions: ArcSliderValueOptionsConstructorOptions = {
    progress: 50,
    min: 5,
    max: 95
  } as ArcSliderValueOptionsConstructorOptions;

  layoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
    reverse: true,
    position: ArcSliderPosition.RIGHT
  } as ArcSliderLayoutOptionsConstructorOptions;
  styleOptionsConstructorOptions: ArcSliderStyleOptionsConstructorOptions = {
    trackThickness: 16,
    activeTrackThickness: 36,
    trackColor: '#999999',
    selectedColor: '#00FF00',
    trackBlur: 20
  } as ArcSliderStyleOptionsConstructorOptions;
  valueOptions: ArcSliderValueOptions = new ArcSliderValueOptions(this.valueOptionsConstructorOptions);
  layoutOptions: ArcSliderLayoutOptions = new ArcSliderLayoutOptions(this.layoutOptionsConstructorOptions);
  styleOptions: ArcSliderStyleOptions = new ArcSliderStyleOptions(this.styleOptionsConstructorOptions);
  arcSliderOptionsConstructorOptions: ArcSliderOptionsConstructorOptions = {
    valueOptions: this.valueOptions,
    layoutOptions: this.layoutOptions,
    styleOptions: this.styleOptions,
    digitalCrownSensitivity:CrownSensitivity.LOW,
    onTouch: (event: TouchEvent) => {
    },
    onChange: (progress: number) => {
    },
    onEnlarge: (isEnlarged: boolean) => {
    }
  } as ArcSliderOptionsConstructorOptions;
  @Param arcSliderOptions: ArcSliderOptions =
    new ArcSliderOptions(this.arcSliderOptionsConstructorOptions) as ArcSliderOptions;

  build() {
    Scroll(this.scroll) {
      Column({ space: 5 } as ColumnOptions) {
        List({ space: 5, initialIndex: 0 }  as ListOptions) {
          ListItem() {
            ArcSlider({ options: this.arcSliderOptions }).id('arcSliderTest001')
          }.backgroundColor(Color.Black)
        }
      }
    }
  }
}