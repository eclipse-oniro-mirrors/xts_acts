// checkbox
import {MenuModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {
  @State fontSizeIndex: number = 0;
  @State fontSizeList: ( string | number | Resource )[] = [
    '50px', -20, 0
  ]
  @State select: boolean = true
  @State menuItemValue: string = ''
  @State modifier:MenuModifier = new MenuModifier().fontSize(this.fontSizeList[this.fontSizeIndex])
  private iconStr: ResourceStr = $r('app.media.app_icon')
  private iconStr2: ResourceStr = $r('app.media.app_icon')

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
      MenuItem({ startIcon: $r('app.media.app_icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }.attributeModifier(this.modifier as MenuModifier)

  }
  build() {
    Column() {
      Button('切换数值')
        .onClick(() => {
          this.fontSizeIndex++
          if (this.fontSizeIndex > this.fontSizeList.length - 1) {
            this.fontSizeIndex = 0
          }
        })
        .id('MenuFontSizeChangeButtonID')
      Column() {
        Text('click to show menu')
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Green)
      }
      .bindMenu(this.MyMenu)
      .id('MenuFontSizeButtonID')
      .width('100%')
      Text(this.fontSizeList[this.fontSizeIndex].toString()).key('MenuFontSizeValueKey')
    }.width('100%')
  }
}
