@Entry
@Component
struct TextPickerTextStyleAnimation {
  private select: number = 1
  private fruits: string[] = ['AAAAA', 'BBBBBBBBBBBBB', 'CCCC', 'DDDDDDDD', 'EEE']
  @State textStyleAnimation: boolean | undefined| null = true
  @State minFontSize: number | undefined | null = 18
  @State maxFontSize: number | undefined | null = 28
  @State overflow: TextOverflow | undefined | null = TextOverflow.Ellipsis

  build() {
    Column() {
      TextPicker({
        range: this.fruits,
        selected: this.select,
        value: this.fruits[this.select]
      })
        .key('TextPickerAnimation')
        .disableTextStyleAnimation(this.textStyleAnimation)
        .defaultTextStyle({ minFontSize: this.minFontSize, maxFontSize: this.maxFontSize, overflow: this.overflow })
        .margin({ bottom: 15 })


      Row() {
        Button("true")
          .fontSize(12)
          .height('8%')
          .key('TextStyleAnimation_TRUE')
          .onClick(() => {
            this.textStyleAnimation = true
          })

        Button("false")
          .fontSize(12)
          .height('8%')
          .key('TextStyleAnimation_FALSE')
          .onClick(() => {
            this.textStyleAnimation = false
          })
      }

      Row() {
        Button("undefined")
          .fontSize(12)
          .height('8%')
          .key('TextStyleAnimation_UNDEFINED')
          .onClick(() => {
            this.textStyleAnimation = undefined
          })

        Button("null")
          .fontSize(12)
          .height('8%')
          .key('TextStyleAnimation_NULL')
          .onClick(() => {
            this.textStyleAnimation = null
          })
      }
    }.width('100%').height('100%')
  }
}