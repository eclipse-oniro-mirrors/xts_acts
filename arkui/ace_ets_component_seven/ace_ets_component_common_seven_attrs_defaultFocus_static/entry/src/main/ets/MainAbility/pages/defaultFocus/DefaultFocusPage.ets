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
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: BadgeAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: BlankAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ButtonAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: CheckboxAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ColumnAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: CounterAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: DataPanelAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: DatePickerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: DividerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: EffectComponentAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: FlexAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: FlowItemAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: FormComponentAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: FormLinkAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: GaugeAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: GridAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: GridColAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: GridItemAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: GridRowAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: HyperlinkAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ImageSpanAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ImageAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ListAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ListItemAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: MarqueeAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: MenuAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: MenuItemAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: NavDestinationAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: NavigationAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}












class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: PatternLockAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: PluginComponentAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: QRCodeAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RadioAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RatingAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RefreshAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RichEditorAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RichTextAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RowAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: RowSplitAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ScrollAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ScrollBarAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: SearchAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: SelectAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: SliderAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: StackAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: SwiperAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TabContentAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TabsAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TextAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TextAreaAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TextClockAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TextInputAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TextPickerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TextTimerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: TimePickerAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: ToggleAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: WaterFlowAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: WebAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mDefaultFocus: boolean = true
  applyNormalAttribute(instance: XComponentAttribute): void {
   instance.defaultFocus(this.mDefaultFocus)
  }
}

@Entry
@Component
struct defaultFocusPage {
  @State _defaultFocus: boolean = true
  @State _defaultFocusAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _defaultFocusBadgeMod: BadgeModifier = new BadgeModifier()
  @State _defaultFocusBlankMod: BlankModifier = new BlankModifier()
  @State _defaultFocusButtonMod: ButtonModifier = new ButtonModifier()
  @State _defaultFocusCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _defaultFocusCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _defaultFocusCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _defaultFocusColumnMod: ColumnModifier = new ColumnModifier()
  @State _defaultFocusColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _defaultFocusCounterMod: CounterModifier = new CounterModifier()
  @State _defaultFocusDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _defaultFocusDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _defaultFocusDividerMod: DividerModifier = new DividerModifier()
  @State _defaultFocusEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _defaultFocusFlexMod: FlexModifier = new FlexModifier()
  @State _defaultFocusFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _defaultFocusFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _defaultFocusFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _defaultFocusGaugeMod: GaugeModifier = new GaugeModifier()
  @State _defaultFocusGridMod: GridModifier = new GridModifier()
  @State _defaultFocusGridColMod: GridColModifier = new GridColModifier()
  @State _defaultFocusGridItemMod: GridItemModifier = new GridItemModifier()
  @State _defaultFocusGridRowMod: GridRowModifier = new GridRowModifier()
  @State _defaultFocusHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _defaultFocusImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _defaultFocusImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _defaultFocusImageMod: ImageModifier = new ImageModifier()
  @State _defaultFocusListMod: ListModifier = new ListModifier()
  @State _defaultFocusListItemMod: ListItemModifier = new ListItemModifier()
  @State _defaultFocusListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _defaultFocusLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _defaultFocusMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _defaultFocusMenuMod: MenuModifier = new MenuModifier()
  @State _defaultFocusMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _defaultFocusMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _defaultFocusNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()

  @State _defaultFocusNavigationMod: NavigationModifier = new NavigationModifier()

  @State _defaultFocusPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _defaultFocusPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _defaultFocusQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _defaultFocusRadioMod: RadioModifier = new RadioModifier()
  @State _defaultFocusRatingMod: RatingModifier = new RatingModifier()
  @State _defaultFocusRefreshMod: RefreshModifier = new RefreshModifier()
  @State _defaultFocusRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _defaultFocusRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _defaultFocusRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _defaultFocusRichTextMod: RichTextModifier = new RichTextModifier()
  @State _defaultFocusRowMod: RowModifier = new RowModifier()
  @State _defaultFocusRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _defaultFocusScrollMod: ScrollModifier = new ScrollModifier()
  @State _defaultFocusScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _defaultFocusSearchMod: SearchModifier = new SearchModifier()
  @State _defaultFocusSelectMod: SelectModifier = new SelectModifier()
  @State _defaultFocusSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _defaultFocusSliderMod: SliderModifier = new SliderModifier()
  @State _defaultFocusStackMod: StackModifier = new StackModifier()
  @State _defaultFocusSwiperMod: SwiperModifier = new SwiperModifier()
  @State _defaultFocusTabContentMod: TabContentModifier = new TabContentModifier()
  @State _defaultFocusTabsMod: TabsModifier = new TabsModifier()
  @State _defaultFocusTextMod: TextModifier = new TextModifier()
  @State _defaultFocusTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _defaultFocusTextClockMod: TextClockModifier = new TextClockModifier()
  @State _defaultFocusTextInputMod: TextInputModifier = new TextInputModifier()
  @State _defaultFocusTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _defaultFocusTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _defaultFocusTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _defaultFocusToggleMod: ToggleModifier = new ToggleModifier()
  @State _defaultFocusUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _defaultFocusWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _defaultFocusWebMod: WebModifier = new WebModifier()
  @State _defaultFocusXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string =  '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State columns: int =  0
  @State gutter: int =  0
  @State parentComponentKey: string =  '';

  onPageShow() {
    console.info('defaultFocus page show called ')
    this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
    this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
    this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
    this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
    this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
    this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
    this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
    this._defaultFocusButtonMod.mDefaultFocus = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.defaultFocus
    attrsManager.registerDataChange((value: SetValue) => {
      
      console.info('[registerDataChange] ' + value.defaultFocus)
      this._defaultFocusAlphabetIndexerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusBadgeMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusBlankMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusButtonMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusCalendarPickerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusCheckboxMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusCheckboxGroupMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusColumnMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusColumnSplitMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusCounterMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusDataPanelMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusDatePickerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusDividerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusEffectComponentMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusFlexMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusFlowItemMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusFormComponentMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusFormLinkMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusGaugeMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusGridMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusGridColMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusGridItemMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusGridRowMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusHyperlinkMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusImageAnimatorMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusImageSpanMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusImageMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusListMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusListItemMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusListItemGroupMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusLoadingProgressMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusMarqueeMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusMenuMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusMenuItemMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusMenuItemGroupMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusNavDestinationMod.mDefaultFocus = value.defaultFocus
      
      this._defaultFocusNavigationMod.mDefaultFocus = value.defaultFocus
      
      this._defaultFocusPatternLockMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusPluginComponentMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusQRCodeMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRadioMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRatingMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRefreshMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRelativeContainerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRemoteWindowMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRichEditorMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRichTextMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRowMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusRowSplitMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusScrollMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusScrollBarMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusSearchMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusSelectMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusSideBarContainerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusSliderMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusStackMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusSwiperMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTabContentMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTabsMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTextMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTextAreaMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTextClockMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTextInputMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTextPickerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTextTimerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusTimePickerMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusToggleMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusUIExtensionComponentMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusWaterFlowMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusWebMod.mDefaultFocus = value.defaultFocus
      this._defaultFocusXComponentMod.mDefaultFocus = value.defaultFocus
    })
  }

  
  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').key(this.componentKey).attributeModifier(this._defaultFocusButtonMod)
        } else if (this.targetView == 'Text') {
          Text('textAlign').fontSize(9).fontColor(0xCCCCCC).attributeModifier(this._defaultFocusTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._defaultFocusAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._defaultFocusBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._defaultFocusCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._defaultFocusCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._defaultFocusDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._defaultFocusDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._defaultFocusDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._defaultFocusGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._defaultFocusImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._defaultFocusImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._defaultFocusLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._defaultFocusMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._defaultFocusMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._defaultFocusQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._defaultFocusRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._defaultFocusRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._defaultFocusScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._defaultFocusSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._defaultFocusSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._defaultFocusSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._defaultFocusTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._defaultFocusTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .attributeModifier(this._defaultFocusTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._defaultFocusTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._defaultFocusTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._defaultFocusToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._defaultFocusWebMod)
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
          }.attributeModifier(this._defaultFocusBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._defaultFocusColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3)
            
          }.attributeModifier(this._defaultFocusColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._defaultFocusCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._defaultFocusFlexMod)
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
          }.attributeModifier(this._defaultFocusGridRowMod)
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
          .attributeModifier(this._defaultFocusGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._defaultFocusListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                
                .backgroundColor(Color.White)
            }.attributeModifier(this._defaultFocusListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._defaultFocusListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._defaultFocusRefreshMod)
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
          }.attributeModifier(this._defaultFocusRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._defaultFocusRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._defaultFocusRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  
              }, (item: int) => item.toString())
            }.width('100%')
          }.scrollBar(BarState.On).attributeModifier(this._defaultFocusScrollMod)
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
          }.attributeModifier(this._defaultFocusStackMod)
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
          }.attributeModifier(this._defaultFocusTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._defaultFocusTabContentMod)
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
          }.attributeModifier(this._defaultFocusWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._defaultFocusGridColMod)
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
              .attributeModifier(this._defaultFocusFlowItemMod)
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
            .attributeModifier(this._defaultFocusGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._defaultFocusMenuItemMod)
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
              .attributeModifier(this._defaultFocusMenuItemGroupMod)
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