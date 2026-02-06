@Entry
@Component
struct TimePickerSelectedAreaExample {
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  @State textFlag: string = ''
  build() {
    Column() {
      Text(this.textFlag).id('textFlag').height('5%').width('90%').margin({ top: 10, bottom: 10 }).textAlign(TextAlign.Center)
      TimePicker({
        selected: this.selectedTime
      }).id('timePicker')
        .width('90%')
        .height('80%')
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute)
            console.info('select current time is: ' + JSON.stringify(value))
          }
        })
        .onEnterSelectedArea((value: TimePickerResult) => {
          this.textFlag = 'enter'
          console.info('item enter selected area, time is: ' + JSON.stringify(value))
        })
    }.alignItems(HorizontalAlign.Center).width('100%').height('90%')
  }
}