'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Flex,
  FlexAlign,
  ItemAlign,
  Select,
  Color,
  Row,
  Font,
  SymbolEffectStrategy,
  SymbolGlyph,
  $r,
  Navigation,
  List,
  TextInput,
  ListItem,
  ForEach,
  NavigationMode,
  Dimension
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
type NavType = [Dimension, Dimension];

@Entry
@Component
struct Index {
  @State isUndefined: Boolean = false;
  @State isUndefined1: Boolean = false;
  @State isUndefined2: Boolean = false;

  @State minContentWidth: number = 150;
  @State navBarWidth: number = 100;
  @State navBarWidthRange: NavType = ['10vp', '500vp'] as NavType;

  build() {
    Column() {
      Row() {
        Button('isUndefined: ' + this.isUndefined).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isUndefined = !this.isUndefined
          })
          .id('Navigation_mode')
        Button('isUndefined1: ' + this.isUndefined1).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isUndefined1 = !this.isUndefined1
          })
          .id('Navigation_minContentWidth')
        Button('isUndefined2: ' + this.isUndefined2).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isUndefined2 = !this.isUndefined2
          })
          .id('Navigation_navBarWidthRange')
      }

      Row() {
        Column() {
          Navigation() {
            Text('mode')
              .height(50)
              .width('100%')
            Text('mode')
              .height(50)
              .width('100%')
            Text('mode')
              .height(50)
              .width('100%')

          }
          .mode(this.isUndefined ? undefined : NavigationMode.Split)
          .minContentWidth(this.isUndefined1 ? undefined : this.minContentWidth)
          .navBarWidthRange(this.isUndefined2 ? undefined : this.navBarWidthRange as NavType)
          .id('MyNavigation3')
        }
      }
    }
  }
}