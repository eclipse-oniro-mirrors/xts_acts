@Entry
@Component
struct Index {
  @State select: boolean = true;
  

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: '复制', labelInfo: 'Ctrl+C' })
      MenuItem({ content: '粘贴', labelInfo: 'Ctrl+V' })
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({ startIcon: $r('app.media.app_icon'), content: '菜单选项' })
        .selectIcon(undefined)
        .contentFont(undefined)
        .contentFontColor(undefined)
        .labelFont(undefined)
        .labelFontColor(undefined)
    }.fontSize(undefined).font(undefined).fontColor(undefined).menuItemDivider(undefined).menuItemGroupDivider(undefined).key('Menuundefined')
  }

  @Builder
  MyMenu1(){
    Menu() {
      MenuItem({ startIcon: $r('app.media.app_icon'), content: '菜单选项' })
        .selectIcon(null)
        .contentFont(null)
        .contentFontColor(null)
        .labelFont(null)
        .labelFontColor(null)
        .key('Menuitemnull')
    }.fontSize(null).font(null).fontColor(null).menuItemDivider(null).menuItemGroupDivider(null).key('Menunull')
  }

  build() {
    Row() {
      Column() {
        Text('menu_undefined')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .id('undefined')
      }
      .bindMenu(this.MyMenu,{showInSubWindow:false})
      // .width('100%')\
      Column(){
        Text('menu_null')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .id('null')
      }
      .bindMenu(this.MyMenu1,{showInSubWindow:false})
      // .width('100%')

    }
    .height('100%')
  }
}