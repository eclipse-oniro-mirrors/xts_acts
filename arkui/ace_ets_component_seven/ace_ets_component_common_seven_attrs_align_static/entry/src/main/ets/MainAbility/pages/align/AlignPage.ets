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
import { attrsManager } from '../../common/AttrsManager';
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
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, Alignment, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`align page show ${JSON.stringify(this.mAlign)}`)
   instance.align(this.mAlign)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: BadgeAttribute): void {
   instance.align(this.mAlign)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: BlankAttribute): void {
   instance.align(this.mAlign)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ButtonAttribute): void {
   instance.align(this.mAlign)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
   instance.align(this.mAlign)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: CheckboxAttribute): void {
   instance.align(this.mAlign)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
   instance.align(this.mAlign)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ColumnAttribute): void {
   instance.align(this.mAlign)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
   instance.align(this.mAlign)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: CounterAttribute): void {
   instance.align(this.mAlign)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: DataPanelAttribute): void {
   instance.align(this.mAlign)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: DatePickerAttribute): void {
   instance.align(this.mAlign)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: DividerAttribute): void {
   instance.align(this.mAlign)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: EffectComponentAttribute): void {
   instance.align(this.mAlign)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: FlexAttribute): void {
   instance.align(this.mAlign)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: FlowItemAttribute): void {
   instance.align(this.mAlign)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: FormComponentAttribute): void {
   instance.align(this.mAlign)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: FormLinkAttribute): void {
   instance.align(this.mAlign)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: GaugeAttribute): void {
   instance.align(this.mAlign)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: GridAttribute): void {
   instance.align(this.mAlign)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: GridColAttribute): void {
   instance.align(this.mAlign)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: GridItemAttribute): void {
   instance.align(this.mAlign)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: GridRowAttribute): void {
   instance.align(this.mAlign)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: HyperlinkAttribute): void {
   instance.align(this.mAlign)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
   instance.align(this.mAlign)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ImageSpanAttribute): void {
   instance.align(this.mAlign)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ImageAttribute): void {
   instance.align(this.mAlign)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ListAttribute): void {
   instance.align(this.mAlign)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ListItemAttribute): void {
   instance.align(this.mAlign)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
   instance.align(this.mAlign)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
   instance.align(this.mAlign)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: MarqueeAttribute): void {
   instance.align(this.mAlign)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: MenuAttribute): void {
   instance.align(this.mAlign)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: MenuItemAttribute): void {
   instance.align(this.mAlign)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
   instance.align(this.mAlign)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: NavDestinationAttribute): void {
   instance.align(this.mAlign)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: NavigationAttribute): void {
   instance.align(this.mAlign)
  }
}












class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: PatternLockAttribute): void {
   instance.align(this.mAlign)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: PluginComponentAttribute): void {
   instance.align(this.mAlign)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: QRCodeAttribute): void {
   instance.align(this.mAlign)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RadioAttribute): void {
   instance.align(this.mAlign)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RatingAttribute): void {
   instance.align(this.mAlign)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RefreshAttribute): void {
   instance.align(this.mAlign)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
   instance.align(this.mAlign)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
   instance.align(this.mAlign)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RichEditorAttribute): void {
   instance.align(this.mAlign)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RichTextAttribute): void {
   instance.align(this.mAlign)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RowAttribute): void {
   instance.align(this.mAlign)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: RowSplitAttribute): void {
   instance.align(this.mAlign)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ScrollAttribute): void {
   instance.align(this.mAlign)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ScrollBarAttribute): void {
   instance.align(this.mAlign)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: SearchAttribute): void {
   instance.align(this.mAlign)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: SelectAttribute): void {
   instance.align(this.mAlign)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
   instance.align(this.mAlign)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: SliderAttribute): void {
   instance.align(this.mAlign)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: StackAttribute): void {
   instance.align(this.mAlign)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: SwiperAttribute): void {
   instance.align(this.mAlign)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TabContentAttribute): void {
   instance.align(this.mAlign)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TabsAttribute): void {
   instance.align(this.mAlign)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TextAttribute): void {
   instance.align(this.mAlign)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TextAreaAttribute): void {
   instance.align(this.mAlign)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TextClockAttribute): void {
   instance.align(this.mAlign)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TextInputAttribute): void {
   instance.align(this.mAlign)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TextPickerAttribute): void {
   instance.align(this.mAlign)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TextTimerAttribute): void {
   instance.align(this.mAlign)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: TimePickerAttribute): void {
   instance.align(this.mAlign)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: ToggleAttribute): void {
   instance.align(this.mAlign)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
   instance.align(this.mAlign)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: WaterFlowAttribute): void {
   instance.align(this.mAlign)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: WebAttribute): void {
   instance.align(this.mAlign)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mAlign: Alignment = Alignment.Top
  applyNormalAttribute(instance: XComponentAttribute): void {
   instance.align(this.mAlign)
  }
}

@Entry
@Component
struct alignPage {
  @State _align: Alignment = Alignment.Bottom
  @State _alignAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _alignBadgeMod: BadgeModifier = new BadgeModifier()
  @State _alignBlankMod: BlankModifier = new BlankModifier()
  @State _alignButtonMod: ButtonModifier = new ButtonModifier()
  @State _alignCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _alignCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _alignCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _alignColumnMod: ColumnModifier = new ColumnModifier()
  @State _alignColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _alignCounterMod: CounterModifier = new CounterModifier()
  @State _alignDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _alignDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _alignDividerMod: DividerModifier = new DividerModifier()
  @State _alignEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _alignFlexMod: FlexModifier = new FlexModifier()
  @State _alignFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _alignFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _alignFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _alignGaugeMod: GaugeModifier = new GaugeModifier()
  @State _alignGridMod: GridModifier = new GridModifier()
  @State _alignGridColMod: GridColModifier = new GridColModifier()
  @State _alignGridItemMod: GridItemModifier = new GridItemModifier()
  @State _alignGridRowMod: GridRowModifier = new GridRowModifier()
  @State _alignHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _alignImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _alignImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _alignImageMod: ImageModifier = new ImageModifier()
  @State _alignListMod: ListModifier = new ListModifier()
  @State _alignListItemMod: ListItemModifier = new ListItemModifier()
  @State _alignListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _alignLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _alignMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _alignMenuMod: MenuModifier = new MenuModifier()
  @State _alignMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _alignMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _alignNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _alignNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _alignPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _alignPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _alignQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _alignRadioMod: RadioModifier = new RadioModifier()
  @State _alignRatingMod: RatingModifier = new RatingModifier()
  @State _alignRefreshMod: RefreshModifier = new RefreshModifier()
  @State _alignRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _alignRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _alignRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _alignRichTextMod: RichTextModifier = new RichTextModifier()
  @State _alignRowMod: RowModifier = new RowModifier()
  @State _alignRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _alignScrollMod: ScrollModifier = new ScrollModifier()
  @State _alignScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _alignSearchMod: SearchModifier = new SearchModifier()
  @State _alignSelectMod: SelectModifier = new SelectModifier()
  @State _alignSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _alignSliderMod: SliderModifier = new SliderModifier()
  @State _alignStackMod: StackModifier = new StackModifier()
  @State _alignSwiperMod: SwiperModifier = new SwiperModifier()
  @State _alignTabContentMod: TabContentModifier = new TabContentModifier()
  @State _alignTabsMod: TabsModifier = new TabsModifier()
  @State _alignTextMod: TextModifier = new TextModifier()
  @State _alignTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _alignTextClockMod: TextClockModifier = new TextClockModifier()
  @State _alignTextInputMod: TextInputModifier = new TextInputModifier()
  @State _alignTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _alignTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _alignTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _alignToggleMod: ToggleModifier = new ToggleModifier()
  @State _alignUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _alignWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _alignWebMod: WebModifier = new WebModifier()
  @State _alignXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State columns: int = 0
  @State gutter: int = 0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('align page show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    this._alignButtonMod.mAlign = routerParamOptions.view.testValue.setValue.align
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as  string
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    attrsManager.registerDataChange((value: SetValue) => {
      
      console.info('[registerDataChange] ' + value.align)
      this._alignAlphabetIndexerMod.mAlign = value.align
      this._alignBadgeMod.mAlign = value.align
      this._alignBlankMod.mAlign = value.align
      this._alignButtonMod.mAlign = value.align
      this._alignCalendarPickerMod.mAlign = value.align
      this._alignCheckboxMod.mAlign = value.align
      this._alignCheckboxGroupMod.mAlign = value.align
      this._alignColumnMod.mAlign = value.align
      this._alignColumnSplitMod.mAlign = value.align
      this._alignCounterMod.mAlign = value.align
      this._alignDataPanelMod.mAlign = value.align
      this._alignDatePickerMod.mAlign = value.align
      this._alignDividerMod.mAlign = value.align
      this._alignEffectComponentMod.mAlign = value.align
      this._alignFlexMod.mAlign = value.align
      this._alignFlowItemMod.mAlign = value.align
      this._alignFormComponentMod.mAlign = value.align
      this._alignFormLinkMod.mAlign = value.align
      this._alignGaugeMod.mAlign = value.align
      this._alignGridMod.mAlign = value.align
      this._alignGridColMod.mAlign = value.align
      this._alignGridItemMod.mAlign = value.align
      this._alignGridRowMod.mAlign = value.align
      this._alignHyperlinkMod.mAlign = value.align
      this._alignImageAnimatorMod.mAlign = value.align
      this._alignImageSpanMod.mAlign = value.align
      this._alignImageMod.mAlign = value.align
      this._alignListMod.mAlign = value.align
      this._alignListItemMod.mAlign = value.align
      this._alignListItemGroupMod.mAlign = value.align
      this._alignLoadingProgressMod.mAlign = value.align
      this._alignMarqueeMod.mAlign = value.align
      this._alignMenuMod.mAlign = value.align
      this._alignMenuItemMod.mAlign = value.align
      this._alignMenuItemGroupMod.mAlign = value.align
      this._alignNavDestinationMod.mAlign = value.align
      
      this._alignNavigationMod.mAlign = value.align
      
      this._alignPatternLockMod.mAlign = value.align
      this._alignPluginComponentMod.mAlign = value.align
      this._alignQRCodeMod.mAlign = value.align
      this._alignRadioMod.mAlign = value.align
      this._alignRatingMod.mAlign = value.align
      this._alignRefreshMod.mAlign = value.align
      this._alignRelativeContainerMod.mAlign = value.align
      this._alignRemoteWindowMod.mAlign = value.align
      this._alignRichEditorMod.mAlign = value.align
      this._alignRichTextMod.mAlign = value.align
      this._alignRowMod.mAlign = value.align
      this._alignRowSplitMod.mAlign = value.align
      this._alignScrollMod.mAlign = value.align
      this._alignScrollBarMod.mAlign = value.align
      this._alignSearchMod.mAlign = value.align
      this._alignSelectMod.mAlign = value.align
      this._alignSideBarContainerMod.mAlign = value.align
      this._alignSliderMod.mAlign = value.align
      this._alignStackMod.mAlign = value.align
      this._alignSwiperMod.mAlign = value.align
      this._alignTabContentMod.mAlign = value.align
      this._alignTabsMod.mAlign = value.align
      this._alignTextMod.mAlign = value.align
      this._alignTextAreaMod.mAlign = value.align
      this._alignTextClockMod.mAlign = value.align
      this._alignTextInputMod.mAlign = value.align
      this._alignTextPickerMod.mAlign = value.align
      this._alignTextTimerMod.mAlign = value.align
      this._alignTimePickerMod.mAlign = value.align
      this._alignToggleMod.mAlign = value.align
      this._alignUIExtensionComponentMod.mAlign = value.align
      this._alignWaterFlowMod.mAlign = value.align
      this._alignWebMod.mAlign = value.align
      this._alignXComponentMod.mAlign = value.align
    })
  }

  
  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').width(100).height(100).key(this.componentKey).attributeModifier(this._alignButtonMod)
        } else if (this.targetView == 'Text') {
          Text('textAlign').fontSize(9).fontColor(0xCCCCCC).attributeModifier(this._alignTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._alignAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._alignBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._alignCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._alignCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._alignDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._alignDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._alignDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._alignGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._alignImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._alignImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._alignLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._alignMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._alignMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._alignQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._alignRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._alignRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._alignScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._alignSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._alignSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._alignSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._alignTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._alignTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .attributeModifier(this._alignTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._alignTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._alignTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._alignToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._alignWebMod)
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
          }.attributeModifier(this._alignBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._alignColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._alignColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._alignCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._alignFlexMod)
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
          }.attributeModifier(this._alignGridRowMod)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], (item: string) => {
              ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                GridItem() {
                  Text(day).backgroundColor(Color.White)
                    .width('100%').height('100%')
                    
                }
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .attributeModifier(this._alignGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._alignListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                
                .backgroundColor(Color.White)
            }.attributeModifier(this._alignListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._alignListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._alignRefreshMod)
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
          }.attributeModifier(this._alignRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._alignRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._alignRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._alignScrollMod)
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
          }.attributeModifier(this._alignStackMod)
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
          }.attributeModifier(this._alignTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._alignTabContentMod)
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
          }.attributeModifier(this._alignWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._alignGridColMod)
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
              .attributeModifier(this._alignFlowItemMod)
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
                
            }.rowStart(1).rowEnd(4)
            .attributeModifier(this._alignGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._alignMenuItemMod)
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
              .attributeModifier(this._alignMenuItemGroupMod)
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