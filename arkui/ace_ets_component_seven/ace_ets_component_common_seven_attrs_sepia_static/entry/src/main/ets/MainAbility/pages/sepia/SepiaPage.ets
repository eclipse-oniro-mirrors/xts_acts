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

import {
  $r,
  AlphabetIndexer,
  AlphabetIndexerAttribute,
  AttributeModifier,
  Badge,
  BadgeAttribute,
  BadgeParamWithNumber,
  BarState,
  Blank,
  BlankAttribute,
  Button,
  ButtonAttribute,
  CalendarPickerAttribute,
  CanvasAttribute,
  Checkbox,
  CheckboxAttribute,
  CheckboxGroup,
  CheckboxGroupAttribute,
  Circle,
  CircleAttribute,
  Color,
  Column,
  ColumnAttribute,
  ColumnOptions,
  ColumnSplit,
  ColumnSplitAttribute,
  Component,
  Counter,
  CounterAttribute,
  DataPanel,
  DataPanelAttribute,
  DatePicker,
  DatePickerAttribute,
  Divider,
  DividerAttribute,
  EffectComponentAttribute,
  Ellipse,
  EllipseAttribute,
  Entry,
  Flex,
  FlexAlign,
  FlexAttribute,
  FlowItem,
  FlowItemAttribute,
  ForEach,
  FormComponentAttribute,
  FormLinkAttribute,
  Gauge,
  GaugeAttribute,
  Grid,
  GridAttribute,
  GridCol,
  GridColAttribute,
  GridItem,
  GridItemAttribute,
  GridRow,
  GridRowAttribute,
  GridRowDirection,
  HorizontalAlign,
  HyperlinkAttribute,
  Image,
  ImageAnimator,
  ImageAnimatorAttribute,
  ImageAttribute,
  ImageFit,
  ImageSpanAttribute,
  Line,
  LineAttribute,
  List,
  ListAttribute,
  ListItem,
  ListItemAttribute,
  ListItemGroup,
  ListItemGroupAttribute,
  LoadingProgress,
  LoadingProgressAttribute,
  Marquee,
  MarqueeAttribute,
  Menu,
  MenuAttribute,
  MenuItem,
  MenuItemAttribute,
  MenuItemGroup,
  MenuItemGroupAttribute,
  MenuItemOptions,
  NavDestinationAttribute,
  Navigation,
  NavigationAttribute,
  NavPathStack,
  Path,
  PathAttribute,
  PatternLockAttribute,
  PluginComponentAttribute,
  Polygon,
  PolygonAttribute,
  Polyline,
  PolylineAttribute,
  Progress,
  ProgressAttribute,
  ProgressType,
  QRCode,
  QRCodeAttribute,
  Radio,
  RadioAttribute,
  Rating,
  RatingAttribute,
  Rect,
  RectAttribute,
  Refresh,
  RefreshAttribute,
  RelativeContainer,
  RelativeContainerAttribute,
  RemoteWindowAttribute,
  RichEditorAttribute,
  RichTextAttribute,
  Row,
  RowAttribute,
  RowSplit,
  RowSplitAttribute,
  Scroll,
  ScrollAttribute,
  ScrollBar,
  ScrollBarAttribute,
  Scroller,
  Search,
  SearchAttribute,
  Select,
  SelectAttribute,
  Shape,
  ShapeAttribute,
  SideBarContainer,
  SideBarContainerAttribute,
  SideBarContainerType,
  Slider,
  SliderAttribute,
  SliderStyle,
  SpanAttribute,
  Stack,
  StackAttribute,
  Swiper,
  SwiperAttribute,
  TabContent,
  TabContentAttribute,
  Tabs,
  TabsAttribute,
  Text,
  TextAlign,
  TextArea,
  TextAreaAttribute,
  TextAttribute,
  TextClock,
  TextClockAttribute,
  TextInputAttribute,
  TextPicker,
  TextPickerAttribute,
  TextTimer,
  TextTimerAttribute,
  TimePicker,
  TimePickerAttribute,
  Toggle,
  ToggleAttribute,
  ToggleType,
  UIExtensionComponentAttribute,
  VerticalAlign,
  VideoAttribute,
  WaterFlow,
  WaterFlowAttribute,
  Web,
  WebAttribute,
  WebviewController,
  WindowSceneAttribute,
  XComponentAttribute
} from '@ohos.arkui.component';
import { State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { RouterParams, SetValue } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mSepia: number = 10

  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`sepia page show ${JSON.stringify(this.mSepia)}`)
    instance.sepia(this.mSepia)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
  this.key(componentKey)
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

function commonStyleButton(this: ButtonAttribute, componentKey: string, _sepia: number | undefined) {
  this.sepia(_sepia)
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
struct sepiaPage {
  @State _sepiaAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _sepiaBadgeMod: BadgeModifier = new BadgeModifier()
  @State _sepiaBlankMod: BlankModifier = new BlankModifier()
  @State _sepiaButttonMod: ButtonModifier = new ButtonModifier()
  @State _sepiaCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _sepiaCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _sepiaCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _sepiaColumnMod: ColumnModifier = new ColumnModifier()
  @State _sepiaColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _sepiaCounterMod: CounterModifier = new CounterModifier()
  @State _sepiaDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _sepiaDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _sepiaDividerMod: DividerModifier = new DividerModifier()
  @State _sepiaEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _sepiaFlexMod: FlexModifier = new FlexModifier()
  @State _sepiaFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _sepiaFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _sepiaFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _sepiaGaugeMod: GaugeModifier = new GaugeModifier()
  @State _sepiaGridMod: GridModifier = new GridModifier()
  @State _sepiaGridColMod: GridColModifier = new GridColModifier()
  @State _sepiaGridItemMod: GridItemModifier = new GridItemModifier()
  @State _sepiaGridRowMod: GridRowModifier = new GridRowModifier()
  @State _sepiaHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _sepiaImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _sepiaImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _sepiaImageMod: ImageModifier = new ImageModifier()
  @State _sepiaListMod: ListModifier = new ListModifier()
  @State _sepiaListItemMod: ListItemModifier = new ListItemModifier()
  @State _sepiaListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _sepiaLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _sepiaMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _sepiaMenuMod: MenuModifier = new MenuModifier()
  @State _sepiaMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _sepiaMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _sepiaNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _sepiaNavigationMod: NavigationModifier = new NavigationModifier()
  @State _sepiaPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _sepiaPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _sepiaQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _sepiaRadioMod: RadioModifier = new RadioModifier()
  @State _sepiaRatingMod: RatingModifier = new RatingModifier()
  @State _sepiaRefreshMod: RefreshModifier = new RefreshModifier()
  @State _sepiaRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _sepiaRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _sepiaRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _sepiaRichTextMod: RichTextModifier = new RichTextModifier()
  @State _sepiaRowMod: RowModifier = new RowModifier()
  @State _sepiaRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _sepiaScrollMod: ScrollModifier = new ScrollModifier()
  @State _sepiaScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _sepiaSearchMod: SearchModifier = new SearchModifier()
  @State _sepiaSelectMod: SelectModifier = new SelectModifier()
  @State _sepiaSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _sepiaSliderMod: SliderModifier = new SliderModifier()
  @State _sepiaStackMod: StackModifier = new StackModifier()
  @State _sepiaSwiperMod: SwiperModifier = new SwiperModifier()
  @State _sepiaTabContentMod: TabContentModifier = new TabContentModifier()
  @State _sepiaTabsMod: TabsModifier = new TabsModifier()
  @State _sepiaTextMod: TextModifier = new TextModifier()
  @State _sepiaTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _sepiaTextClockMod: TextClockModifier = new TextClockModifier()
  @State _sepiaTextInputMod: TextInputModifier = new TextInputModifier()
  @State _sepiaTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _sepiaTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _sepiaTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _sepiaToggleMod: ToggleModifier = new ToggleModifier()
  @State _sepiaUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _sepiaWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _sepiaWebMod: WebModifier = new WebModifier()
  @State _sepiaXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @StoragePropRef('_sepia') _sepia: SetValue = {
    height: 0, sepia: 0
  }

  onPageShow() {
    console.info('22222 sepia page show called ')
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
    GridRow({ columns: this.columns as Int, gutter: this.gutter }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1')
            .attributeModifier(this._sepiaButttonMod)
            .commonStyleButton(this.componentKey, this._sepia.sepia)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._sepiaTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .commonStyle(this.componentKey).attributeModifier(this._sepiaAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._sepiaBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._sepiaCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._sepiaCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .commonStyle(this.componentKey).attributeModifier(this._sepiaDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._sepiaDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._sepiaDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._sepiaGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._sepiaImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._sepiaImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._sepiaLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._sepiaMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._sepiaMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
            .commonStyle(this.componentKey)
            .attributeModifier(this._sepiaQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._sepiaRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
            .commonStyle(this.componentKey)
            .attributeModifier(this._sepiaRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._sepiaSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._sepiaSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._sepiaSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._sepiaTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._sepiaTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._sepiaTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._sepiaTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .commonStyle(this.componentKey).attributeModifier(this._sepiaToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
            .attributeModifier(this._sepiaWebMod)
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
            style: {
              color: 0xFFFFFF,
              fontSize: 16,
              badgeSize: 20,
              badgeColor: Color.Red
            }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
              Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color: Color) => {
              GridCol({
                span: {
                  xs: 1,
                  sm: 2,
                  md: 3,
                  lg: 4
                }
              }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaGridRowMod)
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
          .commonStyle(this.componentKey)
          .attributeModifier(this._sepiaGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._sepiaListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._sepiaListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._sepiaListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaRefreshMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._sepiaRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._sepiaScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._sepiaSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._sepiaTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sepiaWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._sepiaGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._sepiaFlowItemMod)
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
            }
            .rowStart(1)
            .rowEnd(4)
            .commonStyle(this.componentKey)
            .attributeModifier(this._sepiaGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._sepiaMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._sepiaMenuItemGroupMod)
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