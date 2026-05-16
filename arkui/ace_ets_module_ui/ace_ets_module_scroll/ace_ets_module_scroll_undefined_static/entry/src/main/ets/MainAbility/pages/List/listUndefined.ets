'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  TextAlign,
  ForEach,
  LazyForEach,
  Row,
  Blank,
  Scroll,
  CommonMethod,
  ListDividerOptions,
  List,
  ListItem,
  Axis,
  ListItemAlign,
  ChildrenMainSize,
  EdgeEffectOptions,
  EdgeEffect,
  EffectEdge,
  Dimension,
  Edge,
  Scroller,
  ScrollState,
  ColumnOptions,
  ScrollSource,
  ScrollResult,
  OnScrollFrameBeginHandlerResult,
  VisibleListContentInfo,
  BarState,
  StickyStyle,
  ListItemGroupStyle,
  ListItemGroup
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ListEventPage {
  scroller: Scroller = new Scroller();
  private arr: Array<number> =
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20] as Array<number>;
  @State message: string = 'Hello World';
  @State value: ListDividerOptions = {
    strokeWidth: 2,
    color: 0x000000,
    startMargin: 20,
    endMargin: 20
  } as ListDividerOptions;
  @State childrenMainSizeValue: ChildrenMainSize = new ChildrenMainSize(150)
  @State lane: Int = 2;
  @State gutter: Dimension = 50.0;
  @State isAlignListItem: boolean = true;
  @State isChainAnimation: boolean = true;
  @State isChildrenMainSize: boolean = true;
  @State isContentStartOffset: boolean = true;
  @State isContentEndOffset: boolean = true;
  @State isDivider: boolean = true;
  @State isEdgeEffect: boolean = true;
  @State isEdgeEffectOptions: boolean = true;
  @State isValue: boolean = true;
  @State isGutter: boolean = true;
  @State isListDirection: boolean = true;
  @State isMultiSelectable: boolean = true;
  @State isOnDidScroll: boolean = false;
  @State isOnWillScroll: boolean = false;
  @State isOnReachEnd: boolean = false;
  @State isOnReachStart: boolean = false;
  @State isOnScrollFrameBegin: boolean = false;
  @State isOnScrollIndex: boolean = false;
  @State isOnScrollStart: boolean = false;
  @State isOnScrollStop: boolean = false;
  @State isOnScrollVisibleContentChange: boolean = false;
  @State isScrollBar: boolean = true;
  @State isStackFromEnd: boolean = true;
  @State isSticky: boolean = true;

  build() {
    Scroll() {
      Column() {
        Text(this.message)
          .id('List_text')
        List({ scroller: this.scroller }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('Item ' + item)
                  .id('stackFromEnd_' + item)
                  .width('50%')
                  .height(20)
                  .fontSize(12)
                  .textAlign(TextAlign.Center)
              }
              .borderRadius(24)
              .backgroundColor(Color.White)
            }, (item: number, index: int) => `${item}-${index}`)
        }
        .border({ width: 3, color: Color.Red })
        .alignListItem(this.isAlignListItem ? ListItemAlign.End : undefined)
        .chainAnimation(this.isChainAnimation ? true : undefined)
        .childrenMainSize(this.isChildrenMainSize ? this.childrenMainSizeValue : undefined)
        .contentStartOffset(this.isContentStartOffset ? 50.0 : undefined)
        .contentEndOffset(this.isContentEndOffset ? 50.0 : undefined)
        .divider(this.isDivider ? this.value : undefined)
        .edgeEffect(this.isEdgeEffect ? EdgeEffect.None : undefined,
          this.isEdgeEffectOptions ? { alwaysEnabled: true, effectEdge: EffectEdge.START } as EdgeEffectOptions :
            undefined)
        .lanes(this.isValue ? this.lane : undefined, this.isGutter ? this.gutter : undefined)
        .listDirection(this.isListDirection ? Axis.Horizontal : undefined)
        .multiSelectable(this.isMultiSelectable ? true : undefined)
        .onDidScroll(this.isOnDidScroll ? (scrollOffset: Double, scrollState: ScrollState) => {
          this.message = 'onDidScroll';
          console.log(this.message);
        } : undefined)
        .onWillScroll(this.isOnWillScroll ?
          (scrollOffset: Double, scrollState: ScrollState, scrollSource: ScrollSource) => {
            this.message = 'onWillScroll';
            console.log(this.message);
            return { offsetRemain: scrollOffset } as ScrollResult
          } : undefined)
        .onReachEnd(this.isOnReachEnd ? () => {
          this.message = 'onReachEnd';
          console.log(this.message);
        } : undefined)
        .onReachStart(this.isOnReachStart ? () => {
          this.message = 'onReachStart';
          console.log(this.message);
        } : undefined)
        .onScrollFrameBegin(this.isOnScrollFrameBegin ? (offset: number, state: ScrollState) => {
          this.message = 'onScrollFrameBegin';
          console.log(this.message);
          return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
        } : undefined)
        .onScrollIndex(this.isOnScrollIndex ? (start: int, end: int) => {
          this.message = 'onScrollIndex';
          console.log(this.message);
        } : undefined)
        .onScrollStart(this.isOnScrollStart ? () => {
          this.message = 'onScrollStart';
          console.info(this.message);
        } : undefined)
        .onScrollStop(this.isOnScrollStop ? () => {
          this.message = 'onScrollStop';
          console.info(this.message);
        } : undefined)
        .onScrollVisibleContentChange(this.isOnScrollVisibleContentChange ?
          (start: VisibleListContentInfo, end: VisibleListContentInfo) => {
            this.message = 'onScrollVisibleContentChange';
            console.info(this.message);
          } : undefined)
        .scrollBar(this.isScrollBar ? BarState.Off : undefined)
        .stackFromEnd(this.isStackFromEnd ? true : undefined)
        .sticky(this.isSticky ? StickyStyle.Header : undefined)
        .width('80%')
        .height('20%')
        .id('MyList')

        Blank().height(5)
        Column({ space: 5 } as ColumnOptions) {
          Row() {
            Button('flingTop')
              .id('List_flingTop')
              .onClick((e: ClickEvent) => {
                this.scroller.fling(4000);
              })
              .height(20)
            Button('flingBottom')
              .id('List_flingBottom')
              .onClick((e: ClickEvent) => {
                this.scroller.fling(-4000);
              })
              .height(20)
          }
          Row() {
            Button('toBottom')
              .id('List_toBottom')
              .onClick((e: ClickEvent) => {
                console.log('scrollToBottom')
                this.scroller.scrollEdge(Edge.Bottom)
              })
              .height(20)
            Button('toTop')
              .id('List_toTop')
              .onClick((e: ClickEvent) => {
                console.log('scrollToBottom')
                this.scroller.scrollEdge(Edge.Top)
              })
              .height(20)
            Button('resetText')
              .id('List_resetText')
              .onClick((e: ClickEvent) => {
                this.message = 'Hello World';
              })
              .height(20)
          }
          Button('isAlignListItem: ' + this.isAlignListItem)
            .id('List_alignListItem')
            .onClick((e: ClickEvent) => {
              this.isAlignListItem = !this.isAlignListItem
            })
            .height(20)
          Button('isChainAnimation: ' + this.isChainAnimation)
            .id('List_chainAnimation')
            .onClick((e: ClickEvent) => {
              this.isChainAnimation = !this.isChainAnimation
            })
            .height(20)
          Button('isChildrenMainSize: ' + this.isChildrenMainSize)
            .id('List_childrenMainSize')
            .onClick((e: ClickEvent) => {
              this.isChildrenMainSize = !this.isChildrenMainSize
            })
            .height(20)
          Row() {
            Button('isContentStartOffset: ' + this.isContentStartOffset)
              .id('List_contentStartOffset')
              .onClick((e: ClickEvent) => {
                this.isContentStartOffset = !this.isContentStartOffset
              })
              .height(20)
            Button('isContentEndOffset: ' + this.isContentEndOffset)
              .id('List_contentEndOffset')
              .onClick((e: ClickEvent) => {
                this.isContentEndOffset = !this.isContentEndOffset
              })
              .height(20)
          }
          Button('isDivider: ' + this.isDivider)
            .id('List_divider')
            .onClick((e: ClickEvent) => {
              this.isDivider = !this.isDivider
            })
            .height(20)
          Row() {
            Button('isEdgeEffect: ' + this.isEdgeEffect)
              .id('List_edgeEffect')
              .onClick((e: ClickEvent) => {
                this.isEdgeEffect = !this.isEdgeEffect
              })
              .height(20)
            Button('isEdgeEffectOptions: ' + this.isEdgeEffectOptions)
              .id('List_edgeEffectOptions')
              .onClick((e: ClickEvent) => {
                this.isEdgeEffectOptions = !this.isEdgeEffectOptions
              })
              .height(20)
          }
          Row() {
            Button('isValue: ' + this.isValue)
              .id('List_lanesValue')
              .onClick((e: ClickEvent) => {
                this.isValue = !this.isValue
              })
              .height(20)
            Button('isGutter: ' + this.isGutter)
              .id('List_lanesGutter')
              .onClick((e: ClickEvent) => {
                this.isGutter = !this.isGutter
              })
              .height(20)
          }
          Button('isListDirection: ' + this.isListDirection)
            .id('List_listDirection')
            .onClick((e: ClickEvent) => {
              this.isListDirection = !this.isListDirection
            })
            .height(20)
          Button('isMultiSelectable: ' + this.isMultiSelectable)
            .id('List_multiSelectable')
            .onClick((e: ClickEvent) => {
              this.isMultiSelectable = !this.isMultiSelectable
            })
            .height(20)
          Row() {
            Button('isOnDidScroll: ' + this.isOnDidScroll)
              .id('List_onDidScroll')
              .onClick((e: ClickEvent) => {
                this.isOnDidScroll = !this.isOnDidScroll
              })
              .height(20)
            Button('isOnWillScroll: ' + this.isOnWillScroll)
              .id('List_onWillScroll')
              .onClick((e: ClickEvent) => {
                this.isOnWillScroll = !this.isOnWillScroll
              })
              .height(20)
          }

          Row() {
            Button('isOnReachEnd: ' + this.isOnReachEnd)
              .id('List_onReachEnd')
              .onClick((e: ClickEvent) => {
                this.isOnReachEnd = !this.isOnReachEnd
              })
              .height(20)
            Button('isOnReachStart: ' + this.isOnReachStart)
              .id('List_onReachStart')
              .onClick((e: ClickEvent) => {
                this.isOnReachStart = !this.isOnReachStart
              })
              .height(20)
          }
          Row() {
            Button('isOnScrollFrameBegin: ' + this.isOnScrollFrameBegin)
              .id('List_onScrollFrameBegin')
              .onClick((e: ClickEvent) => {
                this.isOnScrollFrameBegin = !this.isOnScrollFrameBegin
              })
              .height(20)
            Button('isOnScrollIndex: ' + this.isOnScrollIndex)
              .id('List_onScrollIndex')
              .onClick((e: ClickEvent) => {
                this.isOnScrollIndex = !this.isOnScrollIndex
              })
              .height(20)
          }
          Row() {
            Button('isOnScrollStart: ' + this.isOnScrollStart)
              .id('List_onScrollStart')
              .onClick((e: ClickEvent) => {
                this.isOnScrollStart = !this.isOnScrollStart
              })
              .height(20)
            Button('isOnScrollStop: ' + this.isOnScrollStop)
              .id('List_onScrollStop')
              .onClick((e: ClickEvent) => {
                this.isOnScrollStop = !this.isOnScrollStop
              })
              .height(20)
          }
          Row() {
            Button('isOnScrollVisibleContentChange: ' + this.isOnScrollVisibleContentChange)
              .id('List_onScrollVisibleContentChange')
              .onClick((e: ClickEvent) => {
                this.isOnScrollVisibleContentChange = !this.isOnScrollVisibleContentChange
              })
              .height(20)
            Button('isScrollBar: ' + this.isScrollBar)
              .id('List_scrollBar')
              .onClick((e: ClickEvent) => {
                this.isScrollBar = !this.isScrollBar
              })
              .height(20)
          }
          Row() {
            Button('isStackFromEnd: ' + this.isStackFromEnd)
              .id('List_stackFromEnd')
              .onClick((e: ClickEvent) => {
                this.isStackFromEnd = !this.isStackFromEnd
              })
              .height(20)
            Button('isSticky: ' + this.isSticky)
              .id('List_sticky')
              .onClick((e: ClickEvent) => {
                this.isSticky = !this.isSticky
              })
              .height(20)
          }
        }
      }
    }
    .width('100%').height('100%')
  }
}
