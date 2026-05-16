'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter'
import { Entry, Component, Row, Text, Color, Column, Scroller, CanvasRenderingContext2D, RenderingContextSettings,Builder,ResourceColor,
  AlphabetIndexer, Button, Blank, Checkbox, CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator,
  LoadingProgress, Marquee, Navigation, Menu, $r, MenuItem, QRCode, Radio, Rating, ScrollBar, Select, MenuItemOptions,
  Slider, TextArea, TextClock, TextInput, TextPicker, TimePicker, Toggle, Web, Circle, Ellipse, Line, WebviewController,
  Polyline, Polygon, Path, Rect, Shape, Badge, ColumnSplit, Counter, Flex, GridRow, Grid, List, Refresh, ProgressType, FlowItem,
  RelativeContainer, RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, WaterFlow, CalendarPicker,Resource,
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
  TimePickerAttribute, VideoAttribute, WaterFlowAttribute, WebAttribute, WindowSceneAttribute, XComponentAttribute,Navigation,NavDestination,
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, BorderImageOption, EffectComponentAttribute,CommonMethod,applyStyles,
  FormComponentAttribute, ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, AlignRuleOption } from '@ohos.arkui.component'
import { State, AppStorage, StoragePropRef,Observed } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';
import { RecordData } from '@ohos.base';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mColorBlend: Color | string = Color.Green
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
@Observed
class _colorBlendButttonMod implements AttributeModifier<ButtonAttribute> {
  mColorBlend: Color | string = Color.Green
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.log('this.mColorBlend',this.mColorBlend)
    instance.colorBlend(this.mColorBlend)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class NavigatorModifier implements AttributeModifier<NavigationAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class NavRouterModifier implements AttributeModifier<NavigationAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mColorBlend: Color = Color.Green
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`colorBlend page show ${JSON.stringify(this.mColorBlend)}`)
    instance.colorBlend(this.mColorBlend)
  }
}

@Entry
@Component
struct colorBlendPage {
  @State _colorBlendAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _colorBlendBadgeMod: BadgeModifier = new BadgeModifier()
  @State _colorBlendBlankMod: BlankModifier = new BlankModifier()
  @State _colorBlendButttonMod: _colorBlendButttonMod = new _colorBlendButttonMod()
  @State _colorBlendCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _colorBlendCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _colorBlendCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _colorBlendColumnMod: ColumnModifier = new ColumnModifier()
  @State _colorBlendColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _colorBlendCounterMod: CounterModifier = new CounterModifier()
  @State _colorBlendDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _colorBlendDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _colorBlendDividerMod: DividerModifier = new DividerModifier()
  @State _colorBlendEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _colorBlendFlexMod: FlexModifier = new FlexModifier()
  @State _colorBlendFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _colorBlendFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _colorBlendFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _colorBlendGaugeMod: GaugeModifier = new GaugeModifier()
  @State _colorBlendGridMod: GridModifier = new GridModifier()
  @State _colorBlendGridColMod: GridColModifier = new GridColModifier()
  @State _colorBlendGridItemMod: GridItemModifier = new GridItemModifier()
  @State _colorBlendGridRowMod: GridRowModifier = new GridRowModifier()
  @State _colorBlendHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _colorBlendImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _colorBlendImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _colorBlendImageMod: ImageModifier = new ImageModifier()
  @State _colorBlendListMod: ListModifier = new ListModifier()
  @State _colorBlendListItemMod: ListItemModifier = new ListItemModifier()
  @State _colorBlendListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _colorBlendLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _colorBlendMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _colorBlendMenuMod: MenuModifier = new MenuModifier()
  @State _colorBlendMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _colorBlendMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _colorBlendNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _colorBlendNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _colorBlendNavigationMod: NavigationModifier = new NavigationModifier()
  @State _colorBlendNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _colorBlendPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _colorBlendPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _colorBlendQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _colorBlendRadioMod: RadioModifier = new RadioModifier()
  @State _colorBlendRatingMod: RatingModifier = new RatingModifier()
  @State _colorBlendRefreshMod: RefreshModifier = new RefreshModifier()
  @State _colorBlendRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _colorBlendRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _colorBlendRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _colorBlendRichTextMod: RichTextModifier = new RichTextModifier()
  @State _colorBlendRowMod: RowModifier = new RowModifier()
  @State _colorBlendRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _colorBlendScrollMod: ScrollModifier = new ScrollModifier()
  @State _colorBlendScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _colorBlendSearchMod: SearchModifier = new SearchModifier()
  @State _colorBlendSelectMod: SelectModifier = new SelectModifier()
  @State _colorBlendSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _colorBlendSliderMod: SliderModifier = new SliderModifier()
  @State _colorBlendStackMod: StackModifier = new StackModifier()
  @State _colorBlendSwiperMod: SwiperModifier = new SwiperModifier()
  @State _colorBlendTabContentMod: TabContentModifier = new TabContentModifier()
  @State _colorBlendTabsMod: TabsModifier = new TabsModifier()
  @State _colorBlendTextMod: TextModifier = new TextModifier()
  @State _colorBlendTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _colorBlendTextClockMod: TextClockModifier = new TextClockModifier()
  @State _colorBlendTextInputMod: TextInputModifier = new TextInputModifier()
  @State _colorBlendTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _colorBlendTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _colorBlendTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _colorBlendToggleMod: ToggleModifier = new ToggleModifier()
  @State _colorBlendUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _colorBlendWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _colorBlendWebMod: WebModifier = new WebModifier()
  @State _colorBlendXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = ''
  @State componentKey: string =  ''
  @State parentWidth: number = 0
  @State parentHeight: number = 0
  @State columns: int =  0
  @State gutter: number =  0
  @State parentComponentKey: string = ''
  @State isShow:boolean = false
  pathStack: NavPathStack = new NavPathStack()

  @Builder PanelBuilder(){
    Text('Panel')
  }
  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<string, RecordData>
      if (data!['colorBlend'] != null) {
        console.log('colorBlendcolorBlendcolorBlendcolorBlendcolorBlend',data!['colorBlend'] as Color|string);
        this._colorBlendButttonMod.mColorBlend = data!['colorBlend'] as Color|string
        console.log('colorBlendcolorBlendcolorBlendcolorBlendcolorBlend2',this._colorBlendButttonMod.mColorBlend);
      }
    }
  }
  onPageShow() {
    console.log('aboutToAppear routerParamOptions before' + this.targetView)
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    this.targetView = routerParamOptions.view.targetView
    this.componentKey = routerParamOptions.view.componentKey
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.columns = routerParamOptions.view.columns
    this.gutter = routerParamOptions.view.gutter
    this.parentComponentKey = routerParamOptions.view.parentComponentKey
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 184,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

commonStyle(instance: CommonMethod){
  instance.height('100%')
  instance.key(this.componentKey)
  }

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter, /*margin: 0 */}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').applyStyles(this.commonStyle).attributeModifier(this._colorBlendButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').applyStyles(this.commonStyle).attributeModifier(this._colorBlendTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .applyStyles(this.commonStyle).attributeModifier(this._colorBlendAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).applyStyles(this.commonStyle).attributeModifier(this._colorBlendBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().applyStyles(this.commonStyle).attributeModifier(this._colorBlendCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).applyStyles(this.commonStyle).attributeModifier(this._colorBlendCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .applyStyles(this.commonStyle).attributeModifier(this._colorBlendDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).applyStyles(this.commonStyle).attributeModifier(this._colorBlendDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().applyStyles(this.commonStyle).attributeModifier(this._colorBlendDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .applyStyles(this.commonStyle).attributeModifier(this._colorBlendGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).applyStyles(this.commonStyle).attributeModifier(this._colorBlendImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).applyStyles(this.commonStyle).attributeModifier(this._colorBlendImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().applyStyles(this.commonStyle).attributeModifier(this._colorBlendLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity.toInt(),
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).applyStyles(this.commonStyle).attributeModifier(this._colorBlendMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle).attributeModifier(this._colorBlendMenuMod)
        } else if (this.targetView == 'NavRouter') {
          Navigation() {
            Row() {
              Image($r('app.media.icon'))
            }

            NavDestination() {
              Text('NavDestination').fontSize(10)
            }
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').applyStyles(this.commonStyle).attributeModifier(this._colorBlendQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle).attributeModifier(this._colorBlendRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).applyStyles(this.commonStyle).attributeModifier(this._colorBlendRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().applyStyles(this.commonStyle).attributeModifier(this._colorBlendSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).applyStyles(this.commonStyle).attributeModifier(this._colorBlendSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .applyStyles(this.commonStyle).attributeModifier(this._colorBlendSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).applyStyles(this.commonStyle).attributeModifier(this._colorBlendTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .applyStyles(this.commonStyle).attributeModifier(this._colorBlendTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .applyStyles(this.commonStyle).attributeModifier(this._colorBlendTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).applyStyles(this.commonStyle).attributeModifier(this._colorBlendTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .applyStyles(this.commonStyle).attributeModifier(this._colorBlendToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() }).applyStyles(this.commonStyle)
          .attributeModifier(this._colorBlendWebMod)
        } else if (this.targetView == 'Circle') {
          Circle().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Ellipse') {
          Ellipse().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Line') {
          Line()
            .applyStyles(this.commonStyle)
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Polygon') {
          Polygon().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Path') {
          Path().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Rect') {
          Rect().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendFlexMod)
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
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendGridRowMod)
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
          .applyStyles(this.commonStyle).attributeModifier(this._colorBlendGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.applyStyles(this.commonStyle).height('100%').width('100%').attributeModifier(this._colorBlendListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .applyStyles(this.commonStyle).attributeModifier(this._colorBlendListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          Navigation() {
            Text('Go to back page').width('100%').height(20)
          }.applyStyles(this.commonStyle).backgroundColor(Color.Red).attributeModifier(this._colorBlendNavigatorMod)
        } else if (this.targetView == 'Panel') {
          Column(){
            Text('Text')
          }
          .backgroundColor(Color.Yellow).applyStyles(this.commonStyle).bindSheet(this.isShow,this.PanelBuilder)
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendRefreshMod)
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
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().applyStyles(this.commonStyle).attributeModifier(this._colorBlendRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, (item: int, index: int) => item.toString())
            }.width('100%')
          }.scrollBar(BarState.On).applyStyles(this.commonStyle).attributeModifier(this._colorBlendScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item: int, index: int) => {
                Column({ space: 5 } as ColumnOptions) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int, index: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .applyStyles(this.commonStyle).attributeModifier(this._colorBlendSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').applyStyles(this.commonStyle).attributeModifier(this._colorBlendTabContentMod)
          }.width('100%').height('100%')
        } else if (this.targetView == 'WaterFlow') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
            }, (item: int, index: int) => item.toString())
          }.applyStyles(this.commonStyle).attributeModifier(this._colorBlendWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .applyStyles(this.commonStyle).attributeModifier(this._colorBlendGridColMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
              .applyStyles(this.commonStyle).attributeModifier(this._colorBlendFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, (item: int, index: int) => item.toString())
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
            .applyStyles(this.commonStyle).attributeModifier(this._colorBlendGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .applyStyles(this.commonStyle).attributeModifier(this._colorBlendMenuItemMod)
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
              .applyStyles(this.commonStyle).attributeModifier(this._colorBlendMenuItemGroupMod)
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