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
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mSphericalEffect: number = 1

  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`sphericalEffect page show ${JSON.stringify(this.mSphericalEffect)}`)
    instance.sphericalEffect(this.mSphericalEffect)
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

function commonStyleButton(this: ButtonAttribute, componentKey: string, _sphericalEffect: number | undefined) {
  this.sphericalEffect(_sphericalEffect)
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
struct sphericalEffectPage {
  @State _sphericalEffectAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _sphericalEffectBadgeMod: BadgeModifier = new BadgeModifier()
  @State _sphericalEffectBlankMod: BlankModifier = new BlankModifier()
  @State _sphericalEffectButttonMod: ButtonModifier = new ButtonModifier()
  @State _sphericalEffectCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _sphericalEffectCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _sphericalEffectCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _sphericalEffectColumnMod: ColumnModifier = new ColumnModifier()
  @State _sphericalEffectColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _sphericalEffectCounterMod: CounterModifier = new CounterModifier()
  @State _sphericalEffectDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _sphericalEffectDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _sphericalEffectDividerMod: DividerModifier = new DividerModifier()
  @State _sphericalEffectEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _sphericalEffectFlexMod: FlexModifier = new FlexModifier()
  @State _sphericalEffectFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _sphericalEffectFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _sphericalEffectFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _sphericalEffectGaugeMod: GaugeModifier = new GaugeModifier()
  @State _sphericalEffectGridMod: GridModifier = new GridModifier()
  @State _sphericalEffectGridColMod: GridColModifier = new GridColModifier()
  @State _sphericalEffectGridItemMod: GridItemModifier = new GridItemModifier()
  @State _sphericalEffectGridRowMod: GridRowModifier = new GridRowModifier()
  @State _sphericalEffectHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _sphericalEffectImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _sphericalEffectImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _sphericalEffectImageMod: ImageModifier = new ImageModifier()
  @State _sphericalEffectListMod: ListModifier = new ListModifier()
  @State _sphericalEffectListItemMod: ListItemModifier = new ListItemModifier()
  @State _sphericalEffectListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _sphericalEffectLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _sphericalEffectMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _sphericalEffectMenuMod: MenuModifier = new MenuModifier()
  @State _sphericalEffectMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _sphericalEffectMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _sphericalEffectNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _sphericalEffectNavigationMod: NavigationModifier = new NavigationModifier()
  @State _sphericalEffectPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _sphericalEffectPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _sphericalEffectQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _sphericalEffectRadioMod: RadioModifier = new RadioModifier()
  @State _sphericalEffectRatingMod: RatingModifier = new RatingModifier()
  @State _sphericalEffectRefreshMod: RefreshModifier = new RefreshModifier()
  @State _sphericalEffectRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _sphericalEffectRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _sphericalEffectRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _sphericalEffectRichTextMod: RichTextModifier = new RichTextModifier()
  @State _sphericalEffectRowMod: RowModifier = new RowModifier()
  @State _sphericalEffectRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _sphericalEffectScrollMod: ScrollModifier = new ScrollModifier()
  @State _sphericalEffectScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _sphericalEffectSearchMod: SearchModifier = new SearchModifier()
  @State _sphericalEffectSelectMod: SelectModifier = new SelectModifier()
  @State _sphericalEffectSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _sphericalEffectSliderMod: SliderModifier = new SliderModifier()
  @State _sphericalEffectStackMod: StackModifier = new StackModifier()
  @State _sphericalEffectSwiperMod: SwiperModifier = new SwiperModifier()
  @State _sphericalEffectTabContentMod: TabContentModifier = new TabContentModifier()
  @State _sphericalEffectTabsMod: TabsModifier = new TabsModifier()
  @State _sphericalEffectTextMod: TextModifier = new TextModifier()
  @State _sphericalEffectTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _sphericalEffectTextClockMod: TextClockModifier = new TextClockModifier()
  @State _sphericalEffectTextInputMod: TextInputModifier = new TextInputModifier()
  @State _sphericalEffectTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _sphericalEffectTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _sphericalEffectTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _sphericalEffectToggleMod: ToggleModifier = new ToggleModifier()
  @State _sphericalEffectUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _sphericalEffectWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _sphericalEffectWebMod: WebModifier = new WebModifier()
  @State _sphericalEffectXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';
  @StoragePropRef('_sphericalEffect') _sphericalEffect: SetValue = {
    height: 0, sphericalEffect: 0.0
  }

  onPageShow() {
    console.info('22222 sphericalEffect page show called ')
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
            .attributeModifier(this._sphericalEffectButttonMod)
            .commonStyleButton(this.componentKey, this._sphericalEffect.sphericalEffect)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._sphericalEffectTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._sphericalEffectBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._sphericalEffectCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._sphericalEffectCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._sphericalEffectDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._sphericalEffectLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
            .commonStyle(this.componentKey)
            .attributeModifier(this._sphericalEffectQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._sphericalEffectRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
            .commonStyle(this.componentKey)
            .attributeModifier(this._sphericalEffectRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._sphericalEffectSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
            .attributeModifier(this._sphericalEffectWebMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectGridRowMod)
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
          .attributeModifier(this._sphericalEffectGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._sphericalEffectListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectRefreshMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._sphericalEffectRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._sphericalEffectScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._sphericalEffectTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._sphericalEffectWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectFlowItemMod)
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
            .attributeModifier(this._sphericalEffectGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._sphericalEffectMenuItemGroupMod)
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