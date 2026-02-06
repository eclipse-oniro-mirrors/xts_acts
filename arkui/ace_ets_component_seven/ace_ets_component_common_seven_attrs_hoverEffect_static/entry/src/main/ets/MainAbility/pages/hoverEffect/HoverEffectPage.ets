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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, HoverEffect, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: GridAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: LineAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ListAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

























class PathModifier implements AttributeModifier<PathAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: PathAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RectAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RowAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: SpanAttribute): void {
		/* hoverEffect not supported */
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: StackAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TextAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: WebAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mHoverEffect: HoverEffect = HoverEffect.Auto

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.hoverEffect(this.mHoverEffect)
	}
}

@Entry
@Component
struct HoverEffectPage {
	@State _hoverEffectAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _hoverEffectBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _hoverEffectButtonModifier: ButtonModifier = new ButtonModifier()
	@State _hoverEffectBlankModifier: BlankModifier = new BlankModifier()
	@State _hoverEffectCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _hoverEffectCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _hoverEffectCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _hoverEffectCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _hoverEffectCircleModifier: CircleModifier = new CircleModifier()
	@State _hoverEffectColumnModifier: ColumnModifier = new ColumnModifier()
	@State _hoverEffectColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _hoverEffectCounterModifier: CounterModifier = new CounterModifier()
	@State _hoverEffectDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _hoverEffectDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _hoverEffectDividerModifier: DividerModifier = new DividerModifier()
	@State _hoverEffectEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _hoverEffectFlexModifier: FlexModifier = new FlexModifier()
	@State _hoverEffectFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _hoverEffectFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _hoverEffectGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _hoverEffectGridModifier: GridModifier = new GridModifier()
	@State _hoverEffectGridColModifier: GridColModifier = new GridColModifier()
	@State _hoverEffectGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _hoverEffectGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _hoverEffectHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _hoverEffectImageModifier: ImageModifier = new ImageModifier()
	@State _hoverEffectImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _hoverEffectLineModifier: LineModifier = new LineModifier()
	@State _hoverEffectListModifier: ListModifier = new ListModifier()
	@State _hoverEffectListItemModifier: ListItemModifier = new ListItemModifier()
	@State _hoverEffectListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _hoverEffectLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _hoverEffectMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _hoverEffectMenuModifier: MenuModifier = new MenuModifier()
	@State _hoverEffectMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _hoverEffectMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _hoverEffectNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _hoverEffectNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _hoverEffectPathModifier: PathModifier = new PathModifier()
	@State _hoverEffectPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _hoverEffectPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _hoverEffectProgressModifier: ProgressModifier = new ProgressModifier()
	@State _hoverEffectQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _hoverEffectRadioModifier: RadioModifier = new RadioModifier()
	@State _hoverEffectRatingModifier: RatingModifier = new RatingModifier()
	@State _hoverEffectRectModifier: RectModifier = new RectModifier()
	@State _hoverEffectRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _hoverEffectRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _hoverEffectRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _hoverEffectRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _hoverEffectRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _hoverEffectRowModifier: RowModifier = new RowModifier()
	@State _hoverEffectRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _hoverEffectScrollModifier: ScrollModifier = new ScrollModifier()
	@State _hoverEffectScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _hoverEffectSearchModifier: SearchModifier = new SearchModifier()
	@State _hoverEffectSelectModifier: SelectModifier = new SelectModifier()
	@State _hoverEffectShapeModifier: ShapeModifier = new ShapeModifier()
	@State _hoverEffectSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _hoverEffectSliderModifier: SliderModifier = new SliderModifier()
	@State _hoverEffectSpanModifier: SpanModifier = new SpanModifier()
	@State _hoverEffectStackModifier: StackModifier = new StackModifier()
	@State _hoverEffectSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _hoverEffectTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _hoverEffectTabsModifier: TabsModifier = new TabsModifier()
	@State _hoverEffectTextModifier: TextModifier = new TextModifier()
	@State _hoverEffectTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _hoverEffectTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _hoverEffectTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _hoverEffectTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _hoverEffectTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _hoverEffectTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _hoverEffectToggleModifier: ToggleModifier = new ToggleModifier()
	@State _hoverEffectVideoModifier: VideoModifier = new VideoModifier()
	@State _hoverEffectWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _hoverEffectWebModifier: WebModifier = new WebModifier()
	@State _hoverEffectWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _hoverEffectXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = '';
	@State componentKey: string = '';
	@State parentWidth: double = 0;
	@State parentHeight: double = 0;
	@State columns: int =  0
	@State gutter: int =  0
	@State parentBackGroundColor: Color =  Color.White;
	@State parentComponentKey: string = '';

	onPageShow() {
		console.info('hoverEffect translate page show called ')
		this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
		this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
		this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
		this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
		this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
		this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
		this.parentBackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor;
		this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey;
		this._hoverEffectButtonModifier.mHoverEffect = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.hoverEffect
    attrsManager.registerDataChange((value: SetValue) => {
			console.info('hoverEffect [registerDataChange] ' + JSON.stringify(value.hoverEffect))
			this._hoverEffectAlphabetIndexerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectBadgeModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectButtonModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectBlankModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectCalendarPickerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectCanvasModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectCheckboxModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectCheckboxGroupModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectCircleModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectColumnModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectColumnSplitModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectCounterModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectDataPanelModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectDatePickerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectDividerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectEllipseModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectFlexModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectFlowItemModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectFormLinkModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectGaugeModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectGridModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectGridColModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectGridItemModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectGridRowModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectHyperlinkModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectImageModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectImageAnimatorModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectLineModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectListModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectListItemModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectListItemGroupModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectLoadingProgressModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectMarqueeModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectMenuModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectMenuItemModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectMenuItemGroupModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectNavDestinationModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectNavigationModifier.mHoverEffect = value.hoverEffect
			
			
			
			this._hoverEffectPathModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectPolygonModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectPolylineModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectProgressModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectQRCodeModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRadioModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRatingModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRectModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRefreshModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRelativeContainerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRemoteWindowModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRichEditorModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRichTextModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRowModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectRowSplitModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectScrollModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectScrollBarModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectSearchModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectSelectModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectShapeModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectSideBarContainerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectSliderModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectSpanModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectStackModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectSwiperModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTabContentModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTabsModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTextModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTextAreaModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTextClockModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTextInputModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTextPickerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTextTimerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectTimePickerModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectToggleModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectVideoModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectWaterFlowModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectWebModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectWindowSceneModifier.mHoverEffect = value.hoverEffect
			this._hoverEffectXComponentModifier.mHoverEffect = value.hoverEffect
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					
					.attributeModifier(this._hoverEffectAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.key(this.componentKey)
					.attributeModifier(this._hoverEffectButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._hoverEffectBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._hoverEffectCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._hoverEffectCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._hoverEffectDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._hoverEffectDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._hoverEffectDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._hoverEffectGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._hoverEffectImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._hoverEffectImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._hoverEffectLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._hoverEffectMarqueeModifier)
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
					
					.attributeModifier(this._hoverEffectMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._hoverEffectProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._hoverEffectQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._hoverEffectRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._hoverEffectRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._hoverEffectScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._hoverEffectSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._hoverEffectSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._hoverEffectSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					
					.attributeModifier(this._hoverEffectTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._hoverEffectTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._hoverEffectTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._hoverEffectTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._hoverEffectTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._hoverEffectTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._hoverEffectTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._hoverEffectToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._hoverEffectWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._hoverEffectCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._hoverEffectEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._hoverEffectLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._hoverEffectPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._hoverEffectPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._hoverEffectPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._hoverEffectRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._hoverEffectShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._hoverEffectBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._hoverEffectColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._hoverEffectColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._hoverEffectCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._hoverEffectFlexModifier)
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
					
					.attributeModifier(this._hoverEffectGridRowModifier)
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
					
					.attributeModifier(this._hoverEffectGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._hoverEffectListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._hoverEffectListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._hoverEffectListItemGroupModifier)
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
					
					.attributeModifier(this._hoverEffectRefreshModifier)
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
					
					.attributeModifier(this._hoverEffectRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._hoverEffectRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._hoverEffectRowSplitModifier)
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
					
					.attributeModifier(this._hoverEffectScrollModifier)
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
					
					.attributeModifier(this._hoverEffectStackModifier)
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
					
					.attributeModifier(this._hoverEffectTabsModifier)
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
						
						.attributeModifier(this._hoverEffectTabContentModifier)
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
					
					.attributeModifier(this._hoverEffectWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._hoverEffectGridColModifier)
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
						
						.attributeModifier(this._hoverEffectGridItemModifier)
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
						
						.attributeModifier(this._hoverEffectFlowItemModifier)
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
							
							.attributeModifier(this._hoverEffectMenuItemModifier)
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
							
							.attributeModifier(this._hoverEffectMenuItemGroupModifier)
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
					
					.attributeModifier(this._hoverEffectCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._hoverEffectCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._hoverEffectFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._hoverEffectHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._hoverEffectSpanModifier)
				}
			}
		}
		.width(this.parentWidth)
		.height(this.parentHeight)
		.backgroundColor(this.parentBackGroundColor)
		.key(this.parentComponentKey)
	}
}
class ObjElement {
  message?: string;
}