@Entry
@Component
struct TextPickerDialogSelectedBgColor {
  showDialog(color: ResourceColor | null | undefined) {
    this.getUIContext().showTextPickerDialog({
      // 建议使用 this.getUIContext().showTextPickerDialog()接口
      range: ['Text1', 'Text1', 'Text1', 'Text1'],
      selectedBackgroundStyle: {
        borderRadius: {
          topLeft: 15,
          topRight: 15,
          bottomLeft: 15,
          bottomRight: 15
        },
        color: color
      }
    })
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Button('Color.White')
        .onClick(() => {
          this.showDialog(Color.White)
        })
        .id('ColorWhiteID')

      Button('rgb(255, 100, 255)')
        .onClick(() => {
          this.showDialog('rgb(255, 100, 255)')
        })
        .id('rgb(255, 100, 255)ID')

      Button('0x008080')
        .onClick(() => {
          this.showDialog(0x008080)
        })
        .id('0x008080ID')

      Button('#00FFFF')
        .onClick(() => {
          this.showDialog('#00FFFF')
        })
        .id('00FFFFID')

      Button('$r(app.color.blue)')
        .onClick(() => {
          this.showDialog($r('app.color.blue'))
        })
        .id('colorBlueID')

      Button('null')
        .onClick(() => {
          this.showDialog(null)
        })
        .id('nullID')

      Button('undefined')
        .onClick(() => {
          this.showDialog(undefined)
        })
        .id('undefinedID')

      Button('xxx')
        .onClick(() => {
          this.showDialog('xxx')
        })
        .id('xxxID')

      Button('-100')
        .onClick(() => {
          this.showDialog(-100)
        })
        .id('-100ID')
    }.width('100%')
  }
}