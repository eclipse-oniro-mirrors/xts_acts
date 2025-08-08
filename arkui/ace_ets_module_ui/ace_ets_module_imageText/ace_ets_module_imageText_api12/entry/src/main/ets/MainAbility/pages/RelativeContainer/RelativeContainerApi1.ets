@Entry
@Component
struct RelativeContainerApi {
  build() {
    Column() {
      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor('#FF3333')
          .id('row1')

        Row().width(100).height(100)
          .backgroundColor('#FFCC00')
          .alignRules({
            middle: {anchor: 'row1', align: HorizontalAlign.End},
            top: {anchor: 'row1', align: VerticalAlign.Bottom}
          })
          .id('row2')

        Row().width(100).height(100)
          .backgroundColor('#FF6633')
          .alignRules({
            start: {anchor: 'barrier1', align: HorizontalAlign.End},
            top: {anchor: 'row1', align: VerticalAlign.Top}
          })
          .id('row3')

        Row().width(50).height(50)
          .backgroundColor('#FF9966')
          .alignRules({
            start: {anchor: 'row1', align: HorizontalAlign.Start},
            top: {anchor: 'barrier2', align: VerticalAlign.Bottom}
          })
          .id('row4')
      }
      .key('RelativeContainerApi1')
      .direction(Direction.Rtl)
      .width(300).height(300)
      .margin({left: 50})
      .barrier([{id: 'barrier1', localizedDirection: LocalizedBarrierDirection.END, referencedId:['row1', 'row2']},
        {id: 'barrier2', localizedDirection: LocalizedBarrierDirection.BOTTOM, referencedId:['row1', 'row2']}])

      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor('#FF3333')
          .id('row11')

        Row().width(100).height(100)
          .backgroundColor('#FFCC00')
          .alignRules({
            middle: {anchor: 'row11', align: HorizontalAlign.End},
            top: {anchor: 'row11', align: VerticalAlign.Bottom}
          })
          .id('row22')

        Row().width(100).height(100)
          .backgroundColor('#FF6633')
          .alignRules({
            left: {anchor: 'barrier11', align: HorizontalAlign.End},
            top: {anchor: 'row11', align: VerticalAlign.Top}
          })
          .id('row33')

        Row().width(50).height(50)
          .backgroundColor('#FF9966')
          .alignRules({
            left: {anchor: 'row11', align: HorizontalAlign.Start},
            top: {anchor: 'barrier22', align: VerticalAlign.Bottom}
          })
          .id('row44')
      }
      .key('RelativeContainerApi2')
      .width(300).height(300)
      .margin({left: 50})
      .barrier([{id: 'barrier11', direction: BarrierDirection.RIGHT, referencedId:['row11', 'row22']},
        {id: 'barrier22', direction: BarrierDirection.BOTTOM, referencedId:['row11', 'row22']}])
    }
    .height('100%')
  }
}