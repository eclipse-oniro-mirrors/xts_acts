import {MenuItemModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {
  @State select: boolean = true
  @State menuItemValue: string = ''
  @State modifier:MenuItemModifier = new MenuItemModifier().onChange((value: boolean) => {
    if(value){
      this.menuItemValue = 'true'
    }else {
      this.menuItemValue = 'false'
    }

    console.info('selectMenu02 MenuItemModifier change is' + value)
  })
  private iconStr: ResourceStr = $r('app.media.icon')
  private iconStr2: ResourceStr = $r('app.media.icon')

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
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        }).id('MenuItemOnChangeID')
          .attributeModifier(this.modifier as MenuItemModifier)
    }
  }
  build() {
    Column() {
      Column() {
        Text('menu')
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Green)
      }
      .bindMenu(this.MyMenu)
      .id('MenuItemOnButtonID')
      .width('50%')
      Text(this.menuItemValue.toString()).key('MenuItemOnChangValueKey')
    }.width('100%')
  }
}