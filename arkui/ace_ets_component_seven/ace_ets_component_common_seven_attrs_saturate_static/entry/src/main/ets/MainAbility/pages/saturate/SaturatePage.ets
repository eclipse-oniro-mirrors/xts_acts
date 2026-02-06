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
import Utils, { BasePageConfig, PageConfig, SetValue, TestValue } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mSaturate: number = 10

  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`saturate page show ${JSON.stringify(this.mSaturate)}`)
    instance.saturate(this.mSaturate)
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

function commonStyleButton(this: ButtonAttribute, componentKey: string, _saturate: number | undefined) {
  this.saturate(_saturate)
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
struct saturatePage {
  @StoragePropRef('_saturate') _saturate: SetValue = {
    height: 0, saturate: 0
  }
  @State _saturateAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _saturateBadgeMod: BadgeModifier = new BadgeModifier()
  @State _saturateBlankMod: BlankModifier = new BlankModifier()
  @State _saturateButttonMod: ButtonModifier = new ButtonModifier()
  @State _saturateCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _saturateCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _saturateCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _saturateColumnMod: ColumnModifier = new ColumnModifier()
  @State _saturateColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _saturateCounterMod: CounterModifier = new CounterModifier()
  @State _saturateDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _saturateDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _saturateDividerMod: DividerModifier = new DividerModifier()
  @State _saturateEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _saturateFlexMod: FlexModifier = new FlexModifier()
  @State _saturateFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _saturateFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _saturateFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _saturateGaugeMod: GaugeModifier = new GaugeModifier()
  @State _saturateGridMod: GridModifier = new GridModifier()
  @State _saturateGridColMod: GridColModifier = new GridColModifier()
  @State _saturateGridItemMod: GridItemModifier = new GridItemModifier()
  @State _saturateGridRowMod: GridRowModifier = new GridRowModifier()
  @State _saturateHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _saturateImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _saturateImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _saturateImageMod: ImageModifier = new ImageModifier()
  @State _saturateListMod: ListModifier = new ListModifier()
  @State _saturateListItemMod: ListItemModifier = new ListItemModifier()
  @State _saturateListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _saturateLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _saturateMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _saturateMenuMod: MenuModifier = new MenuModifier()
  @State _saturateMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _saturateMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _saturateNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _saturateNavigationMod: NavigationModifier = new NavigationModifier()
  @State _saturatePatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _saturatePluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _saturateQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _saturateRadioMod: RadioModifier = new RadioModifier()
  @State _saturateRatingMod: RatingModifier = new RatingModifier()
  @State _saturateRefreshMod: RefreshModifier = new RefreshModifier()
  @State _saturateRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _saturateRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _saturateRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _saturateRichTextMod: RichTextModifier = new RichTextModifier()
  @State _saturateRowMod: RowModifier = new RowModifier()
  @State _saturateRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _saturateScrollMod: ScrollModifier = new ScrollModifier()
  @State _saturateScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _saturateSearchMod: SearchModifier = new SearchModifier()
  @State _saturateSelectMod: SelectModifier = new SelectModifier()
  @State _saturateSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _saturateSliderMod: SliderModifier = new SliderModifier()
  @State _saturateStackMod: StackModifier = new StackModifier()
  @State _saturateSwiperMod: SwiperModifier = new SwiperModifier()
  @State _saturateTabContentMod: TabContentModifier = new TabContentModifier()
  @State _saturateTabsMod: TabsModifier = new TabsModifier()
  @State _saturateTextMod: TextModifier = new TextModifier()
  @State _saturateTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _saturateTextClockMod: TextClockModifier = new TextClockModifier()
  @State _saturateTextInputMod: TextInputModifier = new TextInputModifier()
  @State _saturateTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _saturateTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _saturateTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _saturateToggleMod: ToggleModifier = new ToggleModifier()
  @State _saturateUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _saturateWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _saturateWebMod: WebModifier = new WebModifier()
  @State _saturateXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 saturate page show called ')
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
            .attributeModifier(this._saturateButttonMod)
            .commonStyleButton(this.componentKey, this._saturate.saturate)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._saturateTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .commonStyle(this.componentKey).attributeModifier(this._saturateAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._saturateBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._saturateCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._saturateCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .commonStyle(this.componentKey).attributeModifier(this._saturateDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._saturateDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._saturateDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._saturateGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._saturateImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._saturateImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._saturateLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._saturateMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._saturateNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._saturateMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
            .commonStyle(this.componentKey)
            .attributeModifier(this._saturateQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._saturateRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
            .commonStyle(this.componentKey)
            .attributeModifier(this._saturateRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._saturateScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._saturateSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._saturateSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._saturateSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._saturateTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._saturateTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._saturateTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._saturateTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .commonStyle(this.componentKey).attributeModifier(this._saturateToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
            .attributeModifier(this._saturateWebMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._saturateBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._saturateColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._saturateColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._saturateCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._saturateFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._saturateGridRowMod)
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
          .attributeModifier(this._saturateGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._saturateListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._saturateListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._saturateListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._saturateRefreshMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._saturateRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._saturateRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._saturateRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._saturateScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._saturateSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._saturateStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._saturateSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._saturateTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._saturateTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._saturateWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._saturateGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._saturateFlowItemMod)
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
            .attributeModifier(this._saturateGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._saturateMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._saturateMenuItemGroupMod)
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