/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import attrsManager from '../../common/AttrsManager'
import router from '@ohos.router'

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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

class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: NavigatorAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: NavRouterAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class PanelModifier implements AttributeModifier<PanelAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: PanelAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class PathModifier implements AttributeModifier<PathAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: SpanAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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

class StepperModifier implements AttributeModifier<StepperAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: StepperAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
		center: [20, 30],
		start: 25,
		end: 35,
		rotation: 12,
		colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
		repeating: true
	}

	applyNormalAttribute(instance: StepperItemAttribute): void {
		instance.sweepGradient(this.mSweepGradient)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	mSweepGradient: { center: [number, number]; start?: number | string; end?: number | string; rotation?: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean; } = {
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
	@State _sweepGradientNavigatorModifier: NavigatorModifier = new NavigatorModifier()
	@State _sweepGradientNavRouterModifier: NavRouterModifier = new NavRouterModifier()
	@State _sweepGradientPanelModifier: PanelModifier = new PanelModifier()
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
	@State _sweepGradientStepperModifier: StepperModifier = new StepperModifier()
	@State _sweepGradientStepperItemModifier: StepperItemModifier = new StepperItemModifier()
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
	@State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
	@State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
	@State parentWidth: number = router.getParams() ? router.getParams()['view']['parentWidth'] : 0
	@State parentHeight: number = router.getParams() ? router.getParams()['view']['parentHeight'] : 0
	@State columns: number = router.getParams() ? router.getParams()['view']['columns'] : 0
	@State gutter: number = router.getParams() ? router.getParams()['view']['gutter'] : 0
	@State parentBackGroundColor: string = router.getParams() ? router.getParams()['view']['parentBackGroundColor'] : '#FFFF00'
	@State parentComponentKey: string = router.getParams() ? router.getParams()['view']['parentComponentKey'] : ''

	onPageShow() {
		console.info('sweepGradient translate page show called ')
		attrsManager.registerDataChange(value => {
			console.info('sweepGradient [registerDataChange] ' + JSON.stringify(value.sweepGradient))
			this._sweepGradientAlphabetIndexerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientBadgeModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientButtonModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientBlankModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientCalendarPickerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientCanvasModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientCheckboxModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientCheckboxGroupModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientCircleModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientColumnModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientColumnSplitModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientCounterModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientDataPanelModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientDatePickerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientDividerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientEllipseModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientFlexModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientFlowItemModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientFormLinkModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientGaugeModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientGridModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientGridColModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientGridItemModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientGridRowModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientHyperlinkModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientImageModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientImageAnimatorModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientLineModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientListModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientListItemModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientListItemGroupModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientLoadingProgressModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientMarqueeModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientMenuModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientMenuItemModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientMenuItemGroupModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientNavDestinationModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientNavigationModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientNavigatorModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientNavRouterModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientPanelModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientPathModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientPolygonModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientPolylineModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientProgressModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientQRCodeModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRadioModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRatingModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRectModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRefreshModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRelativeContainerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRemoteWindowModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRichEditorModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRichTextModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRowModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientRowSplitModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientScrollModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientScrollBarModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientSearchModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientSelectModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientShapeModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientSideBarContainerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientSliderModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientSpanModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientStackModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientStepperModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientStepperItemModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientSwiperModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTabContentModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTabsModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTextModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTextAreaModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTextClockModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTextInputModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTextPickerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTextTimerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientTimePickerModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientToggleModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientVideoModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientWaterFlowModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientWebModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientWindowSceneModifier.mSweepGradient = value.sweepGradient
			this._sweepGradientXComponentModifier.mSweepGradient = value.sweepGradient
		})
	}

	@Styles
  commonStyle() {
		.key(this.componentKey)
  }

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					.commonStyle()
					.attributeModifier(this._sweepGradientAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.commonStyle()
					.attributeModifier(this._sweepGradientButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._sweepGradientBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					.commonStyle()
					.attributeModifier(this._sweepGradientCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					.commonStyle()
					.attributeModifier(this._sweepGradientCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					.commonStyle()
					.attributeModifier(this._sweepGradientDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					.commonStyle()
					.attributeModifier(this._sweepGradientDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					.commonStyle()
					.attributeModifier(this._sweepGradientDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					.commonStyle()
					.attributeModifier(this._sweepGradientGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					.commonStyle()
					.attributeModifier(this._sweepGradientImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					.commonStyle()
					.attributeModifier(this._sweepGradientImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					.commonStyle()
					.attributeModifier(this._sweepGradientLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					.commonStyle()
					.attributeModifier(this._sweepGradientMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
				Navigation() {
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientNavigationModifier)
			}
			if (this.targetView == 'Menu') {
				Menu() {
					MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._sweepGradientMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				NavRouter() {
					Row() {
						Image($r('app.media.icon'))
					}

					NavDestination() {
						Text('NavDestination')
							.fontSize(10)
					}
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientNavRouterModifier)
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					.commonStyle()
					.attributeModifier(this._sweepGradientProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					.commonStyle()
					.attributeModifier(this._sweepGradientQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					.commonStyle()
					.attributeModifier(this._sweepGradientRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					.commonStyle()
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
					.commonStyle()
					.attributeModifier(this._sweepGradientScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					.commonStyle()
					.attributeModifier(this._sweepGradientSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					.commonStyle()
					.attributeModifier(this._sweepGradientSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					.commonStyle()
					.attributeModifier(this._sweepGradientSliderModifier)
			}
			if (this.targetView == 'Stepper') {
				Stepper() {
					StepperItem() {
						Column() {
							Text('Page One')
						}
					}
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientStepperModifier)
			}
			if (this.targetView == 'StepperItem') {
				Stepper() {
					StepperItem() {
						Column() {
							Text('Page One')
						}
					}
						.backgroundColor(Color.Red)
						.commonStyle()
						.attributeModifier(this._sweepGradientStepperItemModifier)
				}
					.backgroundColor(Color.Yellow)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Text') {
				Text('text1')
					.commonStyle()
					.attributeModifier(this._sweepGradientTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					.commonStyle()
					.attributeModifier(this._sweepGradientTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					.commonStyle()
					.attributeModifier(this._sweepGradientTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					.commonStyle()
					.attributeModifier(this._sweepGradientTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					.commonStyle()
					.attributeModifier(this._sweepGradientTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._sweepGradientTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					.commonStyle()
					.attributeModifier(this._sweepGradientTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					.commonStyle()
					.attributeModifier(this._sweepGradientToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebController() })
					.commonStyle()
					.attributeModifier(this._sweepGradientWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					.commonStyle()
					.attributeModifier(this._sweepGradientCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					.commonStyle()
					.attributeModifier(this._sweepGradientEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._sweepGradientLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					.commonStyle()
					.attributeModifier(this._sweepGradientPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					.commonStyle()
					.attributeModifier(this._sweepGradientPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					.commonStyle()
					.attributeModifier(this._sweepGradientPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					.commonStyle()
					.attributeModifier(this._sweepGradientRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientShapeModifier)
			}
			if (this.targetView == 'Badge') {
				Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } }) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button()
						.width(100)
						.height(50)
				}
					.commonStyle()
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
					.commonStyle()
					.attributeModifier(this._sweepGradientColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientFlexModifier)
			}
			if (this.targetView == 'GridRow') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					ForEach(
						[Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown],
						(color) => {
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
					.commonStyle()
					.attributeModifier(this._sweepGradientGridRowModifier)
			}
			if (this.targetView == 'Grid') {
				Grid() {
					ForEach(['0', '1', '2', '3', '4'], () => {
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
					.commonStyle()
					.attributeModifier(this._sweepGradientGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					.commonStyle()
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
						.commonStyle()
						.attributeModifier(this._sweepGradientListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						.commonStyle()
						.attributeModifier(this._sweepGradientListItemGroupModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Navigator') {
				Navigator() {
					Text('Go to back page')
						.width('100%')
						.height(20)
				}
					.backgroundColor(Color.Red)
					.commonStyle()
					.attributeModifier(this._sweepGradientNavigatorModifier)
			}
			if (this.targetView == 'Panel') {
				Panel(true) {
					Text('Text')
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._sweepGradientPanelModifier)
			}
			if (this.targetView == 'Refresh') {
				Refresh({ refreshing: true }) {
					Text('123')
				}
					.commonStyle()
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
					.commonStyle()
					.attributeModifier(this._sweepGradientRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					.commonStyle()
					.attributeModifier(this._sweepGradientRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
						ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
						}, item => item)
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					.commonStyle()
					.attributeModifier(this._sweepGradientScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item) => {
							Column({ space: 5 }) {
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
					.commonStyle()
					.attributeModifier(this._sweepGradientSideBarContainerModifier)
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
					ForEach([1, 2, 3], (item: string) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
					}, item => item)
				}
					.indicator(true)
					.backgroundColor(Color.White)
					.commonStyle()
					.attributeModifier(this._sweepGradientSwiperModifier)
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
					.commonStyle()
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
						.commonStyle()
						.attributeModifier(this._sweepGradientTabContentModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'WaterFlow') {
				WaterFlow() {
					ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
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
					}, item => item)
				}
					.commonStyle()
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
						.commonStyle()
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
						.commonStyle()
						.attributeModifier(this._sweepGradientGridItemModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'FlowItem') {
				WaterFlow() {
					ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
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
						.commonStyle()
						.attributeModifier(this._sweepGradientFlowItemModifier)
					}, item => item)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'MenuItem') {
				Row() {
					Menu() {
						MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
							.commonStyle()
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
							MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
						}
							.commonStyle()
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
					.commonStyle()
					.attributeModifier(this._sweepGradientCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					.commonStyle()
					.attributeModifier(this._sweepGradientCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
					params: { 'message': 'testForRouter' }
				}) {
					Button("router event").width(120)
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					.commonStyle()
					.attributeModifier(this._sweepGradientHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						.commonStyle()
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
