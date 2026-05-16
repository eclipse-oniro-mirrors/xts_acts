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
  AlignRuleOption,
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
  Rectangle,
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
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { RouterParams, SetValue } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mResponseRegion: Rectangle[] = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: CanvasAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: CircleAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: EllipseAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: GridAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class LineModifier implements AttributeModifier<LineAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: LineAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ListAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}
class PathModifier implements AttributeModifier<PathAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: PathAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: PolygonAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RectModifier implements AttributeModifier<RectAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RectAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RowAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: StackAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TextAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: VideoAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: WebAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: WindowSceneAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mResponseRegion: Array<Rectangle> = [{
    x: 13,
    y: 17,
    width: '19%',
    height: '23%'
  }]

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.responseRegion(this.mResponseRegion)
  }
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
  this.key(componentKey)
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string,
  _responseRegion: Array<Rectangle> | undefined) {
  this.responseRegion(_responseRegion)
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

function commonStyle(this: DataPanelAttribute, componentKey: string) {
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
struct ResponseRegionPage {
  @State _responseRegionAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _responseRegionBadgeModifier: BadgeModifier = new BadgeModifier()
  @State _responseRegionButtonModifier: ButtonModifier = new ButtonModifier()
  @State _responseRegionBlankModifier: BlankModifier = new BlankModifier()
  @State _responseRegionCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
  @State _responseRegionCanvasModifier: CanvasModifier = new CanvasModifier()
  @State _responseRegionCheckboxModifier: CheckboxModifier = new CheckboxModifier()
  @State _responseRegionCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _responseRegionCircleModifier: CircleModifier = new CircleModifier()
  @State _responseRegionColumnModifier: ColumnModifier = new ColumnModifier()
  @State _responseRegionColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
  @State _responseRegionCounterModifier: CounterModifier = new CounterModifier()
  @State _responseRegionDataPanelModifier: DataPanelModifier = new DataPanelModifier()
  @State _responseRegionDatePickerModifier: DatePickerModifier = new DatePickerModifier()
  @State _responseRegionDividerModifier: DividerModifier = new DividerModifier()
  @State _responseRegionEllipseModifier: EllipseModifier = new EllipseModifier()
  @State _responseRegionFlexModifier: FlexModifier = new FlexModifier()
  @State _responseRegionFlowItemModifier: FlowItemModifier = new FlowItemModifier()
  @State _responseRegionFormLinkModifier: FormLinkModifier = new FormLinkModifier()
  @State _responseRegionGaugeModifier: GaugeModifier = new GaugeModifier()
  @State _responseRegionGridModifier: GridModifier = new GridModifier()
  @State _responseRegionGridColModifier: GridColModifier = new GridColModifier()
  @State _responseRegionGridItemModifier: GridItemModifier = new GridItemModifier()
  @State _responseRegionGridRowModifier: GridRowModifier = new GridRowModifier()
  @State _responseRegionHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
  @State _responseRegionImageModifier: ImageModifier = new ImageModifier()
  @State _responseRegionImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _responseRegionLineModifier: LineModifier = new LineModifier()
  @State _responseRegionListModifier: ListModifier = new ListModifier()
  @State _responseRegionListItemModifier: ListItemModifier = new ListItemModifier()
  @State _responseRegionListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
  @State _responseRegionLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
  @State _responseRegionMarqueeModifier: MarqueeModifier = new MarqueeModifier()
  @State _responseRegionMenuModifier: MenuModifier = new MenuModifier()
  @State _responseRegionMenuItemModifier: MenuItemModifier = new MenuItemModifier()
  @State _responseRegionMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _responseRegionNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
  @State _responseRegionNavigationModifier: NavigationModifier = new NavigationModifier()
  @State _responseRegionPathModifier: PathModifier = new PathModifier()
  @State _responseRegionPolygonModifier: PolygonModifier = new PolygonModifier()
  @State _responseRegionPolylineModifier: PolylineModifier = new PolylineModifier()
  @State _responseRegionProgressModifier: ProgressModifier = new ProgressModifier()
  @State _responseRegionQRCodeModifier: QRCodeModifier = new QRCodeModifier()
  @State _responseRegionRadioModifier: RadioModifier = new RadioModifier()
  @State _responseRegionRatingModifier: RatingModifier = new RatingModifier()
  @State _responseRegionRectModifier: RectModifier = new RectModifier()
  @State _responseRegionRefreshModifier: RefreshModifier = new RefreshModifier()
  @State _responseRegionRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
  @State _responseRegionRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
  @State _responseRegionRichEditorModifier: RichEditorModifier = new RichEditorModifier()
  @State _responseRegionRichTextModifier: RichTextModifier = new RichTextModifier()
  @State _responseRegionRowModifier: RowModifier = new RowModifier()
  @State _responseRegionRowSplitModifier: RowSplitModifier = new RowSplitModifier()
  @State _responseRegionScrollModifier: ScrollModifier = new ScrollModifier()
  @State _responseRegionScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
  @State _responseRegionSearchModifier: SearchModifier = new SearchModifier()
  @State _responseRegionSelectModifier: SelectModifier = new SelectModifier()
  @State _responseRegionShapeModifier: ShapeModifier = new ShapeModifier()
  @State _responseRegionSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
  @State _responseRegionSliderModifier: SliderModifier = new SliderModifier()
  @State _responseRegionSpanModifier: SpanModifier = new SpanModifier()
  @State _responseRegionStackModifier: StackModifier = new StackModifier()
  @State _responseRegionSwiperModifier: SwiperModifier = new SwiperModifier()
  @State _responseRegionTabContentModifier: TabContentModifier = new TabContentModifier()
  @State _responseRegionTabsModifier: TabsModifier = new TabsModifier()
  @State _responseRegionTextModifier: TextModifier = new TextModifier()
  @State _responseRegionTextAreaModifier: TextAreaModifier = new TextAreaModifier()
  @State _responseRegionTextClockModifier: TextClockModifier = new TextClockModifier()
  @State _responseRegionTextInputModifier: TextInputModifier = new TextInputModifier()
  @State _responseRegionTextPickerModifier: TextPickerModifier = new TextPickerModifier()
  @State _responseRegionTextTimerModifier: TextTimerModifier = new TextTimerModifier()
  @State _responseRegionTimePickerModifier: TimePickerModifier = new TimePickerModifier()
  @State _responseRegionToggleModifier: ToggleModifier = new ToggleModifier()
  @State _responseRegionVideoModifier: VideoModifier = new VideoModifier()
  @State _responseRegionWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
  @State _responseRegionWebModifier: WebModifier = new WebModifier()
  @State _responseRegionWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
  @State _responseRegionXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @State parentBackGroundColor: string = '';
  @StoragePropRef('_responseRegion') _responseRegion: Array<Rectangle> = [{
    x: 0,
    y: 0,
    width: 0,
    height: 0
  } as Rectangle]

  onPageShow() {
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    console.info(' setValue112 : ' + JSON.stringify(routerParamOptions.view.testValue.setValue));
    AppStorage.setOrCreate<Array<Rectangle>>('_responseRegion',
      routerParamOptions.view.testValue.setValue.responseRegion)
    console.info('responseRegion translate page show called ')
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
          .attributeModifier(this._responseRegionAlphabetIndexerModifier)
      }
      if (this.targetView == 'Button') {
        Button('button1')
          .attributeModifier(this._responseRegionButtonModifier)
          .commonStyleButton(this.componentKey, this._responseRegion)
      }
      if (this.targetView == 'Blank') {
        Blank()
          .backgroundColor(Color.Yellow)
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionBlankModifier)
      }
      if (this.targetView == 'Checkbox') {
        Checkbox()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionCheckboxModifier)
      }
      if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionCheckboxGroupModifier)
      }
      if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionDataPanelModifier)
      }
      if (this.targetView == 'DatePicker') {
        DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionDatePickerModifier)
      }
      if (this.targetView == 'Divider') {
        Divider()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionDividerModifier)
      }
      if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionGaugeModifier)
      }
      if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionImageModifier)
      }
      if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionImageAnimatorModifier)
      }
      if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionLoadingProgressModifier)
      }
      if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity.toInt(),
          fromStart: true,
          src: 'Running Marquee starts rolling'
        })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionMarqueeModifier)
      }
      if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionNavigationModifier)
      }
      if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
        .backgroundColor(Color.Yellow)
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionMenuModifier)
      }
      if (this.targetView == 'NavRouter') {
      }
      if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionProgressModifier)
      }
      if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionQRCodeModifier)
      }
      if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionRadioModifier)
      }
      if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionRatingModifier)
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
        .attributeModifier(this._responseRegionScrollBarModifier)
      }
      if (this.targetView == 'Search') {
        Search()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionSearchModifier)
      }
      if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionSelectModifier)
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
          .attributeModifier(this._responseRegionSliderModifier)
      }
      if (this.targetView == 'Text') {
        Text('text1')
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionTextModifier)
      }
      if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionTextAreaModifier)
      }
      if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionTextClockModifier)
      }
      if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionTextInputModifier)
      }
      if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionTextPickerModifier)
      }
      if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionTextTimerModifier)
      }
      if (this.targetView == 'TimePicker') {
        TimePicker({ selected: new Date('2022-07-22T08:00:00') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionTimePickerModifier)
      }
      if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionToggleModifier)
      }
      if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionWebModifier)
      }
      if (this.targetView == 'Circle') {
        Circle()
          .width(150)
          .height(200)
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionCircleModifier)
      }
      if (this.targetView == 'Ellipse') {
        Ellipse()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionEllipseModifier)
      }
      if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .backgroundColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionLineModifier)
      }
      if (this.targetView == 'Polyline') {
        Polyline()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionPolylineModifier)
      }
      if (this.targetView == 'Polygon') {
        Polygon()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionPolygonModifier)
      }
      if (this.targetView == 'Path') {
        Path()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionPathModifier)
      }
      if (this.targetView == 'Rect') {
        Rect()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionRectModifier)
      }
      if (this.targetView == 'Shape') {
        Shape() {
          Rect()
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionShapeModifier)
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
        .attributeModifier(this._responseRegionBadgeModifier)
      }
      if (this.targetView == 'Column') {
        Column() {
          Button('')
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionColumnModifier)
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
        .attributeModifier(this._responseRegionColumnSplitModifier)
      }
      if (this.targetView == 'Counter') {
        Counter() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionCounterModifier)
      }
      if (this.targetView == 'Flex') {
        Flex() {
          Text('1')
            .width('20%')
            .height(50)
            .backgroundColor(0xF5DEB3)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionFlexModifier)
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
        .attributeModifier(this._responseRegionGridRowModifier)
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
        .attributeModifier(this._responseRegionGridModifier)
      }
      if (this.targetView == 'List') {
        List() {
        }
        .height('100%')
        .width('100%')
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionListModifier)
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
          .attributeModifier(this._responseRegionListItemModifier)
        }
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._responseRegionListItemGroupModifier)
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
        .attributeModifier(this._responseRegionRefreshModifier)
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
        .attributeModifier(this._responseRegionRelativeContainerModifier)
      }
      if (this.targetView == 'Row') {
        Row()
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionRowModifier)
      }
      if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionRowSplitModifier)
      }
      if (this.targetView == 'Scroll') {
        Scroll() {
          Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: Int) => {
              Text('Scroll' + item.toString())
                .width('90%')
                .height(50)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            }, (item: int, index: Int) => item.toString())
          }
          .width('100%')
        }
        .scrollBar(BarState.On)
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionScrollModifier)
      }
      if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3], (item: int, index: Int) => {
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
        .attributeModifier(this._responseRegionSideBarContainerModifier)
      }
      if (this.targetView == 'Stack') {
        Stack() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionStackModifier)
      }
      if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3], (item: int, index: Int) => {
            Text('Swiper' + item)
              .width('90%')
              .height(50)
          }, (item: int, index: Int) => item.toString())
        }
        .indicator(true)
        .backgroundColor(Color.White)
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionSwiperModifier)
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
        .attributeModifier(this._responseRegionTabsModifier)
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
          .attributeModifier(this._responseRegionTabContentModifier)
        }
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'WaterFlow') {
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: Int) => {
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
          }, (item: int, index: Int) => item.toString())
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionWaterFlowModifier)
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
          .attributeModifier(this._responseRegionGridColModifier)
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
          .attributeModifier(this._responseRegionGridItemModifier)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'FlowItem') {
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: Int) => {
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
            .attributeModifier(this._responseRegionFlowItemModifier)
          }, (item: int, index: Int) => item.toString())
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
              .attributeModifier(this._responseRegionMenuItemModifier)
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
            .attributeModifier(this._responseRegionMenuItemGroupModifier)
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
          .attributeModifier(this._responseRegionCalendarPickerModifier)
      }
      if (this.targetView == 'Canvas') {
        Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
          .backgroundColor('#FFFF00')
          .commonStyle(this.componentKey)
          .attributeModifier(this._responseRegionCanvasModifier)
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
        .attributeModifier(this._responseRegionFormLinkModifier)
      }
      if (this.targetView == 'Hyperlink') {
        Hyperlink('https://example.com/', 'Go to the developer website') {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._responseRegionHyperlinkModifier)
      }
      if (this.targetView == 'Span') {
        Text() {
          Span('Span1')
            .commonStyle(this.componentKey)
            .attributeModifier(this._responseRegionSpanModifier)
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