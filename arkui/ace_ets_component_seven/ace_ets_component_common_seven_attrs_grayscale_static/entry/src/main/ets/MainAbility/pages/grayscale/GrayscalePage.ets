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
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mGrayscale: number = 0.9
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`grayscale page show ${JSON.stringify(this.mGrayscale)}`)
     instance.grayscale(this.mGrayscale)
  }
}

@Entry
@Component
struct grayscalePage {
  @State _grayscale: number = 0.1
  @State _grayscaleAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _grayscaleBadgeMod: BadgeModifier = new BadgeModifier()
  @State _grayscaleBlankMod: BlankModifier = new BlankModifier()
  @State _grayscaleButttonMod: ButtonModifier = new ButtonModifier()
  @State _grayscaleCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _grayscaleCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _grayscaleCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _grayscaleColumnMod: ColumnModifier = new ColumnModifier()
  @State _grayscaleColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _grayscaleCounterMod: CounterModifier = new CounterModifier()
  @State _grayscaleDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _grayscaleDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _grayscaleDividerMod: DividerModifier = new DividerModifier()
  @State _grayscaleEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _grayscaleFlexMod: FlexModifier = new FlexModifier()
  @State _grayscaleFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _grayscaleFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _grayscaleFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _grayscaleGaugeMod: GaugeModifier = new GaugeModifier()
  @State _grayscaleGridMod: GridModifier = new GridModifier()
  @State _grayscaleGridColMod: GridColModifier = new GridColModifier()
  @State _grayscaleGridItemMod: GridItemModifier = new GridItemModifier()
  @State _grayscaleGridRowMod: GridRowModifier = new GridRowModifier()
  @State _grayscaleHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _grayscaleImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _grayscaleImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _grayscaleImageMod: ImageModifier = new ImageModifier()
  @State _grayscaleListMod: ListModifier = new ListModifier()
  @State _grayscaleListItemMod: ListItemModifier = new ListItemModifier()
  @State _grayscaleListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _grayscaleLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _grayscaleMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _grayscaleMenuMod: MenuModifier = new MenuModifier()
  @State _grayscaleMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _grayscaleMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _grayscaleNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _grayscaleNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _grayscalePatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _grayscalePluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _grayscaleQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _grayscaleRadioMod: RadioModifier = new RadioModifier()
  @State _grayscaleRatingMod: RatingModifier = new RatingModifier()
  @State _grayscaleRefreshMod: RefreshModifier = new RefreshModifier()
  @State _grayscaleRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _grayscaleRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _grayscaleRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _grayscaleRichTextMod: RichTextModifier = new RichTextModifier()
  @State _grayscaleRowMod: RowModifier = new RowModifier()
  @State _grayscaleRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _grayscaleScrollMod: ScrollModifier = new ScrollModifier()
  @State _grayscaleScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _grayscaleSearchMod: SearchModifier = new SearchModifier()
  @State _grayscaleSelectMod: SelectModifier = new SelectModifier()
  @State _grayscaleSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _grayscaleSliderMod: SliderModifier = new SliderModifier()
  @State _grayscaleStackMod: StackModifier = new StackModifier()
  @State _grayscaleSwiperMod: SwiperModifier = new SwiperModifier()
  @State _grayscaleTabContentMod: TabContentModifier = new TabContentModifier()
  @State _grayscaleTabsMod: TabsModifier = new TabsModifier()
  @State _grayscaleTextMod: TextModifier = new TextModifier()
  @State _grayscaleTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _grayscaleTextClockMod: TextClockModifier = new TextClockModifier()
  @State _grayscaleTextInputMod: TextInputModifier = new TextInputModifier()
  @State _grayscaleTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _grayscaleTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _grayscaleTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _grayscaleToggleMod: ToggleModifier = new ToggleModifier()
  @State _grayscaleUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _grayscaleWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _grayscaleWebMod: WebModifier = new WebModifier()
  @State _grayscaleXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0;
  @State parentHeight: double = 0;
  @State columns: int = 0
  @State gutter: int = 0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 grayscale page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._grayscaleButttonMod.mGrayscale = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.grayscale
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.grayscale))
      this._grayscaleAlphabetIndexerMod.mGrayscale = value.grayscale
      this._grayscaleBadgeMod.mGrayscale = value.grayscale
      this._grayscaleBlankMod.mGrayscale = value.grayscale
      this._grayscaleButttonMod.mGrayscale = value.grayscale
      this._grayscaleCalendarPickerMod.mGrayscale = value.grayscale
      this._grayscaleCheckboxMod.mGrayscale = value.grayscale
      this._grayscaleCheckboxGroupMod.mGrayscale = value.grayscale
      this._grayscaleColumnMod.mGrayscale = value.grayscale
      this._grayscaleColumnSplitMod.mGrayscale = value.grayscale
      this._grayscaleCounterMod.mGrayscale = value.grayscale
      this._grayscaleDataPanelMod.mGrayscale = value.grayscale
      this._grayscaleDatePickerMod.mGrayscale = value.grayscale
      this._grayscaleDividerMod.mGrayscale = value.grayscale
      this._grayscaleEffectComponentMod.mGrayscale = value.grayscale
      this._grayscaleFlexMod.mGrayscale = value.grayscale
      this._grayscaleFlowItemMod.mGrayscale = value.grayscale
      this._grayscaleFormComponentMod.mGrayscale = value.grayscale
      this._grayscaleFormLinkMod.mGrayscale = value.grayscale
      this._grayscaleGaugeMod.mGrayscale = value.grayscale
      this._grayscaleGridMod.mGrayscale = value.grayscale
      this._grayscaleGridColMod.mGrayscale = value.grayscale
      this._grayscaleGridItemMod.mGrayscale = value.grayscale
      this._grayscaleGridRowMod.mGrayscale = value.grayscale
      this._grayscaleHyperlinkMod.mGrayscale = value.grayscale
      this._grayscaleImageAnimatorMod.mGrayscale = value.grayscale
      this._grayscaleImageSpanMod.mGrayscale = value.grayscale
      this._grayscaleImageMod.mGrayscale = value.grayscale
      this._grayscaleListMod.mGrayscale = value.grayscale
      this._grayscaleListItemMod.mGrayscale = value.grayscale
      this._grayscaleListItemGroupMod.mGrayscale = value.grayscale
      this._grayscaleLoadingProgressMod.mGrayscale = value.grayscale
      this._grayscaleMarqueeMod.mGrayscale = value.grayscale
      this._grayscaleMenuMod.mGrayscale = value.grayscale
      this._grayscaleMenuItemMod.mGrayscale = value.grayscale
      this._grayscaleMenuItemGroupMod.mGrayscale = value.grayscale
      this._grayscaleNavDestinationMod.mGrayscale = value.grayscale
      
      this._grayscaleNavigationMod.mGrayscale = value.grayscale
      
      this._grayscalePatternLockMod.mGrayscale = value.grayscale
      this._grayscalePluginComponentMod.mGrayscale = value.grayscale
      this._grayscaleQRCodeMod.mGrayscale = value.grayscale
      this._grayscaleRadioMod.mGrayscale = value.grayscale
      this._grayscaleRatingMod.mGrayscale = value.grayscale
      this._grayscaleRefreshMod.mGrayscale = value.grayscale
      this._grayscaleRelativeContainerMod.mGrayscale = value.grayscale
      this._grayscaleRemoteWindowMod.mGrayscale = value.grayscale
      this._grayscaleRichEditorMod.mGrayscale = value.grayscale
      this._grayscaleRichTextMod.mGrayscale = value.grayscale
      this._grayscaleRowMod.mGrayscale = value.grayscale
      this._grayscaleRowSplitMod.mGrayscale = value.grayscale
      this._grayscaleScrollMod.mGrayscale = value.grayscale
      this._grayscaleScrollBarMod.mGrayscale = value.grayscale
      this._grayscaleSearchMod.mGrayscale = value.grayscale
      this._grayscaleSelectMod.mGrayscale = value.grayscale
      this._grayscaleSideBarContainerMod.mGrayscale = value.grayscale
      this._grayscaleSliderMod.mGrayscale = value.grayscale
      this._grayscaleStackMod.mGrayscale = value.grayscale
      this._grayscaleSwiperMod.mGrayscale = value.grayscale
      this._grayscaleTabContentMod.mGrayscale = value.grayscale
      this._grayscaleTabsMod.mGrayscale = value.grayscale
      this._grayscaleTextMod.mGrayscale = value.grayscale
      this._grayscaleTextAreaMod.mGrayscale = value.grayscale
      this._grayscaleTextClockMod.mGrayscale = value.grayscale
      this._grayscaleTextInputMod.mGrayscale = value.grayscale
      this._grayscaleTextPickerMod.mGrayscale = value.grayscale
      this._grayscaleTextTimerMod.mGrayscale = value.grayscale
      this._grayscaleTimePickerMod.mGrayscale = value.grayscale
      this._grayscaleToggleMod.mGrayscale = value.grayscale
      this._grayscaleUIExtensionComponentMod.mGrayscale = value.grayscale
      this._grayscaleWaterFlowMod.mGrayscale = value.grayscale
      this._grayscaleWebMod.mGrayscale = value.grayscale
      this._grayscaleXComponentMod.mGrayscale = value.grayscale
  
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').key(this.componentKey).attributeModifier(this._grayscaleButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._grayscaleTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._grayscaleAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._grayscaleBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._grayscaleCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._grayscaleCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._grayscaleDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._grayscaleDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._grayscaleDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._grayscaleGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._grayscaleImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._grayscaleImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._grayscaleLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._grayscaleMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._grayscaleMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._grayscaleQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._grayscaleRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._grayscaleRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._grayscaleScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._grayscaleSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._grayscaleSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._grayscaleSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          })
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._grayscaleTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._grayscaleTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._grayscaleTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._grayscaleToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._grayscaleWebMod)
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
          }.attributeModifier(this._grayscaleBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._grayscaleColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._grayscaleColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._grayscaleCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._grayscaleFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color: Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.attributeModifier(this._grayscaleGridRowMod)
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
          .attributeModifier(this._grayscaleGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._grayscaleListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._grayscaleListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._grayscaleListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._grayscaleRefreshMod)
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
          }.attributeModifier(this._grayscaleRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._grayscaleRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._grayscaleRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._grayscaleScrollMod)
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
          }.attributeModifier(this._grayscaleStackMod)
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
          }.attributeModifier(this._grayscaleTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._grayscaleTabContentMod)
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
          }.attributeModifier(this._grayscaleWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._grayscaleGridColMod)
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
              .attributeModifier(this._grayscaleFlowItemMod)
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
            .attributeModifier(this._grayscaleGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._grayscaleMenuItemMod)
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
              .attributeModifier(this._grayscaleMenuItemGroupMod)
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