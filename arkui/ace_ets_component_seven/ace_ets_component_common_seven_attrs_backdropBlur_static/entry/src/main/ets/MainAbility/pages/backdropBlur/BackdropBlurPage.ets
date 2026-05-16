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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, Color,CommonMethod, AlignRuleOption } from '@ohos.arkui.component'
import { State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: CanvasAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: CircleAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: EllipseAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: GridAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class LineModifier implements AttributeModifier<LineAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: LineAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ListAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

// class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
//   backdropBlur: number = 3
//
//   applyNormalAttribute(instance: NavigatorAttribute): void {
//     instance.backdropBlur(this.backdropBlur)
//   }
// }
//
// class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
//   backdropBlur: number = 3
//
//   applyNormalAttribute(instance: NavRouterAttribute): void {
//     instance.backdropBlur(this.backdropBlur)
//   }
// }
//
// class PanelModifier implements AttributeModifier<PanelAttribute> {
//   backdropBlur: number = 3
//
//   applyNormalAttribute(instance: PanelAttribute): void {
//     instance.backdropBlur(this.backdropBlur)
//   }
// }

class PathModifier implements AttributeModifier<PathAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: PathAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: PolygonAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RectModifier implements AttributeModifier<RectAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RectAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RowAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: SpanAttribute): void {
    // instance.backdropBlur(this.backdropBlur)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: StackAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TextAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: VideoAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: WebAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: WindowSceneAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  backdropBlur: number = 3

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.backdropBlur(this.backdropBlur)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string, backdrop: number){
  console.log('commonStyleButton backdrop = ' + backdrop)
  this.width(100)
  this.height(100)
  this.backdropBlur(backdrop)
  this.key(componentKey)
  return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: CounterAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: EllipseAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: FlexAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: CanvasAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: GaugeAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: GridAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: GridColAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: GridItemAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: GridRowAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: LineAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: NavigationAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: PathAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: PolygonAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: PolylineAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ProgressAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RadioAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RatingAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RectAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RefreshAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RichTextAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RowAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: SearchAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: SelectAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ShapeAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: SliderAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: SpanAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: StackAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: SwiperAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ToggleAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TabsAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TextClockAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TextInputAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: VideoAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: WebAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: XComponentAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: DividerAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: CircleAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: ListAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

function commonStyle(this: TabContentAttribute, componentKey: string){
  this.key(componentKey)
  return this
}

@Entry
@Component
struct BackdropBlurPage {
  @StoragePropRef('_backdropBlurButton') _backdropBlurButton: SetValue = {
    backdropBlur: 0
  }
  @StoragePropRef('_backdropBlur') _backdropBlur: number = 0
  @State _backdropBlurAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _backdropBlurBadgeModifier: BadgeModifier = new BadgeModifier()
  @State _backdropBlurButtonModifier: ButtonModifier = new ButtonModifier()
  @State _backdropBlurBlankModifier: BlankModifier = new BlankModifier()
  @State _backdropBlurCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
  @State _backdropBlurCanvasModifier: CanvasModifier = new CanvasModifier()
  @State _backdropBlurCheckboxModifier: CheckboxModifier = new CheckboxModifier()
  @State _backdropBlurCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _backdropBlurCircleModifier: CircleModifier = new CircleModifier()
  @State _backdropBlurColumnModifier: ColumnModifier = new ColumnModifier()
  @State _backdropBlurColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
  @State _backdropBlurCounterModifier: CounterModifier = new CounterModifier()
  @State _backdropBlurDataPanelModifier: DataPanelModifier = new DataPanelModifier()
  @State _backdropBlurDatePickerModifier: DatePickerModifier = new DatePickerModifier()
  @State _backdropBlurDividerModifier: DividerModifier = new DividerModifier()
  @State _backdropBlurEllipseModifier: EllipseModifier = new EllipseModifier()
  @State _backdropBlurFlexModifier: FlexModifier = new FlexModifier()
  @State _backdropBlurFlowItemModifier: FlowItemModifier = new FlowItemModifier()
  @State _backdropBlurFormLinkModifier: FormLinkModifier = new FormLinkModifier()
  @State _backdropBlurGaugeModifier: GaugeModifier = new GaugeModifier()
  @State _backdropBlurGridModifier: GridModifier = new GridModifier()
  @State _backdropBlurGridColModifier: GridColModifier = new GridColModifier()
  @State _backdropBlurGridItemModifier: GridItemModifier = new GridItemModifier()
  @State _backdropBlurGridRowModifier: GridRowModifier = new GridRowModifier()
  @State _backdropBlurHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
  @State _backdropBlurImageModifier: ImageModifier = new ImageModifier()
  @State _backdropBlurImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _backdropBlurLineModifier: LineModifier = new LineModifier()
  @State _backdropBlurListModifier: ListModifier = new ListModifier()
  @State _backdropBlurListItemModifier: ListItemModifier = new ListItemModifier()
  @State _backdropBlurListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
  @State _backdropBlurLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
  @State _backdropBlurMarqueeModifier: MarqueeModifier = new MarqueeModifier()
  @State _backdropBlurMenuModifier: MenuModifier = new MenuModifier()
  @State _backdropBlurMenuItemModifier: MenuItemModifier = new MenuItemModifier()
  @State _backdropBlurMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _backdropBlurNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
  @State _backdropBlurNavigationModifier: NavigationModifier = new NavigationModifier()
  @State _backdropBlurPathModifier: PathModifier = new PathModifier()
  @State _backdropBlurPolygonModifier: PolygonModifier = new PolygonModifier()
  @State _backdropBlurPolylineModifier: PolylineModifier = new PolylineModifier()
  @State _backdropBlurProgressModifier: ProgressModifier = new ProgressModifier()
  @State _backdropBlurQRCodeModifier: QRCodeModifier = new QRCodeModifier()
  @State _backdropBlurRadioModifier: RadioModifier = new RadioModifier()
  @State _backdropBlurRatingModifier: RatingModifier = new RatingModifier()
  @State _backdropBlurRectModifier: RectModifier = new RectModifier()
  @State _backdropBlurRefreshModifier: RefreshModifier = new RefreshModifier()
  @State _backdropBlurRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
  @State _backdropBlurRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
  @State _backdropBlurRichEditorModifier: RichEditorModifier = new RichEditorModifier()
  @State _backdropBlurRichTextModifier: RichTextModifier = new RichTextModifier()
  @State _backdropBlurRowModifier: RowModifier = new RowModifier()
  @State _backdropBlurRowSplitModifier: RowSplitModifier = new RowSplitModifier()
  @State _backdropBlurScrollModifier: ScrollModifier = new ScrollModifier()
  @State _backdropBlurScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
  @State _backdropBlurSearchModifier: SearchModifier = new SearchModifier()
  @State _backdropBlurSelectModifier: SelectModifier = new SelectModifier()
  @State _backdropBlurShapeModifier: ShapeModifier = new ShapeModifier()
  @State _backdropBlurSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
  @State _backdropBlurSliderModifier: SliderModifier = new SliderModifier()
  @State _backdropBlurSpanModifier: SpanModifier = new SpanModifier()
  @State _backdropBlurStackModifier: StackModifier = new StackModifier()
  @State _backdropBlurSwiperModifier: SwiperModifier = new SwiperModifier()
  @State _backdropBlurTabContentModifier: TabContentModifier = new TabContentModifier()
  @State _backdropBlurTabsModifier: TabsModifier = new TabsModifier()
  @State _backdropBlurTextModifier: TextModifier = new TextModifier()
  @State _backdropBlurTextAreaModifier: TextAreaModifier = new TextAreaModifier()
  @State _backdropBlurTextClockModifier: TextClockModifier = new TextClockModifier()
  @State _backdropBlurTextInputModifier: TextInputModifier = new TextInputModifier()
  @State _backdropBlurTextPickerModifier: TextPickerModifier = new TextPickerModifier()
  @State _backdropBlurTextTimerModifier: TextTimerModifier = new TextTimerModifier()
  @State _backdropBlurTimePickerModifier: TimePickerModifier = new TimePickerModifier()
  @State _backdropBlurToggleModifier: ToggleModifier = new ToggleModifier()
  @State _backdropBlurVideoModifier: VideoModifier = new VideoModifier()
  @State _backdropBlurWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
  @State _backdropBlurWebModifier: WebModifier = new WebModifier()
  @State _backdropBlurWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
  @State _backdropBlurXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @State parentBackGroundColor: Color = Color.White
  onPageShow() {
    console.info('backdropBlur translate page show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    this._backdropBlurButton = routerParamOptions.view.testValue.setValue
    this._backdropBlurButtonModifier.backdropBlur = routerParamOptions.view.testValue.setValue.backdropBlur
    console.info('backdropBlur = ' + this._backdropBlurButton.backdropBlur)
    this.targetView = routerParamOptions.view.targetView
    this.componentKey = routerParamOptions.view.componentKey ?? ""
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.columns = routerParamOptions.view.columns
    this.gutter = routerParamOptions.view.gutter
    this.parentComponentKey = routerParamOptions.view.parentComponentKey
    this.parentBackGroundColor = routerParamOptions.view.parentBackGroundColor
  }

  build() {
    Column() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurAlphabetIndexerModifier)
      }
      if (this.targetView == 'Button') {
        Button('button1')
          .commonStyleButton(this.componentKey, this._backdropBlurButton.backdropBlur)
          .attributeModifier(this._backdropBlurButtonModifier)
      }
      if (this.targetView == 'Blank') {
        Blank()
          .backgroundColor(Color.Yellow)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurBlankModifier)
      }
      if (this.targetView == 'Checkbox') {
        Checkbox()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurCheckboxModifier)
      }
      if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurCheckboxGroupModifier)
      }
      if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurDataPanelModifier)
      }
      if (this.targetView == 'DatePicker') {
        DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurDatePickerModifier)
      }
      if (this.targetView == 'Divider') {
        Divider()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurDividerModifier)
      }
      if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurGaugeModifier)
      }
      if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurImageModifier)
      }
      if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurImageAnimatorModifier)
      }
      if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurLoadingProgressModifier)
      }
      if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Int.MAX_VALUE,
          fromStart: true,
          src: 'Running Marquee starts rolling'
        })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurMarqueeModifier)
      }
      if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurNavigationModifier)
      }
      if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
					.backgroundColor(Color.Yellow)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurMenuModifier)
      }
      if (this.targetView == 'NavRouter') {
        // NavRouter() {
        //   Row() {
        //     Image($r('app.media.icon'))
        //   }
        //
        //   NavDestination() {
        //     Text('NavDestination')
        //       .fontSize(10)
        //   }
        // }
				// 	.commonStyle(this.componentKey)
        //   .attributeModifier(this._backdropBlurNavRouterModifier)
      }
      if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurProgressModifier)
      }
      if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurQRCodeModifier)
      }
      if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurRadioModifier)
      }
      if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurRatingModifier)
      }
      if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(20)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurScrollBarModifier)
      }
      if (this.targetView == 'Search') {
        Search()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurSearchModifier)
      }
      if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurSelectModifier)
      }
      if (this.targetView == 'Slider') {
        Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
          .showTips(true)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurSliderModifier)
      }
      if (this.targetView == 'Text') {
        Text('text1')
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTextModifier)
      }
      if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTextAreaModifier)
      }
      if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTextClockModifier)
      }
      if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTextInputModifier)
      }
      if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTextPickerModifier)
      }
      if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTextTimerModifier)
      }
      if (this.targetView == 'TimePicker') {
        TimePicker({ selected: new Date('2022-07-22T08:00:00') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTimePickerModifier)
      }
      if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurToggleModifier)
      }
      if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurWebModifier)
      }
      if (this.targetView == 'Circle') {
        Circle()
          .width(150)
          .height(200)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurCircleModifier)
      }
      if (this.targetView == 'Ellipse') {
        Ellipse()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurEllipseModifier)
      }
      if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .backgroundColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurLineModifier)
      }
      if (this.targetView == 'Polyline') {
        Polyline()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurPolylineModifier)
      }
      if (this.targetView == 'Polygon') {
        Polygon()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurPolygonModifier)
      }
      if (this.targetView == 'Path') {
        Path()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurPathModifier)
      }
      if (this.targetView == 'Rect') {
        Rect()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurRectModifier)
      }
      if (this.targetView == 'Shape') {
        Shape() {
          Rect()
            .width(100)
            .height(50)
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurShapeModifier)
      }
      if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
          Button('message')
            .width(100)
            .height(50)
            .backgroundColor(0x317aff)
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurBadgeModifier)
      }
      if (this.targetView == 'Column') {
        Column() {
          Button('')
            .width(100)
            .height(50)
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurColumnModifier)
      }
      if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurColumnSplitModifier)
      }
      if (this.targetView == 'Counter') {
        Counter() {
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurCounterModifier)
      }
      if (this.targetView == 'Flex') {
        Flex() {
          Text('1')
            .width('20%')
            .height(50)
            .backgroundColor(0xF5DEB3)
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurFlexModifier)
      }
      if (this.targetView == 'GridRow') {
        GridRow({ columns: 1, direction: GridRowDirection.Row }) {
          ForEach(
            [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown],
            (color:Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row()
                  .width('100%')
                  .height('20vp')
              }
								.borderColor(color)
                .borderWidth(2)
            }
          )
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurGridRowModifier)
      }
      if (this.targetView == 'Grid') {
        Grid() {
          ForEach(['0', '1', '2', '3', '4'], (item: string) => {
            ForEach(['0', '1', '2', '3', '4'], (day: string) => {
              GridItem() {
                Text(day)
                  .backgroundColor(Color.White)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
            })
          })
        }
					.columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .backgroundColor(0xFAEEE0)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurGridModifier)
      }
      if (this.targetView == 'List') {
        List() {
        }
					.height('100%')
          .width('100%')
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurListModifier)
      }
      if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          }
						.commonStyle(this.componentKey)
            .attributeModifier(this._backdropBlurListItemModifier)
        }
					.width('100%')
          .height('100%')
      }
      if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._backdropBlurListItemGroupModifier)
        }
					.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
      }
      if (this.targetView == 'Navigator') {
        // Navigator() {
        //   Text('Go to back page')
        //     .width('100%')
        //     .height(20)
        // }
				// 	.backgroundColor(Color.Red)
        //   .commonStyle(this.componentKey)
        //   .attributeModifier(this._backdropBlurNavigatorModifier)
      }
      if (this.targetView == 'Panel') {
        // Panel(true) {
        //   Text('Text')
        // }
				// 	.backgroundColor(Color.Yellow)
        //   .commonStyle(this.componentKey)
        //   .attributeModifier(this._backdropBlurPanelModifier)
      }
      if (this.targetView == 'Refresh') {
        Refresh({ refreshing: true }) {
          Text('123')
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurRefreshModifier)
      }
      if (this.targetView == 'RelativeContainer') {
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
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurRelativeContainerModifier)
      }
      if (this.targetView == 'Row') {
        Row()
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurRowModifier)
      }
      if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurRowSplitModifier)
      }
      if (this.targetView == 'Scroll') {
        Scroll() {
          Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
              Text('Scroll' + item.toString())
                .width('90%')
                .height(50)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            }, (item: int) => item.toString())
          }
					.width('100%')
        }
					.scrollBar(BarState.On)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurScrollModifier)
      }
      if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3], (item: int) => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                Text('Index0' + item)
                  .fontSize(25)
              }
            })
          }
						.width('100%')
            .justifyContent(FlexAlign.SpaceEvenly)
            .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content')
              .fontSize(25)
          }
						.backgroundColor(Color.Orange)
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurSideBarContainerModifier)
      }
      if (this.targetView == 'Stack') {
        Stack() {
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurStackModifier)
      }
      if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3], (item: int) => {
            Text('Swiper' + item)
              .width('90%')
              .height(50)
          }, (item: int) => item.toString())
        }
					.indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurSwiperModifier)
      }
      if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor('#00CB87')
          }
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurTabsModifier)
      }
      if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test')
              .width('100%')
              .height('100%')
              .backgroundColor(Color.White)
          }
						.tabBar('Tabs1')
            .commonStyle(this.componentKey)
            .attributeModifier(this._backdropBlurTabContentModifier)
        }
					.width('100%')
          .height('100%')
      }
      if (this.targetView == 'WaterFlow') {
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
            FlowItem() {
              Column() {
                Text('WaterFlow' + item)
                  .fontSize(12)
                  .height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }
          }, (item: int) => item.toString())
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurWaterFlowModifier)
      }
      if (this.targetView == 'GridCol') {
        GridRow({ columns: 1, direction: GridRowDirection.Row }) {
          GridCol() {
            Row()
              .width('100%')
              .height('20vp')
          }
						.backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._backdropBlurGridColModifier)
        }
					.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
      }
      if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('4')
              .backgroundColor(0xFAEEE0)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
						.rowStart(1)
            .rowEnd(4)
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._backdropBlurGridItemModifier)
        }
					.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
      }
      if (this.targetView == 'FlowItem') {
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
            FlowItem() {
              Column() {
                Text('WaterFlow' + item)
                  .fontSize(12)
                  .height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }
						.backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey)
              .attributeModifier(this._backdropBlurFlowItemModifier)
          }, (item: int) => item.toString())
        }
					.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
      }
      if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .commonStyle(this.componentKey)
              .attributeModifier(this._backdropBlurMenuItemModifier)
          }
						.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
        }
					.width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
      }
      if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }
							.commonStyle(this.componentKey)
              .attributeModifier(this._backdropBlurMenuItemGroupModifier)
          }
						.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
        }
					.width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
      }
      if (this.targetView == 'CalendarPicker') {
        CalendarPicker({ hintRadius: 10, selected: new Date() })
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurCalendarPickerModifier)
      }
      if (this.targetView == 'Canvas') {
        Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
          .backgroundColor('#FFFF00')
          .commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurCanvasModifier)
      }
      if (this.targetView == 'FormLink') {
        FormLink({
          action: "router",
          abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
          Button("router event").width(120)
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurFormLinkModifier)
      }
      if (this.targetView == 'Hyperlink') {
        Hyperlink('https://example.com/', 'Go to the developer website') {
        }
					.commonStyle(this.componentKey)
          .attributeModifier(this._backdropBlurHyperlinkModifier)
      }
      if (this.targetView == 'Span') {
        Text() {
          Span('Span1')
            .commonStyle(this.componentKey)
            .attributeModifier(this._backdropBlurSpanModifier)
        }
      }
    }
		.width(this.parentWidth)
      .height(this.parentHeight)
      .backgroundColor(this.parentBackGroundColor)
      .key(this.parentComponentKey)
  }
}
class ObjElement {
  message?: string;
}