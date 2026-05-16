'use static'
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
import { NodeContent, typeNode,FrameNode, Content } from '@ohos.arkui.node';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LibUtil } from './LibUtil';
import { State, Watch } from '@ohos.arkui.stateManagement';
import { Column, Entry, Component, Button, Row, ClickEvent, ContentSlot } from '@ohos.arkui.component';
import { UIContext, UIInspector } from '@ohos.arkui.UIContext';
@Entry
@Component
struct InspectorLayoutCallback {
  // 初始化NodeContent对象。
  private rootSlot: Content = new NodeContent() as Content;
  private uiContext: UIContext = this.getUIContext();
  private inspector: UIInspector  = this.uiContext.getUIInspector();
  private libUtil: LibUtil = new LibUtil();
  @State @Watch('verifyingTheLayoutCallbackFunction') layoutCallbackFlag: boolean = false;
  @State @Watch('verifyingTheLayoutAndDrawCallbackFunction100') layoutAndDrawCallback100Flag: boolean = false;
  @State @Watch('verifyingTheLayoutCallbackFunction3000') layoutCallbackFlag3000: boolean = false;
  @State @Watch('verifyTheDeregistrationLayoutCallbackFunction') cancelLayoutCallbackFlag: boolean = false;
  @State @Watch('verifyRegisterDrawCallback') registerDrawCallbackFlag: boolean = false;
  @State @Watch('verifyUnregisterDrawCallback') UnregisterDrawCallbackFlag: boolean = false;
  @State @Watch('changeNativesFlag') showNatives: boolean = false;

  aboutToAppear() {
    console.log('[cf]aboutToAppear start 39' );
    try {
      console.log('[cf]loadLibrary start -> 41' );
      //触发ets侧与C侧接口绑定，会触发CPP中的ANI_Constructor接口
      loadLibrary("entry")
      console.log('[cf]loadLibrary end -> 43' );
    } catch(err) {
      err = err as Error;
      console.log('[cf]loadLibrary entry error: ' + err);
    }
    this.uiContext = this.getUIContext();
    console.log('[cf]getUIContext-49: ');
    this.inspector = this.uiContext.getUIInspector();
    console.log('[cf]getUIContext51: ');
    for (let index: int = 0 as int; index < 0; index++) {
      let listener = this.inspector.createComponentObserver('text_node' + index);
      let onLayoutComplete: () => void = (): void => {
        console.log('[cf]onLayoutComplete: ' + index);
      }
      let onDrawComplete: () => void = (): void => {
        console.log('[cf]onDrawComplete: ' + index);
      }
      listener!.onLayout(onLayoutComplete)
      listener!.onDraw(onDrawComplete)
    }
    console.log('[cf]aboutToAppear end 69' );
  }

  // 验证布局回调函数
  verifyingTheLayoutCallbackFunction(a: string): void {
    if (this.layoutCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      console.log('verifyingTheLayoutCallbackFunction start: ' );
      this.libUtil.verifyingTheLayoutCallbackFunction(this.rootSlot)
      console.log('verifyingTheLayoutCallbackFunction end: ' );
    } else {
      // 销毁NativeModule组件
      console.log('destroyNativeRoot start: ' );
      this.libUtil.destroyNativeRoot()
      console.log('destroyNativeRoot end: ' );
    }
  }

  // 验证布局回调函数-给同一个组件设置3000个回调函数
  verifyingTheLayoutAndDrawCallbackFunction100(a: string): void {
    if (this.layoutAndDrawCallback100Flag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      this.libUtil.verifyingTheLayoutAndDrawCallbackFunction100(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      this.libUtil.destroyNativeRoot()
    }
  }

  // 验证布局回调函数-给同一个组件设置3000个回调函数
  verifyingTheLayoutCallbackFunction3000(a: string): void {
    if (this.layoutCallbackFlag3000) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      this.libUtil.verifyingTheLayoutCallbackFunction3000(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      this.libUtil.destroyNativeRoot()
    }
  }

  // 验证注销布局回调函数
  verifyTheDeregistrationLayoutCallbackFunction(a: string): void {
    if (this.cancelLayoutCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      this.libUtil.verifyTheDeregistrationLayoutCallbackFunction(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      this.libUtil.destroyNativeRoot()
    }
  }

  // 验证注册绘制回调函数
  verifyRegisterDrawCallback(a: string): void {
    if (this.registerDrawCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      this.libUtil.verifyRegisterDrawCallback(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      this.libUtil.destroyNativeRoot()
    }
  }

  // 验证注销绘制回调函数
  verifyUnregisterDrawCallback(a: string): void {
    if (this.UnregisterDrawCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      this.libUtil.verifyUnregisterDrawCallback(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      this.libUtil.destroyNativeRoot()
    }
  }

  changeNativesFlag(a: string): void {
    if (this.showNatives) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      this.libUtil.createNativeRoots(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      this.libUtil.destroyNativeRoots()
    }
  }

  build() {
    Column() {
      // 验证布局回调函数
      Button(this.layoutCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证布局回调函数")
        .onClick((e: ClickEvent) => {
          this.layoutCallbackFlag = !this.layoutCallbackFlag
        }).id("layoutcallback_test01")
      // 验证注销布局回调函数
      Button(this.cancelLayoutCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证注销布局回调函数")
        .onClick((e: ClickEvent) => {
          this.cancelLayoutCallbackFlag = !this.cancelLayoutCallbackFlag
        }).id("layoutcallback_test02")
      // 验证绘制回调函数
      Button(this.registerDrawCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证绘制回调函数")
        .onClick((e: ClickEvent) => {
          this.registerDrawCallbackFlag = !this.registerDrawCallbackFlag
        }).id("drawcallback_test01")
      // 验证注销绘制回调函数
      Button(this.UnregisterDrawCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证注销绘制回调函数")
        .onClick((e: ClickEvent) => {
          this.UnregisterDrawCallbackFlag = !this.UnregisterDrawCallbackFlag
        }).id("drawcallback_test02")
      // 验证布局、绘制回调函数-给同一个组件设置100个回调函数.预期：只会触发一次布局、绘制回调
      Button(this.layoutAndDrawCallback100Flag ? "HideNativeUI" : "ShowNativeUI-1组件100次回调-验证布局、绘制回调函数")
        .onClick((e: ClickEvent) => {
          this.layoutAndDrawCallback100Flag = !this.layoutAndDrawCallback100Flag
        })

      // 验证布局回调函数-给多个组件设置回调函数.预期：只会触发多次布局回调
      Button(this.layoutCallbackFlag3000 ? "HideNativeUI" : "ShowNativeUI-3000组件1次回调-验证布局回调函数")
        .onClick((e: ClickEvent) => {
          this.layoutCallbackFlag3000 = !this.layoutCallbackFlag3000
        })

      // 验证绘制回调函数-给多个组件设置绘制函数.预期：只会触发多次绘制回调
      Button(this.showNatives ? "HideNativeUIs" : "ShowNativeUI-3000组件1次回调-验证绘制回调函数")
        .onClick((e: ClickEvent) => {
          this.showNatives = !this.showNatives
        })
      Row() {
        // 将NodeContent和ContentSlot占位组件绑定。
        ContentSlot(this.rootSlot)
      }.layoutWeight(1)
    }
    .width('100%')
    .height('100%');
  }
}