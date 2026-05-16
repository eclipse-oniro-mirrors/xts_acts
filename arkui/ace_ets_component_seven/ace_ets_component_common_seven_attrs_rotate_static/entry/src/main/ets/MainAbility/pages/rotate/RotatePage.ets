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
  RotateOptions,
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
} from '@ohos.arkui.component'
import { State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { RouterParams, SetValue } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: CanvasAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: CircleAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: EllipseAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class LineModifier implements AttributeModifier<LineAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: LineAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class PathModifier implements AttributeModifier<PathAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: PathAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: PolygonAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RectModifier implements AttributeModifier<RectAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RectAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RowAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: SpanAttribute): void {

  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: StackAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: VideoAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: WebAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: WindowSceneAttribute): void {
    instance.rotate(this.mRotate)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mRotate: RotateOptions = {
    x: 13,
    y: 17,
    z: 31,
    centerX: 37,
    centerY: 41,
    angle: 3,
    perspective: 11
  }

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.rotate(this.mRotate)
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

function commonStyleButton(this: ButtonAttribute, componentKey: string, _rotate: RotateOptions | undefined) {
  this.rotate(_rotate)
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
struct RotatePage {
  @State _rotateAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _rotateBadgeModifier: BadgeModifier = new BadgeModifier()
  @State _rotateButtonModifier: ButtonModifier = new ButtonModifier()
  @State _rotateBlankModifier: BlankModifier = new BlankModifier()
  @State _rotateCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
  @State _rotateCanvasModifier: CanvasModifier = new CanvasModifier()
  @State _rotateCheckboxModifier: CheckboxModifier = new CheckboxModifier()
  @State _rotateCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _rotateCircleModifier: CircleModifier = new CircleModifier()
  @State _rotateColumnModifier: ColumnModifier = new ColumnModifier()
  @State _rotateColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
  @State _rotateCounterModifier: CounterModifier = new CounterModifier()
  @State _rotateDataPanelModifier: DataPanelModifier = new DataPanelModifier()
  @State _rotateDatePickerModifier: DatePickerModifier = new DatePickerModifier()
  @State _rotateDividerModifier: DividerModifier = new DividerModifier()
  @State _rotateEllipseModifier: EllipseModifier = new EllipseModifier()
  @State _rotateFlexModifier: FlexModifier = new FlexModifier()
  @State _rotateFlowItemModifier: FlowItemModifier = new FlowItemModifier()
  @State _rotateFormLinkModifier: FormLinkModifier = new FormLinkModifier()
  @State _rotateGaugeModifier: GaugeModifier = new GaugeModifier()
  @State _rotateGridModifier: GridModifier = new GridModifier()
  @State _rotateGridColModifier: GridColModifier = new GridColModifier()
  @State _rotateGridItemModifier: GridItemModifier = new GridItemModifier()
  @State _rotateGridRowModifier: GridRowModifier = new GridRowModifier()
  @State _rotateHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
  @State _rotateImageModifier: ImageModifier = new ImageModifier()
  @State _rotateImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _rotateLineModifier: LineModifier = new LineModifier()
  @State _rotateListModifier: ListModifier = new ListModifier()
  @State _rotateListItemModifier: ListItemModifier = new ListItemModifier()
  @State _rotateListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
  @State _rotateLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
  @State _rotateMarqueeModifier: MarqueeModifier = new MarqueeModifier()
  @State _rotateMenuModifier: MenuModifier = new MenuModifier()
  @State _rotateMenuItemModifier: MenuItemModifier = new MenuItemModifier()
  @State _rotateMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _rotateNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
  @State _rotateNavigationModifier: NavigationModifier = new NavigationModifier()
  @State _rotatePathModifier: PathModifier = new PathModifier()
  @State _rotatePolygonModifier: PolygonModifier = new PolygonModifier()
  @State _rotatePolylineModifier: PolylineModifier = new PolylineModifier()
  @State _rotateProgressModifier: ProgressModifier = new ProgressModifier()
  @State _rotateQRCodeModifier: QRCodeModifier = new QRCodeModifier()
  @State _rotateRadioModifier: RadioModifier = new RadioModifier()
  @State _rotateRatingModifier: RatingModifier = new RatingModifier()
  @State _rotateRectModifier: RectModifier = new RectModifier()
  @State _rotateRefreshModifier: RefreshModifier = new RefreshModifier()
  @State _rotateRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
  @State _rotateRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
  @State _rotateRichEditorModifier: RichEditorModifier = new RichEditorModifier()
  @State _rotateRichTextModifier: RichTextModifier = new RichTextModifier()
  @State _rotateRowModifier: RowModifier = new RowModifier()
  @State _rotateRowSplitModifier: RowSplitModifier = new RowSplitModifier()
  @State _rotateScrollModifier: ScrollModifier = new ScrollModifier()
  @State _rotateScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
  @State _rotateSearchModifier: SearchModifier = new SearchModifier()
  @State _rotateSelectModifier: SelectModifier = new SelectModifier()
  @State _rotateShapeModifier: ShapeModifier = new ShapeModifier()
  @State _rotateSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
  @State _rotateSliderModifier: SliderModifier = new SliderModifier()
  @State _rotateSpanModifier: SpanModifier = new SpanModifier()
  @State _rotateStackModifier: StackModifier = new StackModifier()
  @State _rotateSwiperModifier: SwiperModifier = new SwiperModifier()
  @State _rotateTabContentModifier: TabContentModifier = new TabContentModifier()
  @State _rotateTabsModifier: TabsModifier = new TabsModifier()
  @State _rotateTextModifier: TextModifier = new TextModifier()
  @State _rotateTextAreaModifier: TextAreaModifier = new TextAreaModifier()
  @State _rotateTextClockModifier: TextClockModifier = new TextClockModifier()
  @State _rotateTextInputModifier: TextInputModifier = new TextInputModifier()
  @State _rotateTextPickerModifier: TextPickerModifier = new TextPickerModifier()
  @State _rotateTextTimerModifier: TextTimerModifier = new TextTimerModifier()
  @State _rotateTimePickerModifier: TimePickerModifier = new TimePickerModifier()
  @State _rotateToggleModifier: ToggleModifier = new ToggleModifier()
  @State _rotateVideoModifier: VideoModifier = new VideoModifier()
  @State _rotateWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
  @State _rotateWebModifier: WebModifier = new WebModifier()
  @State _rotateWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
  @State _rotateXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @State parentBackGroundColor: string = '';
  @StoragePropRef('_rotate') _rotate: SetValue = {
    height: 0, rotate: {
      x: 0,
      y: 0,
      z: 0,
      centerX: '',
      centerY: '',
      angle: 0,
      perspective: 0
    }
  }

  onPageShow() {
    console.info('rotate translate page show called ')
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
          .attributeModifier(this._rotateAlphabetIndexerModifier)
      }
      if (this.targetView == 'Button') {
        Button('button1')
          .attributeModifier(this._rotateButtonModifier)
          .commonStyleButton(this.componentKey, this._rotate.rotate)
      }
      if (this.targetView == 'Blank') {
        Blank()
          .backgroundColor(Color.Yellow)
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateBlankModifier)
      }
      if (this.targetView == 'Checkbox') {
        Checkbox()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateCheckboxModifier)
      }
      if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateCheckboxGroupModifier)
      }
      if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateDataPanelModifier)
      }
      if (this.targetView == 'DatePicker') {
        DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateDatePickerModifier)
      }
      if (this.targetView == 'Divider') {
        Divider()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateDividerModifier)
      }
      if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateGaugeModifier)
      }
      if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateImageModifier)
      }
      if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateImageAnimatorModifier)
      }
      if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateLoadingProgressModifier)
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
          .attributeModifier(this._rotateMarqueeModifier)
      }
      if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
        }
        .commonStyle(this.componentKey)

     
      }
      if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
        .backgroundColor(Color.Yellow)
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateMenuModifier)
      }
      if (this.targetView == 'NavRouter') {
      }
      if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateProgressModifier)
      }
      if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateQRCodeModifier)
      }
      if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateRadioModifier)
      }
      if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateRatingModifier)
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
        .attributeModifier(this._rotateScrollBarModifier)
      }
      if (this.targetView == 'Search') {
        Search()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateSearchModifier)
      }
      if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateSelectModifier)
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
          .attributeModifier(this._rotateSliderModifier)
      }
      if (this.targetView == 'Text') {
        Text('text1')
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateTextModifier)
      }
      if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateTextAreaModifier)
      }
      if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateTextClockModifier)
      }
      if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateTextInputModifier)
      }
      if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateTextPickerModifier)
      }
      if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateTextTimerModifier)
      }
      if (this.targetView == 'TimePicker') {
        TimePicker({ selected: new Date('2022-07-22T08:00:00') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateTimePickerModifier)
      }
      if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateToggleModifier)
      }
      if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateWebModifier)
      }
      if (this.targetView == 'Circle') {
        Circle()
          .width(150)
          .height(200)
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateCircleModifier)
      }
      if (this.targetView == 'Ellipse') {
        Ellipse()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateEllipseModifier)
      }
      if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .backgroundColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateLineModifier)
      }
      if (this.targetView == 'Polyline') {
        Polyline()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotatePolylineModifier)
      }
      if (this.targetView == 'Polygon') {
        Polygon()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotatePolygonModifier)
      }
      if (this.targetView == 'Path') {
        Path()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotatePathModifier)
      }
      if (this.targetView == 'Rect') {
        Rect()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateRectModifier)
      }
      if (this.targetView == 'Shape') {
        Shape() {
          Rect()
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateShapeModifier)
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
        .attributeModifier(this._rotateBadgeModifier)
      }
      if (this.targetView == 'Column') {
        Column() {
          Button('')
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateColumnModifier)
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
        .attributeModifier(this._rotateColumnSplitModifier)
      }
      if (this.targetView == 'Counter') {
        Counter() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateCounterModifier)
      }
      if (this.targetView == 'Flex') {
        Flex() {
          Text('1')
            .width('20%')
            .height(50)
            .backgroundColor(0xF5DEB3)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateFlexModifier)
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
        .attributeModifier(this._rotateGridRowModifier)
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
        .attributeModifier(this._rotateGridModifier)
      }
      if (this.targetView == 'List') {
        List() {
        }
        .height('100%')
        .width('100%')
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateListModifier)
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
          .attributeModifier(this._rotateListItemModifier)
        }
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._rotateListItemGroupModifier)
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
        .attributeModifier(this._rotateRefreshModifier)
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
        .attributeModifier(this._rotateRelativeContainerModifier)
      }
      if (this.targetView == 'Row') {
        Row()
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateRowModifier)
      }
      if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateRowSplitModifier)
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
        .attributeModifier(this._rotateScrollModifier)
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

        // .attributeModifier(this._rotateSideBarContainerModifier)
      }
      if (this.targetView == 'Stack') {
        Stack() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateStackModifier)
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

        // .attributeModifier(this._rotateSwiperModifier)
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
        .attributeModifier(this._rotateTabsModifier)
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
          .attributeModifier(this._rotateTabContentModifier)
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
        .attributeModifier(this._rotateWaterFlowModifier)
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
          .attributeModifier(this._rotateGridColModifier)
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
          .attributeModifier(this._rotateGridItemModifier)
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
            .attributeModifier(this._rotateFlowItemModifier)
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
              .attributeModifier(this._rotateMenuItemModifier)
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
            .attributeModifier(this._rotateMenuItemGroupModifier)
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
          .attributeModifier(this._rotateCalendarPickerModifier)
      }
      if (this.targetView == 'Canvas') {
        Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
          .backgroundColor('#FFFF00')
          .commonStyle(this.componentKey)
          .attributeModifier(this._rotateCanvasModifier)
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
        .attributeModifier(this._rotateFormLinkModifier)
      }
      if (this.targetView == 'Hyperlink') {
        Hyperlink('https://example.com/', 'Go to the developer website') {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._rotateHyperlinkModifier)
      }
      if (this.targetView == 'Span') {
        Text() {
          Span('Span1')
            .commonStyle(this.componentKey)
            .attributeModifier(this._rotateSpanModifier)
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