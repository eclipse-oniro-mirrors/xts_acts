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
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: GridAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: LineAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ListAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

























class PathModifier implements AttributeModifier<PathAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: PathAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RectAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RowAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: SpanAttribute): void {
		/* groupDefaultFocus not supported */
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: StackAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TextAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: WebAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mGroupDefaultFocus: boolean = false

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.groupDefaultFocus(this.mGroupDefaultFocus)
	}
}

@Entry
@Component
struct GroupDefaultFocusPage {
	@State _groupDefaultFocusAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _groupDefaultFocusBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _groupDefaultFocusButtonModifier: ButtonModifier = new ButtonModifier()
	@State _groupDefaultFocusBlankModifier: BlankModifier = new BlankModifier()
	@State _groupDefaultFocusCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _groupDefaultFocusCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _groupDefaultFocusCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _groupDefaultFocusCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _groupDefaultFocusCircleModifier: CircleModifier = new CircleModifier()
	@State _groupDefaultFocusColumnModifier: ColumnModifier = new ColumnModifier()
	@State _groupDefaultFocusColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _groupDefaultFocusCounterModifier: CounterModifier = new CounterModifier()
	@State _groupDefaultFocusDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _groupDefaultFocusDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _groupDefaultFocusDividerModifier: DividerModifier = new DividerModifier()
	@State _groupDefaultFocusEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _groupDefaultFocusFlexModifier: FlexModifier = new FlexModifier()
	@State _groupDefaultFocusFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _groupDefaultFocusFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _groupDefaultFocusGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _groupDefaultFocusGridModifier: GridModifier = new GridModifier()
	@State _groupDefaultFocusGridColModifier: GridColModifier = new GridColModifier()
	@State _groupDefaultFocusGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _groupDefaultFocusGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _groupDefaultFocusHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _groupDefaultFocusImageModifier: ImageModifier = new ImageModifier()
	@State _groupDefaultFocusImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _groupDefaultFocusLineModifier: LineModifier = new LineModifier()
	@State _groupDefaultFocusListModifier: ListModifier = new ListModifier()
	@State _groupDefaultFocusListItemModifier: ListItemModifier = new ListItemModifier()
	@State _groupDefaultFocusListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _groupDefaultFocusLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _groupDefaultFocusMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _groupDefaultFocusMenuModifier: MenuModifier = new MenuModifier()
	@State _groupDefaultFocusMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _groupDefaultFocusMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _groupDefaultFocusNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _groupDefaultFocusNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _groupDefaultFocusPathModifier: PathModifier = new PathModifier()
	@State _groupDefaultFocusPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _groupDefaultFocusPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _groupDefaultFocusProgressModifier: ProgressModifier = new ProgressModifier()
	@State _groupDefaultFocusQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _groupDefaultFocusRadioModifier: RadioModifier = new RadioModifier()
	@State _groupDefaultFocusRatingModifier: RatingModifier = new RatingModifier()
	@State _groupDefaultFocusRectModifier: RectModifier = new RectModifier()
	@State _groupDefaultFocusRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _groupDefaultFocusRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _groupDefaultFocusRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _groupDefaultFocusRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _groupDefaultFocusRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _groupDefaultFocusRowModifier: RowModifier = new RowModifier()
	@State _groupDefaultFocusRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _groupDefaultFocusScrollModifier: ScrollModifier = new ScrollModifier()
	@State _groupDefaultFocusScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _groupDefaultFocusSearchModifier: SearchModifier = new SearchModifier()
	@State _groupDefaultFocusSelectModifier: SelectModifier = new SelectModifier()
	@State _groupDefaultFocusShapeModifier: ShapeModifier = new ShapeModifier()
	@State _groupDefaultFocusSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _groupDefaultFocusSliderModifier: SliderModifier = new SliderModifier()
	@State _groupDefaultFocusSpanModifier: SpanModifier = new SpanModifier()
	@State _groupDefaultFocusStackModifier: StackModifier = new StackModifier()
	@State _groupDefaultFocusSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _groupDefaultFocusTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _groupDefaultFocusTabsModifier: TabsModifier = new TabsModifier()
	@State _groupDefaultFocusTextModifier: TextModifier = new TextModifier()
	@State _groupDefaultFocusTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _groupDefaultFocusTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _groupDefaultFocusTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _groupDefaultFocusTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _groupDefaultFocusTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _groupDefaultFocusTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _groupDefaultFocusToggleModifier: ToggleModifier = new ToggleModifier()
	@State _groupDefaultFocusVideoModifier: VideoModifier = new VideoModifier()
	@State _groupDefaultFocusWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _groupDefaultFocusWebModifier: WebModifier = new WebModifier()
	@State _groupDefaultFocusWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _groupDefaultFocusXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = '';
	@State componentKey: string = '';
	@State parentWidth: double = 0;
	@State parentHeight: double = 0
	@State columns: int = 0
	@State gutter: int = 0
	@State parentBackGroundColor: string = ''
	@State parentComponentKey: string = '';

	onPageShow() {
		console.info('groupDefaultFocus translate page show called ')
		this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
		this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
		this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
		this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
		this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
		this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
		this.parentBackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
		this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
		this._groupDefaultFocusButtonModifier.mGroupDefaultFocus = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.groupDefaultFocus
    attrsManager.registerDataChange((value: SetValue) => {
			console.info('groupDefaultFocus [registerDataChange] ' + JSON.stringify(value.groupDefaultFocus))
			this._groupDefaultFocusAlphabetIndexerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusBadgeModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusButtonModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusBlankModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusCalendarPickerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusCanvasModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusCheckboxModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusCheckboxGroupModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusCircleModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusColumnModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusColumnSplitModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusCounterModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusDataPanelModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusDatePickerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusDividerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusEllipseModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusFlexModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusFlowItemModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusFormLinkModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusGaugeModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusGridModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusGridColModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusGridItemModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusGridRowModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusHyperlinkModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusImageModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusImageAnimatorModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusLineModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusListModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusListItemModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusListItemGroupModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusLoadingProgressModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusMarqueeModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusMenuModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusMenuItemModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusMenuItemGroupModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusNavDestinationModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusNavigationModifier.mGroupDefaultFocus = value.groupDefaultFocus
			
			
			
			this._groupDefaultFocusPathModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusPolygonModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusPolylineModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusProgressModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusQRCodeModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRadioModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRatingModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRectModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRefreshModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRelativeContainerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRemoteWindowModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRichEditorModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRichTextModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRowModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusRowSplitModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusScrollModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusScrollBarModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusSearchModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusSelectModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusShapeModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusSideBarContainerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusSliderModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusSpanModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusStackModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusSwiperModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTabContentModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTabsModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTextModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTextAreaModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTextClockModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTextInputModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTextPickerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTextTimerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusTimePickerModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusToggleModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusVideoModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusWaterFlowModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusWebModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusWindowSceneModifier.mGroupDefaultFocus = value.groupDefaultFocus
			this._groupDefaultFocusXComponentModifier.mGroupDefaultFocus = value.groupDefaultFocus
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					
					.attributeModifier(this._groupDefaultFocusAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.key(this.componentKey)
					.attributeModifier(this._groupDefaultFocusButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._groupDefaultFocusBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._groupDefaultFocusCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._groupDefaultFocusCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._groupDefaultFocusDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._groupDefaultFocusDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._groupDefaultFocusDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._groupDefaultFocusGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._groupDefaultFocusImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._groupDefaultFocusImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._groupDefaultFocusLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._groupDefaultFocusMarqueeModifier)
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
					
					.attributeModifier(this._groupDefaultFocusMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._groupDefaultFocusProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._groupDefaultFocusQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._groupDefaultFocusRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._groupDefaultFocusRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._groupDefaultFocusScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._groupDefaultFocusSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._groupDefaultFocusSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._groupDefaultFocusSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					
					.attributeModifier(this._groupDefaultFocusTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._groupDefaultFocusTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._groupDefaultFocusTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._groupDefaultFocusTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._groupDefaultFocusTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._groupDefaultFocusTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._groupDefaultFocusTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._groupDefaultFocusToggleModifier)
			}
			if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._groupDefaultFocusWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._groupDefaultFocusCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._groupDefaultFocusEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._groupDefaultFocusLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._groupDefaultFocusPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._groupDefaultFocusPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._groupDefaultFocusPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._groupDefaultFocusRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._groupDefaultFocusShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._groupDefaultFocusBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._groupDefaultFocusColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._groupDefaultFocusColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._groupDefaultFocusCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._groupDefaultFocusFlexModifier)
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
					
					.attributeModifier(this._groupDefaultFocusGridRowModifier)
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
					
					.attributeModifier(this._groupDefaultFocusGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._groupDefaultFocusListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._groupDefaultFocusListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._groupDefaultFocusListItemGroupModifier)
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
					
					.attributeModifier(this._groupDefaultFocusRefreshModifier)
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
					
					.attributeModifier(this._groupDefaultFocusRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._groupDefaultFocusRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._groupDefaultFocusRowSplitModifier)
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
					
					.attributeModifier(this._groupDefaultFocusScrollModifier)
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
					
					.attributeModifier(this._groupDefaultFocusStackModifier)
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
					
					.attributeModifier(this._groupDefaultFocusTabsModifier)
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
						
						.attributeModifier(this._groupDefaultFocusTabContentModifier)
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
					
					.attributeModifier(this._groupDefaultFocusWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._groupDefaultFocusGridColModifier)
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
						
						.attributeModifier(this._groupDefaultFocusGridItemModifier)
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
						
						.attributeModifier(this._groupDefaultFocusFlowItemModifier)
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
							
							.attributeModifier(this._groupDefaultFocusMenuItemModifier)
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
							
							.attributeModifier(this._groupDefaultFocusMenuItemGroupModifier)
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
					
					.attributeModifier(this._groupDefaultFocusCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._groupDefaultFocusCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._groupDefaultFocusFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._groupDefaultFocusHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._groupDefaultFocusSpanModifier)
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