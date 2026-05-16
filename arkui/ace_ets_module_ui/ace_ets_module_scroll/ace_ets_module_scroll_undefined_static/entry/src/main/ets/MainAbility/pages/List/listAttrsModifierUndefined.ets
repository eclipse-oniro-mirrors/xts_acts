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
  AttributeModifier,
  ListAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ListAttribute> {
  public isAlignListItem: boolean = true;
  public isChainAnimation: boolean = true;
  public isContentStartOffset: boolean = true;
  public isContentEndOffset: boolean = true;
  public isDivider: boolean = true;
  public isEdgeEffect: boolean = true;
  public isEdgeEffectOptions: boolean = true;
  public isValue: boolean = true;
  public isGutter: boolean = true;
  public isListDirection: boolean = true;
  public isMultiSelectable: boolean = true;
  public isOnDidScroll: boolean = false;
  public isOnWillScroll: boolean = false;
  public isOnReachEnd: boolean = false;
  public isOnReachStart: boolean = false;
  public isOnScrollFrameBegin: boolean = false;
  public isOnScrollIndex: boolean = false;
  public isOnScrollStart: boolean = false;
  public isOnScrollStop: boolean = false;
  public isOnScrollVisibleContentChange: boolean = false;
  public isScrollBar: boolean = true;
  public isStackFromEnd: boolean = true;
  public isSticky: boolean = true;
  public message: string = 'Hello World';
  public value: ListDividerOptions = {
    strokeWidth: 2,
    color: 0x000000,
    startMargin: 20,
    endMargin: 20
  } as ListDividerOptions;
  public lane: Int = 2;
  public gutter: Dimension = 50.0;

  applyNormalAttribute(instance: ListAttribute): void {
    instance
      .alignListItem(this.isAlignListItem ? ListItemAlign.End : undefined)
      .chainAnimation(this.isChainAnimation ? true : undefined)
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
  }
}

@Entry
@Component
struct ListEventPage {
  scroller: Scroller = new Scroller();
  private arr: Array<number> =
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20] as Array<number>;
  @State myModifier: MyModifier = new MyModifier();


  build() {
    Scroll() {
      Column() {
        Text(this.myModifier.message)
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
        .attributeModifier(this.myModifier)
        .width('80%')
        .height('20%')
        .id('MyListAttrsModifier')

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
                this.myModifier.message = 'Hello World';
              })
              .height(20)
          }
          Button('isAlignListItem: ' + this.myModifier.isAlignListItem)
            .id('List_alignListItem')
            .onClick((e: ClickEvent) => {
              this.myModifier.isAlignListItem = !this.myModifier.isAlignListItem
            })
            .height(20)
          Button('isChainAnimation: ' + this.myModifier.isChainAnimation)
            .id('List_chainAnimation')
            .onClick((e: ClickEvent) => {
              this.myModifier.isChainAnimation = !this.myModifier.isChainAnimation
            })
            .height(20)
          Row() {
            Button('isContentStartOffset: ' + this.myModifier.isContentStartOffset)
              .id('List_contentStartOffset')
              .onClick((e: ClickEvent) => {
                this.myModifier.isContentStartOffset = !this.myModifier.isContentStartOffset
              })
              .height(20)
            Button('isContentEndOffset: ' + this.myModifier.isContentEndOffset)
              .id('List_contentEndOffset')
              .onClick((e: ClickEvent) => {
                this.myModifier.isContentEndOffset = !this.myModifier.isContentEndOffset
              })
              .height(20)
          }
          Button('isDivider: ' + this.myModifier.isDivider)
            .id('List_divider')
            .onClick((e: ClickEvent) => {
              this.myModifier.isDivider = !this.myModifier.isDivider
            })
            .height(20)
          Row() {
            Button('isEdgeEffect: ' + this.myModifier.isEdgeEffect)
              .id('List_edgeEffect')
              .onClick((e: ClickEvent) => {
                this.myModifier.isEdgeEffect = !this.myModifier.isEdgeEffect
              })
              .height(20)
            Button('isEdgeEffectOptions: ' + this.myModifier.isEdgeEffectOptions)
              .id('List_edgeEffectOptions')
              .onClick((e: ClickEvent) => {
                this.myModifier.isEdgeEffectOptions = !this.myModifier.isEdgeEffectOptions
              })
              .height(20)
          }
          Row() {
            Button('isValue: ' + this.myModifier.isValue)
              .id('List_lanesValue')
              .onClick((e: ClickEvent) => {
                this.myModifier.isValue = !this.myModifier.isValue
              })
              .height(20)
            Button('isGutter: ' + this.myModifier.isGutter)
              .id('List_lanesGutter')
              .onClick((e: ClickEvent) => {
                this.myModifier.isGutter = !this.myModifier.isGutter
              })
              .height(20)
          }
          Button('isListDirection: ' + this.myModifier.isListDirection)
            .id('List_listDirection')
            .onClick((e: ClickEvent) => {
              this.myModifier.isListDirection = !this.myModifier.isListDirection
            })
            .height(20)
          Button('isMultiSelectable: ' + this.myModifier.isMultiSelectable)
            .id('List_multiSelectable')
            .onClick((e: ClickEvent) => {
              this.myModifier.isMultiSelectable = !this.myModifier.isMultiSelectable
            })
            .height(20)
          Row() {
            Button('isOnDidScroll: ' + this.myModifier.isOnDidScroll)
              .id('List_onDidScroll')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnDidScroll = !this.myModifier.isOnDidScroll
              })
              .height(20)
            Button('isOnWillScroll: ' + this.myModifier.isOnWillScroll)
              .id('List_onWillScroll')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnWillScroll = !this.myModifier.isOnWillScroll
              })
              .height(20)
          }

          Row() {
            Button('isOnReachEnd: ' + this.myModifier.isOnReachEnd)
              .id('List_onReachEnd')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnReachEnd = !this.myModifier.isOnReachEnd
              })
              .height(20)
            Button('isOnReachStart: ' + this.myModifier.isOnReachStart)
              .id('List_onReachStart')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnReachStart = !this.myModifier.isOnReachStart
              })
              .height(20)
          }
          Row() {
            Button('isOnScrollFrameBegin: ' + this.myModifier.isOnScrollFrameBegin)
              .id('List_onScrollFrameBegin')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnScrollFrameBegin = !this.myModifier.isOnScrollFrameBegin
              })
              .height(20)
            Button('isOnScrollIndex: ' + this.myModifier.isOnScrollIndex)
              .id('List_onScrollIndex')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnScrollIndex = !this.myModifier.isOnScrollIndex
              })
              .height(20)
          }
          Row() {
            Button('isOnScrollStart: ' + this.myModifier.isOnScrollStart)
              .id('List_onScrollStart')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnScrollStart = !this.myModifier.isOnScrollStart
              })
              .height(20)
            Button('isOnScrollStop: ' + this.myModifier.isOnScrollStop)
              .id('List_onScrollStop')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnScrollStop = !this.myModifier.isOnScrollStop
              })
              .height(20)
          }
          Row() {
            Button('isOnScrollVisibleContentChange: ' + this.myModifier.isOnScrollVisibleContentChange)
              .id('List_onScrollVisibleContentChange')
              .onClick((e: ClickEvent) => {
                this.myModifier.isOnScrollVisibleContentChange = !this.myModifier.isOnScrollVisibleContentChange
              })
              .height(20)
            Button('isScrollBar: ' + this.myModifier.isScrollBar)
              .id('List_scrollBar')
              .onClick((e: ClickEvent) => {
                this.myModifier.isScrollBar = !this.myModifier.isScrollBar
              })
              .height(20)
          }
          Row() {
            Button('isStackFromEnd: ' + this.myModifier.isStackFromEnd)
              .id('List_stackFromEnd')
              .onClick((e: ClickEvent) => {
                this.myModifier.isStackFromEnd = !this.myModifier.isStackFromEnd
              })
              .height(20)
            Button('isSticky: ' + this.myModifier.isSticky)
              .id('List_sticky')
              .onClick((e: ClickEvent) => {
                this.myModifier.isSticky = !this.myModifier.isSticky
              })
              .height(20)
          }

        }
      }

    }
    .width('100%').height('100%')
  }
}
