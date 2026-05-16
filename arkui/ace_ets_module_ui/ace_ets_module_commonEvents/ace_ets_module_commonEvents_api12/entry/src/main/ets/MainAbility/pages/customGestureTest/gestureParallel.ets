@Entry
@Component
struct GestureGroupExample_2 {
  @State count: number = 0
  @State borderStyles: BorderStyle = BorderStyle.Solid
  @State message1: string = ''
  @State message2: string = ''

  build() {
    Column(){
      Text(this.message1)
        .id('tapGestureMsg')
        .fontSize(18)
        .margin(10)
      Text(this.message2)
        .id('longPressMsg')
        .fontSize(18)
        .margin(10)
      Column() {
        Text('Parallel')
          .fontSize(18)
          .fontColor(Color.Pink)
      }
      .id('columnParallel1')
      .key('parallelGestureKey')
      .height(200)
      .width(400)
      .padding(20)
      .margin(20)
      .border({ width: 3, style: this.borderStyles })
      .gesture(
        // 以下组合手势为并发识别
        GestureGroup(GestureMode.Parallel,
          TapGesture({count:2})
            .onAction(() => {
              this.borderStyles = BorderStyle.Dashed
              console.info('tapGesture onAction')
              this.message1 = 'tapGesture onAction'
            }),
          LongPressGesture({ repeat: true })
            .onAction((event?: GestureEvent) => {
              if (event && event.repeat) {
                this.count++
                console.info('LongPress onAction')
                this.message2 = 'LongPress onAction'
              }
            })
            .onActionEnd((event: GestureEvent) => {
              this.count = 0
              console.info('LongPress onActionEnd')
              this.message2 = 'LongPress onActionEnd'
            })
        )
      )
    }
  }

}