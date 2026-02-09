@CustomDialog
struct CustomDialogDefaultExample {
  controller?: CustomDialogController
  build() {
    Column() {
      Text('这是自定义弹窗')
        .fontSize(30)
        .height(100)
      Text('弹窗不能主动获取焦点')
        .fontSize(20)
        .height(100)
      Button('点我关闭弹窗')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
          }
        })
        .margin(20)
    }
  }
}
@Entry
@Component
struct CustomDialogUser {
  @State setFocus: boolean = false
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
    }),
  })
  aboutToDisappear() {
    this.dialogController = null
  }

  build() {
    Column() {
      Text('' + this.setFocus).id('text')
      Button('change setAutoFocusTransfer')
            .id('btn')
            .onClick(()=>{
            this.setFocus =!this.setFocus
          })
      Button('click me')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
    .onFocus(()=>{this.getUIContext().getFocusController().setAutoFocusTransfer(this.setFocus)})
  }
}