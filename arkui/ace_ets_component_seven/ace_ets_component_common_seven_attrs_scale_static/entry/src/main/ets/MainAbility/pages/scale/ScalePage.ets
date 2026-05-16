'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, ScaleOptions } from '@ohos.arkui.component'
import { State,StoragePropRef } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.scale(this.scale)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.scale(this.scale)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: BlankAttribute): void {
    instance.scale(this.scale)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.scale(this.scale)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.scale(this.scale)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.scale(this.scale)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.scale(this.scale)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.scale(this.scale)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.scale(this.scale)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: CounterAttribute): void {
    instance.scale(this.scale)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.scale(this.scale)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.scale(this.scale)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: DividerAttribute): void {
    instance.scale(this.scale)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    instance.scale(this.scale)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: FlexAttribute): void {
    instance.scale(this.scale)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.scale(this.scale)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: FormComponentAttribute): void {
    instance.scale(this.scale)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.scale(this.scale)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.scale(this.scale)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: GridAttribute): void {
    instance.scale(this.scale)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: GridColAttribute): void {
    instance.scale(this.scale)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.scale(this.scale)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.scale(this.scale)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.scale(this.scale)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.scale(this.scale)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.scale(this.scale)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.scale(this.scale)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ListAttribute): void {
    instance.scale(this.scale)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.scale(this.scale)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.scale(this.scale)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.scale(this.scale)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.scale(this.scale)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: MenuAttribute): void {
    instance.scale(this.scale)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.scale(this.scale)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.scale(this.scale)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.scale(this.scale)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.scale(this.scale)
  }
}
class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.scale(this.scale)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    instance.scale(this.scale)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.scale(this.scale)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RadioAttribute): void {
    instance.scale(this.scale)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RatingAttribute): void {
    instance.scale(this.scale)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.scale(this.scale)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.scale(this.scale)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.scale(this.scale)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.scale(this.scale)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.scale(this.scale)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RowAttribute): void {
    instance.scale(this.scale)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.scale(this.scale)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scale(this.scale)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.scale(this.scale)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: SearchAttribute): void {
    instance.scale(this.scale)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: SelectAttribute): void {
    instance.scale(this.scale)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.scale(this.scale)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.scale(this.scale)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: StackAttribute): void {
    instance.scale(this.scale)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.scale(this.scale)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.scale(this.scale)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TabsAttribute): void {
    instance.scale(this.scale)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TextAttribute): void {
    instance.scale(this.scale)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.scale(this.scale)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.scale(this.scale)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.scale(this.scale)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.scale(this.scale)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.scale(this.scale)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.scale(this.scale)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.scale(this.scale)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    instance.scale(this.scale)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.scale(this.scale)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: WebAttribute): void {
    instance.scale(this.scale)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.scale(this.scale)
  }
}
class PolylineModifier implements AttributeModifier<PolylineAttribute>{
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.scale(this.scale)
  }
}
class PolygonModifier implements AttributeModifier<PolygonAttribute>{
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: PolygonAttribute): void {
    instance.scale(this.scale)
  }
}

class PathModifier implements AttributeModifier<PathAttribute>{
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: PathAttribute): void {
    instance.scale(this.scale)
  }
}

class RectModifier implements AttributeModifier<RectAttribute>{
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: RectAttribute): void {
    instance.scale(this.scale)
  }
}
class ShapeModifier implements AttributeModifier<ShapeAttribute>{
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.scale(this.scale)
  }
}
class EllipseModifier implements AttributeModifier<EllipseAttribute>{
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: EllipseAttribute): void {
    instance.scale(this.scale)
  }
}
class LineModifier implements AttributeModifier<LineAttribute>{
  scale: ScaleOptions = { x: 1, y: 1 }
  applyNormalAttribute(instance: LineAttribute): void {
    instance.scale(this.scale)
  }
}
function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {  this.key(componentKey)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string, _scale: ScaleOptions | undefined) {
  this.scale(_scale)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CounterAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EffectComponentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormComponentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EllipseAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlexAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GaugeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridColAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridRowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LineAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavigationAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PathAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolygonAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolylineAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ProgressAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RadioAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RatingAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RectAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RefreshAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichTextAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SearchAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SelectAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ShapeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SliderAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SpanAttribute, componentKey: string) {

  this.key(componentKey)
  return this
}

function commonStyle(this: StackAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SwiperAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ToggleAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabsAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextClockAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextInputAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: VideoAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WebAttribute, componentKey: string) {

  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CanvasAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: XComponentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DividerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CircleAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabContentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

@Entry
@Component
struct scalePage {
  @State _scaleLineMod: LineModifier = new LineModifier()
  @State _scaleEllipseMod: EllipseModifier = new EllipseModifier()
  @State _scalePolylineMod: PolylineModifier = new PolylineModifier()
  @State _scalePolygonMod: PolygonModifier = new PolygonModifier()
  @State _scalePathMod: PathModifier = new PathModifier()
  @State _scaleRectMod: RectModifier = new RectModifier()
  @State _scaleShapeMod: ShapeModifier = new ShapeModifier()
  @State _scaleAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _scaleBadgeMod: BadgeModifier = new BadgeModifier()
  @State _scaleBlankMod: BlankModifier = new BlankModifier()
  @State _scaleButttonMod: ButtonModifier = new ButtonModifier()
  @State _scaleCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _scaleCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _scaleCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _scaleColumnMod: ColumnModifier = new ColumnModifier()
  @State _scaleColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _scaleCounterMod: CounterModifier = new CounterModifier()
  @State _scaleDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _scaleDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _scaleDividerMod: DividerModifier = new DividerModifier()
  @State _scaleEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _scaleFlexMod: FlexModifier = new FlexModifier()
  @State _scaleFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _scaleFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _scaleFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _scaleGaugeMod: GaugeModifier = new GaugeModifier()
  @State _scaleGridMod: GridModifier = new GridModifier()
  @State _scaleGridColMod: GridColModifier = new GridColModifier()
  @State _scaleGridItemMod: GridItemModifier = new GridItemModifier()
  @State _scaleGridRowMod: GridRowModifier = new GridRowModifier()
  @State _scaleHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _scaleImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _scaleImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _scaleImageMod: ImageModifier = new ImageModifier()
  @State _scaleListMod: ListModifier = new ListModifier()
  @State _scaleListItemMod: ListItemModifier = new ListItemModifier()
  @State _scaleListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _scaleLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _scaleMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _scaleMenuMod: MenuModifier = new MenuModifier()
  @State _scaleMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _scaleMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _scaleNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _scaleNavigationMod: NavigationModifier = new NavigationModifier()
  @State _scalePatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _scalePluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _scaleQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _scaleRadioMod: RadioModifier = new RadioModifier()
  @State _scaleRatingMod: RatingModifier = new RatingModifier()
  @State _scaleRefreshMod: RefreshModifier = new RefreshModifier()
  @State _scaleRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _scaleRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _scaleRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _scaleRichTextMod: RichTextModifier = new RichTextModifier()
  @State _scaleRowMod: RowModifier = new RowModifier()
  @State _scaleRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _scaleScrollMod: ScrollModifier = new ScrollModifier()
  @State _scaleScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _scaleSearchMod: SearchModifier = new SearchModifier()
  @State _scaleSelectMod: SelectModifier = new SelectModifier()
  @State _scaleSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _scaleSliderMod: SliderModifier = new SliderModifier()
  @State _scaleStackMod: StackModifier = new StackModifier()
  @State _scaleSwiperMod: SwiperModifier = new SwiperModifier()
  @State _scaleTabContentMod: TabContentModifier = new TabContentModifier()
  @State _scaleTabsMod: TabsModifier = new TabsModifier()
  @State _scaleTextMod: TextModifier = new TextModifier()
  @State _scaleTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _scaleTextClockMod: TextClockModifier = new TextClockModifier()
  @State _scaleTextInputMod: TextInputModifier = new TextInputModifier()
  @State _scaleTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _scaleTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _scaleTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _scaleToggleMod: ToggleModifier = new ToggleModifier()
  @State _scaleUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _scaleWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _scaleWebMod: WebModifier = new WebModifier()
  @State _scaleXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @StoragePropRef('_scale') _scale: SetValue = {
    height: 0,scale: {}
  }

  onPageShow() {
    console.info('22222 translate page show called ')
    const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
      .getElement("view")
    this.targetView = viewElement.getString("targetView")
    this.componentKey = viewElement.getString("componentKey")
    this.parentWidth = viewElement.getDouble("parentWidth")
    this.parentHeight = viewElement.getDouble("parentHeight")
    this.columns = viewElement.getDouble("columns")
    this.gutter = viewElement.getDouble("gutter")
    this.parentComponentKey = viewElement.getString("parentComponentKey")
  }

  build() {
    GridRow({ columns: this.columns as Int, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._scaleButttonMod).commonStyleButton(this.componentKey, this._scale.scale)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._scaleTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle(this.componentKey).attributeModifier(this._scaleAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._scaleBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._scaleCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle(this.componentKey).attributeModifier(this._scaleCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey).attributeModifier(this._scaleDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._scaleDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._scaleDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._scaleGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._scaleImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._scaleImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._scaleLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._scaleMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._scaleNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._scaleMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle(this.componentKey).attributeModifier(this._scaleQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle(this.componentKey).attributeModifier(this._scaleRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle(this.componentKey).attributeModifier(this._scaleRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._scaleScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._scaleSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._scaleSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._scaleSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._scaleTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._scaleTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._scaleTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._scaleTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey).attributeModifier(this._scaleToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
          .attributeModifier(this._scaleWebMod)
        } else if (this.targetView == 'Circle') {
          Circle().commonStyle(this.componentKey)
        } else if (this.targetView == 'Ellipse') {
          Ellipse().commonStyle(this.componentKey).attributeModifier(this._scaleEllipseMod)
        } else if (this.targetView == 'Line') {
          Line()
            .commonStyle(this.componentKey)
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black).attributeModifier(this._scaleLineMod)
        } else if (this.targetView == 'Polyline') {
          Polyline().commonStyle(this.componentKey).attributeModifier(this._scalePolylineMod)
        } else if (this.targetView == 'Polygon') {
          Polygon().commonStyle(this.componentKey).attributeModifier(this._scalePolygonMod)
        } else if (this.targetView == 'Path') {
          Path().commonStyle(this.componentKey).attributeModifier(this._scalePathMod)
        } else if (this.targetView == 'Rect') {
          Rect().commonStyle(this.componentKey).attributeModifier(this._scaleRectMod)
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }.commonStyle(this.componentKey).attributeModifier(this._scaleShapeMod)
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.commonStyle(this.componentKey).attributeModifier(this._scaleBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._scaleColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._scaleColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._scaleCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._scaleFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._scaleGridRowMod)
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
          .commonStyle(this.componentKey).attributeModifier(this._scaleGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._scaleListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._scaleListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._scaleListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._scaleRefreshMod)
        } else if (this.targetView == 'RelativeContainer') {
          RelativeContainer() {
            Row()
              .width(100)
              .height(100)
              .backgroundColor('#FF3333')
              .alignRules({
                top: { anchor: '__container__', align: VerticalAlign.Top },
                left: { anchor: '__container__', align: HorizontalAlign.Start }
              })
              .id('constraintSize')
          }.commonStyle(this.componentKey).attributeModifier(this._scaleRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._scaleRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._scaleRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._scaleScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._scaleSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._scaleStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._scaleSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._scaleTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._scaleTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._scaleWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._scaleGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._scaleFlowItemMod)
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
            .commonStyle(this.componentKey).attributeModifier(this._scaleGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._scaleMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._scaleMenuItemGroupMod)
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