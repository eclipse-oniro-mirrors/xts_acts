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
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, RichText, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mBackgroundColor: int | string = 0
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`borderColor page show ${JSON.stringify(this.mBackgroundColor)}`)
    instance.backgroundColor(this.mBackgroundColor)
  }
}







@Entry
@Component
struct BackroundColorPage {
  
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  
  private src: string = 'Running Marquee starts rolling'
  
  private value: string[] = ['#', 'A', 'B']
  
  public valueArr: number[] = [5, 10, 10, 7, 9, 10, 10, 10, 10] as number[]
  @State _backgroundColor: number | string = 0.0
  
  @State _backgroundColorAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _backgroundColorBadgeMod: BadgeModifier = new BadgeModifier()
  
  @State _backgroundColorBlankMod: BlankModifier = new BlankModifier()
  @State _backgroundColorButtonMod: ButtonModifier = new ButtonModifier()
  
  @State _backgroundColorCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _backgroundColorCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _backgroundColorCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _backgroundColorColumnMod: ColumnModifier = new ColumnModifier()
  @State _backgroundColorColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _backgroundColorCounterMod: CounterModifier = new CounterModifier()
  @State _backgroundColorDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _backgroundColorDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _backgroundColorDividerMod: DividerModifier = new DividerModifier()
  
  @State _backgroundColorEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _backgroundColorFlexMod: FlexModifier = new FlexModifier()
  @State _backgroundColorFlowItemMod: FlowItemModifier = new FlowItemModifier()
  
  @State _backgroundColorFormComponentMod: FormComponentModifier = new FormComponentModifier()
  
  @State _backgroundColorFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _backgroundColorGaugeMod: GaugeModifier = new GaugeModifier()
  @State _backgroundColorGridMod: GridModifier = new GridModifier()
  @State _backgroundColorGridColMod: GridColModifier = new GridColModifier()
  @State _backgroundColorGridItemMod: GridItemModifier = new GridItemModifier()
  @State _backgroundColorGridRowMod: GridRowModifier = new GridRowModifier()
  
  @State _backgroundColorHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _backgroundColorImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  
  @State _backgroundColorImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _backgroundColorImageMod: ImageModifier = new ImageModifier()
  @State _backgroundColorListMod: ListModifier = new ListModifier()
  @State _backgroundColorListItemMod: ListItemModifier = new ListItemModifier()
  
  @State _backgroundColorListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _backgroundColorLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _backgroundColorMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _backgroundColorMenuMod: MenuModifier = new MenuModifier()
  @State _backgroundColorMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _backgroundColorMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  
  @State _backgroundColorNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _backgroundColorNavigationMod: NavigationModifier = new NavigationModifier()
  
  
  @State _backgroundColorPatternLockMod: PatternLockModifier = new PatternLockModifier()
  
  @State _backgroundColorPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  
  @State _backgroundColorQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _backgroundColorRadioMod: RadioModifier = new RadioModifier()
  @State _backgroundColorRatingMod: RatingModifier = new RatingModifier()
  @State _backgroundColorRefreshMod: RefreshModifier = new RefreshModifier()
  @State _backgroundColorRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  
  @State _backgroundColorRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  
  @State _backgroundColorRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _backgroundColorRichTextMod: RichTextModifier = new RichTextModifier()
  @State _backgroundColorRowMod: RowModifier = new RowModifier()
  @State _backgroundColorRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _backgroundColorScrollMod: ScrollModifier = new ScrollModifier()
  @State _backgroundColorScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _backgroundColorSearchMod: SearchModifier = new SearchModifier()
  @State _backgroundColorSelectMod: SelectModifier = new SelectModifier()
  @State _backgroundColorSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _backgroundColorSliderMod: SliderModifier = new SliderModifier()
  @State _backgroundColorStackMod: StackModifier = new StackModifier()
  @State _backgroundColorSwiperMod: SwiperModifier = new SwiperModifier()
  @State _backgroundColorTabContentMod: TabContentModifier = new TabContentModifier()
  @State _backgroundColorTabsMod: TabsModifier = new TabsModifier()
  @State _backgroundColorTextMod: TextModifier = new TextModifier()
  @State _backgroundColorTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _backgroundColorTextClockMod: TextClockModifier = new TextClockModifier()
  @State _backgroundColorTextInputMod: TextInputModifier = new TextInputModifier()
  @State _backgroundColorTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _backgroundColorTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _backgroundColorTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _backgroundColorToggleMod: ToggleModifier = new ToggleModifier()
  
  @State _backgroundColorUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _backgroundColorWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _backgroundColorWebMod: WebModifier = new WebModifier()
  
  @State _backgroundColorXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State parentBackGroundColor: string = ''
  @State parentComponentKey: string =  '';
  @State BackGroundColor: string = ''
  @State columns: int = 0
  @State gutter: int = 0

  onPageShow() {
    console.info('backgroundcolor page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.parentBackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    // this.BackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.BackGroundColor
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this._backgroundColorButtonMod.mBackgroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.backgroundColor
    attrsManager.registerDataChange((value: SetValue) => {

      console.info('[registerDataChange] ' + value.backgroundColor)
      this._backgroundColorAlphabetIndexerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorBadgeMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorBlankMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorButtonMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorCalendarPickerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorCheckboxMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorCheckboxGroupMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorColumnMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorColumnSplitMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorCounterMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorDataPanelMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorDatePickerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorDividerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorEffectComponentMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorFlexMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorFlowItemMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorFormComponentMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorFormLinkMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorGaugeMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorGridMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorGridColMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorGridItemMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorGridRowMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorHyperlinkMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorImageAnimatorMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorImageSpanMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorImageMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorListMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorListItemMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorListItemGroupMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorLoadingProgressMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorMarqueeMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorMenuMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorMenuItemMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorMenuItemGroupMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorNavDestinationMod.mBackgroundColor = value.backgroundColor
      
      this._backgroundColorNavigationMod.mBackgroundColor = value.backgroundColor
      
      this._backgroundColorPatternLockMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorPluginComponentMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorQRCodeMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRadioMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRatingMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRefreshMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRelativeContainerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRemoteWindowMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRichEditorMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRichTextMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRowMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorRowSplitMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorScrollMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorScrollBarMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorSearchMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorSelectMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorSideBarContainerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorSliderMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorStackMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorSwiperMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTabContentMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTabsMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTextMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTextAreaMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTextClockMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTextInputMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTextPickerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTextTimerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorTimePickerMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorToggleMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorUIExtensionComponentMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorWaterFlowMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorWebMod.mBackgroundColor = value.backgroundColor
      this._backgroundColorXComponentMod.mBackgroundColor = value.backgroundColor
      console.info('[registerDataChange] ' + this._backgroundColorButtonMod.mBackgroundColor)
    })
  }

 
 
 
 

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').width(100).height(100).key(this.componentKey).attributeModifier(this._backgroundColorButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._backgroundColorTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            .attributeModifier(this._backgroundColorAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._backgroundColorBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._backgroundColorCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._backgroundColorCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            .attributeModifier(this._backgroundColorDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._backgroundColorDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._backgroundColorDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._backgroundColorGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._backgroundColorImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._backgroundColorImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._backgroundColorLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._backgroundColorMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._backgroundColorMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._backgroundColorQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._backgroundColorRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._backgroundColorRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._backgroundColorScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._backgroundColorSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
          { value: 'bbb' }]).attributeModifier(this._backgroundColorSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._backgroundColorSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._backgroundColorTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._backgroundColorTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
            .attributeModifier(this._backgroundColorTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._backgroundColorTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._backgroundColorTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .attributeModifier(this._backgroundColorToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
            .attributeModifier(this._backgroundColorWebMod)
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
          }.attributeModifier(this._backgroundColorBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._backgroundColorColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._backgroundColorColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._backgroundColorCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._backgroundColorFlexMod)
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
          }.attributeModifier(this._backgroundColorGridRowMod)
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
            .attributeModifier(this._backgroundColorGridMod)
            .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._backgroundColorListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._backgroundColorListItemMod)
          }
          .width('100%')
            .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._backgroundColorListItemGroupMod)
          }.backgroundColor(Color.Pink)
            .width('100%')
            .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._backgroundColorRefreshMod)
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
          }.attributeModifier(this._backgroundColorRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._backgroundColorRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._backgroundColorRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._backgroundColorScrollMod)
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
          }.attributeModifier(this._backgroundColorStackMod)
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
          }.attributeModifier(this._backgroundColorTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._backgroundColorTabContentMod)
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
          }.attributeModifier(this._backgroundColorWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._backgroundColorGridColMod)
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
              .attributeModifier(this._backgroundColorFlowItemMod)
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
              .attributeModifier(this._backgroundColorGridItemMod)
              .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
            .width('100%')
            .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._backgroundColorMenuItemMod)
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
              .attributeModifier(this._backgroundColorMenuItemGroupMod)
            }.backgroundColor(Color.Yellow)
              .width('100%')
              .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'RichText') {
          RichText('RichText').height(100).backgroundColor(this.BackGroundColor).attributeModifier(this._backgroundColorRichTextMod)
        } else if (this.targetView == 'TextInput') {
          TextInput({ placeholder: 'input your word...' }).height(100).attributeModifier(this._backgroundColorTextInputMod)
        }


      }
      .width('100%')
        .height(this.parentHeight)
        .backgroundColor(Color.Pink)
        .key(this.parentComponentKey)
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Yellow)
  }
}