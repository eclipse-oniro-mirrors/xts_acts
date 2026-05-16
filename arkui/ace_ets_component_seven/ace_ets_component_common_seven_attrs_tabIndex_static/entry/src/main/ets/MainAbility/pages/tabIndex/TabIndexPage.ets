'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions } from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: GridAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: LineAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ListAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class PathModifier implements AttributeModifier<PathAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: PathAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RectAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: SpanAttribute): void {
		// instance.tabIndex(this.mTabIndex)
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: StackAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TextAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: WebAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mTabIndex: Int = 1

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: BadgeAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: BlankAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string, _tabIndex: Int | undefined) {
	this.tabIndex(_tabIndex)
	this.key(componentKey)
	return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: CounterAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: EllipseAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: FlexAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: GaugeAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: GridAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: GridColAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: GridItemAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: GridRowAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ImageAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: LineAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ListItemAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: MenuAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: NavigationAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: PathAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: PolygonAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: PolylineAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ProgressAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RadioAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RatingAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RectAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RefreshAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RichTextAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RowAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ScrollAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: SearchAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: SelectAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ShapeAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: SliderAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: SpanAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: StackAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: SwiperAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ToggleAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TabsAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TextClockAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TextInputAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: VideoAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: WebAttribute, componentKey: string) {

	this.key(componentKey)
	return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: CanvasAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: XComponentAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TextAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: DividerAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: CircleAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ColumnAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: ListAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

function commonStyle(this: TabContentAttribute, componentKey: string) {
	this.key(componentKey)
	return this
}

@Entry
@Component
struct TabIndexPage {
	@State _tabIndexAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _tabIndexBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _tabIndexButtonModifier: ButtonModifier = new ButtonModifier()
	@State _tabIndexBlankModifier: BlankModifier = new BlankModifier()
	@State _tabIndexCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _tabIndexCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _tabIndexCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _tabIndexCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _tabIndexCircleModifier: CircleModifier = new CircleModifier()
	@State _tabIndexColumnModifier: ColumnModifier = new ColumnModifier()
	@State _tabIndexColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _tabIndexCounterModifier: CounterModifier = new CounterModifier()
	@State _tabIndexDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _tabIndexDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _tabIndexDividerModifier: DividerModifier = new DividerModifier()
	@State _tabIndexEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _tabIndexFlexModifier: FlexModifier = new FlexModifier()
	@State _tabIndexFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _tabIndexFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _tabIndexGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _tabIndexGridModifier: GridModifier = new GridModifier()
	@State _tabIndexGridColModifier: GridColModifier = new GridColModifier()
	@State _tabIndexGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _tabIndexGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _tabIndexHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _tabIndexImageModifier: ImageModifier = new ImageModifier()
	@State _tabIndexImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _tabIndexLineModifier: LineModifier = new LineModifier()
	@State _tabIndexListModifier: ListModifier = new ListModifier()
	@State _tabIndexListItemModifier: ListItemModifier = new ListItemModifier()
	@State _tabIndexListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _tabIndexLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _tabIndexMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _tabIndexMenuModifier: MenuModifier = new MenuModifier()
	@State _tabIndexMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _tabIndexMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _tabIndexNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _tabIndexNavigationModifier: NavigationModifier = new NavigationModifier()
	@State _tabIndexPathModifier: PathModifier = new PathModifier()
	@State _tabIndexPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _tabIndexPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _tabIndexProgressModifier: ProgressModifier = new ProgressModifier()
	@State _tabIndexQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _tabIndexRadioModifier: RadioModifier = new RadioModifier()
	@State _tabIndexRatingModifier: RatingModifier = new RatingModifier()
	@State _tabIndexRectModifier: RectModifier = new RectModifier()
	@State _tabIndexRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _tabIndexRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _tabIndexRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _tabIndexRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _tabIndexRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _tabIndexRowModifier: RowModifier = new RowModifier()
	@State _tabIndexRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _tabIndexScrollModifier: ScrollModifier = new ScrollModifier()
	@State _tabIndexScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _tabIndexSearchModifier: SearchModifier = new SearchModifier()
	@State _tabIndexSelectModifier: SelectModifier = new SelectModifier()
	@State _tabIndexShapeModifier: ShapeModifier = new ShapeModifier()
	@State _tabIndexSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _tabIndexSliderModifier: SliderModifier = new SliderModifier()
	@State _tabIndexSpanModifier: SpanModifier = new SpanModifier()
	@State _tabIndexStackModifier: StackModifier = new StackModifier()
	@State _tabIndexSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _tabIndexTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _tabIndexTabsModifier: TabsModifier = new TabsModifier()
	@State _tabIndexTextModifier: TextModifier = new TextModifier()
	@State _tabIndexTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _tabIndexTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _tabIndexTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _tabIndexTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _tabIndexTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _tabIndexTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _tabIndexToggleModifier: ToggleModifier = new ToggleModifier()
	@State _tabIndexVideoModifier: VideoModifier = new VideoModifier()
	@State _tabIndexWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _tabIndexWebModifier: WebModifier = new WebModifier()
	@State _tabIndexWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _tabIndexXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0
  @State gutter: number = 0
  @State parentBackGroundColor: string = '#FFFF00'
  @State parentComponentKey: string =  '';
	@StoragePropRef('_tabIndex') _tabIndex: SetValue = {
		height: 0,tabIndex: 0
	}

	onPageShow() {
		console.info('tabIndex translate page show called ')
		const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
			.getElement("view")
		this.targetView = viewElement.getString("targetView")
		this.componentKey = viewElement.getString("componentKey")
		this.parentWidth = viewElement.getDouble("parentWidth")
		this.parentHeight = viewElement.getDouble("parentHeight")
		this.columns = viewElement.getDouble("columns")
		this.gutter = viewElement.getDouble("gutter")
		this.parentComponentKey = viewElement.getString("parentComponentKey")
		this.parentBackGroundColor = viewElement.getString("parentBackGroundColor")
	}


	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.attributeModifier(this._tabIndexButtonModifier)
					.commonStyleButton(this.componentKey, this._tabIndex.tabIndex as Int)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as Int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
				}
					.commonStyle(this.componentKey)
					// .attributeModifier(this._tabIndexNavigationModifier)
			}
			if (this.targetView == 'Menu') {
				Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
				}
					.backgroundColor(Color.Yellow)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebviewController() })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexFlexModifier)
			}
			if (this.targetView == 'GridRow') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					ForEach(
						[Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown],
						(color:Color) => {
							GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
								Row()
									.width('100%')
									.height('20vp')
							}
								.borderColor(color)
								.borderWidth(2)
						}
					)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexGridRowModifier)
			}
			if (this.targetView == 'Grid') {
				Grid() {
          ForEach(['0', '1', '2', '3', '4'], (item: string) => {
						ForEach(['0', '1', '2', '3', '4'], (day: string) => {
							GridItem() {
								Text(day)
									.backgroundColor(Color.White)
									.width('100%')
									.height('100%')
									.textAlign(TextAlign.Center)
							}
						})
					})
				}
					.columnsTemplate('1fr 1fr 1fr 1fr 1fr')
					.rowsTemplate('1fr 1fr 1fr 1fr 1fr')
					.backgroundColor(0xFAEEE0)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						.commonStyle(this.componentKey)
						.attributeModifier(this._tabIndexListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						.commonStyle(this.componentKey)
						.attributeModifier(this._tabIndexListItemGroupModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Navigator') {
			}
			if (this.targetView == 'Panel') {
			}
			if (this.targetView == 'Refresh') {
				Refresh({ refreshing: true }) {
					Text('123')
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexRefreshModifier)
			}
			if (this.targetView == 'RelativeContainer') {
				RelativeContainer() {
					Row()
						.width(100)
						.height(100)
						.backgroundColor('#FF3333')
						.alignRules({
							top: { anchor: '__container__', align: VerticalAlign.Top },
							left: { anchor: '__container__', align: HorizontalAlign.Start }
						})
						.id('constraintSize')
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
						ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
						}, (item: int) => item.toString())
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item: int) => {
							Column({ space: 5 } as ColumnOptions) {
								Image($r('app.media.icon'))
									.width(50)
									.height(50)
								Text('Index0' + item)
									.fontSize(25)
							}
						})
					}
						.width('100%')
						.justifyContent(FlexAlign.SpaceEvenly)
						.backgroundColor(Color.Green)

					Column() {
						Text('SideBarContainer content')
							.fontSize(25)
					}
						.backgroundColor(Color.Orange)
				}
					.commonStyle(this.componentKey)
					// .attributeModifier(this._tabIndexSideBarContainerModifier)
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
					ForEach([1, 2, 3], (item: int) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
					}, (item: int) => item.toString())
				}
					.indicator(true)
					.backgroundColor(Color.White)
					.commonStyle(this.componentKey)
					// .attributeModifier(this._tabIndexSwiperModifier)
			}
			if (this.targetView == 'Tabs') {
				Tabs() {
					TabContent() {
						Column()
							.width('100%')
							.height('100%')
							.backgroundColor('#00CB87')
					}
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexTabsModifier)
			}
			if (this.targetView == 'TabContent') {
				Tabs() {
					TabContent() {
						Text('TabContent Test')
							.width('100%')
							.height('100%')
							.backgroundColor(Color.White)
					}
						.tabBar('Tabs1')
						.commonStyle(this.componentKey)
						.attributeModifier(this._tabIndexTabContentModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'WaterFlow') {
				WaterFlow() {
					ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
						FlowItem() {
							Column() {
								Text('WaterFlow' + item)
									.fontSize(12)
									.height('16')
								Image($r('app.media.icon'))
									.width(50)
									.height(50)
									.objectFit(ImageFit.Fill)
							}
						}
					}, (item: int) => item.toString())
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						.commonStyle(this.componentKey)
						.attributeModifier(this._tabIndexGridColModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'GridItem') {
				Grid() {
					GridItem() {
						Text('4')
							.backgroundColor(0xFAEEE0)
							.width('100%')
							.height('100%')
							.textAlign(TextAlign.Center)
					}
						.rowStart(1)
						.rowEnd(4)
						.backgroundColor(Color.Yellow)
						.commonStyle(this.componentKey)
						.attributeModifier(this._tabIndexGridItemModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'FlowItem') {
				WaterFlow() {
					ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
						FlowItem() {
							Column() {
								Text('WaterFlow' + item)
									.fontSize(12)
									.height('16')
								Image($r('app.media.icon'))
									.width(50)
									.height(50)
									.objectFit(ImageFit.Fill)
							}
						}
						.backgroundColor(Color.Yellow)
						.commonStyle(this.componentKey)
						.attributeModifier(this._tabIndexFlowItemModifier)
					}, (item: int) => item.toString())
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'MenuItem') {
				Row() {
					Menu() {
						MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
							.commonStyle(this.componentKey)
							.attributeModifier(this._tabIndexMenuItemModifier)
					}
						.backgroundColor(Color.Yellow)
						.width('100%')
						.height('100%')
				}
					.width('100%')
					.height('100%')
					.backgroundColor(Color.Green)
			}
			if (this.targetView == 'MenuItemGroup') {
				Row() {
					Menu() {
						MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
						}
							.commonStyle(this.componentKey)
							.attributeModifier(this._tabIndexMenuItemGroupModifier)
					}
						.backgroundColor(Color.Yellow)
						.width('100%')
						.height('100%')
				}
					.width('100%')
					.height('100%')
					.backgroundColor(Color.Green)
			}
			if (this.targetView == 'CalendarPicker') {
				CalendarPicker({ hintRadius: 10, selected: new Date() })
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._tabIndexHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						.commonStyle(this.componentKey)
						.attributeModifier(this._tabIndexSpanModifier)
				}
			}
		}
		.width(this.parentWidth)
		.height(this.parentHeight)
		.backgroundColor(this.parentBackGroundColor || '#FFFF00')
		.key(this.parentComponentKey)
	}
}
class ObjElement {
	message?: string;
}