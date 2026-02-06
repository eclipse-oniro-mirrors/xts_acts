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
  Ellipse,
  EllipseAttribute,
  Entry,
  Flex,
  FlexAlign,
  FlexAttribute,
  FlowItem,
  FlowItemAttribute,
  ForEach,
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
  TranslateOptions,
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
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { RouterParams, SetValue } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: CanvasAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: CircleAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: EllipseAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class LineModifier implements AttributeModifier<LineAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: LineAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class PathModifier implements AttributeModifier<PathAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: PathAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: PolygonAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RectModifier implements AttributeModifier<RectAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RectAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RowAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: SpanAttribute): void {
    // instance.translate(this.mTranslate)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: StackAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: VideoAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: WebAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: WindowSceneAttribute): void {
    instance.translate(this.mTranslate)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mTranslate: TranslateOptions = { x: 6, y: 5, z: 4 }

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.translate(this.mTranslate)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ButtonAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: CounterAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyleDataPanel(this: DataPanelAttribute, componentKey: string,
  _translate: TranslateOptions | undefined) {
  this.translate(_translate)
  this.key(componentKey)
  return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: EllipseAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: FlexAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: GaugeAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: GridAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: GridColAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: GridItemAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: GridRowAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: LineAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: NavigationAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: PathAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: PolygonAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: PolylineAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ProgressAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RadioAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RatingAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RectAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RefreshAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RichTextAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RowAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: SearchAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: SelectAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ShapeAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: SliderAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: SpanAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: StackAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: SwiperAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ToggleAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TabsAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TextClockAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TextInputAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: VideoAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: WebAttribute, componentKey: string) {

  this.key(componentKey)
  return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: CanvasAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: XComponentAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: DividerAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: CircleAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: ListAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: TabContentAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

@Entry
@Component
struct TranslatePage {
  @State _translateAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _translateBadgeModifier: BadgeModifier = new BadgeModifier()
  @State _translateButtonModifier: ButtonModifier = new ButtonModifier()
  @State _translateBlankModifier: BlankModifier = new BlankModifier()
  @State _translateCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
  @State _translateCanvasModifier: CanvasModifier = new CanvasModifier()
  @State _translateCheckboxModifier: CheckboxModifier = new CheckboxModifier()
  @State _translateCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _translateCircleModifier: CircleModifier = new CircleModifier()
  @State _translateColumnModifier: ColumnModifier = new ColumnModifier()
  @State _translateColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
  @State _translateCounterModifier: CounterModifier = new CounterModifier()
  @State _translateDataPanelModifier: DataPanelModifier = new DataPanelModifier()
  @State _translateDatePickerModifier: DatePickerModifier = new DatePickerModifier()
  @State _translateDividerModifier: DividerModifier = new DividerModifier()
  @State _translateEllipseModifier: EllipseModifier = new EllipseModifier()
  @State _translateFlexModifier: FlexModifier = new FlexModifier()
  @State _translateFlowItemModifier: FlowItemModifier = new FlowItemModifier()
  @State _translateFormLinkModifier: FormLinkModifier = new FormLinkModifier()
  @State _translateGaugeModifier: GaugeModifier = new GaugeModifier()
  @State _translateGridModifier: GridModifier = new GridModifier()
  @State _translateGridColModifier: GridColModifier = new GridColModifier()
  @State _translateGridItemModifier: GridItemModifier = new GridItemModifier()
  @State _translateGridRowModifier: GridRowModifier = new GridRowModifier()
  @State _translateHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
  @State _translateImageModifier: ImageModifier = new ImageModifier()
  @State _translateImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _translateLineModifier: LineModifier = new LineModifier()
  @State _translateListModifier: ListModifier = new ListModifier()
  @State _translateListItemModifier: ListItemModifier = new ListItemModifier()
  @State _translateListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
  @State _translateLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
  @State _translateMarqueeModifier: MarqueeModifier = new MarqueeModifier()
  @State _translateMenuModifier: MenuModifier = new MenuModifier()
  @State _translateMenuItemModifier: MenuItemModifier = new MenuItemModifier()
  @State _translateMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _translateNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
  @State _translateNavigationModifier: NavigationModifier = new NavigationModifier()
  @State _translatePathModifier: PathModifier = new PathModifier()
  @State _translatePolygonModifier: PolygonModifier = new PolygonModifier()
  @State _translatePolylineModifier: PolylineModifier = new PolylineModifier()
  @State _translateProgressModifier: ProgressModifier = new ProgressModifier()
  @State _translateQRCodeModifier: QRCodeModifier = new QRCodeModifier()
  @State _translateRadioModifier: RadioModifier = new RadioModifier()
  @State _translateRatingModifier: RatingModifier = new RatingModifier()
  @State _translateRectModifier: RectModifier = new RectModifier()
  @State _translateRefreshModifier: RefreshModifier = new RefreshModifier()
  @State _translateRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
  @State _translateRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
  @State _translateRichEditorModifier: RichEditorModifier = new RichEditorModifier()
  @State _translateRichTextModifier: RichTextModifier = new RichTextModifier()
  @State _translateRowModifier: RowModifier = new RowModifier()
  @State _translateRowSplitModifier: RowSplitModifier = new RowSplitModifier()
  @State _translateScrollModifier: ScrollModifier = new ScrollModifier()
  @State _translateScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
  @State _translateSearchModifier: SearchModifier = new SearchModifier()
  @State _translateSelectModifier: SelectModifier = new SelectModifier()
  @State _translateShapeModifier: ShapeModifier = new ShapeModifier()
  @State _translateSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
  @State _translateSliderModifier: SliderModifier = new SliderModifier()
  @State _translateSpanModifier: SpanModifier = new SpanModifier()
  @State _translateStackModifier: StackModifier = new StackModifier()
  @State _translateSwiperModifier: SwiperModifier = new SwiperModifier()
  @State _translateTabContentModifier: TabContentModifier = new TabContentModifier()
  @State _translateTabsModifier: TabsModifier = new TabsModifier()
  @State _translateTextModifier: TextModifier = new TextModifier()
  @State _translateTextAreaModifier: TextAreaModifier = new TextAreaModifier()
  @State _translateTextClockModifier: TextClockModifier = new TextClockModifier()
  @State _translateTextInputModifier: TextInputModifier = new TextInputModifier()
  @State _translateTextPickerModifier: TextPickerModifier = new TextPickerModifier()
  @State _translateTextTimerModifier: TextTimerModifier = new TextTimerModifier()
  @State _translateTimePickerModifier: TimePickerModifier = new TimePickerModifier()
  @State _translateToggleModifier: ToggleModifier = new ToggleModifier()
  @State _translateVideoModifier: VideoModifier = new VideoModifier()
  @State _translateWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
  @State _translateWebModifier: WebModifier = new WebModifier()
  @State _translateWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
  @State _translateXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0
  @State gutter: number = 0
  @State parentBackGroundColor: string = '#FFFF00'
  @State parentComponentKey: string = '';
  @StoragePropRef('_translateObj') _translate: SetValue = {
    height: 0, translate: { x: 0, y: 0, z: 0 }
  }

  onPageShow() {
    console.info('translate translate page show called ')
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
  }

  build() {
    Column() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateAlphabetIndexerModifier)
      }
      if (this.targetView == 'Button') {
        Button('button1')
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateButtonModifier)
      }
      if (this.targetView == 'Blank') {
        Blank()
          .backgroundColor(Color.Yellow)
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateBlankModifier)
      }
      if (this.targetView == 'Checkbox') {
        Checkbox()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateCheckboxModifier)
      }
      if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateCheckboxGroupModifier)
      }
      if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._translateDataPanelModifier)
          .commonStyleDataPanel(this.componentKey, this._translate.translate)
      }
      if (this.targetView == 'DatePicker') {
        DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateDatePickerModifier)
      }
      if (this.targetView == 'Divider') {
        Divider()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateDividerModifier)
      }
      if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateGaugeModifier)
      }
      if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateImageModifier)
      }
      if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateImageAnimatorModifier)
      }
      if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateLoadingProgressModifier)
      }
      if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity as Int,
          fromStart: true,
          src: 'Running Marquee starts rolling'
        })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateMarqueeModifier)
      }
      if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
        }
        .commonStyle(this.componentKey)

        // .attributeModifier(this._translateNavigationModifier)
      }
      if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
        .backgroundColor(Color.Yellow)
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateMenuModifier)
      }
      if (this.targetView == 'NavRouter') {
      }
      if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateProgressModifier)
      }
      if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateQRCodeModifier)
      }
      if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateRadioModifier)
      }
      if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateRatingModifier)
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
        .attributeModifier(this._translateScrollBarModifier)
      }
      if (this.targetView == 'Search') {
        Search()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateSearchModifier)
      }
      if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateSelectModifier)
      }
      if (this.targetView == 'Slider') {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .showTips(true)
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateSliderModifier)
      }
      if (this.targetView == 'Text') {
        Text('text1')
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateTextModifier)
      }
      if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateTextAreaModifier)
      }
      if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateTextClockModifier)
      }
      if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateTextInputModifier)
      }
      if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateTextPickerModifier)
      }
      if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateTextTimerModifier)
      }
      if (this.targetView == 'TimePicker') {
        TimePicker({ selected: new Date('2022-07-22T08:00:00') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateTimePickerModifier)
      }
      if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateToggleModifier)
      }
      if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateWebModifier)
      }
      if (this.targetView == 'Circle') {
        Circle()
          .width(150)
          .height(200)
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateCircleModifier)
      }
      if (this.targetView == 'Ellipse') {
        Ellipse()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateEllipseModifier)
      }
      if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .backgroundColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateLineModifier)
      }
      if (this.targetView == 'Polyline') {
        Polyline()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translatePolylineModifier)
      }
      if (this.targetView == 'Polygon') {
        Polygon()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translatePolygonModifier)
      }
      if (this.targetView == 'Path') {
        Path()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translatePathModifier)
      }
      if (this.targetView == 'Rect') {
        Rect()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateRectModifier)
      }
      if (this.targetView == 'Shape') {
        Shape() {
          Rect()
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateShapeModifier)
      }
      if (this.targetView == 'Badge') {
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
            .width(100)
            .height(50)
            .backgroundColor(0x317aff)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateBadgeModifier)
      }
      if (this.targetView == 'Column') {
        Column() {
          Button('')
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateColumnModifier)
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
        .attributeModifier(this._translateColumnSplitModifier)
      }
      if (this.targetView == 'Counter') {
        Counter() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateCounterModifier)
      }
      if (this.targetView == 'Flex') {
        Flex() {
          Text('1')
            .width('20%')
            .height(50)
            .backgroundColor(0xF5DEB3)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateFlexModifier)
      }
      if (this.targetView == 'GridRow') {
        GridRow({ columns: 1, direction: GridRowDirection.Row }) {
          ForEach(
            [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown],
            (color: Color) => {
              GridCol({
                span: {
                  xs: 1,
                  sm: 2,
                  md: 3,
                  lg: 4
                }
              }) {
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
        .attributeModifier(this._translateGridRowModifier)
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
        .attributeModifier(this._translateGridModifier)
      }
      if (this.targetView == 'List') {
        List() {
        }
        .height('100%')
        .width('100%')
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateListModifier)
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
          .attributeModifier(this._translateListItemModifier)
        }
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._translateListItemGroupModifier)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'Navigator') {
      }
      if (this.targetView == 'Panel') {
      }
      if (this.targetView == 'Refresh') {
        Refresh({ refreshing: true }) {
          Text('123')
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateRefreshModifier)
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
            })
            .id('constraintSize')
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateRelativeContainerModifier)
      }
      if (this.targetView == 'Row') {
        Row()
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateRowModifier)
      }
      if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateRowSplitModifier)
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
        .attributeModifier(this._translateScrollModifier)
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

        // .attributeModifier(this._translateSideBarContainerModifier)
      }
      if (this.targetView == 'Stack') {
        Stack() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateStackModifier)
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

        // .attributeModifier(this._translateSwiperModifier)
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
        .attributeModifier(this._translateTabsModifier)
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
          .attributeModifier(this._translateTabContentModifier)
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
        .attributeModifier(this._translateWaterFlowModifier)
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
          .attributeModifier(this._translateGridColModifier)
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
          .attributeModifier(this._translateGridItemModifier)
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
            .attributeModifier(this._translateFlowItemModifier)
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
              .attributeModifier(this._translateMenuItemModifier)
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
            .attributeModifier(this._translateMenuItemGroupModifier)
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
          .attributeModifier(this._translateCalendarPickerModifier)
      }
      if (this.targetView == 'Canvas') {
        Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
          .backgroundColor('#FFFF00')
          .commonStyle(this.componentKey)
          .attributeModifier(this._translateCanvasModifier)
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
        .attributeModifier(this._translateFormLinkModifier)
      }
      if (this.targetView == 'Hyperlink') {
        Hyperlink('https://example.com/', 'Go to the developer website') {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._translateHyperlinkModifier)
      }
      if (this.targetView == 'Span') {
        Text() {
          Span('Span1')
            .commonStyle(this.componentKey)
            .attributeModifier(this._translateSpanModifier)
        }
      }
    }
    .width(this.parentWidth)
    .height(this.parentHeight)
    .backgroundColor(this.parentBackGroundColor || '#FFFF00')
    .key(this.parentComponentKey)
  }
}

class ObjElement {
  message?: string;
}