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
  $$,
  $r,
  AlignRuleOption,
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
  PixelStretchEffectOptions,
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
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { RouterParams, SetValue } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`xyb: pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mPixelStretchEffect: PixelStretchEffectOptions = {
    top: 10,
    left: 10,
    right: 10,
    bottom: 10
  }

  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`pixelStretchEffect page show ${JSON.stringify(this.mPixelStretchEffect)}`)
    instance.pixelStretchEffect(this.mPixelStretchEffect)
  }
}

function commonStyleAlp(this: AlphabetIndexerAttribute, componentKey: string,
  _pixelStretchEffect: PixelStretchEffectOptions): AlphabetIndexerAttribute {
  this.pixelStretchEffect(_pixelStretchEffect)
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

function commonStyle(this: ButtonAttribute, componentKey: string) {
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
struct pixelStretchEffectPage {
  @StoragePropRef('_pixelStretchEffect') _pixelStretchEffect: PixelStretchEffectOptions = {
    top: -10,
    left: -10,
    right: 10,
    bottom: 10
  }
  @State _pixelStretchEffectAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _pixelStretchEffectBadgeMod: BadgeModifier = new BadgeModifier()
  @State _pixelStretchEffectBlankMod: BlankModifier = new BlankModifier()
  @State _pixelStretchEffectButttonMod: ButtonModifier = new ButtonModifier()
  @State _pixelStretchEffectCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _pixelStretchEffectCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _pixelStretchEffectCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _pixelStretchEffectColumnMod: ColumnModifier = new ColumnModifier()
  @State _pixelStretchEffectColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _pixelStretchEffectCounterMod: CounterModifier = new CounterModifier()
  @State _pixelStretchEffectDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _pixelStretchEffectDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _pixelStretchEffectDividerMod: DividerModifier = new DividerModifier()
  @State _pixelStretchEffectEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _pixelStretchEffectFlexMod: FlexModifier = new FlexModifier()
  @State _pixelStretchEffectFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _pixelStretchEffectFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _pixelStretchEffectFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _pixelStretchEffectGaugeMod: GaugeModifier = new GaugeModifier()
  @State _pixelStretchEffectGridMod: GridModifier = new GridModifier()
  @State _pixelStretchEffectGridColMod: GridColModifier = new GridColModifier()
  @State _pixelStretchEffectGridItemMod: GridItemModifier = new GridItemModifier()
  @State _pixelStretchEffectGridRowMod: GridRowModifier = new GridRowModifier()
  @State _pixelStretchEffectHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _pixelStretchEffectImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _pixelStretchEffectImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _pixelStretchEffectImageMod: ImageModifier = new ImageModifier()
  @State _pixelStretchEffectListMod: ListModifier = new ListModifier()
  @State _pixelStretchEffectListItemMod: ListItemModifier = new ListItemModifier()
  @State _pixelStretchEffectListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _pixelStretchEffectLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _pixelStretchEffectMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _pixelStretchEffectMenuMod: MenuModifier = new MenuModifier()
  @State _pixelStretchEffectMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _pixelStretchEffectMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _pixelStretchEffectNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _pixelStretchEffectNavigationMod: NavigationModifier = new NavigationModifier()
  @State _pixelStretchEffectPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _pixelStretchEffectPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _pixelStretchEffectQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _pixelStretchEffectRadioMod: RadioModifier = new RadioModifier()
  @State _pixelStretchEffectRatingMod: RatingModifier = new RatingModifier()
  @State _pixelStretchEffectRefreshMod: RefreshModifier = new RefreshModifier()
  @State _pixelStretchEffectRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _pixelStretchEffectRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _pixelStretchEffectRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _pixelStretchEffectRichTextMod: RichTextModifier = new RichTextModifier()
  @State _pixelStretchEffectRowMod: RowModifier = new RowModifier()
  @State _pixelStretchEffectRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _pixelStretchEffectScrollMod: ScrollModifier = new ScrollModifier()
  @State _pixelStretchEffectScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _pixelStretchEffectSearchMod: SearchModifier = new SearchModifier()
  @State _pixelStretchEffectSelectMod: SelectModifier = new SelectModifier()
  @State _pixelStretchEffectSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _pixelStretchEffectSliderMod: SliderModifier = new SliderModifier()
  @State _pixelStretchEffectStackMod: StackModifier = new StackModifier()
  @State _pixelStretchEffectSwiperMod: SwiperModifier = new SwiperModifier()
  @State _pixelStretchEffectTabContentMod: TabContentModifier = new TabContentModifier()
  @State _pixelStretchEffectTabsMod: TabsModifier = new TabsModifier()
  @State _pixelStretchEffectTextMod: TextModifier = new TextModifier()
  @State _pixelStretchEffectTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _pixelStretchEffectTextClockMod: TextClockModifier = new TextClockModifier()
  @State _pixelStretchEffectTextInputMod: TextInputModifier = new TextInputModifier()
  @State _pixelStretchEffectTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _pixelStretchEffectTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _pixelStretchEffectTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _pixelStretchEffectToggleMod: ToggleModifier = new ToggleModifier()
  @State _pixelStretchEffectUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _pixelStretchEffectWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _pixelStretchEffectWebMod: WebModifier = new WebModifier()
  @State _pixelStretchEffectXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: Int = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';

  onPageShow() {
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    AppStorage.setOrCreate<PixelStretchEffectOptions>('_pixelStretchEffect',
      routerParamOptions.view.testValue.setValue.pixelStretchEffect)
    console.info('xyb: pixelStretchEffect page show called ' +
    routerParamOptions.view.testValue.setValue.pixelStretchEffect.top)
    const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
      .getElement("view")
    this.targetView = viewElement.getString("targetView")
    this.componentKey = viewElement.getString("componentKey")
    this.parentWidth = viewElement.getDouble("parentWidth")
    this.parentHeight = viewElement.getDouble("parentHeight")
    this.columns = viewElement.getInteger("columns")
    this.gutter = viewElement.getDouble("gutter")
    this.parentComponentKey = viewElement.getString("parentComponentKey")
  }

  commonStyleAlp1(instance: CommonMethod) {
    instance.pixelStretchEffect(this._pixelStretchEffect)
    instance.height('100%')
    instance.key(this.componentKey)
  }

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .attributeModifier(this._pixelStretchEffectAlphabetIndexerMod)
            .applyStyles(this.commonStyleAlp1)
        } else if (this.targetView == 'Blank') {
          Blank()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._pixelStretchEffectBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._pixelStretchEffectCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }
          .backgroundColor(Color.Yellow)
          .commonStyle(this.componentKey)
          .attributeModifier(this._pixelStretchEffectMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
            .commonStyle(this.componentKey)
            .attributeModifier(this._pixelStretchEffectQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._pixelStretchEffectRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
            .commonStyle(this.componentKey)
            .attributeModifier(this._pixelStretchEffectRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
            .attributeModifier(this._pixelStretchEffectWebMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectGridRowMod)
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
          .attributeModifier(this._pixelStretchEffectGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }
          .commonStyle(this.componentKey)
          .height('100%')
          .width('100%')
          .attributeModifier(this._pixelStretchEffectListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectRefreshMod)
        } else if (this.targetView == 'RelativeContainer') {
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
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectFlowItemMod)
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
            .attributeModifier(this._pixelStretchEffectGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._pixelStretchEffectMenuItemGroupMod)
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