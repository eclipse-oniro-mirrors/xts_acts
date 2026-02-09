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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: GridAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: LineAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ListAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

























class PathModifier implements AttributeModifier<PathAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: PathAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RectAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RowAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: SpanAttribute): void {
    	/* focusable not supported */
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: StackAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TextAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: WebAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mFocusable: boolean = false

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.focusable(this.mFocusable)
	}
}

@Entry
@Component
struct FocusablePage {
	@State _focusableAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _focusableBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _focusableButtonModifier: ButtonModifier = new ButtonModifier()
	@State _focusableBlankModifier: BlankModifier = new BlankModifier()
	@State _focusableCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _focusableCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _focusableCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _focusableCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _focusableCircleModifier: CircleModifier = new CircleModifier()
	@State _focusableColumnModifier: ColumnModifier = new ColumnModifier()
	@State _focusableColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _focusableCounterModifier: CounterModifier = new CounterModifier()
	@State _focusableDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _focusableDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _focusableDividerModifier: DividerModifier = new DividerModifier()
	@State _focusableEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _focusableFlexModifier: FlexModifier = new FlexModifier()
	@State _focusableFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _focusableFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _focusableGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _focusableGridModifier: GridModifier = new GridModifier()
	@State _focusableGridColModifier: GridColModifier = new GridColModifier()
	@State _focusableGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _focusableGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _focusableHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _focusableImageModifier: ImageModifier = new ImageModifier()
	@State _focusableImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _focusableLineModifier: LineModifier = new LineModifier()
	@State _focusableListModifier: ListModifier = new ListModifier()
	@State _focusableListItemModifier: ListItemModifier = new ListItemModifier()
	@State _focusableListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _focusableLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _focusableMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _focusableMenuModifier: MenuModifier = new MenuModifier()
	@State _focusableMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _focusableMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _focusableNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _focusableNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _focusablePathModifier: PathModifier = new PathModifier()
	@State _focusablePolygonModifier: PolygonModifier = new PolygonModifier()
	@State _focusablePolylineModifier: PolylineModifier = new PolylineModifier()
	@State _focusableProgressModifier: ProgressModifier = new ProgressModifier()
	@State _focusableQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _focusableRadioModifier: RadioModifier = new RadioModifier()
	@State _focusableRatingModifier: RatingModifier = new RatingModifier()
	@State _focusableRectModifier: RectModifier = new RectModifier()
	@State _focusableRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _focusableRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _focusableRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _focusableRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _focusableRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _focusableRowModifier: RowModifier = new RowModifier()
	@State _focusableRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _focusableScrollModifier: ScrollModifier = new ScrollModifier()
	@State _focusableScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _focusableSearchModifier: SearchModifier = new SearchModifier()
	@State _focusableSelectModifier: SelectModifier = new SelectModifier()
	@State _focusableShapeModifier: ShapeModifier = new ShapeModifier()
	@State _focusableSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _focusableSliderModifier: SliderModifier = new SliderModifier()
	@State _focusableSpanModifier: SpanModifier = new SpanModifier()
	@State _focusableStackModifier: StackModifier = new StackModifier()
	@State _focusableSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _focusableTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _focusableTabsModifier: TabsModifier = new TabsModifier()
	@State _focusableTextModifier: TextModifier = new TextModifier()
	@State _focusableTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _focusableTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _focusableTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _focusableTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _focusableTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _focusableTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _focusableToggleModifier: ToggleModifier = new ToggleModifier()
	@State _focusableVideoModifier: VideoModifier = new VideoModifier()
	@State _focusableWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _focusableWebModifier: WebModifier = new WebModifier()
	@State _focusableWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _focusableXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = '';
	@State componentKey: string = '';
	@State parentWidth: double = 0;
	@State parentHeight: double = 0;
	@State columns: int = 0
	@State gutter: int = 0
	@State parentBackGroundColor: string = ''
	@State parentComponentKey: string =  '';

	onPageShow() {
		console.info('focusable translate page show called ')
		this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
		this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
		this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
		this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
		this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
		this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
		this.parentBackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
		this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
		this._focusableButtonModifier.mFocusable = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.focusable
    attrsManager.registerDataChange((value: SetValue) => {
			console.info('focusable [registerDataChange] ' + JSON.stringify(value.focusable))
			this._focusableAlphabetIndexerModifier.mFocusable = value.focusable
			this._focusableBadgeModifier.mFocusable = value.focusable
			this._focusableButtonModifier.mFocusable = value.focusable
			this._focusableBlankModifier.mFocusable = value.focusable
			this._focusableCalendarPickerModifier.mFocusable = value.focusable
			this._focusableCanvasModifier.mFocusable = value.focusable
			this._focusableCheckboxModifier.mFocusable = value.focusable
			this._focusableCheckboxGroupModifier.mFocusable = value.focusable
			this._focusableCircleModifier.mFocusable = value.focusable
			this._focusableColumnModifier.mFocusable = value.focusable
			this._focusableColumnSplitModifier.mFocusable = value.focusable
			this._focusableCounterModifier.mFocusable = value.focusable
			this._focusableDataPanelModifier.mFocusable = value.focusable
			this._focusableDatePickerModifier.mFocusable = value.focusable
			this._focusableDividerModifier.mFocusable = value.focusable
			this._focusableEllipseModifier.mFocusable = value.focusable
			this._focusableFlexModifier.mFocusable = value.focusable
			this._focusableFlowItemModifier.mFocusable = value.focusable
			this._focusableFormLinkModifier.mFocusable = value.focusable
			this._focusableGaugeModifier.mFocusable = value.focusable
			this._focusableGridModifier.mFocusable = value.focusable
			this._focusableGridColModifier.mFocusable = value.focusable
			this._focusableGridItemModifier.mFocusable = value.focusable
			this._focusableGridRowModifier.mFocusable = value.focusable
			this._focusableHyperlinkModifier.mFocusable = value.focusable
			this._focusableImageModifier.mFocusable = value.focusable
			this._focusableImageAnimatorModifier.mFocusable = value.focusable
			this._focusableLineModifier.mFocusable = value.focusable
			this._focusableListModifier.mFocusable = value.focusable
			this._focusableListItemModifier.mFocusable = value.focusable
			this._focusableListItemGroupModifier.mFocusable = value.focusable
			this._focusableLoadingProgressModifier.mFocusable = value.focusable
			this._focusableMarqueeModifier.mFocusable = value.focusable
			this._focusableMenuModifier.mFocusable = value.focusable
			this._focusableMenuItemModifier.mFocusable = value.focusable
			this._focusableMenuItemGroupModifier.mFocusable = value.focusable
			this._focusableNavDestinationModifier.mFocusable = value.focusable
			this._focusableNavigationModifier.mFocusable = value.focusable
			
			
			
			this._focusablePathModifier.mFocusable = value.focusable
			this._focusablePolygonModifier.mFocusable = value.focusable
			this._focusablePolylineModifier.mFocusable = value.focusable
			this._focusableProgressModifier.mFocusable = value.focusable
			this._focusableQRCodeModifier.mFocusable = value.focusable
			this._focusableRadioModifier.mFocusable = value.focusable
			this._focusableRatingModifier.mFocusable = value.focusable
			this._focusableRectModifier.mFocusable = value.focusable
			this._focusableRefreshModifier.mFocusable = value.focusable
			this._focusableRelativeContainerModifier.mFocusable = value.focusable
			this._focusableRemoteWindowModifier.mFocusable = value.focusable
			this._focusableRichEditorModifier.mFocusable = value.focusable
			this._focusableRichTextModifier.mFocusable = value.focusable
			this._focusableRowModifier.mFocusable = value.focusable
			this._focusableRowSplitModifier.mFocusable = value.focusable
			this._focusableScrollModifier.mFocusable = value.focusable
			this._focusableScrollBarModifier.mFocusable = value.focusable
			this._focusableSearchModifier.mFocusable = value.focusable
			this._focusableSelectModifier.mFocusable = value.focusable
			this._focusableShapeModifier.mFocusable = value.focusable
			this._focusableSideBarContainerModifier.mFocusable = value.focusable
			this._focusableSliderModifier.mFocusable = value.focusable
			this._focusableSpanModifier.mFocusable = value.focusable
			this._focusableStackModifier.mFocusable = value.focusable
			this._focusableSwiperModifier.mFocusable = value.focusable
			this._focusableTabContentModifier.mFocusable = value.focusable
			this._focusableTabsModifier.mFocusable = value.focusable
			this._focusableTextModifier.mFocusable = value.focusable
			this._focusableTextAreaModifier.mFocusable = value.focusable
			this._focusableTextClockModifier.mFocusable = value.focusable
			this._focusableTextInputModifier.mFocusable = value.focusable
			this._focusableTextPickerModifier.mFocusable = value.focusable
			this._focusableTextTimerModifier.mFocusable = value.focusable
			this._focusableTimePickerModifier.mFocusable = value.focusable
			this._focusableToggleModifier.mFocusable = value.focusable
			this._focusableVideoModifier.mFocusable = value.focusable
			this._focusableWaterFlowModifier.mFocusable = value.focusable
			this._focusableWebModifier.mFocusable = value.focusable
			this._focusableWindowSceneModifier.mFocusable = value.focusable
			this._focusableXComponentModifier.mFocusable = value.focusable
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					
					.attributeModifier(this._focusableAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.key(this.componentKey)
					.attributeModifier(this._focusableButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._focusableBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._focusableCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._focusableCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._focusableDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._focusableDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._focusableDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._focusableGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._focusableImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._focusableImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._focusableLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._focusableMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
				}
					
					
			}
			if (this.targetView == 'Menu') {
				Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
				}
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._focusableMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._focusableProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._focusableQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._focusableRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._focusableRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._focusableScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._focusableSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._focusableSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._focusableSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					
					.attributeModifier(this._focusableTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._focusableTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._focusableTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._focusableTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._focusableTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._focusableTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._focusableTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._focusableToggleModifier)
			}
			if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._focusableWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._focusableCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._focusableEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._focusableLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._focusablePolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._focusablePolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._focusablePathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._focusableRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._focusableShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._focusableBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._focusableColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._focusableColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._focusableCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._focusableFlexModifier)
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
					
					.attributeModifier(this._focusableGridRowModifier)
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
					
					.attributeModifier(this._focusableGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._focusableListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._focusableListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._focusableListItemGroupModifier)
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
					
					.attributeModifier(this._focusableRefreshModifier)
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
						} as AlignRuleOption)
						.id('constraintSize')
				}
					
					.attributeModifier(this._focusableRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._focusableRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._focusableRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
            }, (item: int, index: int) => item.toString())
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					
					.attributeModifier(this._focusableScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item: int, index: int) => {
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
					
					
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					
					.attributeModifier(this._focusableStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
          ForEach([1, 2, 3], (item: int, index: int) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
          }, (item: int, index: int) => item.toString())
				}
					.indicator(true)
					.backgroundColor(Color.White)
					
					
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
					
					.attributeModifier(this._focusableTabsModifier)
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
						
						.attributeModifier(this._focusableTabContentModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'WaterFlow') {
				WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
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
          }, (item: int, index: int) => item.toString())
				}
					
					.attributeModifier(this._focusableWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._focusableGridColModifier)
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
						
						.attributeModifier(this._focusableGridItemModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'FlowItem') {
				WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
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
						
						.attributeModifier(this._focusableFlowItemModifier)
          }, (item: int, index: int) => item.toString())
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'MenuItem') {
				Row() {
					Menu() {
						MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
							
							.attributeModifier(this._focusableMenuItemModifier)
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
							
							.attributeModifier(this._focusableMenuItemGroupModifier)
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
					
					.attributeModifier(this._focusableCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._focusableCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._focusableFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._focusableHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._focusableSpanModifier)
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