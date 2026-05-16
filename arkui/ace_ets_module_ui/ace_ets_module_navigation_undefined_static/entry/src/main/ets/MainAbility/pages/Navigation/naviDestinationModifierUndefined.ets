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
  Navigation,
  NavDestinationAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Builder
function myMenu() {
  Column() {
    Text('menus')
      .id('NaviDestinationM_menus')
  }
  .backgroundColor(Color.Red)
}

@Observed
export class MyModifier1 implements AttributeModifier<NavDestinationAttribute> {
  public isUndefined1: boolean = true;
  public isUndefined2: boolean = true;
  public isUndefined3: boolean = true;

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance
      .menus(this.isUndefined1 ? undefined : myMenu)
      .title(this.isUndefined2 ? undefined : 'title')
      .toolbarConfiguration(this.isUndefined3 ? undefined : [
        {
          value: 'toolbar',
        }
      ] as Array<ToolbarItem>)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<NavDestinationAttribute> {
  public isUndefined4: boolean = true;
  public isUndefined5: boolean = true;
  public cnt1: int = 0;
  public cnt2: int = 0;

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance
      .onWillShow(this.isUndefined4 ? undefined : () => {
        this.cnt1++;
      })
      .onWillHide(this.isUndefined4 ? undefined : () => {
        this.cnt2++;
      })
  }
}

@Entry
@Component
struct Index {
  private stack: NavPathStack = new NavPathStack();
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();

  @Builder
  PageOne() {
    NavDestination() {
      Column() {
        Row() {
          Button('btn1 : ' + this.myModifier1.isUndefined1)
            .id('NaviDestinationM_btn1')
            .onClick((e: ClickEvent) => {
              this.myModifier1.isUndefined1 = !this.myModifier1.isUndefined1
            })
          Button('btn2 : ' + this.myModifier1.isUndefined2)
            .id('NaviDestinationM_btn2')
            .onClick((e: ClickEvent) => {
              this.myModifier1.isUndefined2 = !this.myModifier1.isUndefined2
            })
          Button('btn3 : ' + this.myModifier1.isUndefined3)
            .id('NaviDestinationM_btn3')
            .onClick((e: ClickEvent) => {
              this.myModifier1.isUndefined3 = !this.myModifier1.isUndefined3
            })
        }
        Button('back')
          .id('NaviDestinationM_back1')
          .onClick((e: ClickEvent) => {
            this.stack.pop();
          })
      }
    }
    .id('NaviDestinationM_1')
    .width('100%')
    .height('100%')
    .borderWidth(1)
    .attributeModifier(this.myModifier1)

  }

  @Builder
  PageTwo() {
    NavDestination() {
      Button('back')
        .id('NaviDestinationM_back2')
        .onClick((e: ClickEvent) => {
          this.stack.pop();
        })
    }
    .title('pageTwo')
    .attributeModifier(this.myModifier2)
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
        Text(`show:${this.myModifier2.cnt1},hide:${this.myModifier2.cnt2}`)
          .id('NaviDestinationM_text')
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
        Button('btn4 : ' + this.myModifier2.isUndefined4)
          .id('NaviDestinationM_btn4')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isUndefined4 = !this.myModifier2.isUndefined4
          })
      }
    }
    .navDestination(this.pageMap)
  }
}