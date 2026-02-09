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
  mborderColor: int | string = 0
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mborderColor: int | string = 0
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`backgroundcolor page show ${JSON.stringify(this.mborderColor)}`)
    instance.borderColor(this.mborderColor)
  }
}

@Entry
@Component
struct borderColorPage {
  @State _borderColor: number | string = Color.Brown
  @State _borderColorAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _borderColorBadgeMod: BadgeModifier = new BadgeModifier()
  @State _borderColorBlankMod: BlankModifier = new BlankModifier()
  @State _borderColorButtonMod: ButtonModifier = new ButtonModifier()
  @State _borderColorCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _borderColorCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _borderColorCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _borderColorColumnMod: ColumnModifier = new ColumnModifier()
  @State _borderColorColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _borderColorCounterMod: CounterModifier = new CounterModifier()
  @State _borderColorDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _borderColorDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _borderColorDividerMod: DividerModifier = new DividerModifier()
  @State _borderColorEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _borderColorFlexMod: FlexModifier = new FlexModifier()
  @State _borderColorFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _borderColorFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _borderColorFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _borderColorGaugeMod: GaugeModifier = new GaugeModifier()
  @State _borderColorGridMod: GridModifier = new GridModifier()
  @State _borderColorGridColMod: GridColModifier = new GridColModifier()
  @State _borderColorGridItemMod: GridItemModifier = new GridItemModifier()
  @State _borderColorGridRowMod: GridRowModifier = new GridRowModifier()
  @State _borderColorHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _borderColorImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _borderColorImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _borderColorImageMod: ImageModifier = new ImageModifier()
  @State _borderColorListMod: ListModifier = new ListModifier()
  @State _borderColorListItemMod: ListItemModifier = new ListItemModifier()
  @State _borderColorListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _borderColorLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _borderColorMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _borderColorMenuMod: MenuModifier = new MenuModifier()
  @State _borderColorMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _borderColorMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _borderColorNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _borderColorNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _borderColorPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _borderColorPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _borderColorQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _borderColorRadioMod: RadioModifier = new RadioModifier()
  @State _borderColorRatingMod: RatingModifier = new RatingModifier()
  @State _borderColorRefreshMod: RefreshModifier = new RefreshModifier()
  @State _borderColorRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _borderColorRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _borderColorRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _borderColorRichTextMod: RichTextModifier = new RichTextModifier()
  @State _borderColorRowMod: RowModifier = new RowModifier()
  @State _borderColorRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _borderColorScrollMod: ScrollModifier = new ScrollModifier()
  @State _borderColorScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _borderColorSearchMod: SearchModifier = new SearchModifier()
  @State _borderColorSelectMod: SelectModifier = new SelectModifier()
  @State _borderColorSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _borderColorSliderMod: SliderModifier = new SliderModifier()
  @State _borderColorStackMod: StackModifier = new StackModifier()
  @State _borderColorSwiperMod: SwiperModifier = new SwiperModifier()
  @State _borderColorTabContentMod: TabContentModifier = new TabContentModifier()
  @State _borderColorTabsMod: TabsModifier = new TabsModifier()
  @State _borderColorTextMod: TextModifier = new TextModifier()
  @State _borderColorTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _borderColorTextClockMod: TextClockModifier = new TextClockModifier()
  @State _borderColorTextInputMod: TextInputModifier = new TextInputModifier()
  @State _borderColorTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _borderColorTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _borderColorTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _borderColorToggleMod: ToggleModifier = new ToggleModifier()
  @State _borderColorUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _borderColorWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _borderColorWebMod: WebModifier = new WebModifier()
  @State _borderColorXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string =  '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State columns: int = 0
  @State gutter: int =  0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('borderColor page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._borderColorButtonMod.mborderColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.borderColor
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('[registerDataChange] ' + JSON.stringify(value.borderColor))
      this._borderColorAlphabetIndexerMod.mborderColor = value.borderColor
      this._borderColorBadgeMod.mborderColor = value.borderColor
      this._borderColorBlankMod.mborderColor = value.borderColor
      this._borderColorButtonMod.mborderColor = value.borderColor
      this._borderColorCalendarPickerMod.mborderColor = value.borderColor
      this._borderColorCheckboxMod.mborderColor = value.borderColor
      this._borderColorCheckboxGroupMod.mborderColor = value.borderColor
      this._borderColorColumnMod.mborderColor = value.borderColor
      this._borderColorColumnSplitMod.mborderColor = value.borderColor
      this._borderColorCounterMod.mborderColor = value.borderColor
      this._borderColorDataPanelMod.mborderColor = value.borderColor
      this._borderColorDatePickerMod.mborderColor = value.borderColor
      this._borderColorDividerMod.mborderColor = value.borderColor
      this._borderColorEffectComponentMod.mborderColor = value.borderColor
      this._borderColorFlexMod.mborderColor = value.borderColor
      this._borderColorFlowItemMod.mborderColor = value.borderColor
      this._borderColorFormComponentMod.mborderColor = value.borderColor
      this._borderColorFormLinkMod.mborderColor = value.borderColor
      this._borderColorGaugeMod.mborderColor = value.borderColor
      this._borderColorGridMod.mborderColor = value.borderColor
      this._borderColorGridColMod.mborderColor = value.borderColor
      this._borderColorGridItemMod.mborderColor = value.borderColor
      this._borderColorGridRowMod.mborderColor = value.borderColor
      this._borderColorHyperlinkMod.mborderColor = value.borderColor
      this._borderColorImageAnimatorMod.mborderColor = value.borderColor
      this._borderColorImageSpanMod.mborderColor = value.borderColor
      this._borderColorImageMod.mborderColor = value.borderColor
      this._borderColorListMod.mborderColor = value.borderColor
      this._borderColorListItemMod.mborderColor = value.borderColor
      this._borderColorListItemGroupMod.mborderColor = value.borderColor
      this._borderColorLoadingProgressMod.mborderColor = value.borderColor
      this._borderColorMarqueeMod.mborderColor = value.borderColor
      this._borderColorMenuMod.mborderColor = value.borderColor
      this._borderColorMenuItemMod.mborderColor = value.borderColor
      this._borderColorMenuItemGroupMod.mborderColor = value.borderColor
      this._borderColorNavDestinationMod.mborderColor = value.borderColor
      
      this._borderColorNavigationMod.mborderColor = value.borderColor
      
      this._borderColorPatternLockMod.mborderColor = value.borderColor
      this._borderColorPluginComponentMod.mborderColor = value.borderColor
      this._borderColorQRCodeMod.mborderColor = value.borderColor
      this._borderColorRadioMod.mborderColor = value.borderColor
      this._borderColorRatingMod.mborderColor = value.borderColor
      this._borderColorRefreshMod.mborderColor = value.borderColor
      this._borderColorRelativeContainerMod.mborderColor = value.borderColor
      this._borderColorRemoteWindowMod.mborderColor = value.borderColor
      this._borderColorRichEditorMod.mborderColor = value.borderColor
      this._borderColorRichTextMod.mborderColor = value.borderColor
      this._borderColorRowMod.mborderColor = value.borderColor
      this._borderColorRowSplitMod.mborderColor = value.borderColor
      this._borderColorScrollMod.mborderColor = value.borderColor
      this._borderColorScrollBarMod.mborderColor = value.borderColor
      this._borderColorSearchMod.mborderColor = value.borderColor
      this._borderColorSelectMod.mborderColor = value.borderColor
      this._borderColorSideBarContainerMod.mborderColor = value.borderColor
      this._borderColorSliderMod.mborderColor = value.borderColor
      this._borderColorStackMod.mborderColor = value.borderColor
      this._borderColorSwiperMod.mborderColor = value.borderColor
      this._borderColorTabContentMod.mborderColor = value.borderColor
      this._borderColorTabsMod.mborderColor = value.borderColor
      this._borderColorTextMod.mborderColor = value.borderColor
      this._borderColorTextAreaMod.mborderColor = value.borderColor
      this._borderColorTextClockMod.mborderColor = value.borderColor
      this._borderColorTextInputMod.mborderColor = value.borderColor
      this._borderColorTextPickerMod.mborderColor = value.borderColor
      this._borderColorTextTimerMod.mborderColor = value.borderColor
      this._borderColorTimePickerMod.mborderColor = value.borderColor
      this._borderColorToggleMod.mborderColor = value.borderColor
      this._borderColorUIExtensionComponentMod.mborderColor = value.borderColor
      this._borderColorWaterFlowMod.mborderColor = value.borderColor
      this._borderColorWebMod.mborderColor = value.borderColor
      this._borderColorXComponentMod.mborderColor = value.borderColor
    })
  }

  
  
  
  
  
  
  
  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').key(this.componentKey).attributeModifier(this._borderColorButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._borderColorTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._borderColorAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._borderColorBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._borderColorCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._borderColorCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._borderColorDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._borderColorDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._borderColorDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._borderColorGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._borderColorImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._borderColorImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._borderColorLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._borderColorMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._borderColorMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._borderColorQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._borderColorRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._borderColorRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._borderColorScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._borderColorSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._borderColorSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._borderColorSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._borderColorTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._borderColorTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .attributeModifier(this._borderColorTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._borderColorTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._borderColorTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._borderColorToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._borderColorWebMod)
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
          }.attributeModifier(this._borderColorBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._borderColorColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._borderColorColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._borderColorCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._borderColorFlexMod)
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
          }.attributeModifier(this._borderColorGridRowMod)
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
          .attributeModifier(this._borderColorGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._borderColorListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._borderColorListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._borderColorListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._borderColorRefreshMod)
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
          }.attributeModifier(this._borderColorRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._borderColorRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._borderColorRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._borderColorScrollMod)
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
          }.attributeModifier(this._borderColorStackMod)
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
          }.attributeModifier(this._borderColorTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._borderColorTabContentMod)
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
          }.attributeModifier(this._borderColorWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._borderColorGridColMod)
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
              .attributeModifier(this._borderColorFlowItemMod)
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
            .attributeModifier(this._borderColorGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._borderColorMenuItemMod)
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
              .attributeModifier(this._borderColorMenuItemGroupMod)
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