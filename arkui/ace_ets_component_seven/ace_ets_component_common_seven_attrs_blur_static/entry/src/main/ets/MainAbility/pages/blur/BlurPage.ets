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
  ColumnAttribute, ColumnSplitAttribute, CounterAttribute, DataPanelAttribute, DatePickerAttribute, DividerAttribute,
  EllipseAttribute, FlexAttribute, FlowItemAttribute, FormLinkAttribute, GaugeAttribute, GridAttribute, GridColAttribute,
  GridItemAttribute, GridRowAttribute, HyperlinkAttribute, ImageAttribute, ImageAnimatorAttribute, LineAttribute, ListAttribute,
  ListItemAttribute, ListItemGroupAttribute, LoadingProgressAttribute, MarqueeAttribute, MenuAttribute, MenuItemAttribute,
  MenuItemGroupAttribute, NavDestinationAttribute, NavigationAttribute, PathAttribute, PolygonAttribute, PolylineAttribute,
  ProgressAttribute, QRCodeAttribute, RadioAttribute, RatingAttribute, RectAttribute, RefreshAttribute, RelativeContainerAttribute,
  RemoteWindowAttribute, RichEditorAttribute, RichTextAttribute, RowAttribute, RowSplitAttribute, ScrollAttribute, ScrollBarAttribute,
  SearchAttribute, SelectAttribute, ShapeAttribute, SliderAttribute, SpanAttribute, StackAttribute,
  SwiperAttribute, SideBarContainerAttribute, ToggleAttribute, TabContentAttribute, TabsAttribute,
  TextAttribute, TextAreaAttribute, TextClockAttribute, TextInputAttribute, TextPickerAttribute, TextTimerAttribute,
  TimePickerAttribute, VideoAttribute, WaterFlowAttribute, WebAttribute, WindowSceneAttribute, XComponentAttribute,
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, EffectComponentAttribute, FormComponentAttribute,
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, RenderFit, SystemAdaptiveOptions, AlignRuleOption } from '@ohos.arkui.component'
import { State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
// class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
//   mBlur: number = 10
//   applyNormalAttribute(instance: NavigatorAttribute): void {
//     console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
//     instance.blur(this.mBlur)
//   }
// }
// class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
//   mBlur: number = 10
//   applyNormalAttribute(instance: NavRouterAttribute): void {
//     console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
//     instance.blur(this.mBlur)
//   }
// }
class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mBlur: number = 10
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`blur page show ${JSON.stringify(this.mBlur)}`)
    instance.blur(this.mBlur)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string){
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

function commonStyleButton(this: ButtonAttribute, componentKey: string, blur: number){
  console.log('commonStyleButton blur = ' + blur)
  this.blur(blur)
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
struct blurPage {
  @StoragePropRef('_blurButton') blurButton: SetValue = {
    blur: 0
  }
  @State _blur: number = 1.0
  @State _blurAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _blurBadgeMod: BadgeModifier = new BadgeModifier()
  @State _blurBlankMod: BlankModifier = new BlankModifier()
  @State _blurButttonMod: ButtonModifier = new ButtonModifier()
  @State _blurCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _blurCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _blurCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _blurColumnMod: ColumnModifier = new ColumnModifier()
  @State _blurColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _blurCounterMod: CounterModifier = new CounterModifier()
  @State _blurDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _blurDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _blurDividerMod: DividerModifier = new DividerModifier()
  @State _blurEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _blurFlexMod: FlexModifier = new FlexModifier()
  @State _blurFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _blurFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _blurFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _blurGaugeMod: GaugeModifier = new GaugeModifier()
  @State _blurGridMod: GridModifier = new GridModifier()
  @State _blurGridColMod: GridColModifier = new GridColModifier()
  @State _blurGridItemMod: GridItemModifier = new GridItemModifier()
  @State _blurGridRowMod: GridRowModifier = new GridRowModifier()
  @State _blurHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _blurImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _blurImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _blurImageMod: ImageModifier = new ImageModifier()
  @State _blurListMod: ListModifier = new ListModifier()
  @State _blurListItemMod: ListItemModifier = new ListItemModifier()
  @State _blurListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _blurLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _blurMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _blurMenuMod: MenuModifier = new MenuModifier()
  @State _blurMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _blurMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _blurNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  // @State _blurNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _blurNavigationMod: NavigationModifier = new NavigationModifier()
  // @State _blurNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _blurPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _blurPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _blurQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _blurRadioMod: RadioModifier = new RadioModifier()
  @State _blurRatingMod: RatingModifier = new RatingModifier()
  @State _blurRefreshMod: RefreshModifier = new RefreshModifier()
  @State _blurRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _blurRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _blurRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _blurRichTextMod: RichTextModifier = new RichTextModifier()
  @State _blurRowMod: RowModifier = new RowModifier()
  @State _blurRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _blurScrollMod: ScrollModifier = new ScrollModifier()
  @State _blurScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _blurSearchMod: SearchModifier = new SearchModifier()
  @State _blurSelectMod: SelectModifier = new SelectModifier()
  @State _blurSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _blurSliderMod: SliderModifier = new SliderModifier()
  @State _blurStackMod: StackModifier = new StackModifier()
  @State _blurSwiperMod: SwiperModifier = new SwiperModifier()
  @State _blurTabContentMod: TabContentModifier = new TabContentModifier()
  @State _blurTabsMod: TabsModifier = new TabsModifier()
  @State _blurTextMod: TextModifier = new TextModifier()
  @State _blurTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _blurTextClockMod: TextClockModifier = new TextClockModifier()
  @State _blurTextInputMod: TextInputModifier = new TextInputModifier()
  @State _blurTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _blurTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _blurTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _blurToggleMod: ToggleModifier = new ToggleModifier()
  @State _blurUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _blurWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _blurWebMod: WebModifier = new WebModifier()
  @State _blurXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: int = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 blur page show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    this.blurButton = routerParamOptions.view.testValue.setValue
    this.targetView = routerParamOptions.view.targetView
    this.componentKey = routerParamOptions.view.componentKey ?? ""
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.columns = routerParamOptions.view.columns
    this.gutter = routerParamOptions.view.gutter
    this.parentComponentKey = routerParamOptions.view.parentComponentKey
    this._blurButttonMod.mBlur =  routerParamOptions.view.testValue.setValue.blur

    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.blur))
      this._blurAlphabetIndexerMod.mBlur =  value.blur
      this._blurBadgeMod.mBlur =  value.blur
      this._blurBlankMod.mBlur =  value.blur
      this._blurButttonMod.mBlur =  value.blur
      this._blurCalendarPickerMod.mBlur =  value.blur
      this._blurCheckboxMod.mBlur =  value.blur
      this._blurCheckboxGroupMod.mBlur =  value.blur
      this._blurColumnMod.mBlur =  value.blur
      this._blurColumnSplitMod.mBlur =  value.blur
      this._blurCounterMod.mBlur =  value.blur
      this._blurDataPanelMod.mBlur =  value.blur
      this._blurDatePickerMod.mBlur =  value.blur
      this._blurDividerMod.mBlur =  value.blur
      this._blurEffectComponentMod.mBlur =  value.blur
      this._blurFlexMod.mBlur =  value.blur
      this._blurFlowItemMod.mBlur =  value.blur
      this._blurFormComponentMod.mBlur =  value.blur
      this._blurFormLinkMod.mBlur =  value.blur
      this._blurGaugeMod.mBlur =  value.blur
      this._blurGridMod.mBlur =  value.blur
      this._blurGridColMod.mBlur =  value.blur
      this._blurGridItemMod.mBlur =  value.blur
      this._blurGridRowMod.mBlur =  value.blur
      this._blurHyperlinkMod.mBlur =  value.blur
      this._blurImageAnimatorMod.mBlur =  value.blur
      this._blurImageSpanMod.mBlur =  value.blur
      this._blurImageMod.mBlur =  value.blur
      this._blurListMod.mBlur =  value.blur
      this._blurListItemMod.mBlur =  value.blur
      this._blurListItemGroupMod.mBlur =  value.blur
      this._blurLoadingProgressMod.mBlur =  value.blur
      this._blurMarqueeMod.mBlur =  value.blur
      this._blurMenuMod.mBlur =  value.blur
      this._blurMenuItemMod.mBlur =  value.blur
      this._blurMenuItemGroupMod.mBlur =  value.blur
      this._blurNavDestinationMod.mBlur =  value.blur
      // this._blurNavRouterMod.mBlur =  value.blur
      this._blurNavigationMod.mBlur =  value.blur
      // this._blurNavigatorMod.mBlur =  value.blur
      this._blurPatternLockMod.mBlur =  value.blur
      this._blurPluginComponentMod.mBlur =  value.blur
      this._blurQRCodeMod.mBlur =  value.blur
      this._blurRadioMod.mBlur =  value.blur
      this._blurRatingMod.mBlur =  value.blur
      this._blurRefreshMod.mBlur =  value.blur
      this._blurRelativeContainerMod.mBlur =  value.blur
      this._blurRemoteWindowMod.mBlur =  value.blur
      this._blurRichEditorMod.mBlur =  value.blur
      this._blurRichTextMod.mBlur =  value.blur
      this._blurRowMod.mBlur =  value.blur
      this._blurRowSplitMod.mBlur =  value.blur
      this._blurScrollMod.mBlur =  value.blur
      this._blurScrollBarMod.mBlur =  value.blur
      this._blurSearchMod.mBlur =  value.blur
      this._blurSelectMod.mBlur =  value.blur
      this._blurSideBarContainerMod.mBlur =  value.blur
      this._blurSliderMod.mBlur =  value.blur
      this._blurStackMod.mBlur =  value.blur
      this._blurSwiperMod.mBlur =  value.blur
      this._blurTabContentMod.mBlur =  value.blur
      this._blurTabsMod.mBlur =  value.blur
      this._blurTextMod.mBlur =  value.blur
      this._blurTextAreaMod.mBlur =  value.blur
      this._blurTextClockMod.mBlur =  value.blur
      this._blurTextInputMod.mBlur =  value.blur
      this._blurTextPickerMod.mBlur =  value.blur
      this._blurTextTimerMod.mBlur =  value.blur
      this._blurTimePickerMod.mBlur =  value.blur
      this._blurToggleMod.mBlur =  value.blur
      this._blurUIExtensionComponentMod.mBlur =  value.blur
      this._blurWaterFlowMod.mBlur =  value.blur
      this._blurWebMod.mBlur =  value.blur
      this._blurXComponentMod.mBlur =  value.blur
    })
  }

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyleButton(this.componentKey, this.blurButton.blur).attributeModifier(this._blurButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._blurTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle(this.componentKey).attributeModifier(this._blurAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._blurBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._blurCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle(this.componentKey).attributeModifier(this._blurCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey).attributeModifier(this._blurDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._blurDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._blurDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._blurGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._blurImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._blurImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._blurLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Int.MAX_VALUE,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._blurMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._blurNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._blurMenuMod)
        } else if (this.targetView == 'NavRouter') {
          // NavRouter() {
          //   Row() {
          //     Image($r('app.media.icon'))
          //   }
          //
          //   NavDestination() {
          //     Text('NavDestination').fontSize(10)
          //   }
          // }.commonStyle(this.componentKey).attributeModifier(this._blurNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle(this.componentKey).attributeModifier(this._blurQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle(this.componentKey).attributeModifier(this._blurRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle(this.componentKey).attributeModifier(this._blurRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._blurScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._blurSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._blurSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._blurSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._blurTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._blurTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._blurTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._blurTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey).attributeModifier(this._blurToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
          .attributeModifier(this._blurWebMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._blurBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._blurColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._blurColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._blurCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._blurFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._blurGridRowMod)
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
          .commonStyle(this.componentKey).attributeModifier(this._blurGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._blurListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._blurListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._blurListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          // Navigator() {
          //   Text('Go to back page').width('100%').height(20)
          // }.commonStyle(this.componentKey).backgroundColor(Color.Red).attributeModifier(this._blurNavigatorMod)
        } else if (this.targetView == 'Panel') {
          // Panel(true) {
          //   Text('Text')
          // }.backgroundColor(Color.Yellow).commonStyle(this.componentKey)
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._blurRefreshMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._blurRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._blurRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._blurRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._blurScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._blurSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._blurStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._blurSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._blurTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._blurTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._blurWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._blurGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._blurFlowItemMod)
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
            .commonStyle(this.componentKey).attributeModifier(this._blurGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._blurMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._blurMenuItemGroupMod)
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