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
  Entry,
  Component,
  Row,
  Text,
  Color,
  Column,
  Scroller,
  CanvasRenderingContext2D,
  RenderingContextSettings,
  AlphabetIndexer,
  Button,
  Blank,
  Checkbox,
  CheckboxGroup,
  DataPanel,
  DatePicker,
  Divider,
  Gauge,
  Image,
  ImageAnimator,
  LoadingProgress,
  Marquee,
  Navigation,
  Menu,
  $r,
  MenuItem,
  QRCode,
  Radio,
  Rating,
  ScrollBar,
  Select,
  MenuItemOptions,
  Slider,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
  TimePicker,
  Toggle,
  Web,
  Circle,
  Ellipse,
  Line,
  WebviewController,
  Polyline,
  Polygon,
  Path,
  Rect,
  Shape,
  Badge,
  ColumnSplit,
  Counter,
  Flex,
  GridRow,
  Grid,
  List,
  Refresh,
  ProgressType,
  FlowItem,
  RelativeContainer,
  RowSplit,
  Scroll,
  SideBarContainer,
  Stack,
  Swiper,
  Tabs,
  WaterFlow,
  CalendarPicker,
  FormLink,
  Hyperlink,
  Progress,
  BarState,
  Search,
  SliderStyle,
  TextTimer,
  ToggleType,
  TextAlign,
  GridRowDirection,
  ForEach,
  ListItem,
  ListItemGroup,
  VerticalAlign,
  HorizontalAlign,
  SideBarContainerType,
  FlexAlign,
  TabContent,
  GridCol,
  GridItem,
  MenuItemGroup,
  Canvas,
  Span,
  AttributeModifier,
  AlphabetIndexerAttribute,
  BadgeAttribute,
  ButtonAttribute,
  BlankAttribute,
  CalendarPickerAttribute,
  CanvasAttribute,
  CheckboxAttribute,
  CheckboxGroupAttribute,
  CircleAttribute,
  ColumnAttribute,
  ColumnSplitAttribute,
  CounterAttribute,
  DataPanelAttribute,
  DatePickerAttribute,
  DividerAttribute,
  EllipseAttribute,
  FlexAttribute,
  FlowItemAttribute,
  FormLinkAttribute,
  GaugeAttribute,
  GridAttribute,
  GridColAttribute,
  GridItemAttribute,
  GridRowAttribute,
  HyperlinkAttribute,
  ImageAttribute,
  ImageAnimatorAttribute,
  LineAttribute,
  ListAttribute,
  ListItemAttribute,
  ListItemGroupAttribute,
  LoadingProgressAttribute,
  MarqueeAttribute,
  MenuAttribute,
  MenuItemAttribute,
  MenuItemGroupAttribute,
  NavDestinationAttribute,
  NavigationAttribute,
  PathAttribute,
  PolygonAttribute,
  PolylineAttribute,
  applyStyles,
  ProgressAttribute,
  QRCodeAttribute,
  RadioAttribute,
  RatingAttribute,
  RectAttribute,
  RefreshAttribute,
  RelativeContainerAttribute,
  RemoteWindowAttribute,
  RichEditorAttribute,
  RichTextAttribute,
  RowAttribute,
  RowSplitAttribute,
  ScrollAttribute,
  ScrollBarAttribute,
  SearchAttribute,
  SelectAttribute,
  ShapeAttribute,
  SliderAttribute,
  SpanAttribute,
  StackAttribute,
  CommonMethod,
  SwiperAttribute,
  SideBarContainerAttribute,
  ToggleAttribute,
  TabContentAttribute,
  TabsAttribute,
  TextAttribute,
  TextAreaAttribute,
  TextClockAttribute,
  TextInputAttribute,
  TextPickerAttribute,
  TextTimerAttribute,
  TimePickerAttribute,
  VideoAttribute,
  WaterFlowAttribute,
  WebAttribute,
  WindowSceneAttribute,
  XComponentAttribute,
  BadgeParamWithNumber,
  ColumnOptions,
  ImageFit,
  NavPathStack,
  FormLinkOptions,
  EffectComponentAttribute,
  FormComponentAttribute,
  ImageSpanAttribute,
  PatternLockAttribute,
  PluginComponentAttribute,
  UIExtensionComponentAttribute,
  RichText,
  AlignRuleOption
} from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.width(this.mWidth)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.width(this.mWidth)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.width(this.mWidth)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.width(this.mWidth)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.width(this.mWidth)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.width(this.mWidth)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.width(this.mWidth)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.width(this.mWidth)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.width(this.mWidth)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.width(this.mWidth)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.width(this.mWidth)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.width(this.mWidth)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.width(this.mWidth)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    instance.width(this.mWidth)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.width(this.mWidth)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.width(this.mWidth)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: FormComponentAttribute): void {
    instance.width(this.mWidth)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.width(this.mWidth)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.width(this.mWidth)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: GridAttribute): void {
    instance.width(this.mWidth)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.width(this.mWidth)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.width(this.mWidth)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.width(this.mWidth)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.width(this.mWidth)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.width(this.mWidth)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.width(this.mWidth)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.width(this.mWidth)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ListAttribute): void {
    instance.width(this.mWidth)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.width(this.mWidth)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.width(this.mWidth)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.width(this.mWidth)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.width(this.mWidth)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.width(this.mWidth)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.width(this.mWidth)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.width(this.mWidth)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.width(this.mWidth)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.width(this.mWidth)
  }
}
class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.width(this.mWidth)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    instance.width(this.mWidth)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.width(this.mWidth)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.width(this.mWidth)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.width(this.mWidth)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.width(this.mWidth)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.width(this.mWidth)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.width(this.mWidth)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.width(this.mWidth)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.width(this.mWidth)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RowAttribute): void {
    instance.width(this.mWidth)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.width(this.mWidth)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.width(this.mWidth)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.width(this.mWidth)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.width(this.mWidth)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.width(this.mWidth)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.width(this.mWidth)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.width(this.mWidth)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: StackAttribute): void {
    instance.width(this.mWidth)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.width(this.mWidth)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.width(this.mWidth)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.width(this.mWidth)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TextAttribute): void {
    instance.width(this.mWidth)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.width(this.mWidth)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.width(this.mWidth)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.width(this.mWidth)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.width(this.mWidth)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.width(this.mWidth)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.width(this.mWidth)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.width(this.mWidth)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    instance.width(this.mWidth)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.width(this.mWidth)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: WebAttribute): void {
    instance.width(this.mWidth)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.width(this.mWidth)
  }
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.width(this.mWidth)
  }
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
  mWidth: number | string = 10

  applyNormalAttribute(instance: CircleAttribute): void {
    instance.width(this.mWidth)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string, _width: string | number) {
  this.width(_width)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CounterAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EffectComponentAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormComponentAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EllipseAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlexAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GaugeAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridColAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridItemAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridRowAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LineAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavigationAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PathAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolygonAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolylineAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ProgressAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RadioAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RatingAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RectAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RefreshAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichTextAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SearchAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SelectAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ShapeAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SliderAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SpanAttribute, componentKey: string) {
  // this.width(50)
  // this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: StackAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SwiperAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ToggleAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabsAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextClockAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextInputAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: VideoAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WebAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CanvasAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: XComponentAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DividerAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CircleAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabContentAttribute, componentKey: string) {
  this.width(50)
  this.height('100%')
  this.key(componentKey)
  return this
}

@Entry
@Component
struct WidthPage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling'
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B']
  //Use for Scroll,Grid,DataPanel.
  public valueArr: number[] = [5, 10, 10, 7, 9, 10, 10, 10, 10] as number[]
  @StoragePropRef('_widthObj') _width: SetValue = {
    height: 0,width: 0
  }
  @State _widthCircleMod: CircleModifier = new CircleModifier()
  @State _widthProgressMod: ProgressModifier = new ProgressModifier()
  @State _widthAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _widthBadgeMod: BadgeModifier = new BadgeModifier()
  //Blank Component is not found on build
  @State _widthBlankMod: BlankModifier = new BlankModifier()
  @State _widthButtonMod: ButtonModifier = new ButtonModifier()
  //CalendarPicker Component is not found on build
  @State _widthCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _widthCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _widthCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _widthColumnMod: ColumnModifier = new ColumnModifier()
  @State _widthColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _widthCounterMod: CounterModifier = new CounterModifier()
  @State _widthDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _widthDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _widthDividerMod: DividerModifier = new DividerModifier()
  //EffectComponent Component is not found on build
  @State _widthEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _widthFlexMod: FlexModifier = new FlexModifier()
  @State _widthFlowItemMod: FlowItemModifier = new FlowItemModifier()
  //FormComponent Component is not found on build
  @State _widthFormComponentMod: FormComponentModifier = new FormComponentModifier()
  //FormLink Component is not found on build
  @State _widthFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _widthGaugeMod: GaugeModifier = new GaugeModifier()
  @State _widthGridMod: GridModifier = new GridModifier()
  @State _widthGridColMod: GridColModifier = new GridColModifier()
  @State _widthGridItemMod: GridItemModifier = new GridItemModifier()
  @State _widthGridRowMod: GridRowModifier = new GridRowModifier()
  //Hyperlink Component is not found on build
  @State _widthHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _widthImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  //ImageSpan Component is not found on build
  @State _widthImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _widthImageMod: ImageModifier = new ImageModifier()
  @State _widthListMod: ListModifier = new ListModifier()
  @State _widthListItemMod: ListItemModifier = new ListItemModifier()
  //ListItemGroup Component is not found on build
  @State _widthListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _widthLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _widthMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _widthMenuMod: MenuModifier = new MenuModifier()
  @State _widthMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _widthMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  //NavDestination Component is not found on build
  @State _widthNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _widthNavigationMod: NavigationModifier = new NavigationModifier()
  //PatternLock Component is not found on build
  @State _widthPatternLockMod: PatternLockModifier = new PatternLockModifier()
  //PluginComponent Component is not found on build
  @State _widthPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  //QRCodeAttribute Component is not found on build
  @State _widthQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _widthRadioMod: RadioModifier = new RadioModifier()
  @State _widthRatingMod: RatingModifier = new RatingModifier()
  @State _widthRefreshMod: RefreshModifier = new RefreshModifier()
  @State _widthRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  //RemoteWindow Component is not found on build
  @State _widthRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  //RichEditor Component is not found on build
  @State _widthRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _widthRichTextMod: RichTextModifier = new RichTextModifier()
  @State _widthRowMod: RowModifier = new RowModifier()
  @State _widthRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _widthScrollMod: ScrollModifier = new ScrollModifier()
  @State _widthScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _widthSearchMod: SearchModifier = new SearchModifier()
  @State _widthSelectMod: SelectModifier = new SelectModifier()
  @State _widthSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _widthSliderMod: SliderModifier = new SliderModifier()
  @State _widthStackMod: StackModifier = new StackModifier()
  @State _widthSwiperMod: SwiperModifier = new SwiperModifier()
  @State _widthTabContentMod: TabContentModifier = new TabContentModifier()
  @State _widthTabsMod: TabsModifier = new TabsModifier()
  @State _widthTextMod: TextModifier = new TextModifier()
  @State _widthTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _widthTextClockMod: TextClockModifier = new TextClockModifier()
  @State _widthTextInputMod: TextInputModifier = new TextInputModifier()
  @State _widthTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _widthTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _widthTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _widthToggleMod: ToggleModifier = new ToggleModifier()
  //UIExtensionComponent Component is not found on build
  @State _widthUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _widthWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _widthWebMod: WebModifier = new WebModifier()
  //XComponent Component is not found on build
  @State _widthXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @State parentBackGroundColor: string = '';
  @State BackGroundColor: string = '';

  onPageShow() {
    console.info('[WidthPage] page show called ')
      const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
        .getElement("view")
      this.targetView = viewElement.getString("targetView")
      this.componentKey = viewElement.getString("componentKey")
      this.parentWidth = viewElement.getDouble("parentWidth")
      this.parentHeight = viewElement.getDouble("parentHeight")
      this.columns = viewElement.getDouble("columns")
      this.gutter = viewElement.getDouble("gutter")
      this.parentComponentKey = viewElement.getString("parentComponentKey")
      this.parentBackGroundColor = viewElement.getString("parentBackGroundColor")
      this.BackGroundColor = viewElement.getString("BackGroundColor")
  }

  build() {
    Row() {
      if (this.targetView == 'Button') {
        Button('button1')
          .height(100)
          .attributeModifier(this._widthButtonMod)
          .commonStyleButton(this.componentKey, this._width.width)
      } else if (this.targetView == 'Text') {
        Text('text1').commonStyle(this.componentKey).height(100).attributeModifier(this._widthTextMod)
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })
          .commonStyle(this.componentKey).height(100).attributeModifier(this._widthAlphabetIndexerMod)
      } else if (this.targetView == 'BlankRow') {
        Blank().color(this.BackGroundColor).commonStyle(this.componentKey).height(100)
      } else if (this.targetView == 'BlankColumn') {
        Column() {
          Blank().color(this.BackGroundColor).commonStyle(this.componentKey)
        }.key(this.parentComponentKey).width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'Checkbox') {
        Checkbox()
          .backgroundColor(this.BackGroundColor)
          .commonStyle(this.componentKey)
          .height(100)
          .margin(0)
          .attributeModifier(this._widthCheckboxMod)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .commonStyle(this.componentKey)
          .backgroundColor(this.BackGroundColor)
          .height(100)
          .attributeModifier(this._widthCheckboxGroupMod)
          .margin(0)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr })
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthDataPanelMod)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1')
        }).commonStyle(this.componentKey).height(100).attributeModifier(this._widthDatePickerMod)
      } else if (this.targetView == 'Divider') {
        Divider()
          .strokeWidth(8)
          .color(Color.Red)
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthDividerMod)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .commonStyle(this.componentKey)
          .attributeModifier(this._widthGaugeMod)
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .height(100)
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .commonStyle(this.componentKey)
          .height(110)
          .backgroundColor(this.BackGroundColor)
          .height(100)
          .attributeModifier(this._widthImageMod)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ]).commonStyle(this.componentKey).height(100).attributeModifier(this._widthImageAnimatorMod)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .backgroundColor(this.BackGroundColor)
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthLoadingProgressMod)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity as Int,
          fromStart: true,
          src: this.src
        }).commonStyle(this.componentKey).attributeModifier(this._widthMarqueeMod)
          .height(100)
      } else if (this.targetView == 'Navigation') {
        Navigation().commonStyle(this.componentKey).height(100).attributeModifier(this._widthNavigationMod)
      } else if (this.targetView == 'NavRouter') {
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthProgressMod)
      } else if (this.targetView == 'QRCode') {
        QRCode(this.src)
          .commonStyle(this.componentKey)
          .backgroundColor(this.BackGroundColor)
          .height(100)
          .attributeModifier(this._widthQRCodeMod)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .height(100)
          .commonStyle(this.componentKey)
          .attributeModifier(this._widthRadioMod)
          .backgroundColor(this.BackGroundColor)
          .margin(0)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 }).commonStyle(this.componentKey).height(100).attributeModifier(this._widthRatingMod)
      } else if (this.targetView == 'RichText') {
        RichText('RichText')
          .commonStyle(this.componentKey)
          .height(100)
          .backgroundColor(this.BackGroundColor)
          .attributeModifier(this._widthRichTextMod)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller() }) {
          Text().width(10).height(50).backgroundColor('#C0C0C0')
        }
        .commonStyle(this.componentKey)
        .backgroundColor(this.BackGroundColor)
        .height(100)
        .attributeModifier(this._widthScrollBarMod)
      } else if (this.targetView == 'Search') {
        Search().commonStyle(this.componentKey).height(100).attributeModifier(this._widthSearchMod)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' },
          { value: 'bbb' }])
          .backgroundColor(this.BackGroundColor)
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthSelectMod)
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50
        }).showTips(true).commonStyle(this.componentKey).height(100).attributeModifier(this._widthSliderMod)
      } else if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'TextArea' })
          .backgroundColor(this.BackGroundColor)
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthTextAreaMod)
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .commonStyle(this.componentKey)
          .backgroundColor(this.BackGroundColor)
          .height(100)
          .attributeModifier(this._widthTextClockMod)
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthTextInputMod)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value })
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthTextPickerMod)
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .commonStyle(this.componentKey)
          .attributeModifier(this._widthTextTimerMod)
          .height(100)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime
        }).useMilitaryTime(true).commonStyle(this.componentKey).height(100).attributeModifier(this._widthTimePickerMod)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch })
          .commonStyle(this.componentKey)
          .backgroundColor(this.BackGroundColor)
          .height(100)
          .margin(0)
          .attributeModifier(this._widthToggleMod)
      } else if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
          .commonStyle(this.componentKey)
          .height(100)
          .attributeModifier(this._widthWebMod)
      } else if (this.targetView == 'Circle') {
        Circle().commonStyle(this.componentKey).height(100).attributeModifier(this._widthCircleMod)
      } else if (this.targetView == 'Ellipse') {
        Ellipse().commonStyle(this.componentKey).height(100)
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .commonStyle(this.componentKey)
          .height(100)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polyline') {
        Polyline()
          .commonStyle(this.componentKey)
          .height(200)
          .points([[20, 0], [0, 100], [100, 90]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polygon') {
        Polygon()
          .commonStyle(this.componentKey)
          .height(100)
          .points([[0, 0], [0, 100], [100, 100], [100, 0]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Path') {
        Path()
          .commonStyle(this.componentKey)
          .height(100)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Rect') {
        Rect()
          .commonStyle(this.componentKey)
          .height(100)
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }.commonStyle(this.componentKey)
        .backgroundColor(this.BackGroundColor)
        .height(100)
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow()
          .commonStyle(this.componentKey)
          .backgroundColor(this.BackGroundColor)
          .height(100)
          .attributeModifier(this._widthWaterFlowMod)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem().commonStyle(this.componentKey).attributeModifier(this._widthFlowItemMod)
        }.key(this.parentComponentKey).width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            }
          }) {
            Row().width('100%').height('20vp')
          }.commonStyle(this.componentKey).attributeModifier(this._widthGridColMod)
        }.key(this.parentComponentKey).width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().commonStyle(this.componentKey)
        }.key(this.parentComponentKey).width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            } as AlignRuleOption)
        }.backgroundColor(Color.Green).commonStyle(this.componentKey).height(100)
      } else if (this.targetView == 'Navigator') {
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
        }.commonStyle(this.componentKey).attributeModifier(this._widthBadgeMod)

      } else if (this.targetView == 'Column') {
        Column() {
          Column().width('100%').height(30).backgroundColor(0xAFEEEE)
        }.commonStyle(this.componentKey).attributeModifier(this._widthColumnMod)
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }.commonStyle(this.componentKey).attributeModifier(this._widthColumnSplitMod)
      } else if (this.targetView == 'Counter') {
        Counter() {
        }.commonStyle(this.componentKey).attributeModifier(this._widthCounterMod)
      } else if (this.targetView == 'Flex') {
        Flex() {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
        }.commonStyle(this.componentKey).attributeModifier(this._widthFlexMod)
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
        }.commonStyle(this.componentKey).attributeModifier(this._widthGridRowMod)
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
        .attributeModifier(this._widthGridMod)
        .backgroundColor(0xFAEEE0)
      } else if (this.targetView == 'List') {
        List() {
        }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._widthListMod)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: true }) {
          Text('123')
        }.commonStyle(this.componentKey).attributeModifier(this._widthRefreshMod)
      }
      else if (this.targetView == 'Row') {
        Row().commonStyle(this.componentKey).attributeModifier(this._widthRowMod)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }.commonStyle(this.componentKey).attributeModifier(this._widthRowSplitMod)
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
        }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._widthScrollMod)
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
        }.commonStyle(this.componentKey).attributeModifier(this._widthSideBarContainerMod)
      } else if (this.targetView == 'Stack') {
        Stack() {
        }.commonStyle(this.componentKey).attributeModifier(this._widthStackMod)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3], (item: int) => {
            Text('Swiper' + item).width('90%').height(50)
          }, (item: int) => item.toString())
        }
        .indicator(true)
        .backgroundColor(Color.White)
        .commonStyle(this.componentKey).attributeModifier(this._widthSwiperMod)
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }
        }.commonStyle(this.componentKey).attributeModifier(this._widthTabsMod)
      } else if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          }.commonStyle(this.componentKey).attributeModifier(this._widthListItemMod)
        }
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'Panel') {
      }
    }
    .height(this.parentHeight)
    .width(this.parentWidth)
    .backgroundColor(this.parentBackGroundColor)
    .key(this.parentComponentKey)
  }
}