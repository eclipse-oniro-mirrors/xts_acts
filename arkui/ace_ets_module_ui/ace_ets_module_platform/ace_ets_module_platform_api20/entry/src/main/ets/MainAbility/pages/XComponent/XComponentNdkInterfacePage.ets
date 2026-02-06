/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import nativeNode from 'libnativerender.so'

@Entry
@Component
struct XComponentNdkInterfacePage {
  @State message: string = 'Hello World';
  xcomponentId: string = 'NdkInterfaceXComponent';
  @State minRate: number = 0;
  @State maxRate: number = 120;
  @State expected: number = 60;
  needSoftKeyboard: boolean = false;
  @State frameCallback: boolean = true;
  @State frameCallbackState: string = '取消';
  @State needSoftKeyboardState: string = 'needSoftKeyboard=' + this.needSoftKeyboard;
  @State text: string = '单指点击XComponent软键盘消失'
  @State setNeedSoftKeyboardResult: number = -1
  @State setFrameRateResult: number = -1
  @State registerFrameCallbackResult: number = -1
  @State unregisterFrameCallbackResult: number = -1

  controller: TextInputController = new TextInputController()
  build() {
    Column() {
      TextInput({ text: this.text, placeholder: 'please input ...', controller: this.controller })
        .onChange((value: string) => {
          this.text = value
        })
      Row({space: 5}) {
        Text(this.setNeedSoftKeyboardResult.toString()).key('XComponent_setNeedSoftKeyboardResult')
        Text(this.setFrameRateResult.toString()).key('XComponent_setFrameRateResult')
        Text(this.registerFrameCallbackResult.toString()).key('XComponent_registerFrameCallbackResult')
        Text(this.unregisterFrameCallbackResult.toString()).key('XComponent_unregisterFrameCallbackResult')
      }.height('8%')

      Column() {
        XComponent({
          type: XComponentType.SURFACE
        })
          .id(this.xcomponentId)
          .onAttach(() => {
            let node = this.getUIContext().getFrameNodeById(this.xcomponentId)
            nativeNode.bindNode(this.xcomponentId, node)
          })
          .onDetach(() => {
            nativeNode.unbindNode(this.xcomponentId)
          })
          .width(150)
          .height(150)
          .focusable(true)
          .focusOnTouch(true)
          .defaultFocus(true)
      }.height('50%')

      Row() {
        Button('setFrameCallback')
          .controlSize(ControlSize.SMALL)
          .onClick(()=>{
            this.frameCallback = !this.frameCallback
            if (this.frameCallback) {
              this.frameCallbackState = '取消'
              this.registerFrameCallbackResult = nativeNode.registerFrameCallback(this.xcomponentId)
            } else {
              this.frameCallbackState = '注册'
              this.unregisterFrameCallbackResult = nativeNode.unregisterFrameCallback(this.xcomponentId)
            }
          })
          .key('XComponent_frameCallback')
        Button('setFrameRate')
          .controlSize(ControlSize.SMALL)
          .onClick(()=>{
            this.setFrameRateResult = nativeNode.setFrameRate(this.xcomponentId, this.minRate, this.maxRate, this.expected)
          })
          .key('XComponent_setFrameRate')
      }.height('8%')

      Row() {
        Button(this.needSoftKeyboardState)
          .controlSize(ControlSize.SMALL)
          .onClick(()=>{
            this.needSoftKeyboard = !this.needSoftKeyboard;
            this.needSoftKeyboardState = 'needSoftKeyboard=' + this.needSoftKeyboard;
            this.setNeedSoftKeyboardResult = nativeNode.setNeedSoftKeyboard(this.xcomponentId, this.needSoftKeyboard);
            this.text = this.needSoftKeyboard ?  '单指点击XComponent软键盘不消失' : '单指点击XComponent软键盘消失'
          })
          .key('XComponent_setNeedSoftKeyboard')
      }.height('8%')

      Row() {
        Button('create provider')
          .controlSize(ControlSize.SMALL)
          .onClick(()=>{
            nativeNode.createProvider(this.xcomponentId)
          })
          .key('XComponent_create_provider')
        Button('dispose provider')
          .controlSize(ControlSize.SMALL)
          .onClick(()=>{
            nativeNode.disposeProvider(this.xcomponentId)
          })
          .key('XComponent_dispose_provider')
      }
    }
    .width('100%')
  }
}