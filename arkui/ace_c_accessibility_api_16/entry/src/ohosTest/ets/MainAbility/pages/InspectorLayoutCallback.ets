import nativeNode from 'libentry.so';
import { NodeContent, UIContext, UIInspector } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';


@Entry
@Component
struct InspectorLayoutCallback {
  // 初始化NodeContent对象。
  private rootSlot = new NodeContent();
  private uiContext = new UIContext();
  private inspector = new UIInspector();
  @State @Watch('verifyingTheLayoutCallbackFunction') layoutCallbackFlag: boolean = false;
  @State @Watch('verifyingTheLayoutAndDrawCallbackFunction100') layoutAndDrawCallback100Flag: boolean = false;
  @State @Watch('verifyingTheLayoutCallbackFunction3000') layoutCallbackFlag3000: boolean = false;
  @State @Watch('verifyTheDeregistrationLayoutCallbackFunction') cancelLayoutCallbackFlag: boolean = false;
  @State @Watch('verifyRegisterDrawCallback') registerDrawCallbackFlag: boolean = false;
  @State @Watch('verifyUnregisterDrawCallback') UnregisterDrawCallbackFlag: boolean = false;
  @State @Watch('changeNativesFlag') showNatives: boolean = false;

  aboutToAppear() {
    this.uiContext = this.getUIContext();
    this.inspector = this.uiContext.getUIInspector();
    for (let index = 0; index < 0; index++) {
      let listener = this.inspector.createComponentObserver('text_node' + index);
      let onLayoutComplete: () => void = (): void => {
        hilog.info(0x0001, "pzw-testTag", "text_node" + index + " is onLayoutComplete");
      }
      let onDrawComplete: () => void = (): void => {
        hilog.info(0x0001, "pzw-testTag", "text_node" + index + " is onDrawComplete");
      }
      listener.on('layout', onLayoutComplete)
      listener.on('draw', onDrawComplete)
    }
  }

  // 验证布局回调函数
  verifyingTheLayoutCallbackFunction(): void {
    if (this.layoutCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      nativeNode.verifyingTheLayoutCallbackFunction(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      nativeNode.destroyNativeRoot()
    }
  }

  // 验证布局回调函数-给同一个组件设置3000个回调函数
  verifyingTheLayoutAndDrawCallbackFunction100(): void {
    if (this.layoutAndDrawCallback100Flag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      nativeNode.verifyingTheLayoutAndDrawCallbackFunction100(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      nativeNode.destroyNativeRoot()
    }
  }

  // 验证布局回调函数-给同一个组件设置3000个回调函数
  verifyingTheLayoutCallbackFunction3000(): void {
    if (this.layoutCallbackFlag3000) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      nativeNode.verifyingTheLayoutCallbackFunction3000(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      nativeNode.destroyNativeRoot()
    }
  }

  // 验证注销布局回调函数
  verifyTheDeregistrationLayoutCallbackFunction(): void {
    if (this.cancelLayoutCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      nativeNode.verifyTheDeregistrationLayoutCallbackFunction(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      nativeNode.destroyNativeRoot()
    }
  }

  // 验证注册绘制回调函数
  verifyRegisterDrawCallback(): void {
    if (this.registerDrawCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      nativeNode.verifyRegisterDrawCallback(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      nativeNode.destroyNativeRoot()
    }
  }

  // 验证注销绘制回调函数
  verifyUnregisterDrawCallback(): void {
    if (this.UnregisterDrawCallbackFlag) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      nativeNode.verifyUnregisterDrawCallback(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      nativeNode.destroyNativeRoot()
    }
  }

  changeNativesFlag(): void {
    if (this.showNatives) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      nativeNode.createNativeRoots(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      nativeNode.destroyNativeRoots()
    }
  }

  build() {
    Column() {
      // 验证布局回调函数
      Button(this.layoutCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证布局回调函数")
        .onClick(() => {
          this.layoutCallbackFlag = !this.layoutCallbackFlag
        }).id("layoutcallback_test01")
      // 验证注销布局回调函数
      Button(this.cancelLayoutCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证注销布局回调函数")
        .onClick(() => {
          this.cancelLayoutCallbackFlag = !this.cancelLayoutCallbackFlag
        }).id("layoutcallback_test02")
      // 验证绘制回调函数
      Button(this.registerDrawCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证绘制回调函数")
        .onClick(() => {
          this.registerDrawCallbackFlag = !this.registerDrawCallbackFlag
        }).id("drawcallback_test01")
      // 验证注销绘制回调函数
      Button(this.UnregisterDrawCallbackFlag ? "HideNativeUI" : "ShowNativeUI-1-验证注销绘制回调函数")
        .onClick(() => {
          this.UnregisterDrawCallbackFlag = !this.UnregisterDrawCallbackFlag
        }).id("drawcallback_test02")
      // 验证布局、绘制回调函数-给同一个组件设置100个回调函数.预期：只会触发一次布局、绘制回调
      Button(this.layoutAndDrawCallback100Flag ? "HideNativeUI" : "ShowNativeUI-1组件100次回调-验证布局、绘制回调函数")
        .onClick(() => {
          this.layoutAndDrawCallback100Flag = !this.layoutAndDrawCallback100Flag
        })

      // 验证布局回调函数-给多个组件设置回调函数.预期：只会触发多次布局回调
      Button(this.layoutCallbackFlag3000 ? "HideNativeUI" : "ShowNativeUI-3000组件1次回调-验证布局回调函数")
        .onClick(() => {
          this.layoutCallbackFlag3000 = !this.layoutCallbackFlag3000
        })

      // 验证绘制回调函数-给多个组件设置绘制函数.预期：只会触发多次绘制回调
      Button(this.showNatives ? "HideNativeUIs" : "ShowNativeUI-3000组件1次回调-验证绘制回调函数")
        .onClick(() => {
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