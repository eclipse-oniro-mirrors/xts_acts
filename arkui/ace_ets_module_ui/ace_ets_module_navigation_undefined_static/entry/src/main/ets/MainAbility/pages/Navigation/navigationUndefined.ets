'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign,ItemAlign, Select, Color, Row, Font, SymbolEffectStrategy,
  SymbolGlyph, $r, Navigation, List, TextInput, ListItem, ForEach,
  NavigationMode, NavBarPosition, NavigationTitleMode, NavigationMenuItem, Dimension } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
type NavType = [Dimension, Dimension];

@Entry
@Component
struct Index {
  @State isNavBarWidthUndefined: Boolean = false;
  @State isNavBarPositionUndefined: Boolean = false;
  @State isBackButtonIconUndefined: Boolean = false;
  @State isMenus: Boolean = true;
  @State isOnNavigationModeChange: Boolean = false;
  @State isOnNavBarStateChange: Boolean = false;
  @State isOnTitleModeChange: Boolean = false;
  @State isHideBackButton: Boolean = false;
  @State isHideTitleBar: Boolean = false;
  @State isHideNavBar: Boolean = false;
  @State isTitle: Boolean = false;
  @State isMinContentWidth: Boolean = false;
  @State isNavBarWidthRange: Boolean = false;

  @State navBarWidth: number = 100;
  @State menuItems:Array<NavigationMenuItem> = [
    {
      value:'menuItem1',
      icon: $r('app.media.startIcon'),
    } as NavigationMenuItem,
    {
      value:'menuItem2',
      icon: $r('app.media.background'),
    } as NavigationMenuItem,
    {
      value:'menuItem3',
      icon: $r('app.media.foreground'),
    } as NavigationMenuItem,
  ]
  @State mode: NavigationMode = NavigationMode.Split;
  @State showMode: NavigationMode = NavigationMode.Split;
  @State navBarVisible: boolean = true;
  @State showNavBarVisible: boolean = true;
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Mini;
  @State showTitleMode: NavigationTitleMode = NavigationTitleMode.Mini;
  @State title: string = 'This is a title';
  @State minContentWidth: number = 150;
  @State navBarWidthRange: NavType = ['10vp', '500vp'] as NavType;

  build() {
    Column() {
      Column() {
        Button('isNavBarWidthUndefined: ' + this.isNavBarWidthUndefined).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isNavBarWidthUndefined = !this.isNavBarWidthUndefined
          })
          .id('Navigation_NavBarWidth')
        Button('isNavBarPositionUndefined: ' + this.isNavBarPositionUndefined).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isNavBarPositionUndefined = !this.isNavBarPositionUndefined
          })
          .id('Navigation_NavBarPosition')
        Button('isBackButtonIconUndefined: ' + this.isBackButtonIconUndefined).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isBackButtonIconUndefined = !this.isBackButtonIconUndefined
          })
          .id('Navigation_BackButtonIcon')
        Button('isMenus: ' + this.isMenus).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isMenus = !this.isMenus
          })
          .id('Navigation_Menus')

        Row(){
          Button('切换mode')
            .onClick(() => {
              if (this.mode == NavigationMode.Split) {
                this.mode = NavigationMode.Stack
              } else if (this.mode == NavigationMode.Stack){
                this.mode = NavigationMode.Split
              }
            })
          Button('isOnNavigationModeChange: ' + this.isOnNavigationModeChange).fontSize(14).fontColor('#182431').fontWeight(500)
            .onClick(() => {
              this.isOnNavigationModeChange = !this.isOnNavigationModeChange
            })
        }
        Row(){
          Button('hideNavBar')
            .onClick(() => {
              this.navBarVisible = !this.navBarVisible
            })
            .id('hideNavBar')
          Button('isOnNavBarStateChange: ' + this.isOnNavBarStateChange).fontSize(14).fontColor('#182431').fontWeight(500)
            .onClick(() => {
              this.isOnNavBarStateChange = !this.isOnNavBarStateChange
            })
            .id('Navigation_OnNavBarStateChange')
        }
        Row(){
          Button('切换titleMode')
            .onClick(() => {
              console.log('ZJL 当前mode:' + this.titleMode)
              if (this.titleMode == NavigationTitleMode.Mini) {
                this.titleMode = NavigationTitleMode.Full
              } else if (this.titleMode == NavigationTitleMode.Full) {
                this.titleMode = NavigationTitleMode.Mini
              }
            })
          Button('isOnTitleModeChange: ' + this.isOnTitleModeChange).fontSize(14).fontColor('#182431').fontWeight(500)
            .onClick(() => {
              this.isOnTitleModeChange = !this.isOnTitleModeChange
            })
        }
        Row(){
          Button('isHideBackButton: ' + this.isHideBackButton).fontSize(14).fontColor('#182431').fontWeight(500)
            .onClick(() => {
              this.isHideBackButton = !this.isHideBackButton
            })
            .id('Navigation_HideBackButton')
          Button('isHideTitleBar: ' + this.isHideTitleBar).fontSize(14).fontColor('#182431').fontWeight(500)
            .onClick(() => {
              this.isHideTitleBar = !this.isHideTitleBar
            })
            .id('Navigation_HideTitleBar')
          Button('isHideNavBar: ' + this.isHideNavBar).fontSize(14).fontColor('#182431').fontWeight(500)
            .onClick(() => {
              this.isHideNavBar = !this.isHideNavBar
            })
            .id('Navigation_HideNavBar')
        }
        Button('isTitle: ' + this.isTitle).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isTitle = !this.isTitle
          })
          .id('Navigation_Title')
        Button('isMinContentWidth: ' + this.isMinContentWidth).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isMinContentWidth = !this.isMinContentWidth
          }).id('Navigation_MinContentWidth')
        Button('isNavBarWidthRange: ' + this.isNavBarWidthRange).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isNavBarWidthRange = !this.isNavBarWidthRange
          }).id('Navigation_NavBarWidthRange')


      }
      Row() {
        Text(`mode:` + this.showMode)
          .fontSize(20)
          .margin(10)
        Button(`NavBarState:` + this.showNavBarVisible)
          .fontSize(20)
          .margin(10)
          .id('NavBarStateButton')
        Text(`TitleMode:` + this.showTitleMode)
          .fontSize(20)
          .margin(10)
      }
      Row() {
        Column() {
          Navigation() {
            Text('navBarWidth')
              .height(50)
              .width('100%')
            Text('navBarPosition')
              .height(50)
              .width('100%')
            Text('backButtonIcon')
              .height(50)
              .width('100%')
          }
          .id('MyNavigation')

          .title(this.isTitle ? undefined : this.title)
          .navBarWidth(this.isNavBarWidthUndefined ? undefined : this.navBarWidth)
          .backButtonIcon(this.isBackButtonIconUndefined ? undefined : $r('app.media.startIcon'))
          .menus(this.isMenus? this.menuItems : undefined)
          .hideNavBar(this.isHideNavBar ? undefined : !this.navBarVisible)
          .onNavBarStateChange(this.isOnNavBarStateChange ? undefined : (isVisible: boolean) => {
            this.showNavBarVisible = isVisible
            console.log('ZJL 导航栏状态变化:', isVisible ? '显示' : '隐藏')
          })
          .navBarPosition(this.isNavBarPositionUndefined ? undefined : NavBarPosition.End)
          .hideBackButton(this.isHideBackButton ? undefined : true)
          .hideTitleBar(this.isHideTitleBar ? undefined : true)
          .minContentWidth(this.isMinContentWidth ? undefined : this.minContentWidth)
          .navBarWidthRange(this.isNavBarWidthRange ? undefined : this.navBarWidthRange as NavType)


          .mode(this.mode)
          .onNavigationModeChange(this.isOnNavigationModeChange ? undefined : (modeChange: NavigationMode) => {
            this.mode = modeChange
            this.showMode = modeChange
          })

          .titleMode(this.titleMode)
          .onTitleModeChange(this.isOnTitleModeChange ? undefined : (modeChange: NavigationTitleMode) => {
            this.titleMode = modeChange
            this.showTitleMode = modeChange
          })

        }
      }
    }
  }
}
