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
@Entry
@Component
struct listenMultiEventExample {
  @State text1: string = '';
  @State text2: string = '';
  @State text3: string = '';
  @State text4: string = '';

  @State eventType: string = '';
  @State event1: TouchEvent | null = null
  @State event2: MouseEvent | null = null
  @State event3: KeyEvent | null = null

  private uiContext: UIContext | undefined = undefined;
  private monitor1: InputEventMonitor | null = null;

  aboutToAppear() {
    this.uiContext = this.getUIContext();

    this.monitor1 = this.uiContext.addLocalInputEventMonitor(
      InputEventSubTypeMask.TOUCH_UP|InputEventSubTypeMask.TOUCH_DOWN|
      InputEventSubTypeMask.LEFT_MOUSE_DOWN|InputEventSubTypeMask.LEFT_MOUSE_UP|InputEventSubTypeMask.RIGHT_MOUSE_DOWN|
      InputEventSubTypeMask.RIGHT_MOUSE_UP|InputEventSubTypeMask.MIDDLE_MOUSE_DOWN|InputEventSubTypeMask.MIDDLE_MOUSE_UP|
      InputEventSubTypeMask.RIGHT_MOUSE_DRAGGING|InputEventSubTypeMask.MIDDLE_MOUSE_DRAGGING|InputEventSubTypeMask.LEFT_MOUSE_DRAGGING|
      InputEventSubTypeMask.KEY_DOWN | InputEventSubTypeMask.KEY_UP,
      (wrapper: RawInputEventWrapper) => {
        if (wrapper.isTouchEvent() == true) {
          this.event1 = wrapper.asTouchEvent();
          if (this.event1 == null) {
            this.text1 = 'null'
          }else {
            this.text1 = 'listenTouchType=' + this.event1.type
            this.text4 = '' + this.event1.targetDisplayId + this.event1.deviceId + this.event1.sourceTool +
              this.event1.rollAngle + this.event1.tiltY + this.event1.tiltX + this.event1.pressure +
              this.event1.axisPinch + this.event1.axisVertical + this.event1.source + this.event1.timestamp +
              this.event1.target + this.event1.eventHandleId + this.event1.changedTouches + this.event1.touches
            return { action: InputEventInterceptAction.CONTINUE };
          }
        }else if (wrapper.isTouchEvent() == false) {
          this.text1 = 'listenTouchType=0'
        }
        if (wrapper.isMouseEvent() == true) {
          this.event2 = wrapper.asMouseEvent();
          if (this.event2 == null) {
            this.text2 = 'null'
          }else {
            this.text2 = 'listenButton=' + this.event2.button + ',Action=' + this.event2.action
            this.text4 = '' + this.event2.globalDisplayX + this.event2.globalDisplayY + this.event2.displayX +
              this.event2.displayY + this.event2.windowX + this.event2.windowY + this.event2.x + this.event2.y +
              this.event2.rawDeltaX + this.event2.rawDeltaY + this.event2.pressedButtons + this.event2.target +
              this.event2.eventHandleId + this.event2.timestamp + this.event2.source + this.event2.axisHorizontal +
              this.event2.axisVertical + this.event2.axisPinch + this.event2.pressure + this.event2.tiltX +
              this.event2.tiltY + this.event2.rollAngle + this.event2.sourceTool + this.event2.deviceId +
              this.event2.targetDisplayId
            return { action: InputEventInterceptAction.CONTINUE };
          }
        }else if (wrapper.isMouseEvent() == false) {
          this.text2 = 'listenButton=0,Action=0'
        }
        if (wrapper.isKeyEvent() == true) {
          this.event3 = wrapper.asKeyEvent();
          if (this.event3 == null) {
            this.text3 = 'null'
          }else {
            this.text3 = 'listenKeyType=' + this.event3.type
            this.text4 = '' + this.event3.keyCode + this.event3.keyText + this.event3.keySource +
              this.event3.metaKey + this.event3.deviceId + this.event3.timestamp + this.event3.intentionCode +
              this.event3.unicode + this.event3.isNumLockOn + this.event3.isCapsLockOn + this.event3.isScrollLockOn
            if (this.event3.type == KeyType.Up){
              return { action: InputEventInterceptAction.BLOCK };
            } else return { action: InputEventInterceptAction.CONTINUE };
          }
        }else if (wrapper.isKeyEvent() == false) {
          this.text3 = 'listenKeyType=0'
        }
        return { action: InputEventInterceptAction.CONTINUE };
      }
    );
  }

  aboutToDisappear() {
    if (this.uiContext) {
      this.uiContext.removeLocalInputEventMonitor(this.monitor1);
      this.uiContext.removeLocalInputEventMonitor(undefined);
      this.uiContext.removeLocalInputEventMonitor(null);

    }
  }

  build() {
    Column({ space: 5 }) {
      Button('KeyTest')
        .width('50%')
        .height('20%')
        .id('listenTest')
        .defaultFocus(true)
        .onKeyEvent((event: KeyEvent)=>{
          if (event.type == KeyType.CANCEL){
            console.log('Key Cancel')
          }
        })
      Text(this.text1).id('listenTouch')
      Text(this.text2).id('listenMouse')
      Text(this.text3).id('listenKey')
      Text(this.text4).id('listenEvent')
    }
    .width('100%')
  }
}