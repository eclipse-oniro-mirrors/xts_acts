import intl from '@ohos.intl';

@Entry
@Component
struct DateTimeOptionsPage {
  @State indexNumber1: number = 0
  @State isMilitaryTime: boolean = false
  @State opt: (intl.DateTimeOptions | undefined | null)[] = [
    { hour: 'numeric', minute: 'numeric' },
    { hour: 'numeric', minute: '2-digit' },
    { hour: 'numeric', minute: 'undefined' },
    { hour: 'numeric', minute: 'null' },
    { hour: 'numeric', minute: '' },
  ]
  private selectTime: Date = new Date("2024-05-6T08:30:01")
  selectedDate: Date = new Date("2010-1-1")

  showDatePicker() {
    DatePickerDialog.show({
      start: new Date("2000-01-1"),
      end: new Date("2100-12-31"),
      selected: this.selectedDate,
      showTime: true,
      useMilitaryTime: this.isMilitaryTime,
      dateTimeOptions: this.opt[this.indexNumber1],
      onDateAccept: (value: Date) => {
        this.selectedDate = value
      }
    })
  }

  build() {
    Column() {
      Button('TimePicker 12/24-hour format')
        .margin(15)
        .onClick(() => {
          this.isMilitaryTime = !this.isMilitaryTime
        })
      Row({ space: 2 }) {
        Button("Set TimeType ++")
          .id("DateTimeOptions")
          .margin({ top: 15 })
          .onClick(() => {
            this.indexNumber1++
            if (this.indexNumber1 > this.opt.length - 1) {
              this.indexNumber1 = 0
            }
            this.showDatePicker();
          })
        Button("Set TimeType --")
          .margin({ top: 15 })
          .onClick(() => {
            this.indexNumber1--
            if (this.indexNumber1 < 0) {
              this.indexNumber1 = this.opt.length - 1
            }
            this.showDatePicker();
          })
      }

      Text(`${this.indexNumber1 + 1} / ${this.opt.length}`)
      Text(`${JSON.stringify(this.opt[this.indexNumber1])} / ${this.isMilitaryTime}`)
        .id("DateTimeOptionsValue")
        .margin({ top: 15 })
        .shadow(ShadowStyle.OUTER_DEFAULT_XS)
        .height("60vp")
        .width("100%")
    }.width("100%")
  }
}