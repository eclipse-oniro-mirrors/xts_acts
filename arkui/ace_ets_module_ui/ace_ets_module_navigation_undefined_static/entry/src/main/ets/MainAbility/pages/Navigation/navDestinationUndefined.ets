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
  $r,
  Builder,
  ToolbarItem,
  NavDestination,
  NavigationMenuItem,
  NavPathStack,
  NavPathInfo,
  Navigation,
  Text,
  NavigationOperation,
  NavDestinationTransition,
  Callback,
  NavDestinationTransitionDelegate,
  Curve,
  Scroller,
  Scroll,
  Margin,
  List,
  ListItem,
  BarState,
  NestedScrollMode,
  TextAlign,
  NestedScrollInfo,
  NavigationSystemTransitionType,
  NavDestinationMode
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  private listScroller: Scroller = new Scroller();
  private scrollScroller: Scroller = new Scroller();
  private arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  private stack: NavPathStack = new NavPathStack();
  @State message: string = "hello";
  @State isBackButtonIcon: boolean = true
  @State isCustomTransition: boolean = false
  @State isBindToNestedScrollable: boolean = false
  @State isBindToScrollable: boolean = false
  @State isSystemTransition: boolean = false
  @State isOnWill: boolean = false
  @State isHideToolBar: boolean = false
  @State isMode: boolean = false
  @State isHideTitleBar: boolean = false
  @State isShow: boolean = false
  @State isBackAndReady: boolean = false
  @State cnt1: int = 0;
  @State cnt2: int = 0;

  @Builder
  PageOne() {
    NavDestination() {
      Text(this.message)
        .id('NavDestination1_text')
      Button("pop")
        .id('NavDestination1_pop')
        .onClick((e: ClickEvent) => {
          this.stack.pop()
        })
      Button('isBackButtonIcon: ' + this.isBackButtonIcon)
        .id('NavDestination_backButtonIcon')
        .onClick((e: ClickEvent) => {
          this.isBackButtonIcon = !this.isBackButtonIcon;
        })
      Button('isCustomTransition: ' + this.isCustomTransition)
        .id('NavDestination_customTransition')
        .onClick((e: ClickEvent) => {
          this.isCustomTransition = !this.isCustomTransition;
        })
      Button('isBindToNestedScrollable: ' + this.isBindToNestedScrollable)
        .id('NavDestination_bindToNestedScrollable')
        .onClick((e: ClickEvent) => {
          this.isBindToNestedScrollable = !this.isBindToNestedScrollable;
        })
      Button('isBindToScrollable: ' + this.isBindToScrollable)
        .id('NavDestination_bindToScrollable')
        .onClick((e: ClickEvent) => {
          this.isBindToScrollable = !this.isBindToScrollable;
        })

      Scroll(this.scrollScroller) {
        Column() {
          List({ scroller: this.listScroller }) {
            ListItem() {
              Text('1')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Gray)
            }

            ListItem() {
              Text('2')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Gray)
            }

            ListItem() {
              Text('3')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Gray)
            }

            ListItem() {
              Text('4')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Gray)
            }

            ListItem() {
              Text('5')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Gray)
            }
          }.width('100%').height('80%').scrollBar(BarState.Off)
          .nestedScroll({ scrollForward: NestedScrollMode.SELF_FIRST, scrollBackward: NestedScrollMode.SELF_FIRST })

          List() {
            ListItem() {
              Text('1')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Pink)
            }

            ListItem() {
              Text('2')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Pink)
            }

            ListItem() {
              Text('3')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Pink)
            }

            ListItem() {
              Text('4')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Pink)
            }

            ListItem() {
              Text('5')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ left: '5%' } as Margin)
                .borderRadius(10)
                .backgroundColor(Color.Pink)
            }
          }
          .width('100%')
          .scrollBar(BarState.Off)
        }
      }.height('40%')
    }
    .id('NavDestination_1')
    .width('100%')
    .height('100%')
    .borderWidth(1)
    .backButtonIcon(this.isBackButtonIcon ? undefined : $r('app.media.startIcon'))
    .customTransition(this.isCustomTransition ? undefined : (operation: NavigationOperation,
      isEnter: boolean): Array<NavDestinationTransition> | undefined => { 
      let transitionOneEvent: Callback<void> = () => {
        hilog.info(0x0000, 'testTag', 'reached transitionOne, empty now!')
      }
      let transitionOneFinishEvent: Callback<void> = () => {
        hilog.info(0x0000, 'testTag', 'reached transitionOne, empty now!')
      }
      let transitionOneDuration: Int = 500;
      let transitionOne: NavDestinationTransition = {
        duration: transitionOneDuration,
        delay: 0,
        curve: Curve.Friction,
        event: transitionOneEvent,
        onTransitionEnd: transitionOneFinishEvent
      };

      let transitionTwoEvent: Callback<void> = () => {
        hilog.info(0x0000, 'testTag', 'reached transitionTwo, empty now!')
      }
      let transitionTwo: NavDestinationTransition = {
        duration: 1000,
        delay: 0,
        curve: Curve.EaseInOut,
        event: transitionTwoEvent,
        onTransitionEnd: () => {
          hilog.info(0x0000, 'testTag', 'reached transitionTwo, finish')
        }
      };

      return [
        transitionOne,
        transitionTwo,
      ];
    } as NavDestinationTransitionDelegate)
    .bindToNestedScrollable(this.isBindToNestedScrollable ?
      [{ parent: this.scrollScroller, child: this.listScroller }] as Array<NestedScrollInfo> : undefined)
    .bindToScrollable(this.isBindToScrollable ? [this.listScroller] as Array<Scroller> : undefined)
  }

  @Builder
  PageTwo() {
    NavDestination() {
      Text(this.message)
        .id('NavDestination2_text')
      Button("pop")
        .id('NavDestination2_pop')
        .onClick((e: ClickEvent) => {
          this.stack.pop()
        })
      Button('isSystemTransition: ' + this.isSystemTransition)
        .id('NavDestination_systemTransition')
        .onClick((e: ClickEvent) => {
          this.isSystemTransition = !this.isSystemTransition;
        })
      Button('isHideToolBar: ' + this.isHideToolBar)
        .id('NavDestination_hideToolBar')
        .onClick((e: ClickEvent) => {
          this.isHideToolBar = !this.isHideToolBar;
        })
      Button('isMode: ' + this.isMode)
        .id('NavDestination_mode')
        .onClick((e: ClickEvent) => {
          this.isMode = !this.isMode;
        })
      Button('isHideTitleBar: ' + this.isHideTitleBar)
        .id('NavDestination_hideTitleBar')
        .onClick((e: ClickEvent) => {
          this.isHideTitleBar = !this.isHideTitleBar;
        })
    }
    .id('NavDestination_2')
    .systemTransition(this.isSystemTransition ? NavigationSystemTransitionType.FADE : undefined)
    .onWillDisappear(this.isOnWill ? () => {
      this.cnt1++;
    } : undefined)
    .onWillAppear(this.isOnWill ? () => {
      this.cnt2++;
    } : undefined)
    .hideToolBar(this.isHideToolBar ? true : undefined)
    .mode(this.isMode ? NavDestinationMode.DIALOG : undefined)
    .hideTitleBar(this.isHideTitleBar ? true : undefined)
    .onShown(this.isShow ? () => {
      this.cnt1++;
    } : undefined)
    .onHidden(this.isShow ? () => {
      this.cnt2++;
    } : undefined)
    .onReady(this.isBackAndReady ? () => {
      this.cnt1++;
    } : undefined)
    .onBackPressed(this.isBackAndReady ? () => {
      this.cnt2++;
      return true;
    } : undefined)
    .title('pageTwo')
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
      Text(`appear:${this.cnt1} disappear:${this.cnt2}`)
        .id('Navigation_text')
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
        Button('isOnWill: ' + this.isOnWill)
          .id('NavDestination_onWill')
          .onClick((e: ClickEvent) => {
            this.isOnWill = !this.isOnWill;
          })
        Button('isShow: ' + this.isShow)
          .id('NavDestination_isShow')
          .onClick((e: ClickEvent) => {
            this.isShow = !this.isShow;
          })
      }

      Button('isBackAndReady: ' + this.isBackAndReady)
        .id('NavDestination_isBackAndReady')
        .onClick((e: ClickEvent) => {
          this.isBackAndReady = !this.isBackAndReady;
        })

    }
    .navDestination(this.pageMap)
  }
}