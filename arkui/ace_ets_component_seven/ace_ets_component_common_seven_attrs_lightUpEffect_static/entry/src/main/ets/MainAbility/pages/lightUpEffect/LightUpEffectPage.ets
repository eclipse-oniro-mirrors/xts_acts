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
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mLightUpEffect: number = 1
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`lightUpEffect page show ${JSON.stringify(this.mLightUpEffect)}`)
   instance.lightUpEffect(this.mLightUpEffect)
  }
}

@Entry
@Component
struct lightUpEffectPage {
  @State _lightUpEffect: number = 0
  @State _lightUpEffectAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _lightUpEffectBadgeMod: BadgeModifier = new BadgeModifier()
  @State _lightUpEffectBlankMod: BlankModifier = new BlankModifier()
  @State _lightUpEffectButttonMod: ButtonModifier = new ButtonModifier()
  @State _lightUpEffectCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _lightUpEffectCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _lightUpEffectCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _lightUpEffectColumnMod: ColumnModifier = new ColumnModifier()
  @State _lightUpEffectColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _lightUpEffectCounterMod: CounterModifier = new CounterModifier()
  @State _lightUpEffectDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _lightUpEffectDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _lightUpEffectDividerMod: DividerModifier = new DividerModifier()
  @State _lightUpEffectEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _lightUpEffectFlexMod: FlexModifier = new FlexModifier()
  @State _lightUpEffectFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _lightUpEffectFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _lightUpEffectFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _lightUpEffectGaugeMod: GaugeModifier = new GaugeModifier()
  @State _lightUpEffectGridMod: GridModifier = new GridModifier()
  @State _lightUpEffectGridColMod: GridColModifier = new GridColModifier()
  @State _lightUpEffectGridItemMod: GridItemModifier = new GridItemModifier()
  @State _lightUpEffectGridRowMod: GridRowModifier = new GridRowModifier()
  @State _lightUpEffectHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _lightUpEffectImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _lightUpEffectImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _lightUpEffectImageMod: ImageModifier = new ImageModifier()
  @State _lightUpEffectListMod: ListModifier = new ListModifier()
  @State _lightUpEffectListItemMod: ListItemModifier = new ListItemModifier()
  @State _lightUpEffectListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _lightUpEffectLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _lightUpEffectMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _lightUpEffectMenuMod: MenuModifier = new MenuModifier()
  @State _lightUpEffectMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _lightUpEffectMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _lightUpEffectNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _lightUpEffectNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _lightUpEffectPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _lightUpEffectPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _lightUpEffectQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _lightUpEffectRadioMod: RadioModifier = new RadioModifier()
  @State _lightUpEffectRatingMod: RatingModifier = new RatingModifier()
  @State _lightUpEffectRefreshMod: RefreshModifier = new RefreshModifier()
  @State _lightUpEffectRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _lightUpEffectRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _lightUpEffectRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _lightUpEffectRichTextMod: RichTextModifier = new RichTextModifier()
  @State _lightUpEffectRowMod: RowModifier = new RowModifier()
  @State _lightUpEffectRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _lightUpEffectScrollMod: ScrollModifier = new ScrollModifier()
  @State _lightUpEffectScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _lightUpEffectSearchMod: SearchModifier = new SearchModifier()
  @State _lightUpEffectSelectMod: SelectModifier = new SelectModifier()
  @State _lightUpEffectSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _lightUpEffectSliderMod: SliderModifier = new SliderModifier()
  @State _lightUpEffectStackMod: StackModifier = new StackModifier()
  @State _lightUpEffectSwiperMod: SwiperModifier = new SwiperModifier()
  @State _lightUpEffectTabContentMod: TabContentModifier = new TabContentModifier()
  @State _lightUpEffectTabsMod: TabsModifier = new TabsModifier()
  @State _lightUpEffectTextMod: TextModifier = new TextModifier()
  @State _lightUpEffectTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _lightUpEffectTextClockMod: TextClockModifier = new TextClockModifier()
  @State _lightUpEffectTextInputMod: TextInputModifier = new TextInputModifier()
  @State _lightUpEffectTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _lightUpEffectTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _lightUpEffectTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _lightUpEffectToggleMod: ToggleModifier = new ToggleModifier()
  @State _lightUpEffectUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _lightUpEffectWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _lightUpEffectWebMod: WebModifier = new WebModifier()
  @State _lightUpEffectXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0;
  @State parentHeight: double = 0;
  @State columns: int = 0
  @State gutter: int = 0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 lightUpEffect page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._lightUpEffectAlphabetIndexerMod.mLightUpEffect = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.lightUpEffect
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.lightUpEffect))
      this._lightUpEffectAlphabetIndexerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectBadgeMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectBlankMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectButttonMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectCalendarPickerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectCheckboxMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectCheckboxGroupMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectColumnMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectColumnSplitMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectCounterMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectDataPanelMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectDatePickerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectDividerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectEffectComponentMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectFlexMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectFlowItemMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectFormComponentMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectFormLinkMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectGaugeMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectGridMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectGridColMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectGridItemMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectGridRowMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectHyperlinkMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectImageAnimatorMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectImageSpanMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectImageMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectListMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectListItemMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectListItemGroupMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectLoadingProgressMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectMarqueeMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectMenuMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectMenuItemMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectMenuItemGroupMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectNavDestinationMod.mLightUpEffect = value.lightUpEffect
      
      this._lightUpEffectNavigationMod.mLightUpEffect = value.lightUpEffect
      
      this._lightUpEffectPatternLockMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectPluginComponentMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectQRCodeMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRadioMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRatingMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRefreshMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRelativeContainerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRemoteWindowMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRichEditorMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRichTextMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRowMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectRowSplitMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectScrollMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectScrollBarMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectSearchMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectSelectMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectSideBarContainerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectSliderMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectStackMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectSwiperMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTabContentMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTabsMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTextMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTextAreaMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTextClockMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTextInputMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTextPickerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTextTimerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectTimePickerMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectToggleMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectUIExtensionComponentMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectWaterFlowMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectWebMod.mLightUpEffect = value.lightUpEffect
      this._lightUpEffectXComponentMod.mLightUpEffect = value.lightUpEffect
  
    })
  }
  
  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter, /*margin: 0*/ }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._lightUpEffectButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._lightUpEffectTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .key(this.componentKey)
          .attributeModifier(this._lightUpEffectAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._lightUpEffectBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._lightUpEffectCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._lightUpEffectCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._lightUpEffectDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._lightUpEffectDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._lightUpEffectDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._lightUpEffectGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._lightUpEffectImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._lightUpEffectImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._lightUpEffectLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._lightUpEffectMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._lightUpEffectMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._lightUpEffectQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._lightUpEffectRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._lightUpEffectRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._lightUpEffectScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._lightUpEffectSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._lightUpEffectSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._lightUpEffectSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._lightUpEffectTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._lightUpEffectTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._lightUpEffectTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._lightUpEffectTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._lightUpEffectToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._lightUpEffectWebMod)
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
          }.attributeModifier(this._lightUpEffectBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._lightUpEffectColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._lightUpEffectColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._lightUpEffectCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._lightUpEffectFlexMod)
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
          }.attributeModifier(this._lightUpEffectGridRowMod)
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
          .attributeModifier(this._lightUpEffectGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._lightUpEffectListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._lightUpEffectListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._lightUpEffectListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._lightUpEffectRefreshMod)
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
          }.attributeModifier(this._lightUpEffectRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._lightUpEffectRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._lightUpEffectRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._lightUpEffectScrollMod)
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
          }.attributeModifier(this._lightUpEffectStackMod)
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
          }.attributeModifier(this._lightUpEffectTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._lightUpEffectTabContentMod)
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
          }.attributeModifier(this._lightUpEffectWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._lightUpEffectGridColMod)
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
              .attributeModifier(this._lightUpEffectFlowItemMod)
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
            .attributeModifier(this._lightUpEffectGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._lightUpEffectMenuItemMod)
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
              .attributeModifier(this._lightUpEffectMenuItemGroupMod)
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