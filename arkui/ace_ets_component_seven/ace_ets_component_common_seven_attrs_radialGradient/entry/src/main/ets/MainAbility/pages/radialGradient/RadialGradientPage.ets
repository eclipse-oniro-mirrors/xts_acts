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
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: GridAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: LineAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ListAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: NavigatorAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: NavRouterAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class PanelModifier implements AttributeModifier<PanelAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: PanelAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class PathModifier implements AttributeModifier<PathAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: PathAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RectAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RowAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: SpanAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: StackAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class StepperModifier implements AttributeModifier<StepperAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: StepperAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: StepperItemAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TextAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: WebAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mRadialGradient: { center: [number, number]; radius: number | string; colors: Array<[ResourceColor, number]>; repeating?: boolean } = {
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [['FFFF0000', 0.0], ['FF0000FF', 0.3], ['FFFFFF00', 0.5]]
		}

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.radialGradient(this.mRadialGradient)
	}
}

@Entry
@Component
struct RadialGradientPage {
	@State _radialGradientAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _radialGradientBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _radialGradientButtonModifier: ButtonModifier = new ButtonModifier()
	@State _radialGradientBlankModifier: BlankModifier = new BlankModifier()
	@State _radialGradientCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _radialGradientCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _radialGradientCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _radialGradientCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _radialGradientCircleModifier: CircleModifier = new CircleModifier()
	@State _radialGradientColumnModifier: ColumnModifier = new ColumnModifier()
	@State _radialGradientColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _radialGradientCounterModifier: CounterModifier = new CounterModifier()
	@State _radialGradientDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _radialGradientDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _radialGradientDividerModifier: DividerModifier = new DividerModifier()
	@State _radialGradientEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _radialGradientFlexModifier: FlexModifier = new FlexModifier()
	@State _radialGradientFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _radialGradientFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _radialGradientGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _radialGradientGridModifier: GridModifier = new GridModifier()
	@State _radialGradientGridColModifier: GridColModifier = new GridColModifier()
	@State _radialGradientGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _radialGradientGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _radialGradientHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _radialGradientImageModifier: ImageModifier = new ImageModifier()
	@State _radialGradientImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _radialGradientLineModifier: LineModifier = new LineModifier()
	@State _radialGradientListModifier: ListModifier = new ListModifier()
	@State _radialGradientListItemModifier: ListItemModifier = new ListItemModifier()
	@State _radialGradientListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _radialGradientLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _radialGradientMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _radialGradientMenuModifier: MenuModifier = new MenuModifier()
	@State _radialGradientMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _radialGradientMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _radialGradientNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _radialGradientNavigationModifier: NavigationModifier = new NavigationModifier()
	@State _radialGradientNavigatorModifier: NavigatorModifier = new NavigatorModifier()
	@State _radialGradientNavRouterModifier: NavRouterModifier = new NavRouterModifier()
	@State _radialGradientPanelModifier: PanelModifier = new PanelModifier()
	@State _radialGradientPathModifier: PathModifier = new PathModifier()
	@State _radialGradientPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _radialGradientPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _radialGradientProgressModifier: ProgressModifier = new ProgressModifier()
	@State _radialGradientQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _radialGradientRadioModifier: RadioModifier = new RadioModifier()
	@State _radialGradientRatingModifier: RatingModifier = new RatingModifier()
	@State _radialGradientRectModifier: RectModifier = new RectModifier()
	@State _radialGradientRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _radialGradientRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _radialGradientRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _radialGradientRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _radialGradientRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _radialGradientRowModifier: RowModifier = new RowModifier()
	@State _radialGradientRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _radialGradientScrollModifier: ScrollModifier = new ScrollModifier()
	@State _radialGradientScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _radialGradientSearchModifier: SearchModifier = new SearchModifier()
	@State _radialGradientSelectModifier: SelectModifier = new SelectModifier()
	@State _radialGradientShapeModifier: ShapeModifier = new ShapeModifier()
	@State _radialGradientSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _radialGradientSliderModifier: SliderModifier = new SliderModifier()
	@State _radialGradientSpanModifier: SpanModifier = new SpanModifier()
	@State _radialGradientStackModifier: StackModifier = new StackModifier()
	@State _radialGradientStepperModifier: StepperModifier = new StepperModifier()
	@State _radialGradientStepperItemModifier: StepperItemModifier = new StepperItemModifier()
	@State _radialGradientSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _radialGradientTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _radialGradientTabsModifier: TabsModifier = new TabsModifier()
	@State _radialGradientTextModifier: TextModifier = new TextModifier()
	@State _radialGradientTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _radialGradientTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _radialGradientTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _radialGradientTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _radialGradientTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _radialGradientTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _radialGradientToggleModifier: ToggleModifier = new ToggleModifier()
	@State _radialGradientVideoModifier: VideoModifier = new VideoModifier()
	@State _radialGradientWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _radialGradientWebModifier: WebModifier = new WebModifier()
	@State _radialGradientWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _radialGradientXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
	@State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
	@State parentWidth: number = router.getParams() ? router.getParams()['view']['parentWidth'] : 0
	@State parentHeight: number = router.getParams() ? router.getParams()['view']['parentHeight'] : 0
	@State columns: number = router.getParams() ? router.getParams()['view']['columns'] : 0
	@State gutter: number = router.getParams() ? router.getParams()['view']['gutter'] : 0
	@State parentBackGroundColor: string = router.getParams() ? router.getParams()['view']['parentBackGroundColor'] : '#FFFF00'
	@State parentComponentKey: string = router.getParams() ? router.getParams()['view']['parentComponentKey'] : ''

	onPageShow() {
		console.info('radialGradient translate page show called ')
		attrsManager.registerDataChange(value => {
			console.info('radialGradient [registerDataChange] ' + JSON.stringify(value.radialGradient))
			this._radialGradientAlphabetIndexerModifier.mRadialGradient = value.radialGradient
			this._radialGradientBadgeModifier.mRadialGradient = value.radialGradient
			this._radialGradientButtonModifier.mRadialGradient = value.radialGradient
			this._radialGradientBlankModifier.mRadialGradient = value.radialGradient
			this._radialGradientCalendarPickerModifier.mRadialGradient = value.radialGradient
			this._radialGradientCanvasModifier.mRadialGradient = value.radialGradient
			this._radialGradientCheckboxModifier.mRadialGradient = value.radialGradient
			this._radialGradientCheckboxGroupModifier.mRadialGradient = value.radialGradient
			this._radialGradientCircleModifier.mRadialGradient = value.radialGradient
			this._radialGradientColumnModifier.mRadialGradient = value.radialGradient
			this._radialGradientColumnSplitModifier.mRadialGradient = value.radialGradient
			this._radialGradientCounterModifier.mRadialGradient = value.radialGradient
			this._radialGradientDataPanelModifier.mRadialGradient = value.radialGradient
			this._radialGradientDatePickerModifier.mRadialGradient = value.radialGradient
			this._radialGradientDividerModifier.mRadialGradient = value.radialGradient
			this._radialGradientEllipseModifier.mRadialGradient = value.radialGradient
			this._radialGradientFlexModifier.mRadialGradient = value.radialGradient
			this._radialGradientFlowItemModifier.mRadialGradient = value.radialGradient
			this._radialGradientFormLinkModifier.mRadialGradient = value.radialGradient
			this._radialGradientGaugeModifier.mRadialGradient = value.radialGradient
			this._radialGradientGridModifier.mRadialGradient = value.radialGradient
			this._radialGradientGridColModifier.mRadialGradient = value.radialGradient
			this._radialGradientGridItemModifier.mRadialGradient = value.radialGradient
			this._radialGradientGridRowModifier.mRadialGradient = value.radialGradient
			this._radialGradientHyperlinkModifier.mRadialGradient = value.radialGradient
			this._radialGradientImageModifier.mRadialGradient = value.radialGradient
			this._radialGradientImageAnimatorModifier.mRadialGradient = value.radialGradient
			this._radialGradientLineModifier.mRadialGradient = value.radialGradient
			this._radialGradientListModifier.mRadialGradient = value.radialGradient
			this._radialGradientListItemModifier.mRadialGradient = value.radialGradient
			this._radialGradientListItemGroupModifier.mRadialGradient = value.radialGradient
			this._radialGradientLoadingProgressModifier.mRadialGradient = value.radialGradient
			this._radialGradientMarqueeModifier.mRadialGradient = value.radialGradient
			this._radialGradientMenuModifier.mRadialGradient = value.radialGradient
			this._radialGradientMenuItemModifier.mRadialGradient = value.radialGradient
			this._radialGradientMenuItemGroupModifier.mRadialGradient = value.radialGradient
			this._radialGradientNavDestinationModifier.mRadialGradient = value.radialGradient
			this._radialGradientNavigationModifier.mRadialGradient = value.radialGradient
			this._radialGradientNavigatorModifier.mRadialGradient = value.radialGradient
			this._radialGradientNavRouterModifier.mRadialGradient = value.radialGradient
			this._radialGradientPanelModifier.mRadialGradient = value.radialGradient
			this._radialGradientPathModifier.mRadialGradient = value.radialGradient
			this._radialGradientPolygonModifier.mRadialGradient = value.radialGradient
			this._radialGradientPolylineModifier.mRadialGradient = value.radialGradient
			this._radialGradientProgressModifier.mRadialGradient = value.radialGradient
			this._radialGradientQRCodeModifier.mRadialGradient = value.radialGradient
			this._radialGradientRadioModifier.mRadialGradient = value.radialGradient
			this._radialGradientRatingModifier.mRadialGradient = value.radialGradient
			this._radialGradientRectModifier.mRadialGradient = value.radialGradient
			this._radialGradientRefreshModifier.mRadialGradient = value.radialGradient
			this._radialGradientRelativeContainerModifier.mRadialGradient = value.radialGradient
			this._radialGradientRemoteWindowModifier.mRadialGradient = value.radialGradient
			this._radialGradientRichEditorModifier.mRadialGradient = value.radialGradient
			this._radialGradientRichTextModifier.mRadialGradient = value.radialGradient
			this._radialGradientRowModifier.mRadialGradient = value.radialGradient
			this._radialGradientRowSplitModifier.mRadialGradient = value.radialGradient
			this._radialGradientScrollModifier.mRadialGradient = value.radialGradient
			this._radialGradientScrollBarModifier.mRadialGradient = value.radialGradient
			this._radialGradientSearchModifier.mRadialGradient = value.radialGradient
			this._radialGradientSelectModifier.mRadialGradient = value.radialGradient
			this._radialGradientShapeModifier.mRadialGradient = value.radialGradient
			this._radialGradientSideBarContainerModifier.mRadialGradient = value.radialGradient
			this._radialGradientSliderModifier.mRadialGradient = value.radialGradient
			this._radialGradientSpanModifier.mRadialGradient = value.radialGradient
			this._radialGradientStackModifier.mRadialGradient = value.radialGradient
			this._radialGradientStepperModifier.mRadialGradient = value.radialGradient
			this._radialGradientStepperItemModifier.mRadialGradient = value.radialGradient
			this._radialGradientSwiperModifier.mRadialGradient = value.radialGradient
			this._radialGradientTabContentModifier.mRadialGradient = value.radialGradient
			this._radialGradientTabsModifier.mRadialGradient = value.radialGradient
			this._radialGradientTextModifier.mRadialGradient = value.radialGradient
			this._radialGradientTextAreaModifier.mRadialGradient = value.radialGradient
			this._radialGradientTextClockModifier.mRadialGradient = value.radialGradient
			this._radialGradientTextInputModifier.mRadialGradient = value.radialGradient
			this._radialGradientTextPickerModifier.mRadialGradient = value.radialGradient
			this._radialGradientTextTimerModifier.mRadialGradient = value.radialGradient
			this._radialGradientTimePickerModifier.mRadialGradient = value.radialGradient
			this._radialGradientToggleModifier.mRadialGradient = value.radialGradient
			this._radialGradientVideoModifier.mRadialGradient = value.radialGradient
			this._radialGradientWaterFlowModifier.mRadialGradient = value.radialGradient
			this._radialGradientWebModifier.mRadialGradient = value.radialGradient
			this._radialGradientWindowSceneModifier.mRadialGradient = value.radialGradient
			this._radialGradientXComponentModifier.mRadialGradient = value.radialGradient
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
					.attributeModifier(this._radialGradientAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.commonStyle()
					.attributeModifier(this._radialGradientButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._radialGradientBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					.commonStyle()
					.attributeModifier(this._radialGradientCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					.commonStyle()
					.attributeModifier(this._radialGradientCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					.commonStyle()
					.attributeModifier(this._radialGradientDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					.commonStyle()
					.attributeModifier(this._radialGradientDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					.commonStyle()
					.attributeModifier(this._radialGradientDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					.commonStyle()
					.attributeModifier(this._radialGradientGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					.commonStyle()
					.attributeModifier(this._radialGradientImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					.commonStyle()
					.attributeModifier(this._radialGradientImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					.commonStyle()
					.attributeModifier(this._radialGradientLoadingProgressModifier)
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
					.attributeModifier(this._radialGradientMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
				Navigation() {
				}
					.commonStyle()
					.attributeModifier(this._radialGradientNavigationModifier)
			}
			if (this.targetView == 'Menu') {
				Menu() {
					MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._radialGradientMenuModifier)
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
					.attributeModifier(this._radialGradientNavRouterModifier)
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					.commonStyle()
					.attributeModifier(this._radialGradientProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					.commonStyle()
					.attributeModifier(this._radialGradientQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					.commonStyle()
					.attributeModifier(this._radialGradientRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					.commonStyle()
					.attributeModifier(this._radialGradientRatingModifier)
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
					.attributeModifier(this._radialGradientScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					.commonStyle()
					.attributeModifier(this._radialGradientSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					.commonStyle()
					.attributeModifier(this._radialGradientSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					.commonStyle()
					.attributeModifier(this._radialGradientSliderModifier)
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
					.attributeModifier(this._radialGradientStepperModifier)
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
						.attributeModifier(this._radialGradientStepperItemModifier)
				}
					.backgroundColor(Color.Yellow)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Text') {
				Text('text1')
					.commonStyle()
					.attributeModifier(this._radialGradientTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					.commonStyle()
					.attributeModifier(this._radialGradientTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					.commonStyle()
					.attributeModifier(this._radialGradientTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					.commonStyle()
					.attributeModifier(this._radialGradientTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					.commonStyle()
					.attributeModifier(this._radialGradientTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._radialGradientTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					.commonStyle()
					.attributeModifier(this._radialGradientTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					.commonStyle()
					.attributeModifier(this._radialGradientToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebController() })
					.commonStyle()
					.attributeModifier(this._radialGradientWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					.commonStyle()
					.attributeModifier(this._radialGradientCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					.commonStyle()
					.attributeModifier(this._radialGradientEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._radialGradientLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					.commonStyle()
					.attributeModifier(this._radialGradientPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					.commonStyle()
					.attributeModifier(this._radialGradientPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					.commonStyle()
					.attributeModifier(this._radialGradientPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					.commonStyle()
					.attributeModifier(this._radialGradientRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					.commonStyle()
					.attributeModifier(this._radialGradientShapeModifier)
			}
			if (this.targetView == 'Badge') {
				Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } }) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					.commonStyle()
					.attributeModifier(this._radialGradientBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button()
						.width(100)
						.height(50)
				}
					.commonStyle()
					.attributeModifier(this._radialGradientColumnModifier)
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
					.attributeModifier(this._radialGradientColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					.commonStyle()
					.attributeModifier(this._radialGradientCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					.commonStyle()
					.attributeModifier(this._radialGradientFlexModifier)
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
					.attributeModifier(this._radialGradientGridRowModifier)
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
					.attributeModifier(this._radialGradientGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					.commonStyle()
					.attributeModifier(this._radialGradientListModifier)
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
						.attributeModifier(this._radialGradientListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						.commonStyle()
						.attributeModifier(this._radialGradientListItemGroupModifier)
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
					.attributeModifier(this._radialGradientNavigatorModifier)
			}
			if (this.targetView == 'Panel') {
				Panel(true) {
					Text('Text')
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._radialGradientPanelModifier)
			}
			if (this.targetView == 'Refresh') {
				Refresh({ refreshing: true }) {
					Text('123')
				}
					.commonStyle()
					.attributeModifier(this._radialGradientRefreshModifier)
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
					.attributeModifier(this._radialGradientRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					.commonStyle()
					.attributeModifier(this._radialGradientRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					.commonStyle()
					.attributeModifier(this._radialGradientRowSplitModifier)
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
					.attributeModifier(this._radialGradientScrollModifier)
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
					.attributeModifier(this._radialGradientSideBarContainerModifier)
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					.commonStyle()
					.attributeModifier(this._radialGradientStackModifier)
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
					.attributeModifier(this._radialGradientSwiperModifier)
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
					.attributeModifier(this._radialGradientTabsModifier)
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
						.attributeModifier(this._radialGradientTabContentModifier)
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
					.attributeModifier(this._radialGradientWaterFlowModifier)
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
						.attributeModifier(this._radialGradientGridColModifier)
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
						.attributeModifier(this._radialGradientGridItemModifier)
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
						.attributeModifier(this._radialGradientFlowItemModifier)
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
							.attributeModifier(this._radialGradientMenuItemModifier)
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
							.attributeModifier(this._radialGradientMenuItemGroupModifier)
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
					.attributeModifier(this._radialGradientCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					.commonStyle()
					.attributeModifier(this._radialGradientCanvasModifier)
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
					.attributeModifier(this._radialGradientFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					.commonStyle()
					.attributeModifier(this._radialGradientHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						.commonStyle()
						.attributeModifier(this._radialGradientSpanModifier)
				}
			}
		}
		.width(this.parentWidth)
		.height(this.parentHeight)
		.backgroundColor(this.parentBackGroundColor || '#FFFF00')
		.key(this.parentComponentKey)
	}
}
