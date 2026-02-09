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

  controller: TextInputController = new TextInputController()
  build() {
    Column() {
      TextInput({ text: this.text, placeholder: 'please input ...', controller: this.controller })
        .onChange((value: string) => {
          this.text = value
        })

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
        Button(this.needSoftKeyboardState)
          .controlSize(ControlSize.SMALL)
          .onClick(()=>{
            this.needSoftKeyboard = !this.needSoftKeyboard;
            this.needSoftKeyboardState = 'needSoftKeyboard=' + this.needSoftKeyboard;
            nativeNode.setNeedSoftKeyboard(this.xcomponentId, this.needSoftKeyboard);
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