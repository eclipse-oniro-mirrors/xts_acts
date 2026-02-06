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
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mHueRotate: number | string = 10
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`hueRotate page show ${JSON.stringify(this.mHueRotate)}`)
    instance.hueRotate(this.mHueRotate)
  }
}

@Entry
@Component
struct hueRotatePage {
  
  @State _hueRotateAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _hueRotateBadgeMod: BadgeModifier = new BadgeModifier()
  @State _hueRotateBlankMod: BlankModifier = new BlankModifier()
  @State _hueRotateButttonMod: ButtonModifier = new ButtonModifier()
  @State _hueRotateCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _hueRotateCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _hueRotateCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _hueRotateColumnMod: ColumnModifier = new ColumnModifier()
  @State _hueRotateColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _hueRotateCounterMod: CounterModifier = new CounterModifier()
  @State _hueRotateDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _hueRotateDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _hueRotateDividerMod: DividerModifier = new DividerModifier()
  @State _hueRotateEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _hueRotateFlexMod: FlexModifier = new FlexModifier()
  @State _hueRotateFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _hueRotateFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _hueRotateFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _hueRotateGaugeMod: GaugeModifier = new GaugeModifier()
  @State _hueRotateGridMod: GridModifier = new GridModifier()
  @State _hueRotateGridColMod: GridColModifier = new GridColModifier()
  @State _hueRotateGridItemMod: GridItemModifier = new GridItemModifier()
  @State _hueRotateGridRowMod: GridRowModifier = new GridRowModifier()
  @State _hueRotateHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _hueRotateImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _hueRotateImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _hueRotateImageMod: ImageModifier = new ImageModifier()
  @State _hueRotateListMod: ListModifier = new ListModifier()
  @State _hueRotateListItemMod: ListItemModifier = new ListItemModifier()
  @State _hueRotateListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _hueRotateLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _hueRotateMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _hueRotateMenuMod: MenuModifier = new MenuModifier()
  @State _hueRotateMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _hueRotateMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _hueRotateNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _hueRotateNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _hueRotatePatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _hueRotatePluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _hueRotateQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _hueRotateRadioMod: RadioModifier = new RadioModifier()
  @State _hueRotateRatingMod: RatingModifier = new RatingModifier()
  @State _hueRotateRefreshMod: RefreshModifier = new RefreshModifier()
  @State _hueRotateRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _hueRotateRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _hueRotateRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _hueRotateRichTextMod: RichTextModifier = new RichTextModifier()
  @State _hueRotateRowMod: RowModifier = new RowModifier()
  @State _hueRotateRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _hueRotateScrollMod: ScrollModifier = new ScrollModifier()
  @State _hueRotateScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _hueRotateSearchMod: SearchModifier = new SearchModifier()
  @State _hueRotateSelectMod: SelectModifier = new SelectModifier()
  @State _hueRotateSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _hueRotateSliderMod: SliderModifier = new SliderModifier()
  @State _hueRotateStackMod: StackModifier = new StackModifier()
  @State _hueRotateSwiperMod: SwiperModifier = new SwiperModifier()
  @State _hueRotateTabContentMod: TabContentModifier = new TabContentModifier()
  @State _hueRotateTabsMod: TabsModifier = new TabsModifier()
  @State _hueRotateTextMod: TextModifier = new TextModifier()
  @State _hueRotateTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _hueRotateTextClockMod: TextClockModifier = new TextClockModifier()
  @State _hueRotateTextInputMod: TextInputModifier = new TextInputModifier()
  @State _hueRotateTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _hueRotateTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _hueRotateTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _hueRotateToggleMod: ToggleModifier = new ToggleModifier()
  @State _hueRotateUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _hueRotateWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _hueRotateWebMod: WebModifier = new WebModifier()
  @State _hueRotateXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0;
  @State parentHeight: double = 0;
  @State columns: int = 0
  @State gutter: int = 0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 hueRotate page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._hueRotateAlphabetIndexerMod.mHueRotate = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.hueRotate
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.hueRotate))
      this._hueRotateAlphabetIndexerMod.mHueRotate = value.hueRotate
      this._hueRotateBadgeMod.mHueRotate = value.hueRotate
      this._hueRotateBlankMod.mHueRotate = value.hueRotate
      this._hueRotateButttonMod.mHueRotate = value.hueRotate
      this._hueRotateCalendarPickerMod.mHueRotate = value.hueRotate
      this._hueRotateCheckboxMod.mHueRotate = value.hueRotate
      this._hueRotateCheckboxGroupMod.mHueRotate = value.hueRotate
      this._hueRotateColumnMod.mHueRotate = value.hueRotate
      this._hueRotateColumnSplitMod.mHueRotate = value.hueRotate
      this._hueRotateCounterMod.mHueRotate = value.hueRotate
      this._hueRotateDataPanelMod.mHueRotate = value.hueRotate
      this._hueRotateDatePickerMod.mHueRotate = value.hueRotate
      this._hueRotateDividerMod.mHueRotate = value.hueRotate
      this._hueRotateEffectComponentMod.mHueRotate = value.hueRotate
      this._hueRotateFlexMod.mHueRotate = value.hueRotate
      this._hueRotateFlowItemMod.mHueRotate = value.hueRotate
      this._hueRotateFormComponentMod.mHueRotate = value.hueRotate
      this._hueRotateFormLinkMod.mHueRotate = value.hueRotate
      this._hueRotateGaugeMod.mHueRotate = value.hueRotate
      this._hueRotateGridMod.mHueRotate = value.hueRotate
      this._hueRotateGridColMod.mHueRotate = value.hueRotate
      this._hueRotateGridItemMod.mHueRotate = value.hueRotate
      this._hueRotateGridRowMod.mHueRotate = value.hueRotate
      this._hueRotateHyperlinkMod.mHueRotate = value.hueRotate
      this._hueRotateImageAnimatorMod.mHueRotate = value.hueRotate
      this._hueRotateImageSpanMod.mHueRotate = value.hueRotate
      this._hueRotateImageMod.mHueRotate = value.hueRotate
      this._hueRotateListMod.mHueRotate = value.hueRotate
      this._hueRotateListItemMod.mHueRotate = value.hueRotate
      this._hueRotateListItemGroupMod.mHueRotate = value.hueRotate
      this._hueRotateLoadingProgressMod.mHueRotate = value.hueRotate
      this._hueRotateMarqueeMod.mHueRotate = value.hueRotate
      this._hueRotateMenuMod.mHueRotate = value.hueRotate
      this._hueRotateMenuItemMod.mHueRotate = value.hueRotate
      this._hueRotateMenuItemGroupMod.mHueRotate = value.hueRotate
      this._hueRotateNavDestinationMod.mHueRotate = value.hueRotate
      
      this._hueRotateNavigationMod.mHueRotate = value.hueRotate
      
      this._hueRotatePatternLockMod.mHueRotate = value.hueRotate
      this._hueRotatePluginComponentMod.mHueRotate = value.hueRotate
      this._hueRotateQRCodeMod.mHueRotate = value.hueRotate
      this._hueRotateRadioMod.mHueRotate = value.hueRotate
      this._hueRotateRatingMod.mHueRotate = value.hueRotate
      this._hueRotateRefreshMod.mHueRotate = value.hueRotate
      this._hueRotateRelativeContainerMod.mHueRotate = value.hueRotate
      this._hueRotateRemoteWindowMod.mHueRotate = value.hueRotate
      this._hueRotateRichEditorMod.mHueRotate = value.hueRotate
      this._hueRotateRichTextMod.mHueRotate = value.hueRotate
      this._hueRotateRowMod.mHueRotate = value.hueRotate
      this._hueRotateRowSplitMod.mHueRotate = value.hueRotate
      this._hueRotateScrollMod.mHueRotate = value.hueRotate
      this._hueRotateScrollBarMod.mHueRotate = value.hueRotate
      this._hueRotateSearchMod.mHueRotate = value.hueRotate
      this._hueRotateSelectMod.mHueRotate = value.hueRotate
      this._hueRotateSideBarContainerMod.mHueRotate = value.hueRotate
      this._hueRotateSliderMod.mHueRotate = value.hueRotate
      this._hueRotateStackMod.mHueRotate = value.hueRotate
      this._hueRotateSwiperMod.mHueRotate = value.hueRotate
      this._hueRotateTabContentMod.mHueRotate = value.hueRotate
      this._hueRotateTabsMod.mHueRotate = value.hueRotate
      this._hueRotateTextMod.mHueRotate = value.hueRotate
      this._hueRotateTextAreaMod.mHueRotate = value.hueRotate
      this._hueRotateTextClockMod.mHueRotate = value.hueRotate
      this._hueRotateTextInputMod.mHueRotate = value.hueRotate
      this._hueRotateTextPickerMod.mHueRotate = value.hueRotate
      this._hueRotateTextTimerMod.mHueRotate = value.hueRotate
      this._hueRotateTimePickerMod.mHueRotate = value.hueRotate
      this._hueRotateToggleMod.mHueRotate = value.hueRotate
      this._hueRotateUIExtensionComponentMod.mHueRotate = value.hueRotate
      this._hueRotateWaterFlowMod.mHueRotate = value.hueRotate
      this._hueRotateWebMod.mHueRotate = value.hueRotate
      this._hueRotateXComponentMod.mHueRotate = value.hueRotate
  
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._hueRotateButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._hueRotateTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .key(this.componentKey)
          .attributeModifier(this._hueRotateAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._hueRotateBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._hueRotateCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._hueRotateCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._hueRotateDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._hueRotateDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._hueRotateDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._hueRotateGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._hueRotateImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._hueRotateImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._hueRotateLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._hueRotateMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._hueRotateMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._hueRotateQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._hueRotateRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._hueRotateRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._hueRotateScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._hueRotateSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._hueRotateSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._hueRotateSliderMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._hueRotateTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._hueRotateTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._hueRotateTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._hueRotateToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._hueRotateWebMod)
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
          }.attributeModifier(this._hueRotateBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._hueRotateColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._hueRotateColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._hueRotateCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._hueRotateFlexMod)
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
          }.attributeModifier(this._hueRotateGridRowMod)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], (item:string) => {
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
          .attributeModifier(this._hueRotateGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._hueRotateListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._hueRotateListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._hueRotateListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._hueRotateRefreshMod)
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
          }.attributeModifier(this._hueRotateRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._hueRotateRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._hueRotateRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._hueRotateScrollMod)
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
          }.attributeModifier(this._hueRotateStackMod)
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
          }.attributeModifier(this._hueRotateTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._hueRotateTabContentMod)
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
          }.attributeModifier(this._hueRotateWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._hueRotateGridColMod)
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
              .attributeModifier(this._hueRotateFlowItemMod)
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
            .attributeModifier(this._hueRotateGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._hueRotateMenuItemMod)
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
              .attributeModifier(this._hueRotateMenuItemGroupMod)
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