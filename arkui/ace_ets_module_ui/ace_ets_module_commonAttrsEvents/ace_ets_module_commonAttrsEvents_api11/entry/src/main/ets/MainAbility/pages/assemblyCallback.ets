/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Entry
@Component
struct assemblyCallback {
  @State message: string = 'Blank';
  private scroller: Scroller = new Scroller();

  build() {
    Row() {
      Text('Bluetooth').fontSize(18)
      Blank()
      Button()
      Checkbox()
      Toggle({ type: ToggleType.Switch })
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text('Bluetooth').fontSize(18)
        Button().key("11")
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

  listener11 = inspector.createComponentObserver('11')
  listener12 = inspector.createComponentObserver('12')
  listener13 = inspector.createComponentObserver('13')
  listener14 = inspector.createComponentObserver('14')
  listener15 = inspector.createComponentObserver('15')
  listener16 = inspector.createComponentObserver('16')

  aboutToAppear() {
    let Func11layout: ESObject = this.layout11.bind(this) // bind current js instance
    let Func11draw: ESObject = this.draw11.bind(this) // bind current js instance
    this.listener11.on('layout', Func11layout)
    this.listener11.on('draw', Func11draw)
    let Func12layout: ESObject = this.layout12.bind(this) // bind current js instance
    let Func12draw: ESObject = this.draw12.bind(this) // bind current js instance
    this.listener12.on('layout', Func12layout)
    this.listener12.on('draw', Func12draw)
    let Func13layout: ESObject = this.layout13.bind(this) // bind current js instance
    let Func13draw: ESObject = this.draw13.bind(this) // bind current js instance
    this.listener13.on('layout', Func13layout)
    this.listener13.on('draw', Func13draw)
    let Func14layout: ESObject = this.layout14.bind(this) // bind current js instance
    let Func14draw: ESObject = this.draw14.bind(this) // bind current js instance
    this.listener14.on('layout', Func14layout)
    this.listener14.on('draw', Func14draw)
    let Func15layout: ESObject = this.layout15.bind(this) // bind current js instance
    let Func15draw: ESObject = this.draw15.bind(this) // bind current js instance
    this.listener15.on('layout', Func15layout)
    this.listener15.on('draw', Func15draw)
    let Func16layout: ESObject = this.layout16.bind(this) // bind current js instance
    let Func16draw: ESObject = this.draw16.bind(this) // bind current js instance
    this.listener16.on('layout', Func16layout)
    this.listener16.on('draw', Func16draw)
  }

  layout11() {
    console.log("skButton, layout")
  }

  draw11() {
    console.log("skButton, draw")
  }

  layout12() {
    console.log("skCheckbox, layout")
  }

  draw12() {
    console.log("skCheckbox, draw")
  }

  layout13() {
    console.log("skImage, layout")
  }

  draw13() {
    console.log("skImage, draw")
  }

  layout14() {
    console.log("skMenu, layout")
  }

  draw14() {
    console.log("skMenu, draw")
  }

  layout15() {
    console.log("skRadio, layout")
  }

  draw15() {
    console.log("skRadio, draw")
  }

  layout16() {
    console.log("skScrollBar, layout")
  }

  draw16() {
    console.log("skScrollBar, draw")
  }
}