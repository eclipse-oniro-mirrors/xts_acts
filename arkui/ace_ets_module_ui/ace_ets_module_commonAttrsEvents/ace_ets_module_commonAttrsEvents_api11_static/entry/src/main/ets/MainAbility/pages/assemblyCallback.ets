'use static';
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
import inspector from '@ohos.arkui.inspector';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext, UIInspector } from '@ohos.arkui.UIContext';
import {
  BarState,
  Blank,
  Button,
  Checkbox,
  Color,
  Column,
  Component,
  Entry,
  FontWeight,
  Image,
  Menu,
  Radio,
  Row,
  ScrollBar,
  ScrollBarDirection,
  Scroller,
  Text,
  Toggle,
  ToggleType,
  TouchEvent
} from '@ohos.arkui.component'

@Entry
@Component
struct assemblyCallback {
  @State message: string = 'Blank';
  uiInspector:UIInspector = this.getUIContext().getUIInspector();
  listener11: inspector.ComponentObserver = this.uiInspector.createComponentObserver('11') as inspector.ComponentObserver
  listener12: inspector.ComponentObserver = this.uiInspector.createComponentObserver('12') as inspector.ComponentObserver
  listener13: inspector.ComponentObserver = this.uiInspector.createComponentObserver('13') as inspector.ComponentObserver
  listener14: inspector.ComponentObserver = this.uiInspector.createComponentObserver('14') as inspector.ComponentObserver
  listener15: inspector.ComponentObserver = this.uiInspector.createComponentObserver('15') as inspector.ComponentObserver
  listener16: inspector.ComponentObserver = this.uiInspector.createComponentObserver('16') as inspector.ComponentObserver
  private scroller: Scroller = new Scroller();

  build() {
    Row() {
      Text('Bluetooth').fontSize(18)
      Blank()
      Button('')
      Checkbox()
      Toggle({ type: ToggleType.Switch })
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text('Bluetooth').fontSize(18)
        Button('').key("11")
        Checkbox().key("12")
        Image('').key("13")
        Menu().key("14")
        Radio({ value: 'Radio1', group: 'radioGroup' }).key("15")
        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.Auto }).key("16")
        Toggle({ type: ToggleType.Switch })
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear() {
    let layout11: () => void = () => {
      console.log("skButton, layout")
    }

    let draw11: () => void = () => {
      console.log("skButton, draw")
    }

    let layout12: () => void = () => {
      console.log("skCheckbox, layout")
    }

    let draw12: () => void = () => {
      console.log("skCheckbox, draw")
    }

    let layout13: () => void = () => {
      console.log("skImage, layout")
    }

    let draw13: () => void = () => {
      console.log("skImage, draw")
    }

    let layout14: () => void = () => {
      console.log("skMenu, layout")
    }

    let draw14: () => void = () => {
      console.log("skMenu, draw")
    }

    let layout15: () => void = () => {
      console.log("skRadio, layout")
    }

    let draw15: () => void = () => {
      console.log("skRadio, draw")
    }

    let layout16: () => void = () => {
      console.log("skScrollBar, layout")
    }

    let draw16: () => void = () => {
      console.log("skScrollBar, draw")
    }
    let Func11layout = layout11 // bind current js instance
    let Func11draw = draw11 // bind current js instance
    this.listener11.onDrawChildren(Func11layout)
    this.listener11.onDrawChildren(Func11draw)
    let Func12layout = layout12 // bind current js instance
    let Func12draw = draw12 // bind current js instance
    this.listener12.onDrawChildren(Func12layout)
    this.listener12.onDrawChildren(Func12draw)
    let Func13layout = layout13 // bind current js instance
    let Func13draw = draw13 // bind current js instance
    this.listener13.onDrawChildren(Func13layout)
    this.listener13.onDrawChildren(Func13draw)
    let Func14layout = layout14 // bind current js instance
    let Func14draw = draw14 // bind current js instance
    this.listener14.onDrawChildren(Func14layout)
    this.listener14.onDrawChildren(Func14draw)
    let Func15layout = layout15 // bind current js instance
    let Func15draw = draw15 // bind current js instance
    this.listener15.onDrawChildren(Func15layout)
    this.listener15.onDrawChildren(Func15draw)
    let Func16layout = layout16 // bind current js instance
    let Func16draw = draw16 // bind current js instance
    this.listener16.onDrawChildren(Func16layout)
    this.listener16.onDrawChildren(Func16draw)
  }
}