'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { Entry, Text, Column, Component, Button, ClickEvent, MouseEvent, TouchEvent, KeyEvent, Scroll, KeyType } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { UIContext, InputEventSubTypeMask, InputEventInterceptAction, InputEventMonitor, RawInputEventWrapper } from '@kit.ArkUI'

@Entry
@Component
struct listenMultiEventStatic {
  @State text1: string = '';
  @State text2: string = '';
  @State text3: string = '';

  @State eventType: string = '';
  private uiContext: UIContext | undefined = undefined;
  private monitor1: InputEventMonitor | undefined = undefined;

  aboutToAppear() {
    this.uiContext = this.getUIContext();

    this.monitor1 = this.uiContext?.addLocalInputEventMonitor(
      InputEventSubTypeMask.TOUCH_UP|InputEventSubTypeMask.TOUCH_DOWN|
      InputEventSubTypeMask.LEFT_MOUSE_DOWN|InputEventSubTypeMask.LEFT_MOUSE_UP|
      InputEventSubTypeMask.RIGHT_MOUSE_DOWN|InputEventSubTypeMask.RIGHT_MOUSE_UP|
      InputEventSubTypeMask.MIDDLE_MOUSE_DOWN|InputEventSubTypeMask.MIDDLE_MOUSE_UP|
      InputEventSubTypeMask.RIGHT_MOUSE_DRAGGING|InputEventSubTypeMask.MIDDLE_MOUSE_DRAGGING|
      InputEventSubTypeMask.LEFT_MOUSE_DRAGGING|InputEventSubTypeMask.KEY_DOWN|InputEventSubTypeMask.KEY_UP,
      (wrapper: RawInputEventWrapper) => {
        if (wrapper.isTouchEvent()) {
          const event1 = wrapper.asTouchEvent()!;
          this.text1 = 'listenTouchType=' + event1.type
          return { action: InputEventInterceptAction.CONTINUE };
        }
        if (wrapper.isMouseEvent()) {
          const event2 = wrapper.asMouseEvent()!;
          this.text2 = 'listenButton=' + event2.button + ',Action=' + event2.action
          return { action: InputEventInterceptAction.CONTINUE };
        }
        if (wrapper.isKeyEvent()) {
          const event3 = wrapper.asKeyEvent()!;
          this.text3 = 'listenKeyType=' + event3.type
          if (event3.type == KeyType.Up){
            return { action: InputEventInterceptAction.BLOCK };
          } else return { action: InputEventInterceptAction.CONTINUE };
        }
        return { action: InputEventInterceptAction.CONTINUE };
      }
    );
  }

  aboutToDisappear() {
    for(let monitor of [this.monitor1]) {
      if (monitor && this.uiContext) {
        this.uiContext!.removeLocalInputEventMonitor(monitor)
      }
    }
  }

  build() {
    Column() {
      Button('KeyTest')
        .width('50%')
        .height('20%')
        .id('listenTest')
        .defaultFocus(true)
        .onKeyEvent((event: KeyEvent)=>{
          if (event.type == KeyType.CANCEL){
            console.log('Key Cancel')
          }
          return true
        })
      Text(this.text1).id('listenTouch')
      Text(this.text2).id('listenMouse')
      Text(this.text3).id('listenKey')
    }
    .width('100%')
  }
}