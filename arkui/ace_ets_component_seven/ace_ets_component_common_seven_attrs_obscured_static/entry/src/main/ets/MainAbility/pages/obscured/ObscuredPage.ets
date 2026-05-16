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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, ObscuredReasons, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: GridAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: LineAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ListAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.obscured(this.mObscured)
	}
}

























class PathModifier implements AttributeModifier<PathAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: PathAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RectAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RowAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: SpanAttribute): void {
		/* obscured not supported */
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: StackAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TextAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: WebAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.obscured(this.mObscured)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mObscured: Array<ObscuredReasons> = []

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.obscured(this.mObscured)
	}
}

@Entry
@Component
struct ObscuredPage {
	@State _obscuredAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _obscuredBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _obscuredButtonModifier: ButtonModifier = new ButtonModifier()
	@State _obscuredBlankModifier: BlankModifier = new BlankModifier()
	@State _obscuredCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _obscuredCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _obscuredCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _obscuredCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _obscuredCircleModifier: CircleModifier = new CircleModifier()
	@State _obscuredColumnModifier: ColumnModifier = new ColumnModifier()
	@State _obscuredColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _obscuredCounterModifier: CounterModifier = new CounterModifier()
	@State _obscuredDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _obscuredDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _obscuredDividerModifier: DividerModifier = new DividerModifier()
	@State _obscuredEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _obscuredFlexModifier: FlexModifier = new FlexModifier()
	@State _obscuredFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _obscuredFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _obscuredGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _obscuredGridModifier: GridModifier = new GridModifier()
	@State _obscuredGridColModifier: GridColModifier = new GridColModifier()
	@State _obscuredGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _obscuredGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _obscuredHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _obscuredImageModifier: ImageModifier = new ImageModifier()
	@State _obscuredImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _obscuredLineModifier: LineModifier = new LineModifier()
	@State _obscuredListModifier: ListModifier = new ListModifier()
	@State _obscuredListItemModifier: ListItemModifier = new ListItemModifier()
	@State _obscuredListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _obscuredLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _obscuredMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _obscuredMenuModifier: MenuModifier = new MenuModifier()
	@State _obscuredMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _obscuredMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _obscuredNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _obscuredNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _obscuredPathModifier: PathModifier = new PathModifier()
	@State _obscuredPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _obscuredPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _obscuredProgressModifier: ProgressModifier = new ProgressModifier()
	@State _obscuredQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _obscuredRadioModifier: RadioModifier = new RadioModifier()
	@State _obscuredRatingModifier: RatingModifier = new RatingModifier()
	@State _obscuredRectModifier: RectModifier = new RectModifier()
	@State _obscuredRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _obscuredRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _obscuredRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _obscuredRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _obscuredRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _obscuredRowModifier: RowModifier = new RowModifier()
	@State _obscuredRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _obscuredScrollModifier: ScrollModifier = new ScrollModifier()
	@State _obscuredScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _obscuredSearchModifier: SearchModifier = new SearchModifier()
	@State _obscuredSelectModifier: SelectModifier = new SelectModifier()
	@State _obscuredShapeModifier: ShapeModifier = new ShapeModifier()
	@State _obscuredSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _obscuredSliderModifier: SliderModifier = new SliderModifier()
	@State _obscuredSpanModifier: SpanModifier = new SpanModifier()
	@State _obscuredStackModifier: StackModifier = new StackModifier()
	@State _obscuredSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _obscuredTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _obscuredTabsModifier: TabsModifier = new TabsModifier()
	@State _obscuredTextModifier: TextModifier = new TextModifier()
	@State _obscuredTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _obscuredTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _obscuredTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _obscuredTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _obscuredTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _obscuredTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _obscuredToggleModifier: ToggleModifier = new ToggleModifier()
	@State _obscuredVideoModifier: VideoModifier = new VideoModifier()
	@State _obscuredWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _obscuredWebModifier: WebModifier = new WebModifier()
	@State _obscuredWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _obscuredXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = '';
	@State componentKey: string = '';
	@State parentWidth: double = 0;
	@State parentHeight: double = 0;
	@State columns: int = 0
	@State gutter: int = 0
	@State parentBackGroundColor: string = '#FFFF00'
	@State parentComponentKey: string = '';

	onPageShow() {
		console.info('obscured translate page show called ')
		this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
		this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
		this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
		this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
		this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
		this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
		this.parentBackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
		this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
		this._obscuredAlphabetIndexerModifier.mObscured = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.obscured
		console.log(this._obscuredAlphabetIndexerModifier.mObscured,'abc112233')
    attrsManager.registerDataChange((value: SetValue) => {
			console.info('obscured [registerDataChange] ' + JSON.stringify(value.obscured))
			this._obscuredAlphabetIndexerModifier.mObscured = value.obscured
			this._obscuredBadgeModifier.mObscured = value.obscured
			this._obscuredButtonModifier.mObscured = value.obscured
			this._obscuredBlankModifier.mObscured = value.obscured
			this._obscuredCalendarPickerModifier.mObscured = value.obscured
			this._obscuredCanvasModifier.mObscured = value.obscured
			this._obscuredCheckboxModifier.mObscured = value.obscured
			this._obscuredCheckboxGroupModifier.mObscured = value.obscured
			this._obscuredCircleModifier.mObscured = value.obscured
			this._obscuredColumnModifier.mObscured = value.obscured
			this._obscuredColumnSplitModifier.mObscured = value.obscured
			this._obscuredCounterModifier.mObscured = value.obscured
			this._obscuredDataPanelModifier.mObscured = value.obscured
			this._obscuredDatePickerModifier.mObscured = value.obscured
			this._obscuredDividerModifier.mObscured = value.obscured
			this._obscuredEllipseModifier.mObscured = value.obscured
			this._obscuredFlexModifier.mObscured = value.obscured
			this._obscuredFlowItemModifier.mObscured = value.obscured
			this._obscuredFormLinkModifier.mObscured = value.obscured
			this._obscuredGaugeModifier.mObscured = value.obscured
			this._obscuredGridModifier.mObscured = value.obscured
			this._obscuredGridColModifier.mObscured = value.obscured
			this._obscuredGridItemModifier.mObscured = value.obscured
			this._obscuredGridRowModifier.mObscured = value.obscured
			this._obscuredHyperlinkModifier.mObscured = value.obscured
			this._obscuredImageModifier.mObscured = value.obscured
			this._obscuredImageAnimatorModifier.mObscured = value.obscured
			this._obscuredLineModifier.mObscured = value.obscured
			this._obscuredListModifier.mObscured = value.obscured
			this._obscuredListItemModifier.mObscured = value.obscured
			this._obscuredListItemGroupModifier.mObscured = value.obscured
			this._obscuredLoadingProgressModifier.mObscured = value.obscured
			this._obscuredMarqueeModifier.mObscured = value.obscured
			this._obscuredMenuModifier.mObscured = value.obscured
			this._obscuredMenuItemModifier.mObscured = value.obscured
			this._obscuredMenuItemGroupModifier.mObscured = value.obscured
			this._obscuredNavDestinationModifier.mObscured = value.obscured
			this._obscuredNavigationModifier.mObscured = value.obscured
			
			
			
			this._obscuredPathModifier.mObscured = value.obscured
			this._obscuredPolygonModifier.mObscured = value.obscured
			this._obscuredPolylineModifier.mObscured = value.obscured
			this._obscuredProgressModifier.mObscured = value.obscured
			this._obscuredQRCodeModifier.mObscured = value.obscured
			this._obscuredRadioModifier.mObscured = value.obscured
			this._obscuredRatingModifier.mObscured = value.obscured
			this._obscuredRectModifier.mObscured = value.obscured
			this._obscuredRefreshModifier.mObscured = value.obscured
			this._obscuredRelativeContainerModifier.mObscured = value.obscured
			this._obscuredRemoteWindowModifier.mObscured = value.obscured
			this._obscuredRichEditorModifier.mObscured = value.obscured
			this._obscuredRichTextModifier.mObscured = value.obscured
			this._obscuredRowModifier.mObscured = value.obscured
			this._obscuredRowSplitModifier.mObscured = value.obscured
			this._obscuredScrollModifier.mObscured = value.obscured
			this._obscuredScrollBarModifier.mObscured = value.obscured
			this._obscuredSearchModifier.mObscured = value.obscured
			this._obscuredSelectModifier.mObscured = value.obscured
			this._obscuredShapeModifier.mObscured = value.obscured
			this._obscuredSideBarContainerModifier.mObscured = value.obscured
			this._obscuredSliderModifier.mObscured = value.obscured
			this._obscuredSpanModifier.mObscured = value.obscured
			this._obscuredStackModifier.mObscured = value.obscured
			this._obscuredSwiperModifier.mObscured = value.obscured
			this._obscuredTabContentModifier.mObscured = value.obscured
			this._obscuredTabsModifier.mObscured = value.obscured
			this._obscuredTextModifier.mObscured = value.obscured
			this._obscuredTextAreaModifier.mObscured = value.obscured
			this._obscuredTextClockModifier.mObscured = value.obscured
			this._obscuredTextInputModifier.mObscured = value.obscured
			this._obscuredTextPickerModifier.mObscured = value.obscured
			this._obscuredTextTimerModifier.mObscured = value.obscured
			this._obscuredTimePickerModifier.mObscured = value.obscured
			this._obscuredToggleModifier.mObscured = value.obscured
			this._obscuredVideoModifier.mObscured = value.obscured
			this._obscuredWaterFlowModifier.mObscured = value.obscured
			this._obscuredWebModifier.mObscured = value.obscured
			this._obscuredWindowSceneModifier.mObscured = value.obscured
			this._obscuredXComponentModifier.mObscured = value.obscured
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					.key(this.componentKey)
					.attributeModifier(this._obscuredAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					
					.attributeModifier(this._obscuredButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._obscuredBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._obscuredCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._obscuredCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._obscuredDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._obscuredDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._obscuredDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._obscuredGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._obscuredImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._obscuredImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._obscuredLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._obscuredMarqueeModifier)
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
					
					.attributeModifier(this._obscuredMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._obscuredProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._obscuredQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._obscuredRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._obscuredRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._obscuredScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._obscuredSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._obscuredSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._obscuredSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					
					.attributeModifier(this._obscuredTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._obscuredTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._obscuredTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._obscuredTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._obscuredTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._obscuredTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._obscuredTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._obscuredToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._obscuredWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._obscuredCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._obscuredEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._obscuredLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._obscuredPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._obscuredPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._obscuredPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._obscuredRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._obscuredShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._obscuredBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._obscuredColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._obscuredColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._obscuredCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._obscuredFlexModifier)
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
					
					.attributeModifier(this._obscuredGridRowModifier)
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
					
					.attributeModifier(this._obscuredGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._obscuredListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._obscuredListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._obscuredListItemGroupModifier)
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
					
					.attributeModifier(this._obscuredRefreshModifier)
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
					
					.attributeModifier(this._obscuredRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._obscuredRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._obscuredRowSplitModifier)
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
					
					.attributeModifier(this._obscuredScrollModifier)
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
					
					.attributeModifier(this._obscuredStackModifier)
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
					
					.attributeModifier(this._obscuredTabsModifier)
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
						
						.attributeModifier(this._obscuredTabContentModifier)
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
					
					.attributeModifier(this._obscuredWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._obscuredGridColModifier)
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
						
						.attributeModifier(this._obscuredGridItemModifier)
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
						
						.attributeModifier(this._obscuredFlowItemModifier)
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
							
							.attributeModifier(this._obscuredMenuItemModifier)
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
							
							.attributeModifier(this._obscuredMenuItemGroupModifier)
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
					
					.attributeModifier(this._obscuredCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._obscuredCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._obscuredFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._obscuredHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._obscuredSpanModifier)
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