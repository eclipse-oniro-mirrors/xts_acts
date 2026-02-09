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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, SweepGradientOptions } from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: GridAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: LineAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ListAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class PathModifier implements AttributeModifier<PathAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: PathAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RectAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RowAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: SpanAttribute): void {

	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: StackAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TextAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: WebAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mSweepGradient: SweepGradientOptions = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
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

function commonStyleButton(this: ButtonAttribute, componentKey: string,_sweepGradient: SweepGradientOptions | undefined) {
	this.sweepGradient(_sweepGradient)
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
struct SweepGradientPage {
	@State _sweepGradientAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _sweepGradientBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _sweepGradientButtonModifier: ButtonModifier = new ButtonModifier()
	@State _sweepGradientBlankModifier: BlankModifier = new BlankModifier()
	@State _sweepGradientCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _sweepGradientCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _sweepGradientCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _sweepGradientCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _sweepGradientCircleModifier: CircleModifier = new CircleModifier()
	@State _sweepGradientColumnModifier: ColumnModifier = new ColumnModifier()
	@State _sweepGradientColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _sweepGradientCounterModifier: CounterModifier = new CounterModifier()
	@State _sweepGradientDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _sweepGradientDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _sweepGradientDividerModifier: DividerModifier = new DividerModifier()
	@State _sweepGradientEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _sweepGradientFlexModifier: FlexModifier = new FlexModifier()
	@State _sweepGradientFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _sweepGradientFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _sweepGradientGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _sweepGradientGridModifier: GridModifier = new GridModifier()
	@State _sweepGradientGridColModifier: GridColModifier = new GridColModifier()
	@State _sweepGradientGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _sweepGradientGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _sweepGradientHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _sweepGradientImageModifier: ImageModifier = new ImageModifier()
	@State _sweepGradientImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _sweepGradientLineModifier: LineModifier = new LineModifier()
	@State _sweepGradientListModifier: ListModifier = new ListModifier()
	@State _sweepGradientListItemModifier: ListItemModifier = new ListItemModifier()
	@State _sweepGradientListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _sweepGradientLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _sweepGradientMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _sweepGradientMenuModifier: MenuModifier = new MenuModifier()
	@State _sweepGradientMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _sweepGradientMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _sweepGradientNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _sweepGradientNavigationModifier: NavigationModifier = new NavigationModifier()
	@State _sweepGradientPathModifier: PathModifier = new PathModifier()
	@State _sweepGradientPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _sweepGradientPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _sweepGradientProgressModifier: ProgressModifier = new ProgressModifier()
	@State _sweepGradientQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _sweepGradientRadioModifier: RadioModifier = new RadioModifier()
	@State _sweepGradientRatingModifier: RatingModifier = new RatingModifier()
	@State _sweepGradientRectModifier: RectModifier = new RectModifier()
	@State _sweepGradientRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _sweepGradientRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _sweepGradientRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _sweepGradientRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _sweepGradientRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _sweepGradientRowModifier: RowModifier = new RowModifier()
	@State _sweepGradientRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _sweepGradientScrollModifier: ScrollModifier = new ScrollModifier()
	@State _sweepGradientScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _sweepGradientSearchModifier: SearchModifier = new SearchModifier()
	@State _sweepGradientSelectModifier: SelectModifier = new SelectModifier()
	@State _sweepGradientShapeModifier: ShapeModifier = new ShapeModifier()
	@State _sweepGradientSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _sweepGradientSliderModifier: SliderModifier = new SliderModifier()
	@State _sweepGradientSpanModifier: SpanModifier = new SpanModifier()
	@State _sweepGradientStackModifier: StackModifier = new StackModifier()
	@State _sweepGradientSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _sweepGradientTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _sweepGradientTabsModifier: TabsModifier = new TabsModifier()
	@State _sweepGradientTextModifier: TextModifier = new TextModifier()
	@State _sweepGradientTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _sweepGradientTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _sweepGradientTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _sweepGradientTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _sweepGradientTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _sweepGradientTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _sweepGradientToggleModifier: ToggleModifier = new ToggleModifier()
	@State _sweepGradientVideoModifier: VideoModifier = new VideoModifier()
	@State _sweepGradientWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _sweepGradientWebModifier: WebModifier = new WebModifier()
	@State _sweepGradientWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _sweepGradientXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = '';
	@State componentKey: string = '';
	@State parentWidth: number = 0;
	@State parentHeight: number = 0;
	@State columns: number = 0
	@State gutter: number = 0
	@State parentBackGroundColor: string = '#FFFF00'
  @State parentComponentKey: string = '';
	@StoragePropRef('_sweepGradient') _sweepGradient: SetValue = {
		height: 0,sweepGradient: {
			center: [0, 0],
			start: 0,
			end: 0,
			colors: [['#FFFF0000', 0.0]],
			repeating: true
		}
	}

	onPageShow() {
		console.info('sweepGradient translate page show called ')
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
					.attributeModifier(this._sweepGradientAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.attributeModifier(this._sweepGradientButtonModifier)
					.commonStyleButton(this.componentKey,this._sweepGradient.sweepGradient)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientLoadingProgressModifier)
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
					.attributeModifier(this._sweepGradientMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
				}
					.commonStyle(this.componentKey)

			}
			if (this.targetView == 'Menu') {
				Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
				}
					.backgroundColor(Color.Yellow)
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientRatingModifier)
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
					.attributeModifier(this._sweepGradientScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientToggleModifier)
			}
			if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientColumnModifier)
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
					.attributeModifier(this._sweepGradientColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientFlexModifier)
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
					.attributeModifier(this._sweepGradientGridRowModifier)
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
					.attributeModifier(this._sweepGradientGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientListModifier)
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
						.attributeModifier(this._sweepGradientListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						.commonStyle(this.componentKey)
						.attributeModifier(this._sweepGradientListItemGroupModifier)
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
					.attributeModifier(this._sweepGradientRefreshModifier)
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
					.attributeModifier(this._sweepGradientRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: Int) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
            }, (item: int, index: Int) => item.toString())
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item: int, index: Int) => {
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
					// .attributeModifier(this._sweepGradientSideBarContainerModifier)
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
          ForEach([1, 2, 3], (item: int, index: Int) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
          }, (item: int, index: Int) => item.toString())
				}
					.indicator(true)
					.backgroundColor(Color.White)
					.commonStyle(this.componentKey)
					// .attributeModifier(this._sweepGradientSwiperModifier)
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
					.attributeModifier(this._sweepGradientTabsModifier)
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
						.attributeModifier(this._sweepGradientTabContentModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'WaterFlow') {
				WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: Int) => {
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
          }, (item: int, index: Int) => item.toString())
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientWaterFlowModifier)
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
						.attributeModifier(this._sweepGradientGridColModifier)
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
						.attributeModifier(this._sweepGradientGridItemModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'FlowItem') {
				WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: Int) => {
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
						.attributeModifier(this._sweepGradientFlowItemModifier)
          }, (item: int, index: Int) => item.toString())
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
							.attributeModifier(this._sweepGradientMenuItemModifier)
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
							.attributeModifier(this._sweepGradientMenuItemGroupModifier)
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
					.attributeModifier(this._sweepGradientCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientCanvasModifier)
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
					.attributeModifier(this._sweepGradientFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._sweepGradientHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						.commonStyle(this.componentKey)
						.attributeModifier(this._sweepGradientSpanModifier)
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