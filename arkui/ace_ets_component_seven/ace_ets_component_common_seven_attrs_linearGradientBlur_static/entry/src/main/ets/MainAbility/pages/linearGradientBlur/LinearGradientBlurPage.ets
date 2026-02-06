'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Row, Text, Color, Column, Scroller, CanvasRenderingContext2D, RenderingContextSettings,
  AlphabetIndexer, Button, Blank, Checkbox, CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator,
  LoadingProgress, Marquee, Navigation, Menu, $r, MenuItem, QRCode, Radio, Rating, ScrollBar, Select, MenuItemOptions,
  Slider, TextArea, TextClock, TextInput, TextPicker, TimePicker, Toggle, Web, Circle, Ellipse, Line, WebviewController,
  Polyline, Polygon, Path, Rect, Shape, Badge, ColumnSplit, Counter, Flex, GridRow, Grid, List, Refresh, ProgressType, FlowItem,
  RelativeContainer, RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, WaterFlow, CalendarPicker,
  FormLink, Hyperlink, Progress, BarState, Search, SliderStyle, TextTimer, ToggleType, TextAlign,
  GridRowDirection, ForEach, ListItem, ListItemGroup, VerticalAlign, HorizontalAlign, SideBarContainerType, FlexAlign,
  TabContent, GridCol, GridItem, MenuItemGroup, Canvas, Span, AttributeModifier, AlphabetIndexerAttribute, BadgeAttribute, ButtonAttribute,
  BlankAttribute, CalendarPickerAttribute, CanvasAttribute, CheckboxAttribute, CheckboxGroupAttribute, CircleAttribute,
  ColumnAttribute, ColumnSplitAttribute, CounterAttribute, DataPanelAttribute, DatePickerAttribute, DividerAttribute,
  EllipseAttribute, FlexAttribute, FlowItemAttribute, FormLinkAttribute, GaugeAttribute, GridAttribute, GridColAttribute,
  GridItemAttribute, GridRowAttribute, HyperlinkAttribute, ImageAttribute, ImageAnimatorAttribute, LineAttribute, ListAttribute,
  ListItemAttribute, ListItemGroupAttribute, LoadingProgressAttribute, MarqueeAttribute, MenuAttribute, MenuItemAttribute,
  MenuItemGroupAttribute, NavDestinationAttribute, NavigationAttribute, PathAttribute, PolygonAttribute, PolylineAttribute,
  ProgressAttribute, QRCodeAttribute, RadioAttribute, RatingAttribute, RectAttribute, RefreshAttribute, RelativeContainerAttribute,
  RemoteWindowAttribute, RichEditorAttribute, RichTextAttribute, RowAttribute, RowSplitAttribute, ScrollAttribute, ScrollBarAttribute,
  SearchAttribute, SelectAttribute, ShapeAttribute, SliderAttribute, SpanAttribute, StackAttribute,
  SwiperAttribute, SideBarContainerAttribute, ToggleAttribute, TabContentAttribute, TabsAttribute,
  TextAttribute, TextAreaAttribute, TextClockAttribute, TextInputAttribute, TextPickerAttribute, TextTimerAttribute,
  TimePickerAttribute, VideoAttribute, WaterFlowAttribute, WebAttribute, WindowSceneAttribute, XComponentAttribute,
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, EffectComponentAttribute, FormComponentAttribute,
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mLinearGradientBlur: number = 60
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`linearGradientBlur page show ${JSON.stringify(this.mLinearGradientBlur)}`)
    instance.linearGradientBlur(this.mLinearGradientBlur, undefined)
  }
}

@Entry
@Component
struct linearGradientBlurPage {
  @State _linearGradientBlur: number = 10
  @State _linearGradientBlurAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _linearGradientBlurBadgeMod: BadgeModifier = new BadgeModifier()
  @State _linearGradientBlurBlankMod: BlankModifier = new BlankModifier()
  @State _linearGradientBlurButttonMod: ButtonModifier = new ButtonModifier()
  @State _linearGradientBlurCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _linearGradientBlurCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _linearGradientBlurCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _linearGradientBlurColumnMod: ColumnModifier = new ColumnModifier()
  @State _linearGradientBlurColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _linearGradientBlurCounterMod: CounterModifier = new CounterModifier()
  @State _linearGradientBlurDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _linearGradientBlurDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _linearGradientBlurDividerMod: DividerModifier = new DividerModifier()
  @State _linearGradientBlurEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _linearGradientBlurFlexMod: FlexModifier = new FlexModifier()
  @State _linearGradientBlurFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _linearGradientBlurFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _linearGradientBlurFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _linearGradientBlurGaugeMod: GaugeModifier = new GaugeModifier()
  @State _linearGradientBlurGridMod: GridModifier = new GridModifier()
  @State _linearGradientBlurGridColMod: GridColModifier = new GridColModifier()
  @State _linearGradientBlurGridItemMod: GridItemModifier = new GridItemModifier()
  @State _linearGradientBlurGridRowMod: GridRowModifier = new GridRowModifier()
  @State _linearGradientBlurHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _linearGradientBlurImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _linearGradientBlurImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _linearGradientBlurImageMod: ImageModifier = new ImageModifier()
  @State _linearGradientBlurListMod: ListModifier = new ListModifier()
  @State _linearGradientBlurListItemMod: ListItemModifier = new ListItemModifier()
  @State _linearGradientBlurListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _linearGradientBlurLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _linearGradientBlurMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _linearGradientBlurMenuMod: MenuModifier = new MenuModifier()
  @State _linearGradientBlurMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _linearGradientBlurMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _linearGradientBlurNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _linearGradientBlurNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _linearGradientBlurPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _linearGradientBlurPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _linearGradientBlurQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _linearGradientBlurRadioMod: RadioModifier = new RadioModifier()
  @State _linearGradientBlurRatingMod: RatingModifier = new RatingModifier()
  @State _linearGradientBlurRefreshMod: RefreshModifier = new RefreshModifier()
  @State _linearGradientBlurRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _linearGradientBlurRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _linearGradientBlurRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _linearGradientBlurRichTextMod: RichTextModifier = new RichTextModifier()
  @State _linearGradientBlurRowMod: RowModifier = new RowModifier()
  @State _linearGradientBlurRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _linearGradientBlurScrollMod: ScrollModifier = new ScrollModifier()
  @State _linearGradientBlurScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _linearGradientBlurSearchMod: SearchModifier = new SearchModifier()
  @State _linearGradientBlurSelectMod: SelectModifier = new SelectModifier()
  @State _linearGradientBlurSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _linearGradientBlurSliderMod: SliderModifier = new SliderModifier()
  @State _linearGradientBlurStackMod: StackModifier = new StackModifier()
  @State _linearGradientBlurSwiperMod: SwiperModifier = new SwiperModifier()
  @State _linearGradientBlurTabContentMod: TabContentModifier = new TabContentModifier()
  @State _linearGradientBlurTabsMod: TabsModifier = new TabsModifier()
  @State _linearGradientBlurTextMod: TextModifier = new TextModifier()
  @State _linearGradientBlurTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _linearGradientBlurTextClockMod: TextClockModifier = new TextClockModifier()
  @State _linearGradientBlurTextInputMod: TextInputModifier = new TextInputModifier()
  @State _linearGradientBlurTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _linearGradientBlurTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _linearGradientBlurTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _linearGradientBlurToggleMod: ToggleModifier = new ToggleModifier()
  @State _linearGradientBlurUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _linearGradientBlurWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _linearGradientBlurWebMod: WebModifier = new WebModifier()
  @State _linearGradientBlurXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0;
  @State parentHeight: double = 0;
  @State columns: int = 0
  @State gutter: int =  0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 linearGradientBlur page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._linearGradientBlurButttonMod.mLinearGradientBlur = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.linearGradientBlur
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.linearGradientBlur))
      this._linearGradientBlurAlphabetIndexerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurBadgeMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurBlankMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurButttonMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurCalendarPickerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurCheckboxMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurCheckboxGroupMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurColumnMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurColumnSplitMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurCounterMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurDataPanelMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurDatePickerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurDividerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurEffectComponentMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurFlexMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurFlowItemMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurFormComponentMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurFormLinkMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurGaugeMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurGridMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurGridColMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurGridItemMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurGridRowMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurHyperlinkMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurImageAnimatorMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurImageSpanMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurImageMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurListMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurListItemMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurListItemGroupMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurLoadingProgressMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurMarqueeMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurMenuMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurMenuItemMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurMenuItemGroupMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurNavDestinationMod.mLinearGradientBlur = value.linearGradientBlur
      
      this._linearGradientBlurNavigationMod.mLinearGradientBlur = value.linearGradientBlur
      
      this._linearGradientBlurPatternLockMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurPluginComponentMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurQRCodeMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRadioMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRatingMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRefreshMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRelativeContainerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRemoteWindowMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRichEditorMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRichTextMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRowMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurRowSplitMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurScrollMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurScrollBarMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurSearchMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurSelectMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurSideBarContainerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurSliderMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurStackMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurSwiperMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTabContentMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTabsMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTextMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTextAreaMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTextClockMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTextInputMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTextPickerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTextTimerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurTimePickerMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurToggleMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurUIExtensionComponentMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurWaterFlowMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurWebMod.mLinearGradientBlur = value.linearGradientBlur
      this._linearGradientBlurXComponentMod.mLinearGradientBlur = value.linearGradientBlur
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter, /*margin: 0*/ }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').key(this.componentKey).attributeModifier(this._linearGradientBlurButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._linearGradientBlurTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._linearGradientBlurAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._linearGradientBlurBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._linearGradientBlurCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._linearGradientBlurCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._linearGradientBlurDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._linearGradientBlurDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._linearGradientBlurDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._linearGradientBlurGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._linearGradientBlurImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._linearGradientBlurImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._linearGradientBlurLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._linearGradientBlurMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._linearGradientBlurMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._linearGradientBlurQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._linearGradientBlurRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._linearGradientBlurRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._linearGradientBlurScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._linearGradientBlurSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._linearGradientBlurSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._linearGradientBlurSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._linearGradientBlurTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._linearGradientBlurTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._linearGradientBlurTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._linearGradientBlurTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._linearGradientBlurToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._linearGradientBlurWebMod)
        } else if (this.targetView == 'Circle') {
          Circle()
        } else if (this.targetView == 'Ellipse') {
          Ellipse()
        } else if (this.targetView == 'Line') {
          Line()
            
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline()
        } else if (this.targetView == 'Polygon') {
          Polygon()
        } else if (this.targetView == 'Path') {
          Path()
        } else if (this.targetView == 'Rect') {
          Rect()
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.attributeModifier(this._linearGradientBlurBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._linearGradientBlurColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._linearGradientBlurColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._linearGradientBlurCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._linearGradientBlurFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color:Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.attributeModifier(this._linearGradientBlurGridRowMod)
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
          .attributeModifier(this._linearGradientBlurGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._linearGradientBlurListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._linearGradientBlurListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._linearGradientBlurListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._linearGradientBlurRefreshMod)
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
          }.attributeModifier(this._linearGradientBlurRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._linearGradientBlurRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._linearGradientBlurRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._linearGradientBlurScrollMod)
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
          }
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.attributeModifier(this._linearGradientBlurStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.attributeModifier(this._linearGradientBlurTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._linearGradientBlurTabContentMod)
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
          }.attributeModifier(this._linearGradientBlurWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._linearGradientBlurGridColMod)
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
              .attributeModifier(this._linearGradientBlurFlowItemMod)
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
            .attributeModifier(this._linearGradientBlurGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._linearGradientBlurMenuItemMod)
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
              .attributeModifier(this._linearGradientBlurMenuItemGroupMod)
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