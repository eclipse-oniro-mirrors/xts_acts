@Entry
@Component
struct TextPickerTextStyleExample {
  private select: number = 1
  private fruits: string[] = ['AAAAA', 'BBBBBBBBBBBBB', 'CCCC', 'DDDDDDDD', 'EEE']
  @State minFontSize: number | undefined | null = 18
  @State maxFontSize: number | undefined | null = 28
  @State overflow: TextOverflow | undefined | null = TextOverflow.Ellipsis

  build() {
    Column({ space: 3 }) {
      TextPicker({
        range: this.fruits,
        selected: this.select,
      })
        .height('50%')
        .key('TextPickerTextStyle')
        .disableTextStyleAnimation(true)
        .defaultTextStyle({ minFontSize: this.minFontSize, maxFontSize: this.maxFontSize, overflow: this.overflow })

      Button("min18 < max28")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Normal1')
        .onClick(() => {
          this.minFontSize = 18
          this.maxFontSize = 28
          this.overflow = TextOverflow.Ellipsis
        })

      Button("min18 = max18")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Normal2')
        .onClick(() => {
          this.minFontSize = 18
          this.maxFontSize = 18
          this.overflow = TextOverflow.Ellipsis
        })

      Button("min28 > max18")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Normal3')
        .onClick(() => {
          this.minFontSize = 28
          this.maxFontSize = 18
          this.overflow = TextOverflow.Ellipsis
        })

      Row() {
        Button("undefined")
          .fontSize(12)
          .height('8%')
          .key('TextPickerTextStyle_Undefined')
          .onClick(() => {
            this.minFontSize = undefined
            this.maxFontSize = undefined
            this.overflow = undefined
          })

        Button("null")
          .fontSize(12)
          .height('8%')
          .key('TextPickerTextStyle_Null')
          .onClick(() => {
            this.minFontSize = null
            this.maxFontSize = null
            this.overflow = null
          })
      }

      Button("negative min:-10 max:-20")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Negative')
        .onClick(() => {
          this.minFontSize = -10
          this.maxFontSize = -20
          this.overflow = TextOverflow.Clip
        })
    }.alignItems(HorizontalAlign.Center).width('100%').height('90%').margin({ top: 20 })
  }
}