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
  applyStyles,
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
  CommonMethod,
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

// add Modifier
class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: FormComponentAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: GridAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ListAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RowAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: StackAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TextAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: WebAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mRestoreId: int = 2;

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.restoreId(this.mRestoreId)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyleBtn(this: ButtonAttribute, componentKey: string, _restoreId: Int | undefined) {
  this.restoreId(_restoreId)
  this.key(componentKey)
  return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: CounterAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: EffectComponentAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: FormComponentAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: EllipseAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: FlexAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: GaugeAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: GridAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: GridColAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: GridItemAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: GridRowAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: LineAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: NavigationAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: PathAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: PolygonAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: PolylineAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ProgressAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RadioAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RatingAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RectAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RefreshAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RichTextAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RowAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: SearchAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: SelectAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ShapeAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: SliderAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: SpanAttribute, componentKey: string) {

  this.key(componentKey)
  return this
}

function commonStyle(this: StackAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: SwiperAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ToggleAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TabsAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TextClockAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TextInputAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: VideoAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: WebAttribute, componentKey: string) {

  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: CanvasAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: XComponentAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: DividerAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: CircleAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: ListAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

function commonStyle(this: TabContentAttribute, componentKey: string) {
  this.restoreId(2)
  this.key(componentKey)
  return this
}

@Entry
@Component
struct restoreIdPage {
  @State _restoreIdAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _restoreIdBadgeMod: BadgeModifier = new BadgeModifier()
  @State _restoreIdBlankMod: BlankModifier = new BlankModifier()
  @State _restoreIdButttonMod: ButtonModifier = new ButtonModifier()
  @State _restoreIdCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _restoreIdCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _restoreIdCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _restoreIdColumnMod: ColumnModifier = new ColumnModifier()
  @State _restoreIdColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _restoreIdCounterMod: CounterModifier = new CounterModifier()
  @State _restoreIdDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _restoreIdDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _restoreIdDividerMod: DividerModifier = new DividerModifier()
  @State _restoreIdEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _restoreIdFlexMod: FlexModifier = new FlexModifier()
  @State _restoreIdFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _restoreIdFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _restoreIdFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _restoreIdGaugeMod: GaugeModifier = new GaugeModifier()
  @State _restoreIdGridMod: GridModifier = new GridModifier()
  @State _restoreIdGridColMod: GridColModifier = new GridColModifier()
  @State _restoreIdGridItemMod: GridItemModifier = new GridItemModifier()
  @State _restoreIdGridRowMod: GridRowModifier = new GridRowModifier()
  @State _restoreIdHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _restoreIdImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _restoreIdImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _restoreIdImageMod: ImageModifier = new ImageModifier()
  @State _restoreIdListMod: ListModifier = new ListModifier()
  @State _restoreIdListItemMod: ListItemModifier = new ListItemModifier()
  @State _restoreIdListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _restoreIdLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _restoreIdMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _restoreIdMenuMod: MenuModifier = new MenuModifier()
  @State _restoreIdMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _restoreIdMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _restoreIdNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _restoreIdNavigationMod: NavigationModifier = new NavigationModifier()
  @State _restoreIdPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _restoreIdPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _restoreIdQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _restoreIdRadioMod: RadioModifier = new RadioModifier()
  @State _restoreIdRatingMod: RatingModifier = new RatingModifier()
  @State _restoreIdRefreshMod: RefreshModifier = new RefreshModifier()
  @State _restoreIdRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _restoreIdRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _restoreIdRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _restoreIdRichTextMod: RichTextModifier = new RichTextModifier()
  @State _restoreIdRowMod: RowModifier = new RowModifier()
  @State _restoreIdRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _restoreIdScrollMod: ScrollModifier = new ScrollModifier()
  @State _restoreIdScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _restoreIdSearchMod: SearchModifier = new SearchModifier()
  @State _restoreIdSelectMod: SelectModifier = new SelectModifier()
  @State _restoreIdSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _restoreIdSliderMod: SliderModifier = new SliderModifier()
  @State _restoreIdStackMod: StackModifier = new StackModifier()
  @State _restoreIdSwiperMod: SwiperModifier = new SwiperModifier()
  @State _restoreIdTabContentMod: TabContentModifier = new TabContentModifier()
  @State _restoreIdTabsMod: TabsModifier = new TabsModifier()
  @State _restoreIdTextMod: TextModifier = new TextModifier()
  @State _restoreIdTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _restoreIdTextClockMod: TextClockModifier = new TextClockModifier()
  @State _restoreIdTextInputMod: TextInputModifier = new TextInputModifier()
  @State _restoreIdTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _restoreIdTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _restoreIdTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _restoreIdToggleMod: ToggleModifier = new ToggleModifier()
  @State _restoreIdUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _restoreIdWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _restoreIdWebMod: WebModifier = new WebModifier()
  @State _restoreIdXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @StoragePropRef('_restoreId') _restoreId: Int = 0

  onPageShow() {
    console.info('restoreId page show called ')
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

  // commonStyleButton(instance: CommonMethod) {
  //   instance.key(this.componentKey)
  // }

  build() {
    GridRow({ columns: this.columns as Int, gutter: this.gutter }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1')
            .attributeModifier(this._restoreIdButttonMod)
            .commonStyleBtn(this.componentKey, this._restoreId)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._restoreIdTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .commonStyle(this.componentKey)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle(this.componentKey)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle(this.componentKey)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._restoreIdImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._restoreIdLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle(this.componentKey)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle(this.componentKey)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle(this.componentKey)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._restoreIdTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .commonStyle(this.componentKey).attributeModifier(this._restoreIdToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
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
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey)
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
          }.commonStyle(this.componentKey)
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
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%')
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._restoreIdRefreshMod)
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
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._restoreIdScrollMod)
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
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._restoreIdStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey)
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
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey)
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
              .commonStyle(this.componentKey)
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
            .commonStyle(this.componentKey)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey)
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
              .commonStyle(this.componentKey)
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