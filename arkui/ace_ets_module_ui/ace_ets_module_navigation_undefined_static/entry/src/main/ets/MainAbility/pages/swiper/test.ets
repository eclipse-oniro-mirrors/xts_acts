'use static'
import { State } from '@ohos.arkui.stateManagement'
import { LevelMode, ImmersiveMode, LevelOrder} from '@ohos.promptAction'
import promptAction from '@ohos.promptAction';
import { Callback, BusinessError } from '@ohos.base';
import { ComponentContent, FrameNode, Frame } from '@ohos.arkui.node';
import { UIContext, OverlayManager, UIInspector, OverlayManagerOptions, PromptAction } from '@ohos.arkui.UIContext'
import {
  $r, Entry, Text, Column, Component, Button, ClickEvent, LengthMetrics, Color, TextAlign, List, ListItem,
  ListScroller, Builder, ForEach, Row, TransitionType, FlexAlign, ColumnOptions, Slider, SliderStyle, Divider,
  SliderBlockType, Path, SizeOptions, ResourceColor, Length, ResourceStr, Select, ArrowPosition, MenuAlignType,
  MenuItemConfiguration, WrappedBuilder, ContentModifier, Dimension, MenuOutlineOptions, OnSelectCallback,
  CustomBuilderT, SwiperController, Swiper, AutoPlayOptions, SwiperDisplayMode, EdgeEffect,
  OnSwiperAnimationEndCallback, OnSwiperAnimationStartCallback, ContentDidScrollCallback, ContentWillScrollCallback,
  SwiperContentWillScrollResult, OnSwiperGestureSwipeCallback, SwiperAnimationEvent, AttributeModifier,
  ListAttribute, Position, DotIndicator
} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import { IDataSource, DataChangeListener, LazyForEach } from '@kit.ArkUI';
import {
  BlurStyle, ShadowOptions, ShadowStyle, HoverModeAreaType, Rectangle, TransitionEffect, KeyboardAvoidMode,
  DismissReason, BackgroundBlurStyleOptions, BackgroundEffectOptions, BlurStyleActivePolicy, ThemeColorMode,
  AdaptiveColor, ShadowType
} from 'arkui.component.common';
import { DismissDialogAction } from 'arkui.component.actionSheet';
import {
  AlertDialogParamWithConfirm, AlertDialogParamWithButtons, AlertDialogParamWithOptions, DialogAlignment
} from 'arkui.component.alertDialog';
import { WordBreak, DialogButtonStyle, BorderStyle, Alignment, Curve } from 'arkui.component.enums';
import { ActionSheetOptions, ActionSheetButtonOptions } from 'arkui.component.actionSheet';
import { NavPathStack, NavigationOperation, NavBar, Navigation } from 'arkui.component.navigation';
import { ButtonType, ButtonStyleMode, ButtonRole } from 'arkui.component.button';
import { NavDestination } from 'arkui.component.navDestination';
import { Scroller } from 'arkui.component.scroll';
import { ColoringStrategy } from 'arkui.component.enums'
@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index:number = 0;
  build() {
    Column() {
      Button('isUndefined = ' + this.buttonText)
        .onClick(() => {
          this.isUndefined == true ? this.isUndefined = false : this.isUndefined = true
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        })
      Column() {
        Text('indicator').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).indicator( this.isUndefined ? undefined : false)
        Divider().margin(10)
      }
    }.width('100%')
  }
}