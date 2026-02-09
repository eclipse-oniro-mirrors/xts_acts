@Entry
@Component
struct TextPickerDialogDefaultTextStyleExample {
  private select: number | number[] = 0
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  @State v: string = '';

  build() {
    Row() {
      Column({ space: 5 }) {
        Button('minFontSize:18 maxFontSize:28')
          .id('btn1')
          .onClick(() => {
            TextPickerDialog.show({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              disableTextStyleAnimation: true,
              defaultTextStyle: { minFontSize: 18, maxFontSize: 28, overflow: TextOverflow.Ellipsis },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            })
          })
        Button('minFontSize:28 maxFontSize:18')
          .id('btn2')
          .onClick(() => {
            TextPickerDialog.show({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              disableTextStyleAnimation: true,
              defaultTextStyle: { minFontSize: 28, maxFontSize: 18, overflow: TextOverflow.Ellipsis },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            })
          })
        Button('minFontSize:undefined maxFontSize:undefined')
          .id('btn3')
          .onClick(() => {
            TextPickerDialog.show({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              disableTextStyleAnimation: true,
              defaultTextStyle: { minFontSize: undefined, maxFontSize: undefined, overflow: undefined },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            })
          })
        Button('minFontSize:null maxFontSize:null')
          .id('btn4')
          .onClick(() => {
            TextPickerDialog.show({
              // 建议使用 this.getUIContext().showTextPickerDialog()接口
              range: this.fruits,
              selected: this.select,
              value: this.v,
              defaultPickerItemHeight: 40,
              disableTextStyleAnimation: true,
              defaultTextStyle: { minFontSize: null, maxFontSize: null, overflow: null },
              onAccept: (value: TextPickerResult) => {
                // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                this.select = value.index
                console.log(this.select + '')
                // 点击确定后，被选到的文本数据展示到页面
                this.v = value.value as string
                console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onScrollStop: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TextPickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TextPickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TextPickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TextPickerDialog:onWillDisappear()')
              }
            })
          })
      }.width('100%')
    }.height('100%')
  }
}