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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, BorderOptions, ResourceStr, AlignRuleOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: GridAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: LineAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ListAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

























class PathModifier implements AttributeModifier<PathAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: PathAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RectAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RowAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: SpanAttribute): void {
    	/* backgroundImage not supported */
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: StackAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TextAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: WebAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mBackgroundImage: ResourceStr = 'resources/media/icon.png'

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.backgroundImage(this.mBackgroundImage)
	}
}

@Entry
@Component
struct BackgroundImagePage {
	@State _backgroundImageAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _backgroundImageBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _backgroundImageButtonModifier: ButtonModifier = new ButtonModifier()
	@State _backgroundImageBlankModifier: BlankModifier = new BlankModifier()
	@State _backgroundImageCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _backgroundImageCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _backgroundImageCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _backgroundImageCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _backgroundImageCircleModifier: CircleModifier = new CircleModifier()
	@State _backgroundImageColumnModifier: ColumnModifier = new ColumnModifier()
	@State _backgroundImageColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _backgroundImageCounterModifier: CounterModifier = new CounterModifier()
	@State _backgroundImageDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _backgroundImageDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _backgroundImageDividerModifier: DividerModifier = new DividerModifier()
	@State _backgroundImageEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _backgroundImageFlexModifier: FlexModifier = new FlexModifier()
	@State _backgroundImageFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _backgroundImageFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _backgroundImageGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _backgroundImageGridModifier: GridModifier = new GridModifier()
	@State _backgroundImageGridColModifier: GridColModifier = new GridColModifier()
	@State _backgroundImageGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _backgroundImageGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _backgroundImageHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _backgroundImageImageModifier: ImageModifier = new ImageModifier()
	@State _backgroundImageImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _backgroundImageLineModifier: LineModifier = new LineModifier()
	@State _backgroundImageListModifier: ListModifier = new ListModifier()
	@State _backgroundImageListItemModifier: ListItemModifier = new ListItemModifier()
	@State _backgroundImageListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _backgroundImageLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _backgroundImageMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _backgroundImageMenuModifier: MenuModifier = new MenuModifier()
	@State _backgroundImageMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _backgroundImageMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _backgroundImageNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _backgroundImageNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _backgroundImagePathModifier: PathModifier = new PathModifier()
	@State _backgroundImagePolygonModifier: PolygonModifier = new PolygonModifier()
	@State _backgroundImagePolylineModifier: PolylineModifier = new PolylineModifier()
	@State _backgroundImageProgressModifier: ProgressModifier = new ProgressModifier()
	@State _backgroundImageQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _backgroundImageRadioModifier: RadioModifier = new RadioModifier()
	@State _backgroundImageRatingModifier: RatingModifier = new RatingModifier()
	@State _backgroundImageRectModifier: RectModifier = new RectModifier()
	@State _backgroundImageRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _backgroundImageRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _backgroundImageRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _backgroundImageRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _backgroundImageRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _backgroundImageRowModifier: RowModifier = new RowModifier()
	@State _backgroundImageRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _backgroundImageScrollModifier: ScrollModifier = new ScrollModifier()
	@State _backgroundImageScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _backgroundImageSearchModifier: SearchModifier = new SearchModifier()
	@State _backgroundImageSelectModifier: SelectModifier = new SelectModifier()
	@State _backgroundImageShapeModifier: ShapeModifier = new ShapeModifier()
	@State _backgroundImageSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _backgroundImageSliderModifier: SliderModifier = new SliderModifier()
	@State _backgroundImageSpanModifier: SpanModifier = new SpanModifier()
	@State _backgroundImageStackModifier: StackModifier = new StackModifier()
	@State _backgroundImageSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _backgroundImageTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _backgroundImageTabsModifier: TabsModifier = new TabsModifier()
	@State _backgroundImageTextModifier: TextModifier = new TextModifier()
	@State _backgroundImageTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _backgroundImageTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _backgroundImageTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _backgroundImageTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _backgroundImageTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _backgroundImageTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _backgroundImageToggleModifier: ToggleModifier = new ToggleModifier()
	@State _backgroundImageVideoModifier: VideoModifier = new VideoModifier()
	@State _backgroundImageWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _backgroundImageWebModifier: WebModifier = new WebModifier()
	@State _backgroundImageWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _backgroundImageXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: double = 0
  @State parentHeight: double = 0
  @State columns: int = 0
  @State gutter: int = 0
	@State parentBackGroundColor: string = '#FFFF00'
  @State parentComponentKey: string = '';

	onPageShow() {
		console.info('backgroundImage translate page show called ')
		this.targetView = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
		this.componentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey as string;
		this.parentWidth = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
		this.parentHeight = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
		this.columns = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int)
		this.gutter = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int)
		this.parentBackGroundColor = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
		this.parentComponentKey = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey
		this._backgroundImageButtonModifier.mBackgroundImage = (this.getUIContext().getRouter().getParams() as RouterParams).view.testValue.setValue.backgroundImage
    attrsManager.registerDataChange((value: SetValue) => {
			console.info('backgroundImage [registerDataChange] ' + JSON.stringify(value.backgroundImage))
			this._backgroundImageAlphabetIndexerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageBadgeModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageButtonModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageBlankModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageCalendarPickerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageCanvasModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageCheckboxModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageCheckboxGroupModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageCircleModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageColumnModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageColumnSplitModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageCounterModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageDataPanelModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageDatePickerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageDividerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageEllipseModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageFlexModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageFlowItemModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageFormLinkModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageGaugeModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageGridModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageGridColModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageGridItemModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageGridRowModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageHyperlinkModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageImageModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageImageAnimatorModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageLineModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageListModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageListItemModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageListItemGroupModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageLoadingProgressModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageMarqueeModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageMenuModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageMenuItemModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageMenuItemGroupModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageNavDestinationModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageNavigationModifier.mBackgroundImage = value.backgroundImage
			
			
			
			this._backgroundImagePathModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImagePolygonModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImagePolylineModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageProgressModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageQRCodeModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRadioModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRatingModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRectModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRefreshModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRelativeContainerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRemoteWindowModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRichEditorModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRichTextModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRowModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageRowSplitModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageScrollModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageScrollBarModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageSearchModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageSelectModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageShapeModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageSideBarContainerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageSliderModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageSpanModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageStackModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageSwiperModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTabContentModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTabsModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTextModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTextAreaModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTextClockModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTextInputModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTextPickerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTextTimerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageTimePickerModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageToggleModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageVideoModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageWaterFlowModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageWebModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageWindowSceneModifier.mBackgroundImage = value.backgroundImage
			this._backgroundImageXComponentModifier.mBackgroundImage = value.backgroundImage
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					
					.attributeModifier(this._backgroundImageAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.width(100)
					.height(100)
					.key(this.componentKey)
					.attributeModifier(this._backgroundImageButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._backgroundImageBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._backgroundImageCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._backgroundImageCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._backgroundImageDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._backgroundImageDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._backgroundImageDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._backgroundImageGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._backgroundImageImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._backgroundImageImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._backgroundImageLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._backgroundImageMarqueeModifier)
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
					
					.attributeModifier(this._backgroundImageMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._backgroundImageProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._backgroundImageQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._backgroundImageRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._backgroundImageRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._backgroundImageScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._backgroundImageSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._backgroundImageSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._backgroundImageSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					
					.attributeModifier(this._backgroundImageTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._backgroundImageTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._backgroundImageTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._backgroundImageTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._backgroundImageTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._backgroundImageTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._backgroundImageTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._backgroundImageToggleModifier)
			}
			if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._backgroundImageWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._backgroundImageCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._backgroundImageEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._backgroundImageLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._backgroundImagePolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._backgroundImagePolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._backgroundImagePathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._backgroundImageRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._backgroundImageShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._backgroundImageBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._backgroundImageColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._backgroundImageColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._backgroundImageCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._backgroundImageFlexModifier)
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
					
					.attributeModifier(this._backgroundImageGridRowModifier)
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
					
					.attributeModifier(this._backgroundImageGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._backgroundImageListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._backgroundImageListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._backgroundImageListItemGroupModifier)
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
					
					.attributeModifier(this._backgroundImageRefreshModifier)
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
					
					.attributeModifier(this._backgroundImageRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._backgroundImageRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._backgroundImageRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
						ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item:int) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
						}, (item:int) => item.toString())
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					
					.attributeModifier(this._backgroundImageScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item:int) => {
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
					
					.attributeModifier(this._backgroundImageStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
					ForEach([1, 2, 3], (item: int) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
					}, (item:int) => item.toString())
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
					
					.attributeModifier(this._backgroundImageTabsModifier)
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
						
						.attributeModifier(this._backgroundImageTabContentModifier)
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
					}, (item:int) => item.toString())
				}
					
					.attributeModifier(this._backgroundImageWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._backgroundImageGridColModifier)
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
						
						.attributeModifier(this._backgroundImageGridItemModifier)
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
						
						.attributeModifier(this._backgroundImageFlowItemModifier)
					}, (item:int) => item.toString())
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'MenuItem') {
				Row() {
					Menu() {
						MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
							
							.attributeModifier(this._backgroundImageMenuItemModifier)
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
							
							.attributeModifier(this._backgroundImageMenuItemGroupModifier)
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
					
					.attributeModifier(this._backgroundImageCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._backgroundImageCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._backgroundImageFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._backgroundImageHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._backgroundImageSpanModifier)
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