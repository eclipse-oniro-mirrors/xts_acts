import window from '@ohos.window';

@Entry
@Component
struct TestPage {
  uiContext = this.getUIContext();
  @State windowName :string | undefined = ""
  aboutToAppear() {
    this.windowName = this.getUIContext().getWindowName();
    console.error('WindowName ' + this.windowName);
    const currWindow = window.findWindow(this.windowName);
    const windowProperties = currWindow.getWindowProperties();
    console.error(`Window width ${windowProperties.windowRect.width}, height ${windowProperties.windowRect.height}`);
  }

  build() {
    Row() {
      Column() {
        Text("cacheDir="+this.uiContext?.getHostContext()!.cacheDir).fontSize(25)
        Text("bundleCodeDir="+this.uiContext?.getHostContext()!.bundleCodeDir).fontSize(25)
        Text("object = "+this.uiContext?.getHostContext()).fontSize(25).key("getHostContext")
        Text(this.windowName).fontSize(25).key("getWindowName")
      }
      .width('100%')
    }
    .height('100%')
  }
}