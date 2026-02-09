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
  TimePickerAttribute, VideoAttribute, WaterFlowAttribute, WebAttribute, WindowSceneAttribute, XComponentAttribute, AlignRuleOption,
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, BorderImageOption, GradientDirection, RepeatMode } from '@ohos.arkui.component'
import { State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mBorderImage: BorderImageOption = {
		source: {
			angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: BlankAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: CircleAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: CounterAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: DividerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: FlexAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: GridAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: GridColAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ImageAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: LineAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ListAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: MenuAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

// class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
// 	mBorderImage: BorderImageOption = {
// 		source: { angle: 13,
// 			direction: GradientDirection.Right,
// 			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
// 		},
// 		slice: 28,
// 		width: 66,
// 		repeat: RepeatMode.Stretch,
// 		outset: 4,
// 		fill: true
// 	}
//
//
// 	applyNormalAttribute(instance: NavigatorAttribute): void {
// 		instance.borderImage(this.mBorderImage)
// 	}
// }
//
// class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
// 	mBorderImage: BorderImageOption = {
// 		source: { angle: 13,
// 			direction: GradientDirection.Right,
// 			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
// 		},
// 		slice: 28,
// 		width: 66,
// 		repeat: RepeatMode.Stretch,
// 		outset: 4,
// 		fill: true
// 	}
//
//
// 	applyNormalAttribute(instance: NavRouterAttribute): void {
// 		instance.borderImage(this.mBorderImage)
// 	}
// }
//
// class PanelModifier implements AttributeModifier<PanelAttribute> {
// 	mBorderImage: BorderImageOption = {
// 		source: { angle: 13,
// 			direction: GradientDirection.Right,
// 			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
// 		},
// 		slice: 28,
// 		width: 66,
// 		repeat: RepeatMode.Stretch,
// 		outset: 4,
// 		fill: true
// 	}
//
//
// 	applyNormalAttribute(instance: PanelAttribute): void {
// 		instance.borderImage(this.mBorderImage)
// 	}
// }

class PathModifier implements AttributeModifier<PathAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: PathAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RadioAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RatingAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RectAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RowAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: SearchAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: SelectAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: SliderAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: SpanAttribute): void {
		// instance.borderImage(this.mBorderImage)
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: StackAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TabsAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TextAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: VideoAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: WebAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mBorderImage: BorderImageOption = {
		source: { angle: 13,
			direction: GradientDirection.Right,
			colors: [[0xAEE1E2, 0.1], [0xD3E0DD, 0.4], [0xFCD1D6, 0.4]]
		},
		slice: 28,
		width: 66,
		repeat: RepeatMode.Stretch,
		outset: 4,
		fill: true
	}


	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.borderImage(this.mBorderImage)
	}
}
function commonStyle(this: AlphabetIndexerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: BadgeAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string, borderImage: BorderImageOption){
	console.log('commonStyleButton borderImage = ' + JSON.stringify(borderImage))
	this.borderImage(borderImage)
	this.key(componentKey)
	return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: CounterAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: EllipseAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: FlexAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: CanvasAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: GaugeAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: GridAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: GridColAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: GridItemAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: GridRowAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ImageAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: LineAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ListItemAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: MenuAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: NavigationAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: PathAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: PolygonAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: PolylineAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ProgressAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RadioAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RatingAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RectAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RefreshAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RichTextAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RowAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ScrollAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: SearchAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: SelectAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ShapeAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: SliderAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: SpanAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: StackAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: SwiperAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ToggleAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TabsAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TextClockAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TextInputAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: VideoAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: WebAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: XComponentAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TextAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: DividerAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: CircleAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: BlankAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ColumnAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: ListAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

function commonStyle(this: TabContentAttribute, componentKey: string){
	this.key(componentKey)
	return this
}

@Entry
@Component
struct BorderImagePage {
	@StoragePropRef('_borderImageButton') borderImageButton: SetValue = {
		borderImage: {}
	}
	@State _borderImageAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _borderImageBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _borderImageButtonModifier: ButtonModifier = new ButtonModifier()
	@State _borderImageBlankModifier: BlankModifier = new BlankModifier()
	@State _borderImageCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _borderImageCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _borderImageCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _borderImageCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _borderImageCircleModifier: CircleModifier = new CircleModifier()
	@State _borderImageColumnModifier: ColumnModifier = new ColumnModifier()
	@State _borderImageColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _borderImageCounterModifier: CounterModifier = new CounterModifier()
	@State _borderImageDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _borderImageDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _borderImageDividerModifier: DividerModifier = new DividerModifier()
	@State _borderImageEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _borderImageFlexModifier: FlexModifier = new FlexModifier()
	@State _borderImageFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _borderImageFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _borderImageGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _borderImageGridModifier: GridModifier = new GridModifier()
	@State _borderImageGridColModifier: GridColModifier = new GridColModifier()
	@State _borderImageGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _borderImageGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _borderImageHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _borderImageImageModifier: ImageModifier = new ImageModifier()
	@State _borderImageImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _borderImageLineModifier: LineModifier = new LineModifier()
	@State _borderImageListModifier: ListModifier = new ListModifier()
	@State _borderImageListItemModifier: ListItemModifier = new ListItemModifier()
	@State _borderImageListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _borderImageLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _borderImageMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _borderImageMenuModifier: MenuModifier = new MenuModifier()
	@State _borderImageMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _borderImageMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _borderImageNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _borderImageNavigationModifier: NavigationModifier = new NavigationModifier()
	@State _borderImagePathModifier: PathModifier = new PathModifier()
	@State _borderImagePolygonModifier: PolygonModifier = new PolygonModifier()
	@State _borderImagePolylineModifier: PolylineModifier = new PolylineModifier()
	@State _borderImageProgressModifier: ProgressModifier = new ProgressModifier()
	@State _borderImageQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _borderImageRadioModifier: RadioModifier = new RadioModifier()
	@State _borderImageRatingModifier: RatingModifier = new RatingModifier()
	@State _borderImageRectModifier: RectModifier = new RectModifier()
	@State _borderImageRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _borderImageRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _borderImageRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _borderImageRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _borderImageRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _borderImageRowModifier: RowModifier = new RowModifier()
	@State _borderImageRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _borderImageScrollModifier: ScrollModifier = new ScrollModifier()
	@State _borderImageScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _borderImageSearchModifier: SearchModifier = new SearchModifier()
	@State _borderImageSelectModifier: SelectModifier = new SelectModifier()
	@State _borderImageShapeModifier: ShapeModifier = new ShapeModifier()
	@State _borderImageSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _borderImageSliderModifier: SliderModifier = new SliderModifier()
	@State _borderImageSpanModifier: SpanModifier = new SpanModifier()
	@State _borderImageStackModifier: StackModifier = new StackModifier()
	@State _borderImageSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _borderImageTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _borderImageTabsModifier: TabsModifier = new TabsModifier()
	@State _borderImageTextModifier: TextModifier = new TextModifier()
	@State _borderImageTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _borderImageTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _borderImageTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _borderImageTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _borderImageTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _borderImageTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _borderImageToggleModifier: ToggleModifier = new ToggleModifier()
	@State _borderImageVideoModifier: VideoModifier = new VideoModifier()
	@State _borderImageWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _borderImageWebModifier: WebModifier = new WebModifier()
	@State _borderImageWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _borderImageXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = '';
	@State componentKey: string = '';
	@State parentWidth: number = 0;
	@State parentHeight: number = 0;
	@State columns: number = 0;
	@State gutter: number = 0;
	@State parentComponentKey: string = '';
	@State parentBackGroundColor: string = '';

	onPageShow() {
		console.info('borderImage translate page show called ')
		let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
		this.borderImageButton = routerParamOptions.view.testValue.setValue
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
    attrsManager.registerDataChange((value: SetValue) => {
			// console.info('borderImage [registerDataChange] ' + JSON.stringify(value.borderImage))
			this._borderImageAlphabetIndexerModifier.mBorderImage = value.borderImage!;
			this._borderImageBadgeModifier.mBorderImage = value.borderImage!;
			this._borderImageButtonModifier.mBorderImage = value.borderImage!;
			this._borderImageBlankModifier.mBorderImage = value.borderImage!;
			this._borderImageCalendarPickerModifier.mBorderImage = value.borderImage!;
			this._borderImageCanvasModifier.mBorderImage = value.borderImage!;
			this._borderImageCheckboxModifier.mBorderImage = value.borderImage!;
			this._borderImageCheckboxGroupModifier.mBorderImage = value.borderImage!;
			this._borderImageCircleModifier.mBorderImage = value.borderImage!;
			this._borderImageColumnModifier.mBorderImage = value.borderImage!;
			this._borderImageColumnSplitModifier.mBorderImage = value.borderImage!;
			this._borderImageCounterModifier.mBorderImage = value.borderImage!;
			this._borderImageDataPanelModifier.mBorderImage = value.borderImage!;
			this._borderImageDatePickerModifier.mBorderImage = value.borderImage!;
			this._borderImageDividerModifier.mBorderImage = value.borderImage!;
			this._borderImageEllipseModifier.mBorderImage = value.borderImage!;
			this._borderImageFlexModifier.mBorderImage = value.borderImage!;
			this._borderImageFlowItemModifier.mBorderImage = value.borderImage!;
			this._borderImageFormLinkModifier.mBorderImage = value.borderImage!;
			this._borderImageGaugeModifier.mBorderImage = value.borderImage!;
			this._borderImageGridModifier.mBorderImage = value.borderImage!;
			this._borderImageGridColModifier.mBorderImage = value.borderImage!;
			this._borderImageGridItemModifier.mBorderImage = value.borderImage!;
			this._borderImageGridRowModifier.mBorderImage = value.borderImage!;
			this._borderImageHyperlinkModifier.mBorderImage = value.borderImage!;
			this._borderImageImageModifier.mBorderImage = value.borderImage!;
			this._borderImageImageAnimatorModifier.mBorderImage = value.borderImage!;
			this._borderImageLineModifier.mBorderImage = value.borderImage!;
			this._borderImageListModifier.mBorderImage = value.borderImage!;
			this._borderImageListItemModifier.mBorderImage = value.borderImage!;
			this._borderImageListItemGroupModifier.mBorderImage = value.borderImage!;
			this._borderImageLoadingProgressModifier.mBorderImage = value.borderImage!;
			this._borderImageMarqueeModifier.mBorderImage = value.borderImage!;
			this._borderImageMenuModifier.mBorderImage = value.borderImage!;
			this._borderImageMenuItemModifier.mBorderImage = value.borderImage!;
			this._borderImageMenuItemGroupModifier.mBorderImage = value.borderImage!;
			this._borderImageNavDestinationModifier.mBorderImage = value.borderImage!;
			this._borderImageNavigationModifier.mBorderImage = value.borderImage!;
			this._borderImagePathModifier.mBorderImage = value.borderImage!;
			this._borderImagePolygonModifier.mBorderImage = value.borderImage!;
			this._borderImagePolylineModifier.mBorderImage = value.borderImage!;
			this._borderImageProgressModifier.mBorderImage = value.borderImage!;
			this._borderImageQRCodeModifier.mBorderImage = value.borderImage!;
			this._borderImageRadioModifier.mBorderImage = value.borderImage!;
			this._borderImageRatingModifier.mBorderImage = value.borderImage!;
			this._borderImageRectModifier.mBorderImage = value.borderImage!;
			this._borderImageRefreshModifier.mBorderImage = value.borderImage!;
			this._borderImageRelativeContainerModifier.mBorderImage = value.borderImage!;
			this._borderImageRemoteWindowModifier.mBorderImage = value.borderImage!;
			this._borderImageRichEditorModifier.mBorderImage = value.borderImage!;
			this._borderImageRichTextModifier.mBorderImage = value.borderImage!;
			this._borderImageRowModifier.mBorderImage = value.borderImage!;
			this._borderImageRowSplitModifier.mBorderImage = value.borderImage!;
			this._borderImageScrollModifier.mBorderImage = value.borderImage!;
			this._borderImageScrollBarModifier.mBorderImage = value.borderImage!;
			this._borderImageSearchModifier.mBorderImage = value.borderImage!;
			this._borderImageSelectModifier.mBorderImage = value.borderImage!;
			this._borderImageShapeModifier.mBorderImage = value.borderImage!;
			this._borderImageSideBarContainerModifier.mBorderImage = value.borderImage!;
			this._borderImageSliderModifier.mBorderImage = value.borderImage!;
			this._borderImageSpanModifier.mBorderImage = value.borderImage!;
			this._borderImageStackModifier.mBorderImage = value.borderImage!;
			this._borderImageSwiperModifier.mBorderImage = value.borderImage!;
			this._borderImageTabContentModifier.mBorderImage = value.borderImage!;
			this._borderImageTabsModifier.mBorderImage = value.borderImage!;
			this._borderImageTextModifier.mBorderImage = value.borderImage!;
			this._borderImageTextAreaModifier.mBorderImage = value.borderImage!;
			this._borderImageTextClockModifier.mBorderImage = value.borderImage!;
			this._borderImageTextInputModifier.mBorderImage = value.borderImage!;
			this._borderImageTextPickerModifier.mBorderImage = value.borderImage!;
			this._borderImageTextTimerModifier.mBorderImage = value.borderImage!;
			this._borderImageTimePickerModifier.mBorderImage = value.borderImage!;
			this._borderImageToggleModifier.mBorderImage = value.borderImage!;
			this._borderImageVideoModifier.mBorderImage = value.borderImage!;
			this._borderImageWaterFlowModifier.mBorderImage = value.borderImage!;
			this._borderImageWebModifier.mBorderImage = value.borderImage!;
			this._borderImageWindowSceneModifier.mBorderImage = value.borderImage!;
			this._borderImageXComponentModifier.mBorderImage = value.borderImage!;
		})
	}

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.commonStyleButton(this.componentKey, this.borderImageButton.borderImage!)
					// .attributeModifier(this._borderImageButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Int.MAX_VALUE,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageNavigationModifier)
			}
			if (this.targetView == 'Menu') {
				Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
				}
					.backgroundColor(Color.Yellow)
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				// NavRouter() {
				// 	Row() {
				// 		Image($r('app.media.icon'))
				// 	}
				//
				// 	NavDestination() {
				// 		Text('NavDestination')
				// 			.fontSize(10)
				// 	}
				// }
				// 	.commonStyle(this.componentKey)
				// 	.attributeModifier(this._borderImageNavRouterModifier)
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageRatingModifier)
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
					.attributeModifier(this._borderImageScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageSliderModifier)
			}
			if (this.targetView == 'Text') {
				Text('text1')
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebviewController() })
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImagePolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImagePolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImagePathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageColumnModifier)
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
					.attributeModifier(this._borderImageColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageFlexModifier)
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
					.attributeModifier(this._borderImageGridRowModifier)
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
					.attributeModifier(this._borderImageGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageListModifier)
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
						.attributeModifier(this._borderImageListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						.commonStyle(this.componentKey)
						.attributeModifier(this._borderImageListItemGroupModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Navigator') {
				// Navigator() {
				// 	Text('Go to back page')
				// 		.width('100%')
				// 		.height(20)
				// }
				// 	.backgroundColor(Color.Red)
				// 	.commonStyle(this.componentKey)
				// 	.attributeModifier(this._borderImageNavigatorModifier)
			}
			if (this.targetView == 'Panel') {
				// Panel(true) {
				// 	Text('Text')
				// }
				// 	.backgroundColor(Color.Yellow)
				// 	.commonStyle(this.componentKey)
				// 	.attributeModifier(this._borderImagePanelModifier)
			}
			if (this.targetView == 'Refresh') {
				Refresh({ refreshing: true }) {
					Text('123')
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageRefreshModifier)
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
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageRowSplitModifier)
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
					.attributeModifier(this._borderImageScrollModifier)
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
					.attributeModifier(this._borderImageSideBarContainerModifier)
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageStackModifier)
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
					.attributeModifier(this._borderImageSwiperModifier)
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
					.attributeModifier(this._borderImageTabsModifier)
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
						.attributeModifier(this._borderImageTabContentModifier)
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
					.attributeModifier(this._borderImageWaterFlowModifier)
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
						.attributeModifier(this._borderImageGridColModifier)
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
						.attributeModifier(this._borderImageGridItemModifier)
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
						.attributeModifier(this._borderImageFlowItemModifier)
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
							.attributeModifier(this._borderImageMenuItemModifier)
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
							.attributeModifier(this._borderImageMenuItemGroupModifier)
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
					.attributeModifier(this._borderImageCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageCanvasModifier)
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
					.attributeModifier(this._borderImageFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					.commonStyle(this.componentKey)
					.attributeModifier(this._borderImageHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						.commonStyle(this.componentKey)
						.attributeModifier(this._borderImageSpanModifier)
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