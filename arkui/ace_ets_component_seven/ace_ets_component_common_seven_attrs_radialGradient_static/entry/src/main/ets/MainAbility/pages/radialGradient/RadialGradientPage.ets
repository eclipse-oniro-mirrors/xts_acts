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
  RadialGradientOptions,
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
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: CanvasAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: CircleAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: EllipseAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class LineModifier implements AttributeModifier<LineAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: LineAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class PathModifier implements AttributeModifier<PathAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: PathAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: PolygonAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RectModifier implements AttributeModifier<RectAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RectAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RowAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: SpanAttribute): void {

  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: StackAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: VideoAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: WebAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: WindowSceneAttribute): void {
    instance.radialGradient(this.mRadialGradient)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mRadialGradient: RadialGradientOptions = {
    center: [50, 50],
    radius: 60,
    repeating: true,
    colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
  }

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.radialGradient(this.mRadialGradient)
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
  this.key(componentKey)
  return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string,
  _radialGradient: RadialGradientOptions | undefined) {
  this.radialGradient(_radialGradient)
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
struct RadialGradientPage {
  @State _radialGradientAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _radialGradientBadgeModifier: BadgeModifier = new BadgeModifier()
  @State _radialGradientButtonModifier: ButtonModifier = new ButtonModifier()
  @State _radialGradientBlankModifier: BlankModifier = new BlankModifier()
  @State _radialGradientCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
  @State _radialGradientCanvasModifier: CanvasModifier = new CanvasModifier()
  @State _radialGradientCheckboxModifier: CheckboxModifier = new CheckboxModifier()
  @State _radialGradientCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _radialGradientCircleModifier: CircleModifier = new CircleModifier()
  @State _radialGradientColumnModifier: ColumnModifier = new ColumnModifier()
  @State _radialGradientColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
  @State _radialGradientCounterModifier: CounterModifier = new CounterModifier()
  @State _radialGradientDataPanelModifier: DataPanelModifier = new DataPanelModifier()
  @State _radialGradientDatePickerModifier: DatePickerModifier = new DatePickerModifier()
  @State _radialGradientDividerModifier: DividerModifier = new DividerModifier()
  @State _radialGradientEllipseModifier: EllipseModifier = new EllipseModifier()
  @State _radialGradientFlexModifier: FlexModifier = new FlexModifier()
  @State _radialGradientFlowItemModifier: FlowItemModifier = new FlowItemModifier()
  @State _radialGradientFormLinkModifier: FormLinkModifier = new FormLinkModifier()
  @State _radialGradientGaugeModifier: GaugeModifier = new GaugeModifier()
  @State _radialGradientGridModifier: GridModifier = new GridModifier()
  @State _radialGradientGridColModifier: GridColModifier = new GridColModifier()
  @State _radialGradientGridItemModifier: GridItemModifier = new GridItemModifier()
  @State _radialGradientGridRowModifier: GridRowModifier = new GridRowModifier()
  @State _radialGradientHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
  @State _radialGradientImageModifier: ImageModifier = new ImageModifier()
  @State _radialGradientImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _radialGradientLineModifier: LineModifier = new LineModifier()
  @State _radialGradientListModifier: ListModifier = new ListModifier()
  @State _radialGradientListItemModifier: ListItemModifier = new ListItemModifier()
  @State _radialGradientListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
  @State _radialGradientLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
  @State _radialGradientMarqueeModifier: MarqueeModifier = new MarqueeModifier()
  @State _radialGradientMenuModifier: MenuModifier = new MenuModifier()
  @State _radialGradientMenuItemModifier: MenuItemModifier = new MenuItemModifier()
  @State _radialGradientMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _radialGradientNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
  @State _radialGradientNavigationModifier: NavigationModifier = new NavigationModifier()
  @State _radialGradientPathModifier: PathModifier = new PathModifier()
  @State _radialGradientPolygonModifier: PolygonModifier = new PolygonModifier()
  @State _radialGradientPolylineModifier: PolylineModifier = new PolylineModifier()
  @State _radialGradientProgressModifier: ProgressModifier = new ProgressModifier()
  @State _radialGradientQRCodeModifier: QRCodeModifier = new QRCodeModifier()
  @State _radialGradientRadioModifier: RadioModifier = new RadioModifier()
  @State _radialGradientRatingModifier: RatingModifier = new RatingModifier()
  @State _radialGradientRectModifier: RectModifier = new RectModifier()
  @State _radialGradientRefreshModifier: RefreshModifier = new RefreshModifier()
  @State _radialGradientRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
  @State _radialGradientRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
  @State _radialGradientRichEditorModifier: RichEditorModifier = new RichEditorModifier()
  @State _radialGradientRichTextModifier: RichTextModifier = new RichTextModifier()
  @State _radialGradientRowModifier: RowModifier = new RowModifier()
  @State _radialGradientRowSplitModifier: RowSplitModifier = new RowSplitModifier()
  @State _radialGradientScrollModifier: ScrollModifier = new ScrollModifier()
  @State _radialGradientScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
  @State _radialGradientSearchModifier: SearchModifier = new SearchModifier()
  @State _radialGradientSelectModifier: SelectModifier = new SelectModifier()
  @State _radialGradientShapeModifier: ShapeModifier = new ShapeModifier()
  @State _radialGradientSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
  @State _radialGradientSliderModifier: SliderModifier = new SliderModifier()
  @State _radialGradientSpanModifier: SpanModifier = new SpanModifier()
  @State _radialGradientStackModifier: StackModifier = new StackModifier()
  @State _radialGradientSwiperModifier: SwiperModifier = new SwiperModifier()
  @State _radialGradientTabContentModifier: TabContentModifier = new TabContentModifier()
  @State _radialGradientTabsModifier: TabsModifier = new TabsModifier()
  @State _radialGradientTextModifier: TextModifier = new TextModifier()
  @State _radialGradientTextAreaModifier: TextAreaModifier = new TextAreaModifier()
  @State _radialGradientTextClockModifier: TextClockModifier = new TextClockModifier()
  @State _radialGradientTextInputModifier: TextInputModifier = new TextInputModifier()
  @State _radialGradientTextPickerModifier: TextPickerModifier = new TextPickerModifier()
  @State _radialGradientTextTimerModifier: TextTimerModifier = new TextTimerModifier()
  @State _radialGradientTimePickerModifier: TimePickerModifier = new TimePickerModifier()
  @State _radialGradientToggleModifier: ToggleModifier = new ToggleModifier()
  @State _radialGradientVideoModifier: VideoModifier = new VideoModifier()
  @State _radialGradientWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
  @State _radialGradientWebModifier: WebModifier = new WebModifier()
  @State _radialGradientWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
  @State _radialGradientXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @State parentBackGroundColor: string = '';
  @StoragePropRef('_radialGradient') _radialGradient: SetValue = {
    height: 0,
    radialGradient: {
      center: [0, 0],
      radius: 0,
      repeating: false,
      colors: [[0xff0000, 0.0]]
    }
  }

  onPageShow() {
    console.info('radialGradient translate page show called ')
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
          .attributeModifier(this._radialGradientAlphabetIndexerModifier)
      }
      if (this.targetView == 'Button') {
        Button('button1')
          .attributeModifier(this._radialGradientButtonModifier)
          .commonStyleButton(this.componentKey, this._radialGradient.radialGradient)
      }
      if (this.targetView == 'Blank') {
        Blank()
          .backgroundColor(Color.Yellow)
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientBlankModifier)
      }
      if (this.targetView == 'Checkbox') {
        Checkbox()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientCheckboxModifier)
      }
      if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientCheckboxGroupModifier)
      }
      if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientDataPanelModifier)
      }
      if (this.targetView == 'DatePicker') {
        DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientDatePickerModifier)
      }
      if (this.targetView == 'Divider') {
        Divider()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientDividerModifier)
      }
      if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientGaugeModifier)
      }
      if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientImageModifier)
      }
      if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientImageAnimatorModifier)
      }
      if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientLoadingProgressModifier)
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
          .attributeModifier(this._radialGradientMarqueeModifier)
      }
      if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientNavigationModifier)
      }
      if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
        .backgroundColor(Color.Yellow)
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientMenuModifier)
      }
      if (this.targetView == 'NavRouter') {
      }
      if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientProgressModifier)
      }
      if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientQRCodeModifier)
      }
      if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientRadioModifier)
      }
      if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientRatingModifier)
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
        .attributeModifier(this._radialGradientScrollBarModifier)
      }
      if (this.targetView == 'Search') {
        Search()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientSearchModifier)
      }
      if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }])
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientSelectModifier)
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
          .attributeModifier(this._radialGradientSliderModifier)
      }
      if (this.targetView == 'Text') {
        Text('text1')
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientTextModifier)
      }
      if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientTextAreaModifier)
      }
      if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientTextClockModifier)
      }
      if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientTextInputModifier)
      }
      if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientTextPickerModifier)
      }
      if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientTextTimerModifier)
      }
      if (this.targetView == 'TimePicker') {
        TimePicker({ selected: new Date('2022-07-22T08:00:00') })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientTimePickerModifier)
      }
      if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientToggleModifier)
      }
      if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientWebModifier)
      }
      if (this.targetView == 'Circle') {
        Circle()
          .width(150)
          .height(200)
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientCircleModifier)
      }
      if (this.targetView == 'Ellipse') {
        Ellipse()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientEllipseModifier)
      }
      if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .backgroundColor(Color.Black)
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientLineModifier)
      }
      if (this.targetView == 'Polyline') {
        Polyline()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientPolylineModifier)
      }
      if (this.targetView == 'Polygon') {
        Polygon()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientPolygonModifier)
      }
      if (this.targetView == 'Path') {
        Path()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientPathModifier)
      }
      if (this.targetView == 'Rect') {
        Rect()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientRectModifier)
      }
      if (this.targetView == 'Shape') {
        Shape() {
          Rect()
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientShapeModifier)
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
        .attributeModifier(this._radialGradientBadgeModifier)
      }
      if (this.targetView == 'Column') {
        Column() {
          Button('')
            .width(100)
            .height(50)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientColumnModifier)
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
        .attributeModifier(this._radialGradientColumnSplitModifier)
      }
      if (this.targetView == 'Counter') {
        Counter() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientCounterModifier)
      }
      if (this.targetView == 'Flex') {
        Flex() {
          Text('1')
            .width('20%')
            .height(50)
            .backgroundColor(0xF5DEB3)
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientFlexModifier)
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
        .attributeModifier(this._radialGradientGridRowModifier)
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
        .attributeModifier(this._radialGradientGridModifier)
      }
      if (this.targetView == 'List') {
        List() {
        }
        .height('100%')
        .width('100%')
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientListModifier)
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
          .attributeModifier(this._radialGradientListItemModifier)
        }
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._radialGradientListItemGroupModifier)
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
        .attributeModifier(this._radialGradientRefreshModifier)
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
        .attributeModifier(this._radialGradientRelativeContainerModifier)
      }
      if (this.targetView == 'Row') {
        Row()
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientRowModifier)
      }
      if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientRowSplitModifier)
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
        .attributeModifier(this._radialGradientScrollModifier)
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
        .attributeModifier(this._radialGradientSideBarContainerModifier)
      }
      if (this.targetView == 'Stack') {
        Stack() {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientStackModifier)
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
        .attributeModifier(this._radialGradientSwiperModifier)
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
        .attributeModifier(this._radialGradientTabsModifier)
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
          .attributeModifier(this._radialGradientTabContentModifier)
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
        .attributeModifier(this._radialGradientWaterFlowModifier)
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
          .attributeModifier(this._radialGradientGridColModifier)
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
          .attributeModifier(this._radialGradientGridItemModifier)
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
            .attributeModifier(this._radialGradientFlowItemModifier)
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
              .attributeModifier(this._radialGradientMenuItemModifier)
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
            .attributeModifier(this._radialGradientMenuItemGroupModifier)
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
          .attributeModifier(this._radialGradientCalendarPickerModifier)
      }
      if (this.targetView == 'Canvas') {
        Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
          .backgroundColor('#FFFF00')
          .commonStyle(this.componentKey)
          .attributeModifier(this._radialGradientCanvasModifier)
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
        .attributeModifier(this._radialGradientFormLinkModifier)
      }
      if (this.targetView == 'Hyperlink') {
        Hyperlink('https://example.com/', 'Go to the developer website') {
        }
        .commonStyle(this.componentKey)
        .attributeModifier(this._radialGradientHyperlinkModifier)
      }
      if (this.targetView == 'Span') {
        Text() {
          Span('Span1')
            .commonStyle(this.componentKey)
            .attributeModifier(this._radialGradientSpanModifier)
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