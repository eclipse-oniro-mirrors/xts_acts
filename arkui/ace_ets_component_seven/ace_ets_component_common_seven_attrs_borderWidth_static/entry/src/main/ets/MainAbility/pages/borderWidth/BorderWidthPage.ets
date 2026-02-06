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
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, RenderFit, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';


class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mBorderWidth: number | string = 10
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`borderWidth page show ${JSON.stringify(this.mBorderWidth)}`)
    instance.borderWidth(this.mBorderWidth)
  }
}

@Entry
@Component
struct borderWidthPage {
  @State _borderWidth: number | string = 5.0
  @State _borderWidthAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _borderWidthBadgeMod: BadgeModifier = new BadgeModifier()
  @State _borderWidthBlankMod: BlankModifier = new BlankModifier()
  @State _borderWidthButtonMod: ButtonModifier = new ButtonModifier()
  @State _borderWidthCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _borderWidthCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _borderWidthCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _borderWidthColumnMod: ColumnModifier = new ColumnModifier()
  @State _borderWidthColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _borderWidthCounterMod: CounterModifier = new CounterModifier()
  @State _borderWidthDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _borderWidthDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _borderWidthDividerMod: DividerModifier = new DividerModifier()
  @State _borderWidthEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _borderWidthFlexMod: FlexModifier = new FlexModifier()
  @State _borderWidthFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _borderWidthFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _borderWidthFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _borderWidthGaugeMod: GaugeModifier = new GaugeModifier()
  @State _borderWidthGridMod: GridModifier = new GridModifier()
  @State _borderWidthGridColMod: GridColModifier = new GridColModifier()
  @State _borderWidthGridItemMod: GridItemModifier = new GridItemModifier()
  @State _borderWidthGridRowMod: GridRowModifier = new GridRowModifier()
  @State _borderWidthHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _borderWidthImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _borderWidthImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _borderWidthImageMod: ImageModifier = new ImageModifier()
  @State _borderWidthListMod: ListModifier = new ListModifier()
  @State _borderWidthListItemMod: ListItemModifier = new ListItemModifier()
  @State _borderWidthListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _borderWidthLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _borderWidthMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _borderWidthMenuMod: MenuModifier = new MenuModifier()
  @State _borderWidthMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _borderWidthMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _borderWidthNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()

  @State _borderWidthNavigationMod: NavigationModifier = new NavigationModifier()

  @State _borderWidthPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _borderWidthPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _borderWidthQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _borderWidthRadioMod: RadioModifier = new RadioModifier()
  @State _borderWidthRatingMod: RatingModifier = new RatingModifier()
  @State _borderWidthRefreshMod: RefreshModifier = new RefreshModifier()
  @State _borderWidthRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _borderWidthRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _borderWidthRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _borderWidthRichTextMod: RichTextModifier = new RichTextModifier()
  @State _borderWidthRowMod: RowModifier = new RowModifier()
  @State _borderWidthRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _borderWidthScrollMod: ScrollModifier = new ScrollModifier()
  @State _borderWidthScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _borderWidthSearchMod: SearchModifier = new SearchModifier()
  @State _borderWidthSelectMod: SelectModifier = new SelectModifier()
  @State _borderWidthSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _borderWidthSliderMod: SliderModifier = new SliderModifier()
  @State _borderWidthStackMod: StackModifier = new StackModifier()
  @State _borderWidthSwiperMod: SwiperModifier = new SwiperModifier()
  @State _borderWidthTabContentMod: TabContentModifier = new TabContentModifier()
  @State _borderWidthTabsMod: TabsModifier = new TabsModifier()
  @State _borderWidthTextMod: TextModifier = new TextModifier()
  @State _borderWidthTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _borderWidthTextClockMod: TextClockModifier = new TextClockModifier()
  @State _borderWidthTextInputMod: TextInputModifier = new TextInputModifier()
  @State _borderWidthTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _borderWidthTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _borderWidthTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _borderWidthToggleMod: ToggleModifier = new ToggleModifier()
  @State _borderWidthUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _borderWidthWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _borderWidthWebMod: WebModifier = new WebModifier()
  @State _borderWidthXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State columns: int =  0
  @State gutter: int =  0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('borderWidth page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as  string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._borderWidthButtonMod.mBorderWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.borderWidth
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('[registerDataChange] ' + JSON.stringify(value.borderWidth))
      this._borderWidthAlphabetIndexerMod.mBorderWidth = value.borderWidth
      this._borderWidthBadgeMod.mBorderWidth = value.borderWidth
      this._borderWidthBlankMod.mBorderWidth = value.borderWidth
      this._borderWidthButtonMod.mBorderWidth = value.borderWidth
      this._borderWidthCalendarPickerMod.mBorderWidth = value.borderWidth
      this._borderWidthCheckboxMod.mBorderWidth = value.borderWidth
      this._borderWidthCheckboxGroupMod.mBorderWidth = value.borderWidth
      this._borderWidthColumnMod.mBorderWidth = value.borderWidth
      this._borderWidthColumnSplitMod.mBorderWidth = value.borderWidth
      this._borderWidthCounterMod.mBorderWidth = value.borderWidth
      this._borderWidthDataPanelMod.mBorderWidth = value.borderWidth
      this._borderWidthDatePickerMod.mBorderWidth = value.borderWidth
      this._borderWidthDividerMod.mBorderWidth = value.borderWidth
      this._borderWidthEffectComponentMod.mBorderWidth = value.borderWidth
      this._borderWidthFlexMod.mBorderWidth = value.borderWidth
      this._borderWidthFlowItemMod.mBorderWidth = value.borderWidth
      this._borderWidthFormComponentMod.mBorderWidth = value.borderWidth
      this._borderWidthFormLinkMod.mBorderWidth = value.borderWidth
      this._borderWidthGaugeMod.mBorderWidth = value.borderWidth
      this._borderWidthGridMod.mBorderWidth = value.borderWidth
      this._borderWidthGridColMod.mBorderWidth = value.borderWidth
      this._borderWidthGridItemMod.mBorderWidth = value.borderWidth
      this._borderWidthGridRowMod.mBorderWidth = value.borderWidth
      this._borderWidthHyperlinkMod.mBorderWidth = value.borderWidth
      this._borderWidthImageAnimatorMod.mBorderWidth = value.borderWidth
      this._borderWidthImageSpanMod.mBorderWidth = value.borderWidth
      this._borderWidthImageMod.mBorderWidth = value.borderWidth
      this._borderWidthListMod.mBorderWidth = value.borderWidth
      this._borderWidthListItemMod.mBorderWidth = value.borderWidth
      this._borderWidthListItemGroupMod.mBorderWidth = value.borderWidth
      this._borderWidthLoadingProgressMod.mBorderWidth = value.borderWidth
      this._borderWidthMarqueeMod.mBorderWidth = value.borderWidth
      this._borderWidthMenuMod.mBorderWidth = value.borderWidth
      this._borderWidthMenuItemMod.mBorderWidth = value.borderWidth
      this._borderWidthMenuItemGroupMod.mBorderWidth = value.borderWidth
      this._borderWidthNavDestinationMod.mBorderWidth = value.borderWidth

      this._borderWidthNavigationMod.mBorderWidth = value.borderWidth

      this._borderWidthPatternLockMod.mBorderWidth = value.borderWidth
      this._borderWidthPluginComponentMod.mBorderWidth = value.borderWidth
      this._borderWidthQRCodeMod.mBorderWidth = value.borderWidth
      this._borderWidthRadioMod.mBorderWidth = value.borderWidth
      this._borderWidthRatingMod.mBorderWidth = value.borderWidth
      this._borderWidthRefreshMod.mBorderWidth = value.borderWidth
      this._borderWidthRelativeContainerMod.mBorderWidth = value.borderWidth
      this._borderWidthRemoteWindowMod.mBorderWidth = value.borderWidth
      this._borderWidthRichEditorMod.mBorderWidth = value.borderWidth
      this._borderWidthRichTextMod.mBorderWidth = value.borderWidth
      this._borderWidthRowMod.mBorderWidth = value.borderWidth
      this._borderWidthRowSplitMod.mBorderWidth = value.borderWidth
      this._borderWidthScrollMod.mBorderWidth = value.borderWidth
      this._borderWidthScrollBarMod.mBorderWidth = value.borderWidth
      this._borderWidthSearchMod.mBorderWidth = value.borderWidth
      this._borderWidthSelectMod.mBorderWidth = value.borderWidth
      this._borderWidthSideBarContainerMod.mBorderWidth = value.borderWidth
      this._borderWidthSliderMod.mBorderWidth = value.borderWidth
      this._borderWidthStackMod.mBorderWidth = value.borderWidth
      this._borderWidthSwiperMod.mBorderWidth = value.borderWidth
      this._borderWidthTabContentMod.mBorderWidth = value.borderWidth
      this._borderWidthTabsMod.mBorderWidth = value.borderWidth
      this._borderWidthTextMod.mBorderWidth = value.borderWidth
      this._borderWidthTextAreaMod.mBorderWidth = value.borderWidth
      this._borderWidthTextClockMod.mBorderWidth = value.borderWidth
      this._borderWidthTextInputMod.mBorderWidth = value.borderWidth
      this._borderWidthTextPickerMod.mBorderWidth = value.borderWidth
      this._borderWidthTextTimerMod.mBorderWidth = value.borderWidth
      this._borderWidthTimePickerMod.mBorderWidth = value.borderWidth
      this._borderWidthToggleMod.mBorderWidth = value.borderWidth
      this._borderWidthUIExtensionComponentMod.mBorderWidth = value.borderWidth
      this._borderWidthWaterFlowMod.mBorderWidth = value.borderWidth
      this._borderWidthWebMod.mBorderWidth = value.borderWidth
      this._borderWidthXComponentMod.mBorderWidth = value.borderWidth
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').key(this.componentKey).attributeModifier(this._borderWidthButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._borderWidthTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .attributeModifier(this._borderWidthAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._borderWidthBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._borderWidthCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._borderWidthCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .attributeModifier(this._borderWidthDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._borderWidthDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._borderWidthDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._borderWidthGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._borderWidthImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._borderWidthImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._borderWidthLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._borderWidthMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._borderWidthMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._borderWidthQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._borderWidthRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._borderWidthRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._borderWidthScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._borderWidthSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
          { value: 'bbb' }]).attributeModifier(this._borderWidthSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._borderWidthSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._borderWidthTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._borderWidthTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
            .attributeModifier(this._borderWidthTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._borderWidthTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._borderWidthTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .attributeModifier(this._borderWidthToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
            .attributeModifier(this._borderWidthWebMod)
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
          }.attributeModifier(this._borderWidthBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._borderWidthColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._borderWidthColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._borderWidthCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._borderWidthFlexMod)
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
          }.attributeModifier(this._borderWidthGridRowMod)
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
            .attributeModifier(this._borderWidthGridMod)
            .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._borderWidthListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._borderWidthListItemMod)
          }
          .width('100%')
            .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._borderWidthListItemGroupMod)
          }.backgroundColor(Color.Pink)
            .width('100%')
            .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._borderWidthRefreshMod)
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
          }.attributeModifier(this._borderWidthRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._borderWidthRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._borderWidthRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._borderWidthScrollMod)
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
          }.attributeModifier(this._borderWidthStackMod)
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
          }.attributeModifier(this._borderWidthTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._borderWidthTabContentMod)
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
          }.attributeModifier(this._borderWidthWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._borderWidthGridColMod)
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
              .attributeModifier(this._borderWidthFlowItemMod)
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
              .attributeModifier(this._borderWidthGridItemMod)
              .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
            .width('100%')
            .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._borderWidthMenuItemMod)
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
              .attributeModifier(this._borderWidthMenuItemGroupMod)
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