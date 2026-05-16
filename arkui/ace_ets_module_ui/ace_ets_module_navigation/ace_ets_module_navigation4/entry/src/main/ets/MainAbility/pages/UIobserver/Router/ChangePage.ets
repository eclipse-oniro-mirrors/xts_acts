@Entry
@Component
struct ChangePage {
  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
       Button('pop').onClick(() => {
         this.getUIContext().getRouter().back();
       }).id('popId')
    }
    .width('100%')
    .height('50%')
  }
}