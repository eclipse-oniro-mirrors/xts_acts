import { MenuItemModifier } from '@ohos.arkui.modifier'

class MyMenuItemContentModifier implements ContentModifier<MenuItemConfiguration> {
  modifierText: string = ""
  constructor(text: string) {
    this.modifierText = text;
  }
  applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
    return wrapBuilder(MenuItemBuilder)
  }
}

@Builder
function MenuItemBuilder(configuration: MenuItemConfiguration) {
  Row() {
    Text(configuration.value).id("RowValue")
    Blank()
    Image(configuration.icon).size({ width: 40, height: 40 })
    Blank(30)
    Text((configuration.contentModifier as MyMenuItemContentModifier).modifierText)
    Path()
      .width('100px')
      .height('150px')
      .commands('M40 0 L80 100 L0 100 Z')
      .fillOpacity(0)
      .stroke(Color.Black)
      .strokeWidth(3)
  }
  .onClick(() => {
    configuration.triggerSelect(configuration.index, configuration.value.valueOf().toString())
  })
}

@Entry
@Component
struct triggerSelectExample {
  @State text: string = "有modifier"
  @State triggerSelect: string = "triggerSelect"

  build() {
    Column() {
      Row() {
        Text(this.triggerSelect).margin(30).id("triggerSelectValue")
        Select([{ value: 'item1', icon: $r("app.media.icon") },
          { value: 'item2', icon: $r("app.media.icon") }])
          .value(this.text)
          .onSelect((index:number, text?: string)=>{
            this.triggerSelect = 'Select index:' + index + 'Select text:' + text
            console.info('Select index:' + index)
            console.info('Select text:' + text)
          })
          .menuItemContentModifier(new MyMenuItemContentModifier("我来自Modifier"))
          .id("SelectClick")

      }.alignItems(VerticalAlign.Center).height("50%")
    }
  }
}