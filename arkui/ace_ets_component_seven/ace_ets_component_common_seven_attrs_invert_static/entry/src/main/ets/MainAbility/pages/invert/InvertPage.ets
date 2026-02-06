'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { attrsManager } from '../../common/AttrsManager'
import router from '@ohos.router'
import { Entry, Component, Row, Text, Color, Column, Scroller, CanvasRenderingContext2D, RenderingContextSettings,
  AlphabetIndexer, Button, Blank, Checkbox, CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator,
  LoadingProgress, Marquee, Navigation, Menu, $r, MenuItem, QRCode, Radio, Rating, ScrollBar, Select, MenuItemOptions,
  Slider, TextArea, TextClock, TextInput, TextPicker, TimePicker, Toggle, Web, Circle, Ellipse, Line, WebviewController,
  Polyline, Polygon, Path, Rect, Shape, Badge, ColumnSplit, Counter, Flex, GridRow, Grid, List, Refresh, ProgressType, FlowItem,
  RelativeContainer, RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, WaterFlow, CalendarPicker,
  FormLink, Hyperlink, Progress, BarState, Search, SliderStyle, TextTimer, ToggleType, TextAlign,
  GridRowDirection, ForEach, ListItem, ListItemGroup, VerticalAlign, HorizontalAlign, SideBarContainerType, FlexAlign,
  TabContent, GridCol, GridItem, MenuItemGroup, Canvas, Span, AttributeModifier, AlphabetIndexerAttribute, BadgeAttribute, ButtonAttribute,
  BlankAttribute, CalendarPickerAttribute, CanvasAttribute, CheckboxAttribute, CheckboxGroupAttribute, CircleAttribute,
  ColumnAttribute, ColumnSplitAttribute, CounterAttribute, DataPanelAttribute, DatePickerAttribute, DividerAttribute,applyStyles,CommonMethod,
  EllipseAttribute, FlexAttribute, FlowItemAttribute, FormLinkAttribute, GaugeAttribute, GridAttribute, GridColAttribute,
  GridItemAttribute, GridRowAttribute, HyperlinkAttribute, ImageAttribute, ImageAnimatorAttribute, LineAttribute, ListAttribute,
  ListItemAttribute, ListItemGroupAttribute, LoadingProgressAttribute, MarqueeAttribute, MenuAttribute, MenuItemAttribute,
  MenuItemGroupAttribute, NavDestinationAttribute, NavigationAttribute, PathAttribute, PolygonAttribute, PolylineAttribute,
  ProgressAttribute, QRCodeAttribute, RadioAttribute, RatingAttribute, RectAttribute, RefreshAttribute, RelativeContainerAttribute,
  RemoteWindowAttribute, RichEditorAttribute, RichTextAttribute, RowAttribute, RowSplitAttribute, ScrollAttribute, ScrollBarAttribute,
  SearchAttribute, SelectAttribute, ShapeAttribute, SliderAttribute, SpanAttribute, StackAttribute,
  SwiperAttribute, SideBarContainerAttribute, ToggleAttribute, TabContentAttribute, TabsAttribute,
  TextAttribute, TextAreaAttribute, TextClockAttribute, TextInputAttribute, TextPickerAttribute, TextTimerAttribute,
  TimePickerAttribute, VideoAttribute, WaterFlowAttribute, WebAttribute, WindowSceneAttribute, XComponentAttribute, GridRowOptions,
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, EffectComponentAttribute, FormComponentAttribute,
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, AlignRuleOption } from '@ohos.arkui.component'
import { State, StoragePropRef,AppStorage } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
// class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
//   mInvert: number= 10
//   applyNormalAttribute(instance: NavigatorAttribute): void {
//     console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
//    instance.invert(this.mInvert)
//   }
// }
// class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
//   mInvert: number= 10
//   applyNormalAttribute(instance: NavRouterAttribute): void {
//     console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
//    instance.invert(this.mInvert)
//   }
// }
class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mInvert: number= 10
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`invert page show ${JSON.stringify(this.mInvert)}`)
   instance.invert(this.mInvert)
  }
}
function commonStyleAlphabetIndexer(this: AlphabetIndexerAttribute, componentKey: string, invert: number){
  this.invert(invert)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ButtonAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CounterAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EffectComponentAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormComponentAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EllipseAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlexAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GaugeAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridColAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridItemAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridRowAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LineAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavigationAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PathAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolygonAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolylineAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ProgressAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RadioAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RatingAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RectAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RefreshAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichTextAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SearchAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SelectAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ShapeAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SliderAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SpanAttribute, componentKey: string){
  // this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: StackAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SwiperAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ToggleAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabsAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextClockAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextInputAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: VideoAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WebAttribute, componentKey: string){

  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CanvasAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: XComponentAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DividerAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CircleAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabContentAttribute, componentKey: string){
  this.height('100%')
  this.key(componentKey)
  return this
}

@Entry
@Component
struct invertPage {
  @State _invert: number = 0
  @StoragePropRef('_invertAlphabetIndexer') invertAlphabetIndexerInvert: number = 0
  @State _invertAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _invertBadgeMod: BadgeModifier = new BadgeModifier()
  @State _invertBlankMod: BlankModifier = new BlankModifier()
  @State _invertButttonMod: ButtonModifier = new ButtonModifier()
  @State _invertCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _invertCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _invertCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _invertColumnMod: ColumnModifier = new ColumnModifier()
  @State _invertColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _invertCounterMod: CounterModifier = new CounterModifier()
  @State _invertDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _invertDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _invertDividerMod: DividerModifier = new DividerModifier()
  @State _invertEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _invertFlexMod: FlexModifier = new FlexModifier()
  @State _invertFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _invertFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _invertFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _invertGaugeMod: GaugeModifier = new GaugeModifier()
  @State _invertGridMod: GridModifier = new GridModifier()
  @State _invertGridColMod: GridColModifier = new GridColModifier()
  @State _invertGridItemMod: GridItemModifier = new GridItemModifier()
  @State _invertGridRowMod: GridRowModifier = new GridRowModifier()
  @State _invertHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _invertImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _invertImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _invertImageMod: ImageModifier = new ImageModifier()
  @State _invertListMod: ListModifier = new ListModifier()
  @State _invertListItemMod: ListItemModifier = new ListItemModifier()
  @State _invertListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _invertLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _invertMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _invertMenuMod: MenuModifier = new MenuModifier()
  @State _invertMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _invertMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _invertNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  // @State _invertNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _invertNavigationMod: NavigationModifier = new NavigationModifier()
  // @State _invertNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _invertPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _invertPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _invertQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _invertRadioMod: RadioModifier = new RadioModifier()
  @State _invertRatingMod: RatingModifier = new RatingModifier()
  @State _invertRefreshMod: RefreshModifier = new RefreshModifier()
  @State _invertRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _invertRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _invertRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _invertRichTextMod: RichTextModifier = new RichTextModifier()
  @State _invertRowMod: RowModifier = new RowModifier()
  @State _invertRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _invertScrollMod: ScrollModifier = new ScrollModifier()
  @State _invertScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _invertSearchMod: SearchModifier = new SearchModifier()
  @State _invertSelectMod: SelectModifier = new SelectModifier()
  @State _invertSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _invertSliderMod: SliderModifier = new SliderModifier()
  @State _invertStackMod: StackModifier = new StackModifier()
  @State _invertSwiperMod: SwiperModifier = new SwiperModifier()
  @State _invertTabContentMod: TabContentModifier = new TabContentModifier()
  @State _invertTabsMod: TabsModifier = new TabsModifier()
  @State _invertTextMod: TextModifier = new TextModifier()
  @State _invertTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _invertTextClockMod: TextClockModifier = new TextClockModifier()
  @State _invertTextInputMod: TextInputModifier = new TextInputModifier()
  @State _invertTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _invertTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _invertTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _invertToggleMod: ToggleModifier = new ToggleModifier()
  @State _invertUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _invertWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _invertWebMod: WebModifier = new WebModifier()
  @State _invertXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: int = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 invert page show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    AppStorage.setOrCreate<number>('_invertAlphabetIndexer',routerParamOptions.view.testValue.setValue.invert)
    console.log(this.invertAlphabetIndexerInvert,'abc112233')
    const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
      .getElement("view")
    this.targetView = viewElement.getString("targetView")
    this.componentKey = viewElement.getString("componentKey")
    this.parentWidth = viewElement.getDouble("parentWidth")
    this.parentHeight = viewElement.getDouble("parentHeight")
    this.columns = viewElement.getInteger("columns")
    this.gutter = viewElement.getDouble("gutter")
    this.parentComponentKey = viewElement.getString("parentComponentKey")
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.invert))
      this._invertAlphabetIndexerMod.mInvert = value.invert
      this._invertBadgeMod.mInvert = value.invert
      this._invertBlankMod.mInvert = value.invert
      this._invertButttonMod.mInvert = value.invert
      this._invertCalendarPickerMod.mInvert = value.invert
      this._invertCheckboxMod.mInvert = value.invert
      this._invertCheckboxGroupMod.mInvert = value.invert
      this._invertColumnMod.mInvert = value.invert
      this._invertColumnSplitMod.mInvert = value.invert
      this._invertCounterMod.mInvert = value.invert
      this._invertDataPanelMod.mInvert = value.invert
      this._invertDatePickerMod.mInvert = value.invert
      this._invertDividerMod.mInvert = value.invert
      this._invertEffectComponentMod.mInvert = value.invert
      this._invertFlexMod.mInvert = value.invert
      this._invertFlowItemMod.mInvert = value.invert
      this._invertFormComponentMod.mInvert = value.invert
      this._invertFormLinkMod.mInvert = value.invert
      this._invertGaugeMod.mInvert = value.invert
      this._invertGridMod.mInvert = value.invert
      this._invertGridColMod.mInvert = value.invert
      this._invertGridItemMod.mInvert = value.invert
      this._invertGridRowMod.mInvert = value.invert
      this._invertHyperlinkMod.mInvert = value.invert
      this._invertImageAnimatorMod.mInvert = value.invert
      this._invertImageSpanMod.mInvert = value.invert
      this._invertImageMod.mInvert = value.invert
      this._invertListMod.mInvert = value.invert
      this._invertListItemMod.mInvert = value.invert
      this._invertListItemGroupMod.mInvert = value.invert
      this._invertLoadingProgressMod.mInvert = value.invert
      this._invertMarqueeMod.mInvert = value.invert
      this._invertMenuMod.mInvert = value.invert
      this._invertMenuItemMod.mInvert = value.invert
      this._invertMenuItemGroupMod.mInvert = value.invert
      this._invertNavDestinationMod.mInvert = value.invert
      // this._invertNavRouterMod.mInvert = value.invert
      this._invertNavigationMod.mInvert = value.invert
      // this._invertNavigatorMod.mInvert = value.invert
      this._invertPatternLockMod.mInvert = value.invert
      this._invertPluginComponentMod.mInvert = value.invert
      this._invertQRCodeMod.mInvert = value.invert
      this._invertRadioMod.mInvert = value.invert
      this._invertRatingMod.mInvert = value.invert
      this._invertRefreshMod.mInvert = value.invert
      this._invertRelativeContainerMod.mInvert = value.invert
      this._invertRemoteWindowMod.mInvert = value.invert
      this._invertRichEditorMod.mInvert = value.invert
      this._invertRichTextMod.mInvert = value.invert
      this._invertRowMod.mInvert = value.invert
      this._invertRowSplitMod.mInvert = value.invert
      this._invertScrollMod.mInvert = value.invert
      this._invertScrollBarMod.mInvert = value.invert
      this._invertSearchMod.mInvert = value.invert
      this._invertSelectMod.mInvert = value.invert
      this._invertSideBarContainerMod.mInvert = value.invert
      this._invertSliderMod.mInvert = value.invert
      this._invertStackMod.mInvert = value.invert
      this._invertSwiperMod.mInvert = value.invert
      this._invertTabContentMod.mInvert = value.invert
      this._invertTabsMod.mInvert = value.invert
      this._invertTextMod.mInvert = value.invert
      this._invertTextAreaMod.mInvert = value.invert
      this._invertTextClockMod.mInvert = value.invert
      this._invertTextInputMod.mInvert = value.invert
      this._invertTextPickerMod.mInvert = value.invert
      this._invertTextTimerMod.mInvert = value.invert
      this._invertTimePickerMod.mInvert = value.invert
      this._invertToggleMod.mInvert = value.invert
      this._invertUIExtensionComponentMod.mInvert = value.invert
      this._invertWaterFlowMod.mInvert = value.invert
      this._invertWebMod.mInvert = value.invert
      this._invertXComponentMod.mInvert = value.invert
  
    })
  }

  commonStyleAlp1(instance: CommonMethod) {
    instance.invert(this.invertAlphabetIndexerInvert)
    instance.height('100%')
    instance.key(this.componentKey)
  }

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter} as GridRowOptions) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle(this.componentKey).attributeModifier(this._invertButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._invertTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .attributeModifier(this._invertAlphabetIndexerMod)
            .applyStyles(this.commonStyleAlp1)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._invertBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._invertCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle(this.componentKey).attributeModifier(this._invertCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey).attributeModifier(this._invertDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._invertDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._invertDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._invertGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._invertImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._invertImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._invertLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Int.MAX_VALUE,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._invertMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._invertNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._invertMenuMod)
        } else if (this.targetView == 'NavRouter') {
          // NavRouter() {
          //   Row() {
          //     Image($r('app.media.icon'))
          //   }
          //
          //   NavDestination() {
          //     Text('NavDestination').fontSize(10)
          //   }
          // }.commonStyle(this.componentKey).attributeModifier(this._invertNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle(this.componentKey).attributeModifier(this._invertQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle(this.componentKey).attributeModifier(this._invertRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle(this.componentKey).attributeModifier(this._invertRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._invertScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._invertSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._invertSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._invertSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._invertTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._invertTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._invertTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._invertTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey).attributeModifier(this._invertToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
          .attributeModifier(this._invertWebMod)
        } else if (this.targetView == 'Circle') {
          Circle().commonStyle(this.componentKey)
        } else if (this.targetView == 'Ellipse') {
          Ellipse().commonStyle(this.componentKey)
        } else if (this.targetView == 'Line') {
          Line()
            .commonStyle(this.componentKey)
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline().commonStyle(this.componentKey)
        } else if (this.targetView == 'Polygon') {
          Polygon().commonStyle(this.componentKey)
        } else if (this.targetView == 'Path') {
          Path().commonStyle(this.componentKey)
        } else if (this.targetView == 'Rect') {
          Rect().commonStyle(this.componentKey)
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.commonStyle(this.componentKey).attributeModifier(this._invertBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._invertColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._invertColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._invertCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._invertFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color:Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.commonStyle(this.componentKey).attributeModifier(this._invertGridRowMod)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], (item: string) => {
              ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                GridItem() {
                  Text(day).backgroundColor(Color.White)
                    .width('100%').height('100%').textAlign(TextAlign.Center)
                }
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .commonStyle(this.componentKey).attributeModifier(this._invertGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._invertListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._invertListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._invertListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          // Navigator() {
          //   Text('Go to back page').width('100%').height(20)
          // }.commonStyle(this.componentKey).backgroundColor(Color.Red).attributeModifier(this._invertNavigatorMod)
        } else if (this.targetView == 'Panel') {
          // Panel(true) {
          //   Text('Text')
          // }.backgroundColor(Color.Yellow).commonStyle(this.componentKey)
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._invertRefreshMod)
        } else if (this.targetView == 'RelativeContainer') {
          RelativeContainer() {
            Row()
              .width(100)
              .height(100)
              .backgroundColor('#FF3333')
              .alignRules({
                top: { anchor: '__container__', align: VerticalAlign.Top },
                left: { anchor: '__container__', align: HorizontalAlign.Start }
              } as AlignRuleOption)
              .id('constraintSize')
          }.commonStyle(this.componentKey).attributeModifier(this._invertRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._invertRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._invertRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, (item: int) => item.toString())
            }.width('100%')
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._invertScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item: int) => {
                Column({ space: 5 } as ColumnOptions) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.commonStyle(this.componentKey).attributeModifier(this._invertSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._invertStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._invertSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._invertTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._invertTabContentMod)
          }.width('100%').height('100%')
        } else if (this.targetView == 'WaterFlow') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
            }, (item: int) => item.toString())
          }.commonStyle(this.componentKey).attributeModifier(this._invertWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._invertGridColMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
              .commonStyle(this.componentKey).attributeModifier(this._invertFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, (item: int) => item.toString())
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('4')
                .backgroundColor(0xFAEEE0)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }.rowStart(1).rowEnd(4)
            .commonStyle(this.componentKey).attributeModifier(this._invertGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._invertMenuItemMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'MenuItemGroup') {
          Row() {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              }
              .commonStyle(this.componentKey).attributeModifier(this._invertMenuItemGroupMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        }
      }
      .width('100%')
      .height(this.parentHeight)
      .backgroundColor(Color.Pink)
      .key(this.parentComponentKey)
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Yellow)
  }
}