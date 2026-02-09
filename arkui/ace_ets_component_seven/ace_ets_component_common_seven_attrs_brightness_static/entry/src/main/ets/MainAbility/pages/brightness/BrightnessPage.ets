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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, BorderImageOption, EffectComponentAttribute,
  FormComponentAttribute, ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mBrightness: number = 10
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`brightness page show ${JSON.stringify(this.mBrightness)}`)
    instance.brightness(this.mBrightness)
  }
}

@Entry
@Component
struct brightnessPage {
  @State _brightness: number = 1.0
  @State _brightnessAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _brightnessBadgeMod: BadgeModifier = new BadgeModifier()
  @State _brightnessBlankMod: BlankModifier = new BlankModifier()
  @State _brightnessButttonMod: ButtonModifier = new ButtonModifier()
  @State _brightnessCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _brightnessCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _brightnessCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _brightnessColumnMod: ColumnModifier = new ColumnModifier()
  @State _brightnessColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _brightnessCounterMod: CounterModifier = new CounterModifier()
  @State _brightnessDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _brightnessDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _brightnessDividerMod: DividerModifier = new DividerModifier()
  @State _brightnessEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _brightnessFlexMod: FlexModifier = new FlexModifier()
  @State _brightnessFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _brightnessFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _brightnessFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _brightnessGaugeMod: GaugeModifier = new GaugeModifier()
  @State _brightnessGridMod: GridModifier = new GridModifier()
  @State _brightnessGridColMod: GridColModifier = new GridColModifier()
  @State _brightnessGridItemMod: GridItemModifier = new GridItemModifier()
  @State _brightnessGridRowMod: GridRowModifier = new GridRowModifier()
  @State _brightnessHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _brightnessImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _brightnessImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _brightnessImageMod: ImageModifier = new ImageModifier()
  @State _brightnessListMod: ListModifier = new ListModifier()
  @State _brightnessListItemMod: ListItemModifier = new ListItemModifier()
  @State _brightnessListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _brightnessLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _brightnessMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _brightnessMenuMod: MenuModifier = new MenuModifier()
  @State _brightnessMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _brightnessMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _brightnessNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _brightnessNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _brightnessPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _brightnessPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _brightnessQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _brightnessRadioMod: RadioModifier = new RadioModifier()
  @State _brightnessRatingMod: RatingModifier = new RatingModifier()
  @State _brightnessRefreshMod: RefreshModifier = new RefreshModifier()
  @State _brightnessRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _brightnessRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _brightnessRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _brightnessRichTextMod: RichTextModifier = new RichTextModifier()
  @State _brightnessRowMod: RowModifier = new RowModifier()
  @State _brightnessRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _brightnessScrollMod: ScrollModifier = new ScrollModifier()
  @State _brightnessScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _brightnessSearchMod: SearchModifier = new SearchModifier()
  @State _brightnessSelectMod: SelectModifier = new SelectModifier()
  @State _brightnessSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _brightnessSliderMod: SliderModifier = new SliderModifier()
  @State _brightnessStackMod: StackModifier = new StackModifier()
  @State _brightnessSwiperMod: SwiperModifier = new SwiperModifier()
  @State _brightnessTabContentMod: TabContentModifier = new TabContentModifier()
  @State _brightnessTabsMod: TabsModifier = new TabsModifier()
  @State _brightnessTextMod: TextModifier = new TextModifier()
  @State _brightnessTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _brightnessTextClockMod: TextClockModifier = new TextClockModifier()
  @State _brightnessTextInputMod: TextInputModifier = new TextInputModifier()
  @State _brightnessTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _brightnessTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _brightnessTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _brightnessToggleMod: ToggleModifier = new ToggleModifier()
  @State _brightnessUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _brightnessWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _brightnessWebMod: WebModifier = new WebModifier()
  @State _brightnessXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State columns: int = 0
  @State gutter: int = 0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 brightness page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as  string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._brightnessCheckboxMod.mBrightness = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.brightness
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.brightness))
      this._brightnessAlphabetIndexerMod.mBrightness = value.brightness
      this._brightnessBadgeMod.mBrightness = value.brightness
      this._brightnessBlankMod.mBrightness = value.brightness
      this._brightnessButttonMod.mBrightness = value.brightness
      this._brightnessCalendarPickerMod.mBrightness = value.brightness
      this._brightnessCheckboxMod.mBrightness = value.brightness
      this._brightnessCheckboxGroupMod.mBrightness = value.brightness
      this._brightnessColumnMod.mBrightness = value.brightness
      this._brightnessColumnSplitMod.mBrightness = value.brightness
      this._brightnessCounterMod.mBrightness = value.brightness
      this._brightnessDataPanelMod.mBrightness = value.brightness
      this._brightnessDatePickerMod.mBrightness = value.brightness
      this._brightnessDividerMod.mBrightness = value.brightness
      this._brightnessEffectComponentMod.mBrightness = value.brightness
      this._brightnessFlexMod.mBrightness = value.brightness
      this._brightnessFlowItemMod.mBrightness = value.brightness
      this._brightnessFormComponentMod.mBrightness = value.brightness
      this._brightnessFormLinkMod.mBrightness = value.brightness
      this._brightnessGaugeMod.mBrightness = value.brightness
      this._brightnessGridMod.mBrightness = value.brightness
      this._brightnessGridColMod.mBrightness = value.brightness
      this._brightnessGridItemMod.mBrightness = value.brightness
      this._brightnessGridRowMod.mBrightness = value.brightness
      this._brightnessHyperlinkMod.mBrightness = value.brightness
      this._brightnessImageAnimatorMod.mBrightness = value.brightness
      this._brightnessImageSpanMod.mBrightness = value.brightness
      this._brightnessImageMod.mBrightness = value.brightness
      this._brightnessListMod.mBrightness = value.brightness
      this._brightnessListItemMod.mBrightness = value.brightness
      this._brightnessListItemGroupMod.mBrightness = value.brightness
      this._brightnessLoadingProgressMod.mBrightness = value.brightness
      this._brightnessMarqueeMod.mBrightness = value.brightness
      this._brightnessMenuMod.mBrightness = value.brightness
      this._brightnessMenuItemMod.mBrightness = value.brightness
      this._brightnessMenuItemGroupMod.mBrightness = value.brightness
      this._brightnessNavDestinationMod.mBrightness = value.brightness
      
      
      
      this._brightnessPatternLockMod.mBrightness = value.brightness
      this._brightnessPluginComponentMod.mBrightness = value.brightness
      this._brightnessQRCodeMod.mBrightness = value.brightness
      this._brightnessRadioMod.mBrightness = value.brightness
      this._brightnessRatingMod.mBrightness = value.brightness
      this._brightnessRefreshMod.mBrightness = value.brightness
      this._brightnessRelativeContainerMod.mBrightness = value.brightness
      this._brightnessRemoteWindowMod.mBrightness = value.brightness
      this._brightnessRichEditorMod.mBrightness = value.brightness
      this._brightnessRichTextMod.mBrightness = value.brightness
      this._brightnessRowMod.mBrightness = value.brightness
      this._brightnessRowSplitMod.mBrightness = value.brightness
      this._brightnessScrollMod.mBrightness = value.brightness
      this._brightnessScrollBarMod.mBrightness = value.brightness
      this._brightnessSearchMod.mBrightness = value.brightness
      this._brightnessSelectMod.mBrightness = value.brightness
      this._brightnessSideBarContainerMod.mBrightness = value.brightness
      this._brightnessSliderMod.mBrightness = value.brightness
      this._brightnessStackMod.mBrightness = value.brightness
      this._brightnessSwiperMod.mBrightness = value.brightness
      this._brightnessTabContentMod.mBrightness = value.brightness
      this._brightnessTabsMod.mBrightness = value.brightness
      this._brightnessTextMod.mBrightness = value.brightness
      this._brightnessTextAreaMod.mBrightness = value.brightness
      this._brightnessTextClockMod.mBrightness = value.brightness
      this._brightnessTextInputMod.mBrightness = value.brightness
      this._brightnessTextPickerMod.mBrightness = value.brightness
      this._brightnessTextTimerMod.mBrightness = value.brightness
      this._brightnessTimePickerMod.mBrightness = value.brightness
      this._brightnessToggleMod.mBrightness = value.brightness
      this._brightnessUIExtensionComponentMod.mBrightness = value.brightness
      this._brightnessWaterFlowMod.mBrightness = value.brightness
      this._brightnessWebMod.mBrightness = value.brightness
      this._brightnessXComponentMod.mBrightness = value.brightness
  
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._brightnessButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._brightnessTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._brightnessAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._brightnessBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().key(this.componentKey).attributeModifier(this._brightnessCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._brightnessCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._brightnessDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._brightnessDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._brightnessDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._brightnessGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._brightnessImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._brightnessImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._brightnessLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._brightnessMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._brightnessMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._brightnessQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._brightnessRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._brightnessRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._brightnessScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._brightnessSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._brightnessSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._brightnessSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._brightnessTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._brightnessTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._brightnessTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._brightnessTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._brightnessToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._brightnessWebMod)
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
          }.attributeModifier(this._brightnessBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._brightnessColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._brightnessColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._brightnessCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._brightnessFlexMod)
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
          }.attributeModifier(this._brightnessGridRowMod)
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
          .attributeModifier(this._brightnessGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._brightnessListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._brightnessListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._brightnessListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._brightnessRefreshMod)
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
          }.attributeModifier(this._brightnessRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._brightnessRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._brightnessRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._brightnessScrollMod)
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
          }
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.attributeModifier(this._brightnessStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int, index: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.attributeModifier(this._brightnessTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._brightnessTabContentMod)
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
          }.attributeModifier(this._brightnessWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._brightnessGridColMod)
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
              .attributeModifier(this._brightnessFlowItemMod)
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
            .attributeModifier(this._brightnessGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._brightnessMenuItemMod)
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
              .attributeModifier(this._brightnessMenuItemGroupMod)
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