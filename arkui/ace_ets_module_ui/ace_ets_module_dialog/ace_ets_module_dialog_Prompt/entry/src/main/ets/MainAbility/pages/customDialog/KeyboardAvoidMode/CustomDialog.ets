@CustomDialog
struct CustomDialogExampleC {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  build() {
    Column() {
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()
        .id('TextInput')
      Button('点我关闭弹窗')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
          }
        })
        .id('close')
        .backgroundColor(Color.Red)
        .margin(20)
      TextInput()
      TextInput()
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()

      Button('点我关闭弹窗')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
          }
        })
        .margin(20)
      TextInput()
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()
      Button('点我关闭弹窗')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
          }
        })
        .margin(20)
      TextInput()
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()
      Button('点我关闭弹窗')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
          }
        })
        .margin(20)
      TextInput()
    }
  }
}
@Entry
@Component
struct CustomDialogUserC {
  @State mText1: string = ''
  @State mText2: string = ''
  @State keyboardAvoidMode1: number | undefined = 0
  @State keyboardAvoidMode2: number | undefined = 1
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleC({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() }
    }),
    cancel: this.existApp,
    autoCancel: true,
    onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
      console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
      console.log("dialog onWillDismiss")
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss()
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss()
      }
    },
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    showInSubWindow: true,
    isModal: true,
    customStyle: false,
    cornerRadius: 10,
  })
  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = null // 将dialogController置空
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Column() {
      Text(this.mText1)
        .id('text1')
      Button('DEFAULT')
        .id('btn1')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExampleC({
              cancel: () => { this.onCancel() },
              confirm: () => { this.onAccept() },
            }),
            width: 350,
            height: 600,
            keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          })
          if (this.dialogController != null) {
            this.dialogController.open()
            this.mText1 = this.keyboardAvoidMode1 + ''
          }
          setTimeout(() => {
            this.dialogController?.close()
          }, 1500)
        }).backgroundColor(0x317aff)

      Text(this.mText2)
        .id('text2')
      Button('NONE')
        .id('btn2')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExampleC({
              cancel: () => { this.onCancel() },
              confirm: () => { this.onAccept() },
            }),
            width: 350,
            height: 600,
            keyboardAvoidMode: KeyboardAvoidMode.NONE,
          })
          if (this.dialogController != null) {
            this.dialogController.open()
            this.mText2 = this.keyboardAvoidMode2 + ''
          }
          setTimeout(() => {
            this.dialogController?.close()
          }, 1500)
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 100 })
  }
}