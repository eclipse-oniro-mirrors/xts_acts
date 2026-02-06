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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, ResourceColor, ColoringStrategy, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: GridAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: LineAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ListAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

























class PathModifier implements AttributeModifier<PathAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: PathAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RectAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RowAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: SpanAttribute): void {
    	/* foregroundColor not supported */
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: StackAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TextAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: WebAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mForegroundColor: ResourceColor | ColoringStrategy = '#FF123456'

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.foregroundColor(this.mForegroundColor)
	}
}

@Entry
@Component
struct ForegroundColorPage {
	@State _foregroundColorAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _foregroundColorBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _foregroundColorButtonModifier: ButtonModifier = new ButtonModifier()
	@State _foregroundColorBlankModifier: BlankModifier = new BlankModifier()
	@State _foregroundColorCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _foregroundColorCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _foregroundColorCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _foregroundColorCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _foregroundColorCircleModifier: CircleModifier = new CircleModifier()
	@State _foregroundColorColumnModifier: ColumnModifier = new ColumnModifier()
	@State _foregroundColorColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _foregroundColorCounterModifier: CounterModifier = new CounterModifier()
	@State _foregroundColorDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _foregroundColorDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _foregroundColorDividerModifier: DividerModifier = new DividerModifier()
	@State _foregroundColorEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _foregroundColorFlexModifier: FlexModifier = new FlexModifier()
	@State _foregroundColorFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _foregroundColorFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _foregroundColorGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _foregroundColorGridModifier: GridModifier = new GridModifier()
	@State _foregroundColorGridColModifier: GridColModifier = new GridColModifier()
	@State _foregroundColorGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _foregroundColorGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _foregroundColorHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _foregroundColorImageModifier: ImageModifier = new ImageModifier()
	@State _foregroundColorImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _foregroundColorLineModifier: LineModifier = new LineModifier()
	@State _foregroundColorListModifier: ListModifier = new ListModifier()
	@State _foregroundColorListItemModifier: ListItemModifier = new ListItemModifier()
	@State _foregroundColorListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _foregroundColorLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _foregroundColorMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _foregroundColorMenuModifier: MenuModifier = new MenuModifier()
	@State _foregroundColorMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _foregroundColorMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _foregroundColorNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _foregroundColorNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _foregroundColorPathModifier: PathModifier = new PathModifier()
	@State _foregroundColorPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _foregroundColorPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _foregroundColorProgressModifier: ProgressModifier = new ProgressModifier()
	@State _foregroundColorQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _foregroundColorRadioModifier: RadioModifier = new RadioModifier()
	@State _foregroundColorRatingModifier: RatingModifier = new RatingModifier()
	@State _foregroundColorRectModifier: RectModifier = new RectModifier()
	@State _foregroundColorRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _foregroundColorRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _foregroundColorRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _foregroundColorRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _foregroundColorRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _foregroundColorRowModifier: RowModifier = new RowModifier()
	@State _foregroundColorRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _foregroundColorScrollModifier: ScrollModifier = new ScrollModifier()
	@State _foregroundColorScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _foregroundColorSearchModifier: SearchModifier = new SearchModifier()
	@State _foregroundColorSelectModifier: SelectModifier = new SelectModifier()
	@State _foregroundColorShapeModifier: ShapeModifier = new ShapeModifier()
	@State _foregroundColorSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _foregroundColorSliderModifier: SliderModifier = new SliderModifier()
	@State _foregroundColorSpanModifier: SpanModifier = new SpanModifier()
	@State _foregroundColorStackModifier: StackModifier = new StackModifier()
	@State _foregroundColorSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _foregroundColorTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _foregroundColorTabsModifier: TabsModifier = new TabsModifier()
	@State _foregroundColorTextModifier: TextModifier = new TextModifier()
	@State _foregroundColorTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _foregroundColorTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _foregroundColorTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _foregroundColorTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _foregroundColorTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _foregroundColorTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _foregroundColorToggleModifier: ToggleModifier = new ToggleModifier()
	@State _foregroundColorVideoModifier: VideoModifier = new VideoModifier()
	@State _foregroundColorWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _foregroundColorWebModifier: WebModifier = new WebModifier()
	@State _foregroundColorWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _foregroundColorXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = '';
	@State componentKey: string = '';
	@State parentWidth: double = 0
	@State parentHeight: double = 0
	@State columns: int = 0
	@State gutter: int = 0
	@State parentBackGroundColor: string =  ''
	@State parentComponentKey: string = '';

	onPageShow() {
		console.info('foregroundColor translate page show called ')
		this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
		this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
		this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
		this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
		this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
		this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
		this.parentBackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
		this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
		this._foregroundColorButtonModifier.mForegroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.foregroundColor
    attrsManager.registerDataChange((value: SetValue) => {
			
			this._foregroundColorAlphabetIndexerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorBadgeModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorButtonModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorBlankModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorCalendarPickerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorCanvasModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorCheckboxModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorCheckboxGroupModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorCircleModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorColumnModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorColumnSplitModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorCounterModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorDataPanelModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorDatePickerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorDividerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorEllipseModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorFlexModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorFlowItemModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorFormLinkModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorGaugeModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorGridModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorGridColModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorGridItemModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorGridRowModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorHyperlinkModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorImageModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorImageAnimatorModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorLineModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorListModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorListItemModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorListItemGroupModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorLoadingProgressModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorMarqueeModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorMenuModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorMenuItemModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorMenuItemGroupModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorNavDestinationModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorNavigationModifier.mForegroundColor = value.foregroundColor
			
			
			
			this._foregroundColorPathModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorPolygonModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorPolylineModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorProgressModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorQRCodeModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRadioModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRatingModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRectModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRefreshModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRelativeContainerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRemoteWindowModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRichEditorModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRichTextModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRowModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorRowSplitModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorScrollModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorScrollBarModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorSearchModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorSelectModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorShapeModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorSideBarContainerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorSliderModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorSpanModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorStackModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorSwiperModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTabContentModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTabsModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTextModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTextAreaModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTextClockModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTextInputModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTextPickerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTextTimerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorTimePickerModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorToggleModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorVideoModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorWaterFlowModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorWebModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorWindowSceneModifier.mForegroundColor = value.foregroundColor
			this._foregroundColorXComponentModifier.mForegroundColor = value.foregroundColor
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					
					.attributeModifier(this._foregroundColorAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.key(this.componentKey)
					.attributeModifier(this._foregroundColorButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._foregroundColorBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._foregroundColorCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._foregroundColorCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._foregroundColorDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._foregroundColorDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._foregroundColorDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._foregroundColorGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._foregroundColorImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._foregroundColorImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._foregroundColorLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._foregroundColorMarqueeModifier)
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
					
					.attributeModifier(this._foregroundColorMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._foregroundColorProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._foregroundColorQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._foregroundColorRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._foregroundColorRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._foregroundColorScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._foregroundColorSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._foregroundColorSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._foregroundColorSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					
					.attributeModifier(this._foregroundColorTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._foregroundColorTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._foregroundColorTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._foregroundColorTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._foregroundColorTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._foregroundColorTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._foregroundColorTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._foregroundColorToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._foregroundColorWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._foregroundColorCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._foregroundColorEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._foregroundColorLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._foregroundColorPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._foregroundColorPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._foregroundColorPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._foregroundColorRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._foregroundColorShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._foregroundColorBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._foregroundColorColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._foregroundColorColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._foregroundColorCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._foregroundColorFlexModifier)
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
					
					.attributeModifier(this._foregroundColorGridRowModifier)
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
					
					.attributeModifier(this._foregroundColorGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._foregroundColorListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._foregroundColorListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._foregroundColorListItemGroupModifier)
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
					
					.attributeModifier(this._foregroundColorRefreshModifier)
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
					
					.attributeModifier(this._foregroundColorRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._foregroundColorRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._foregroundColorRowSplitModifier)
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
					
					.attributeModifier(this._foregroundColorScrollModifier)
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
					
					.attributeModifier(this._foregroundColorStackModifier)
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
					
					.attributeModifier(this._foregroundColorTabsModifier)
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
						
						.attributeModifier(this._foregroundColorTabContentModifier)
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
					
					.attributeModifier(this._foregroundColorWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._foregroundColorGridColModifier)
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
						
						.attributeModifier(this._foregroundColorGridItemModifier)
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
						
						.attributeModifier(this._foregroundColorFlowItemModifier)
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
							
							.attributeModifier(this._foregroundColorMenuItemModifier)
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
							
							.attributeModifier(this._foregroundColorMenuItemGroupModifier)
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
					
					.attributeModifier(this._foregroundColorCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._foregroundColorCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._foregroundColorFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._foregroundColorHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._foregroundColorSpanModifier)
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