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
  RenderFit,
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
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mRenderFit: RenderFit = RenderFit.RIGHT

  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`renderFit page show ${JSON.stringify(this.mRenderFit)}`)
    instance.renderFit(this.mRenderFit)
  }
}

function commonStyleAlp(this: AlphabetIndexerAttribute, componentKey: string, _renderFit: RenderFit) {
  this.renderFit(_renderFit)
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
struct renderFitPage {
  @StoragePropRef('_renderFit') _renderFit: SetValue = {
    height: 0, renderFit: RenderFit.LEFT
  }
  @State _renderFitAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _renderFitBadgeMod: BadgeModifier = new BadgeModifier()
  @State _renderFitBlankMod: BlankModifier = new BlankModifier()
  @State _renderFitButttonMod: ButtonModifier = new ButtonModifier()
  @State _renderFitCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _renderFitCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _renderFitCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _renderFitColumnMod: ColumnModifier = new ColumnModifier()
  @State _renderFitColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _renderFitCounterMod: CounterModifier = new CounterModifier()
  @State _renderFitDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _renderFitDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _renderFitDividerMod: DividerModifier = new DividerModifier()
  @State _renderFitEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _renderFitFlexMod: FlexModifier = new FlexModifier()
  @State _renderFitFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _renderFitFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _renderFitFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _renderFitGaugeMod: GaugeModifier = new GaugeModifier()
  @State _renderFitGridMod: GridModifier = new GridModifier()
  @State _renderFitGridColMod: GridColModifier = new GridColModifier()
  @State _renderFitGridItemMod: GridItemModifier = new GridItemModifier()
  @State _renderFitGridRowMod: GridRowModifier = new GridRowModifier()
  @State _renderFitHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _renderFitImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _renderFitImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _renderFitImageMod: ImageModifier = new ImageModifier()
  @State _renderFitListMod: ListModifier = new ListModifier()
  @State _renderFitListItemMod: ListItemModifier = new ListItemModifier()
  @State _renderFitListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _renderFitLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _renderFitMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _renderFitMenuMod: MenuModifier = new MenuModifier()
  @State _renderFitMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _renderFitMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _renderFitNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _renderFitNavigationMod: NavigationModifier = new NavigationModifier()
  @State _renderFitPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _renderFitPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _renderFitQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _renderFitRadioMod: RadioModifier = new RadioModifier()
  @State _renderFitRatingMod: RatingModifier = new RatingModifier()
  @State _renderFitRefreshMod: RefreshModifier = new RefreshModifier()
  @State _renderFitRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _renderFitRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _renderFitRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _renderFitRichTextMod: RichTextModifier = new RichTextModifier()
  @State _renderFitRowMod: RowModifier = new RowModifier()
  @State _renderFitRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _renderFitScrollMod: ScrollModifier = new ScrollModifier()
  @State _renderFitScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _renderFitSearchMod: SearchModifier = new SearchModifier()
  @State _renderFitSelectMod: SelectModifier = new SelectModifier()
  @State _renderFitSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _renderFitSliderMod: SliderModifier = new SliderModifier()
  @State _renderFitStackMod: StackModifier = new StackModifier()
  @State _renderFitSwiperMod: SwiperModifier = new SwiperModifier()
  @State _renderFitTabContentMod: TabContentModifier = new TabContentModifier()
  @State _renderFitTabsMod: TabsModifier = new TabsModifier()
  @State _renderFitTextMod: TextModifier = new TextModifier()
  @State _renderFitTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _renderFitTextClockMod: TextClockModifier = new TextClockModifier()
  @State _renderFitTextInputMod: TextInputModifier = new TextInputModifier()
  @State _renderFitTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _renderFitTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _renderFitTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _renderFitToggleMod: ToggleModifier = new ToggleModifier()
  @State _renderFitUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _renderFitWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _renderFitWebMod: WebModifier = new WebModifier()
  @State _renderFitXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: Int = 0;
  @State gutter: number = 0;
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 renderFit page show called ')
    const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
      .getElement("view")
    this.targetView = viewElement.getString("targetView")
    this.componentKey = viewElement.getString("componentKey")
    this.parentWidth = viewElement.getDouble("parentWidth")
    this.parentHeight = viewElement.getDouble("parentHeight")
    this.columns = viewElement.getDouble("columns") as Int
    this.gutter = viewElement.getDouble("gutter")
    this.parentComponentKey = viewElement.getString("parentComponentKey")
  }

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle(this.componentKey).attributeModifier(this._renderFitButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._renderFitTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .attributeModifier(this._renderFitAlphabetIndexerMod)
            .commonStyleAlp(this.componentKey, this._renderFit.renderFit)
        } else if (this.targetView == 'Blank') {
          Blank()
            .backgroundColor(Color.Yellow)
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderFitBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._renderFitCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderFitCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .commonStyle(this.componentKey).attributeModifier(this._renderFitDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._renderFitDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._renderFitDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._renderFitGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._renderFitImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._renderFitImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._renderFitLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._renderFitMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._renderFitMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderFitQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderFitRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
            .commonStyle(this.componentKey)
            .attributeModifier(this._renderFitRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._renderFitSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._renderFitSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._renderFitSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._renderFitTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._renderFitTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle(this.componentKey)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._renderFitTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._renderFitTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .commonStyle(this.componentKey).attributeModifier(this._renderFitToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).commonStyle(this.componentKey)
            .attributeModifier(this._renderFitWebMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitGridRowMod)
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
          .attributeModifier(this._renderFitGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._renderFitListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._renderFitListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._renderFitListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitRefreshMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._renderFitRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._renderFitScrollMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._renderFitSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._renderFitTabContentMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._renderFitWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._renderFitGridColMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._renderFitFlowItemMod)
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
            .attributeModifier(this._renderFitGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._renderFitMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._renderFitMenuItemGroupMod)
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