@Entry
@Component
struct TimePickerLoopExample {
  @State isLoop: boolean | undefined = true
  private selectedTime: Date = new Date('2022-07-22T12:00:00')

  build() {
    Column() {
      TimePicker({
        selected: this.selectedTime
      })
        .id('timePicker')
        .loop(this.isLoop)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute)
            console.info('select current date is: ' + JSON.stringify(value))
          }
        })

      Row() {
        Button('TRUE').id('trueFlag').width('20%').fontSize(8).onClick(() => {
          this.isLoop = true
        })
        Button('FALSE').id('falseFlag').width('20%').fontSize(8).onClick(() => {
          this.isLoop = false
        })
        Button('UNDEFINED').id('undefinedFlag').width('20%').fontSize(8).onClick(() => {
          this.isLoop = undefined
        })
      }
    }.width('100%')
  }
}