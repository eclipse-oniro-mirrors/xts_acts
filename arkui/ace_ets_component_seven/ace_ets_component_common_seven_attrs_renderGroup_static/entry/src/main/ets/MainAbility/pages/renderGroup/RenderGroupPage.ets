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
  CalendarPicker,
  CalendarPickerAttribute,
  Canvas,
  CanvasAttribute,
  CanvasRenderingContext2D,
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
  FormLink,
  FormLinkAttribute,
  FormLinkOptions,
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
  Hyperlink,
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
  RenderingContextSettings,
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
  Span,
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
  TextInput,
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
} from '@ohos.arkui.component'
import { State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { RouterParams, SetValue } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mRenderGroup: boolean = true

  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`renderGroup page show ${JSON.stringify(this.mRenderGroup)}`)
    instance.renderGroup(this.mRenderGroup)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
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

function commonStyleButton(this: ButtonAttribute, componentKey: string, _renderGroup: Boolean | undefined) {
  this.renderGroup(_renderGroup)
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
struct renderGroupPage {
  @State _renderGroupAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _renderGroupBadgeMod: BadgeModifier = new BadgeModifier()
  @State _renderGroupBlankMod: BlankModifier = new BlankModifier()
  @State _renderGroupButttonMod: ButtonModifier = new ButtonModifier()
  @State _renderGroupCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _renderGroupCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _renderGroupCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _renderGroupColumnMod: ColumnModifier = new ColumnModifier()
  @State _renderGroupColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _renderGroupCounterMod: CounterModifier = new CounterModifier()
  @State _renderGroupDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _renderGroupDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _renderGroupDividerMod: DividerModifier = new DividerModifier()
  @State _renderGroupEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _renderGroupFlexMod: FlexModifier = new FlexModifier()
  @State _renderGroupFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _renderGroupFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _renderGroupFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _renderGroupGaugeMod: GaugeModifier = new GaugeModifier()
  @State _renderGroupGridMod: GridModifier = new GridModifier()
  @State _renderGroupGridColMod: GridColModifier = new GridColModifier()
  @State _renderGroupGridItemMod: GridItemModifier = new GridItemModifier()
  @State _renderGroupGridRowMod: GridRowModifier = new GridRowModifier()
  @State _renderGroupHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _renderGroupImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _renderGroupImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _renderGroupImageMod: ImageModifier = new ImageModifier()
  @State _renderGroupListMod: ListModifier = new ListModifier()
  @State _renderGroupListItemMod: ListItemModifier = new ListItemModifier()
  @State _renderGroupListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _renderGroupLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _renderGroupMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _renderGroupMenuMod: MenuModifier = new MenuModifier()
  @State _renderGroupMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _renderGroupMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _renderGroupNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _renderGroupNavigationMod: NavigationModifier = new NavigationModifier()
  @State _renderGroupPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _renderGroupPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _renderGroupQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _renderGroupRadioMod: RadioModifier = new RadioModifier()
  @State _renderGroupRatingMod: RatingModifier = new RatingModifier()
  @State _renderGroupRefreshMod: RefreshModifier = new RefreshModifier()
  @State _renderGroupRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _renderGroupRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _renderGroupRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _renderGroupRichTextMod: RichTextModifier = new RichTextModifier()
  @State _renderGroupRowMod: RowModifier = new RowModifier()
  @State _renderGroupRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _renderGroupScrollMod: ScrollModifier = new ScrollModifier()
  @State _renderGroupScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _renderGroupSearchMod: SearchModifier = new SearchModifier()
  @State _renderGroupSelectMod: SelectModifier = new SelectModifier()
  @State _renderGroupSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _renderGroupSliderMod: SliderModifier = new SliderModifier()
  @State _renderGroupStackMod: StackModifier = new StackModifier()
  @State _renderGroupSwiperMod: SwiperModifier = new SwiperModifier()
  @State _renderGroupTabContentMod: TabContentModifier = new TabContentModifier()
  @State _renderGroupTabsMod: TabsModifier = new TabsModifier()
  @State _renderGroupTextMod: TextModifier = new TextModifier()
  @State _renderGroupTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _renderGroupTextClockMod: TextClockModifier = new TextClockModifier()
  @State _renderGroupTextInputMod: TextInputModifier = new TextInputModifier()
  @State _renderGroupTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _renderGroupTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _renderGroupTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _renderGroupToggleMod: ToggleModifier = new ToggleModifier()
  @State _renderGroupUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _renderGroupWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _renderGroupWebMod: WebModifier = new WebModifier()
  @State _renderGroupXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @StoragePropRef('_renderGroup') _renderGroup: SetValue = {
    height: 0, renderGroup: false
  }

  onPageShow() {
    console.info('22222 renderGroup page show called ')
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
    GridRow({ columns: this.columns as Int, gutter: this.gutter, /*margin: 0*/ }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1')
            .attributeModifier(this._renderGroupButttonMod)
            .commonStyleButton(this.componentKey, this._renderGroup.renderGroup)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._renderGroupTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderGroupBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._renderGroupCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderGroupCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._renderGroupDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._renderGroupDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._renderGroupImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._renderGroupImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._renderGroupLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._renderGroupMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._renderGroupMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderGroupQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderGroupRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderGroupRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._renderGroupSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._renderGroupSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._renderGroupTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._renderGroupTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
            .attributeModifier(this._renderGroupWebMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupGridRowMod)
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
          .attributeModifier(this._renderGroupGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._renderGroupListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._renderGroupListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._renderGroupListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupRefreshMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._renderGroupRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._renderGroupScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._renderGroupSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._renderGroupTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderGroupWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._renderGroupGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._renderGroupFlowItemMod)
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
            .attributeModifier(this._renderGroupGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._renderGroupMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._renderGroupMenuItemGroupMod)
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