'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  Builder,
  ToolbarItem,
  NavDestination,
  NavigationMenuItem,
  NavPathStack,
  NavPathInfo,
  Navigation
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  @State isUndefined2: boolean = true;
  @State isUndefined3: boolean = true;
  @State isUndefined4: boolean = true;
  @State isUndefined5: boolean = true;
  @State cnt1: int = 0;
  @State cnt2: int = 0;
  private stack: NavPathStack = new NavPathStack();

  @Builder
  myMenu() {
    Column() {
      Text('menus')
        .id('NaviDestination_menus')
    }
    .backgroundColor(Color.Red)
  }

  @Builder
  PageOne() {
    NavDestination() {
      Column() {
        Row() {
          Button('btn1 : ' + this.isUndefined1)
            .id('NaviDestination_btn1')
            .onClick((e: ClickEvent) => {
              this.isUndefined1 = !this.isUndefined1
            })
          Button('btn2 : ' + this.isUndefined2)
            .id('NaviDestination_btn2')
            .onClick((e: ClickEvent) => {
              this.isUndefined2 = !this.isUndefined2
            })
          Button('btn3 : ' + this.isUndefined3)
            .id('NaviDestination_btn3')
            .onClick((e: ClickEvent) => {
              this.isUndefined3 = !this.isUndefined3
            })
        }

        Button('back')
          .id('NaviDestination_back1')
          .onClick((e: ClickEvent) => {
            this.stack.pop();
          })
      }

    }
    .id('NaviDestination_1')
    .width('100%')
    .height('100%')
    .borderWidth(1)
    .menus(this.isUndefined1 ? undefined : this.myMenu)
    .title(this.isUndefined2 ? undefined : 'title')
    .toolbarConfiguration(this.isUndefined3 ? undefined : [
      {
        value: 'toolbar',
      }
    ] as Array<ToolbarItem>)
  }

  @Builder
  PageTwo() {
    NavDestination() {
      Button('back')
        .id('NaviDestination_back2')
        .onClick((e: ClickEvent) => {
          this.stack.pop();
        })
    }
    .title('pageTwo')
    .onWillShow(this.isUndefined4 ? undefined : () => {
      this.cnt1++;
    })
    .onWillHide(this.isUndefined4 ? undefined : () => {
      this.cnt2++;
    })
  }

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      this.PageOne()
    } else if (name == 'pageTwo') {
      this.PageTwo()
    }
  }

  build() {
    Navigation(this.stack) {
      Row() {
        Text(`show:${this.cnt1},hide:${this.cnt2}`)
          .id('NaviDestination_text')
      }

      Row() {
        Button('pageOne')
          .onClick((event: ClickEvent) => {
            this.stack.pushPath(new NavPathInfo('pageOne', undefined))
          })
          .id('pageOne')
        Button('pageTwo')
          .onClick((event: ClickEvent) => {
            this.stack.pushPath(new NavPathInfo('pageTwo', undefined))
          })
          .id('pageTwo')
      }

      Row() {
        Button('btn4 : ' + this.isUndefined4)
          .id('NaviDestination_btn4')
          .onClick((e: ClickEvent) => {
            this.isUndefined4 = !this.isUndefined4
          })
      }
    }
    .navDestination(this.pageMap)
  }
}