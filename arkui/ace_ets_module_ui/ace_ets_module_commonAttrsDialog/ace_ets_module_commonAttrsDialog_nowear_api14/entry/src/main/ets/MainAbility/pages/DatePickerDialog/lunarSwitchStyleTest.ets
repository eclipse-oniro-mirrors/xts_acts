// xxx.ets
@Entry
@Component
struct lunarSwitchStyleTest {
  selectedDate: Date = new Date('2010-1-1')
  @State lunar: string = ''

  build() {
    Column() {
      Text('' + this.lunar)
        .id('text')
      Button('Lunar DatePickerDialog')
        .id('btn')
        .margin(20)
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            lunar: true,
            lunarSwitch: true,
            lunarSwitchStyle: {
              selectedColor: Color.Pink,
              strokeColor: Color.Green,
              unselectedColor: Color.Grey
            },
            disappearTextStyle: { color: Color.Pink, font: { size: '22fp', weight: FontWeight.Bold } },
            textStyle: { color: '#ff00ff00', font: { size: '18fp', weight: FontWeight.Normal } },
            selectedTextStyle: { color: '#ff182431', font: { size: '14fp', weight: FontWeight.Regular } },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
              console.info('DatePickerDialog:onDateAccept()' + value.toString())
            },
            onCancel: () => {
              console.info('DatePickerDialog:onCancel()')
            },
            onDateChange: (value: Date) => {
              console.info('DatePickerDialog:onDateChange()' + value.toString())
            },
            onDidAppear: () => {
              console.info('DatePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              this.lunar = 'lunarSwitchStyle'
              console.info('DatePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('DatePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('DatePickerDialog:onWillDisappear()')
            }
          })
        })
    }.width('100%')
  }
}