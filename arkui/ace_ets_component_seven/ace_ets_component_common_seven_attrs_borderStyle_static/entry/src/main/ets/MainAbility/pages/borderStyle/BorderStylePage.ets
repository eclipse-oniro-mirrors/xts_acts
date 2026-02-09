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
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, BorderStyle, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';


  class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class BadgeModifier implements AttributeModifier<BadgeAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: BadgeAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class BlankModifier implements AttributeModifier<BlankAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: BlankAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ButtonModifier implements AttributeModifier<ButtonAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ButtonAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: CalendarPickerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: CheckboxAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: CheckboxGroupAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ColumnModifier implements AttributeModifier<ColumnAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ColumnAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ColumnSplitAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class CounterModifier implements AttributeModifier<CounterAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: CounterAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: DataPanelAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: DatePickerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class DividerModifier implements AttributeModifier<DividerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: DividerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: EffectComponentAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class FlexModifier implements AttributeModifier<FlexAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: FlexAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: FlowItemAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: FormComponentAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: FormLinkAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class GaugeModifier implements AttributeModifier<GaugeAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: GaugeAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class GridModifier implements AttributeModifier<GridAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: GridAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class GridColModifier implements AttributeModifier<GridColAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: GridColAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class GridItemModifier implements AttributeModifier<GridItemAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: GridItemAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class GridRowModifier implements AttributeModifier<GridRowAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: GridRowAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: HyperlinkAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ImageAnimatorAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ImageSpanAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ImageModifier implements AttributeModifier<ImageAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ImageAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ListModifier implements AttributeModifier<ListAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ListAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ListItemModifier implements AttributeModifier<ListItemAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ListItemAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ListItemGroupAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: LoadingProgressAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: MarqueeAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class MenuModifier implements AttributeModifier<MenuAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: MenuAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: MenuItemAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: MenuItemGroupAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: NavDestinationAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class NavigationModifier implements AttributeModifier<NavigationAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: NavigationAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }














  class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: PatternLockAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: PluginComponentAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: QRCodeAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RadioModifier implements AttributeModifier<RadioAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RadioAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RatingModifier implements AttributeModifier<RatingAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RatingAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RefreshModifier implements AttributeModifier<RefreshAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RefreshAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RelativeContainerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RemoteWindowAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RichEditorAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RichTextModifier implements AttributeModifier<RichTextAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RichTextAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RowModifier implements AttributeModifier<RowAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RowAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: RowSplitAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ScrollModifier implements AttributeModifier<ScrollAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ScrollAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ScrollBarAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class SearchModifier implements AttributeModifier<SearchAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: SearchAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class SelectModifier implements AttributeModifier<SelectAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: SelectAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: SideBarContainerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class SliderModifier implements AttributeModifier<SliderAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: SliderAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class StackModifier implements AttributeModifier<StackAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: StackAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class SwiperModifier implements AttributeModifier<SwiperAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: SwiperAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TabContentModifier implements AttributeModifier<TabContentAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TabContentAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TabsModifier implements AttributeModifier<TabsAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TabsAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TextModifier implements AttributeModifier<TextAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TextAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TextAreaAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TextClockModifier implements AttributeModifier<TextClockAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TextClockAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TextInputModifier implements AttributeModifier<TextInputAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TextInputAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TextPickerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TextTimerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: TimePickerAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class ToggleModifier implements AttributeModifier<ToggleAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: ToggleAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: WaterFlowAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class WebModifier implements AttributeModifier<WebAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: WebAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }
  class XComponentModifier implements AttributeModifier<XComponentAttribute> {
    mBorderStyle: BorderStyle = BorderStyle.Solid
    applyNormalAttribute(instance: XComponentAttribute): void {
      console.info(`borderStyle page show ${JSON.stringify(this.mBorderStyle)}`)
     instance.borderStyle(this.mBorderStyle)
    }
  }

@Entry
@Component
struct borderStylePage {
  @State _borderStyle: BorderStyle = BorderStyle.Dotted
  @State _borderStyleAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _borderStyleBadgeMod: BadgeModifier = new BadgeModifier()
  @State _borderStyleBlankMod: BlankModifier = new BlankModifier()
  @State _borderStyleButttonMod: ButtonModifier = new ButtonModifier()
  @State _borderStyleCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _borderStyleCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _borderStyleCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _borderStyleColumnMod: ColumnModifier = new ColumnModifier()
  @State _borderStyleColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _borderStyleCounterMod: CounterModifier = new CounterModifier()
  @State _borderStyleDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _borderStyleDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _borderStyleDividerMod: DividerModifier = new DividerModifier()
  @State _borderStyleEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _borderStyleFlexMod: FlexModifier = new FlexModifier()
  @State _borderStyleFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _borderStyleFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _borderStyleFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _borderStyleGaugeMod: GaugeModifier = new GaugeModifier()
  @State _borderStyleGridMod: GridModifier = new GridModifier()
  @State _borderStyleGridColMod: GridColModifier = new GridColModifier()
  @State _borderStyleGridItemMod: GridItemModifier = new GridItemModifier()
  @State _borderStyleGridRowMod: GridRowModifier = new GridRowModifier()
  @State _borderStyleHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _borderStyleImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _borderStyleImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _borderStyleImageMod: ImageModifier = new ImageModifier()
  @State _borderStyleListMod: ListModifier = new ListModifier()
  @State _borderStyleListItemMod: ListItemModifier = new ListItemModifier()
  @State _borderStyleListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _borderStyleLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _borderStyleMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _borderStyleMenuMod: MenuModifier = new MenuModifier()
  @State _borderStyleMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _borderStyleMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _borderStyleNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _borderStyleNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _borderStylePatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _borderStylePluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _borderStyleQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _borderStyleRadioMod: RadioModifier = new RadioModifier()
  @State _borderStyleRatingMod: RatingModifier = new RatingModifier()
  @State _borderStyleRefreshMod: RefreshModifier = new RefreshModifier()
  @State _borderStyleRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _borderStyleRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _borderStyleRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _borderStyleRichTextMod: RichTextModifier = new RichTextModifier()
  @State _borderStyleRowMod: RowModifier = new RowModifier()
  @State _borderStyleRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _borderStyleScrollMod: ScrollModifier = new ScrollModifier()
  @State _borderStyleScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _borderStyleSearchMod: SearchModifier = new SearchModifier()
  @State _borderStyleSelectMod: SelectModifier = new SelectModifier()
  @State _borderStyleSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _borderStyleSliderMod: SliderModifier = new SliderModifier()
  @State _borderStyleStackMod: StackModifier = new StackModifier()
  @State _borderStyleSwiperMod: SwiperModifier = new SwiperModifier()
  @State _borderStyleTabContentMod: TabContentModifier = new TabContentModifier()
  @State _borderStyleTabsMod: TabsModifier = new TabsModifier()
  @State _borderStyleTextMod: TextModifier = new TextModifier()
  @State _borderStyleTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _borderStyleTextClockMod: TextClockModifier = new TextClockModifier()
  @State _borderStyleTextInputMod: TextInputModifier = new TextInputModifier()
  @State _borderStyleTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _borderStyleTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _borderStyleTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _borderStyleToggleMod: ToggleModifier = new ToggleModifier()
  @State _borderStyleUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _borderStyleWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _borderStyleWebMod: WebModifier = new WebModifier()
  @State _borderStyleXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State columns: int = 0
  @State gutter: int =  0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 borderStyle page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._borderStyleButttonMod.mBorderStyle = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.borderStyle
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.borderStyle))
      this._borderStyleAlphabetIndexerMod.mBorderStyle = value.borderStyle
      this._borderStyleBadgeMod.mBorderStyle = value.borderStyle
      this._borderStyleBlankMod.mBorderStyle = value.borderStyle
      this._borderStyleButttonMod.mBorderStyle = value.borderStyle
      this._borderStyleCalendarPickerMod.mBorderStyle = value.borderStyle
      this._borderStyleCheckboxMod.mBorderStyle = value.borderStyle
      this._borderStyleCheckboxGroupMod.mBorderStyle = value.borderStyle
      this._borderStyleColumnMod.mBorderStyle = value.borderStyle
      this._borderStyleColumnSplitMod.mBorderStyle = value.borderStyle
      this._borderStyleCounterMod.mBorderStyle = value.borderStyle
      this._borderStyleDataPanelMod.mBorderStyle = value.borderStyle
      this._borderStyleDatePickerMod.mBorderStyle = value.borderStyle
      this._borderStyleDividerMod.mBorderStyle = value.borderStyle
      this._borderStyleEffectComponentMod.mBorderStyle = value.borderStyle
      this._borderStyleFlexMod.mBorderStyle = value.borderStyle
      this._borderStyleFlowItemMod.mBorderStyle = value.borderStyle
      this._borderStyleFormComponentMod.mBorderStyle = value.borderStyle
      this._borderStyleFormLinkMod.mBorderStyle = value.borderStyle
      this._borderStyleGaugeMod.mBorderStyle = value.borderStyle
      this._borderStyleGridMod.mBorderStyle = value.borderStyle
      this._borderStyleGridColMod.mBorderStyle = value.borderStyle
      this._borderStyleGridItemMod.mBorderStyle = value.borderStyle
      this._borderStyleGridRowMod.mBorderStyle = value.borderStyle
      this._borderStyleHyperlinkMod.mBorderStyle = value.borderStyle
      this._borderStyleImageAnimatorMod.mBorderStyle = value.borderStyle
      this._borderStyleImageSpanMod.mBorderStyle = value.borderStyle
      this._borderStyleImageMod.mBorderStyle = value.borderStyle
      this._borderStyleListMod.mBorderStyle = value.borderStyle
      this._borderStyleListItemMod.mBorderStyle = value.borderStyle
      this._borderStyleListItemGroupMod.mBorderStyle = value.borderStyle
      this._borderStyleLoadingProgressMod.mBorderStyle = value.borderStyle
      this._borderStyleMarqueeMod.mBorderStyle = value.borderStyle
      this._borderStyleMenuMod.mBorderStyle = value.borderStyle
      this._borderStyleMenuItemMod.mBorderStyle = value.borderStyle
      this._borderStyleMenuItemGroupMod.mBorderStyle = value.borderStyle
      this._borderStyleNavDestinationMod.mBorderStyle = value.borderStyle

      this._borderStyleNavigationMod.mBorderStyle = value.borderStyle

      this._borderStylePatternLockMod.mBorderStyle = value.borderStyle
      this._borderStylePluginComponentMod.mBorderStyle = value.borderStyle
      this._borderStyleQRCodeMod.mBorderStyle = value.borderStyle
      this._borderStyleRadioMod.mBorderStyle = value.borderStyle
      this._borderStyleRatingMod.mBorderStyle = value.borderStyle
      this._borderStyleRefreshMod.mBorderStyle = value.borderStyle
      this._borderStyleRelativeContainerMod.mBorderStyle = value.borderStyle
      this._borderStyleRemoteWindowMod.mBorderStyle = value.borderStyle
      this._borderStyleRichEditorMod.mBorderStyle = value.borderStyle
      this._borderStyleRichTextMod.mBorderStyle = value.borderStyle
      this._borderStyleRowMod.mBorderStyle = value.borderStyle
      this._borderStyleRowSplitMod.mBorderStyle = value.borderStyle
      this._borderStyleScrollMod.mBorderStyle = value.borderStyle
      this._borderStyleScrollBarMod.mBorderStyle = value.borderStyle
      this._borderStyleSearchMod.mBorderStyle = value.borderStyle
      this._borderStyleSelectMod.mBorderStyle = value.borderStyle
      this._borderStyleSideBarContainerMod.mBorderStyle = value.borderStyle
      this._borderStyleSliderMod.mBorderStyle = value.borderStyle
      this._borderStyleStackMod.mBorderStyle = value.borderStyle
      this._borderStyleSwiperMod.mBorderStyle = value.borderStyle
      this._borderStyleTabContentMod.mBorderStyle = value.borderStyle
      this._borderStyleTabsMod.mBorderStyle = value.borderStyle
      this._borderStyleTextMod.mBorderStyle = value.borderStyle
      this._borderStyleTextAreaMod.mBorderStyle = value.borderStyle
      this._borderStyleTextClockMod.mBorderStyle = value.borderStyle
      this._borderStyleTextInputMod.mBorderStyle = value.borderStyle
      this._borderStyleTextPickerMod.mBorderStyle = value.borderStyle
      this._borderStyleTextTimerMod.mBorderStyle = value.borderStyle
      this._borderStyleTimePickerMod.mBorderStyle = value.borderStyle
      this._borderStyleToggleMod.mBorderStyle = value.borderStyle
      this._borderStyleUIExtensionComponentMod.mBorderStyle = value.borderStyle
      this._borderStyleWaterFlowMod.mBorderStyle = value.borderStyle
      this._borderStyleWebMod.mBorderStyle = value.borderStyle
      this._borderStyleXComponentMod.mBorderStyle = value.borderStyle
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').key(this.componentKey).attributeModifier(this._borderStyleButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._borderStyleTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow)
        } else if (this.targetView == 'Checkbox') {
          Checkbox()
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          })
        } else if (this.targetView == 'Divider') {
          Divider()
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon'))
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ])
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress()
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          })
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
        } else if (this.targetView == 'Search') {
          Search()
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }])
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          })
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          })
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
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
          }
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }
        } else if (this.targetView == 'Counter') {
          Counter() {
          }
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }
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
          }
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
          
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }
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
          }
        } else if (this.targetView == 'Row') {
          Row()
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }
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
          }.scrollBar(BarState.On)
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
          }
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
          }
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1')
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
          }
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            
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
            
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                
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