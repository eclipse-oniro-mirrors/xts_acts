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
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.border(this.border)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.border(this.border)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.border(this.border)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.border(this.border)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.border(this.border)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.border(this.border)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.border(this.border)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.border(this.border)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.border(this.border)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.border(this.border)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.border(this.border)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.border(this.border)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.border(this.border)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.border(this.border)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.border(this.border)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.border(this.border)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.border(this.border)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.border(this.border)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.border(this.border)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.border(this.border)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: GridAttribute): void {
		instance.border(this.border)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.border(this.border)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.border(this.border)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.border(this.border)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.border(this.border)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.border(this.border)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.border(this.border)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: LineAttribute): void {
		instance.border(this.border)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ListAttribute): void {
		instance.border(this.border)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.border(this.border)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.border(this.border)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.border(this.border)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.border(this.border)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.border(this.border)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.border(this.border)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.border(this.border)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.border(this.border)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.border(this.border)
	}
}

class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: NavigatorAttribute): void {
		instance.border(this.border)
	}
}

class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: NavRouterAttribute): void {
		instance.border(this.border)
	}
}

class PanelModifier implements AttributeModifier<PanelAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: PanelAttribute): void {
		instance.border(this.border)
	}
}

class PathModifier implements AttributeModifier<PathAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: PathAttribute): void {
		instance.border(this.border)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.border(this.border)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.border(this.border)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.border(this.border)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.border(this.border)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.border(this.border)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.border(this.border)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RectAttribute): void {
		instance.border(this.border)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.border(this.border)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.border(this.border)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.border(this.border)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.border(this.border)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.border(this.border)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RowAttribute): void {
		instance.border(this.border)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.border(this.border)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.border(this.border)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.border(this.border)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.border(this.border)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.border(this.border)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.border(this.border)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.border(this.border)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.border(this.border)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: SpanAttribute): void {
		instance.border(this.border)
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: StackAttribute): void {
		instance.border(this.border)
	}
}

class StepperModifier implements AttributeModifier<StepperAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: StepperAttribute): void {
		instance.border(this.border)
	}
}

class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: StepperItemAttribute): void {
		instance.border(this.border)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.border(this.border)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.border(this.border)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.border(this.border)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TextAttribute): void {
		instance.border(this.border)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.border(this.border)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.border(this.border)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.border(this.border)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.border(this.border)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.border(this.border)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.border(this.border)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.border(this.border)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.border(this.border)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.border(this.border)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: WebAttribute): void {
		instance.border(this.border)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.border(this.border)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	border: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
	}

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.border(this.border)
	}
}

@Entry
@Component
struct BorderPage {
	@State _borderAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _borderBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _borderButtonModifier: ButtonModifier = new ButtonModifier()
	@State _borderBlankModifier: BlankModifier = new BlankModifier()
	@State _borderCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _borderCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _borderCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _borderCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _borderCircleModifier: CircleModifier = new CircleModifier()
	@State _borderColumnModifier: ColumnModifier = new ColumnModifier()
	@State _borderColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _borderCounterModifier: CounterModifier = new CounterModifier()
	@State _borderDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _borderDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _borderDividerModifier: DividerModifier = new DividerModifier()
	@State _borderEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _borderFlexModifier: FlexModifier = new FlexModifier()
	@State _borderFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _borderFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _borderGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _borderGridModifier: GridModifier = new GridModifier()
	@State _borderGridColModifier: GridColModifier = new GridColModifier()
	@State _borderGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _borderGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _borderHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _borderImageModifier: ImageModifier = new ImageModifier()
	@State _borderImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _borderLineModifier: LineModifier = new LineModifier()
	@State _borderListModifier: ListModifier = new ListModifier()
	@State _borderListItemModifier: ListItemModifier = new ListItemModifier()
	@State _borderListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _borderLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _borderMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _borderMenuModifier: MenuModifier = new MenuModifier()
	@State _borderMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _borderMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _borderNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _borderNavigationModifier: NavigationModifier = new NavigationModifier()
	@State _borderNavigatorModifier: NavigatorModifier = new NavigatorModifier()
	@State _borderNavRouterModifier: NavRouterModifier = new NavRouterModifier()
	@State _borderPanelModifier: PanelModifier = new PanelModifier()
	@State _borderPathModifier: PathModifier = new PathModifier()
	@State _borderPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _borderPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _borderProgressModifier: ProgressModifier = new ProgressModifier()
	@State _borderQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _borderRadioModifier: RadioModifier = new RadioModifier()
	@State _borderRatingModifier: RatingModifier = new RatingModifier()
	@State _borderRectModifier: RectModifier = new RectModifier()
	@State _borderRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _borderRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _borderRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _borderRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _borderRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _borderRowModifier: RowModifier = new RowModifier()
	@State _borderRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _borderScrollModifier: ScrollModifier = new ScrollModifier()
	@State _borderScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _borderSearchModifier: SearchModifier = new SearchModifier()
	@State _borderSelectModifier: SelectModifier = new SelectModifier()
	@State _borderShapeModifier: ShapeModifier = new ShapeModifier()
	@State _borderSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _borderSliderModifier: SliderModifier = new SliderModifier()
	@State _borderSpanModifier: SpanModifier = new SpanModifier()
	@State _borderStackModifier: StackModifier = new StackModifier()
	@State _borderStepperModifier: StepperModifier = new StepperModifier()
	@State _borderStepperItemModifier: StepperItemModifier = new StepperItemModifier()
	@State _borderSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _borderTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _borderTabsModifier: TabsModifier = new TabsModifier()
	@State _borderTextModifier: TextModifier = new TextModifier()
	@State _borderTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _borderTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _borderTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _borderTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _borderTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _borderTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _borderToggleModifier: ToggleModifier = new ToggleModifier()
	@State _borderVideoModifier: VideoModifier = new VideoModifier()
	@State _borderWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _borderWebModifier: WebModifier = new WebModifier()
	@State _borderWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _borderXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
	@State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
	@State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
	@State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
	@State columns: number = router.getParams() ? (router.getParams() as ESObject)['view']['columns'] : 0
	@State gutter: number = router.getParams() ? (router.getParams() as ESObject)['view']['gutter'] : 0
	@State parentBackGroundColor: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentBackGroundColor'] : ''
	@State parentComponentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentComponentKey'] : ''

	onPageShow() {
		console.info('border translate page show called ')
		attrsManager.registerDataChange((value:ESObject) => {
			console.info('border [registerDataChange] ' + JSON.stringify(value.border))
			this._borderAlphabetIndexerModifier.border = value.border
			this._borderBadgeModifier.border = value.border
			this._borderButtonModifier.border = value.border
			this._borderBlankModifier.border = value.border
			this._borderCalendarPickerModifier.border = value.border
			this._borderCanvasModifier.border = value.border
			this._borderCheckboxModifier.border = value.border
			this._borderCheckboxGroupModifier.border = value.border
			this._borderCircleModifier.border = value.border
			this._borderColumnModifier.border = value.border
			this._borderColumnSplitModifier.border = value.border
			this._borderCounterModifier.border = value.border
			this._borderDataPanelModifier.border = value.border
			this._borderDatePickerModifier.border = value.border
			this._borderDividerModifier.border = value.border
			this._borderEllipseModifier.border = value.border
			this._borderFlexModifier.border = value.border
			this._borderFlowItemModifier.border = value.border
			this._borderFormLinkModifier.border = value.border
			this._borderGaugeModifier.border = value.border
			this._borderGridModifier.border = value.border
			this._borderGridColModifier.border = value.border
			this._borderGridItemModifier.border = value.border
			this._borderGridRowModifier.border = value.border
			this._borderHyperlinkModifier.border = value.border
			this._borderImageModifier.border = value.border
			this._borderImageAnimatorModifier.border = value.border
			this._borderLineModifier.border = value.border
			this._borderListModifier.border = value.border
			this._borderListItemModifier.border = value.border
			this._borderListItemGroupModifier.border = value.border
			this._borderLoadingProgressModifier.border = value.border
			this._borderMarqueeModifier.border = value.border
			this._borderMenuModifier.border = value.border
			this._borderMenuItemModifier.border = value.border
			this._borderMenuItemGroupModifier.border = value.border
			this._borderNavDestinationModifier.border = value.border
			this._borderNavigationModifier.border = value.border
			this._borderNavigatorModifier.border = value.border
			this._borderNavRouterModifier.border = value.border
			this._borderPanelModifier.border = value.border
			this._borderPathModifier.border = value.border
			this._borderPolygonModifier.border = value.border
			this._borderPolylineModifier.border = value.border
			this._borderProgressModifier.border = value.border
			this._borderQRCodeModifier.border = value.border
			this._borderRadioModifier.border = value.border
			this._borderRatingModifier.border = value.border
			this._borderRectModifier.border = value.border
			this._borderRefreshModifier.border = value.border
			this._borderRelativeContainerModifier.border = value.border
			this._borderRemoteWindowModifier.border = value.border
			this._borderRichEditorModifier.border = value.border
			this._borderRichTextModifier.border = value.border
			this._borderRowModifier.border = value.border
			this._borderRowSplitModifier.border = value.border
			this._borderScrollModifier.border = value.border
			this._borderScrollBarModifier.border = value.border
			this._borderSearchModifier.border = value.border
			this._borderSelectModifier.border = value.border
			this._borderShapeModifier.border = value.border
			this._borderSideBarContainerModifier.border = value.border
			this._borderSliderModifier.border = value.border
			this._borderSpanModifier.border = value.border
			this._borderStackModifier.border = value.border
			this._borderStepperModifier.border = value.border
			this._borderStepperItemModifier.border = value.border
			this._borderSwiperModifier.border = value.border
			this._borderTabContentModifier.border = value.border
			this._borderTabsModifier.border = value.border
			this._borderTextModifier.border = value.border
			this._borderTextAreaModifier.border = value.border
			this._borderTextClockModifier.border = value.border
			this._borderTextInputModifier.border = value.border
			this._borderTextPickerModifier.border = value.border
			this._borderTextTimerModifier.border = value.border
			this._borderTimePickerModifier.border = value.border
			this._borderToggleModifier.border = value.border
			this._borderVideoModifier.border = value.border
			this._borderWaterFlowModifier.border = value.border
			this._borderWebModifier.border = value.border
			this._borderWindowSceneModifier.border = value.border
			this._borderXComponentModifier.border = value.border
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
					.attributeModifier(this._borderAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.commonStyle()
					.attributeModifier(this._borderButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._borderBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					.commonStyle()
					.attributeModifier(this._borderCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					.commonStyle()
					.attributeModifier(this._borderCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					.commonStyle()
					.attributeModifier(this._borderDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					.commonStyle()
					.attributeModifier(this._borderDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					.commonStyle()
					.attributeModifier(this._borderDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					.commonStyle()
					.attributeModifier(this._borderGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					.commonStyle()
					.attributeModifier(this._borderImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					.commonStyle()
					.attributeModifier(this._borderImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					.commonStyle()
					.attributeModifier(this._borderLoadingProgressModifier)
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
					.attributeModifier(this._borderMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
				Navigation() {
				}
					.commonStyle()
					.attributeModifier(this._borderNavigationModifier)
			}
			if (this.targetView == 'Menu') {
				Menu() {
					MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._borderMenuModifier)
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
					.attributeModifier(this._borderNavRouterModifier)
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					.commonStyle()
					.attributeModifier(this._borderProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					.commonStyle()
					.attributeModifier(this._borderQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					.commonStyle()
					.attributeModifier(this._borderRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					.commonStyle()
					.attributeModifier(this._borderRatingModifier)
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
					.attributeModifier(this._borderScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					.commonStyle()
					.attributeModifier(this._borderSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					.commonStyle()
					.attributeModifier(this._borderSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					.commonStyle()
					.attributeModifier(this._borderSliderModifier)
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
					.attributeModifier(this._borderStepperModifier)
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
						.attributeModifier(this._borderStepperItemModifier)
				}
					.backgroundColor(Color.Yellow)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Text') {
				Text('text1')
					.commonStyle()
					.attributeModifier(this._borderTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					.commonStyle()
					.attributeModifier(this._borderTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					.commonStyle()
					.attributeModifier(this._borderTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					.commonStyle()
					.attributeModifier(this._borderTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					.commonStyle()
					.attributeModifier(this._borderTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._borderTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					.commonStyle()
					.attributeModifier(this._borderTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					.commonStyle()
					.attributeModifier(this._borderToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebController() })
					.commonStyle()
					.attributeModifier(this._borderWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					.commonStyle()
					.attributeModifier(this._borderCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					.commonStyle()
					.attributeModifier(this._borderEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._borderLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					.commonStyle()
					.attributeModifier(this._borderPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					.commonStyle()
					.attributeModifier(this._borderPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					.commonStyle()
					.attributeModifier(this._borderPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					.commonStyle()
					.attributeModifier(this._borderRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					.commonStyle()
					.attributeModifier(this._borderShapeModifier)
			}
			if (this.targetView == 'Badge') {
				Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } }) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					.commonStyle()
					.attributeModifier(this._borderBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button()
						.width(100)
						.height(50)
				}
					.commonStyle()
					.attributeModifier(this._borderColumnModifier)
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
					.attributeModifier(this._borderColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					.commonStyle()
					.attributeModifier(this._borderCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					.commonStyle()
					.attributeModifier(this._borderFlexModifier)
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
					.commonStyle()
					.attributeModifier(this._borderGridRowModifier)
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
					.attributeModifier(this._borderGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					.commonStyle()
					.attributeModifier(this._borderListModifier)
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
						.attributeModifier(this._borderListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						.commonStyle()
						.attributeModifier(this._borderListItemGroupModifier)
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
					.attributeModifier(this._borderNavigatorModifier)
			}
			if (this.targetView == 'Panel') {
				Panel(true) {
					Text('Text')
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._borderPanelModifier)
			}
			if (this.targetView == 'Refresh') {
				Refresh({ refreshing: true }) {
					Text('123')
				}
					.commonStyle()
					.attributeModifier(this._borderRefreshModifier)
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
					.attributeModifier(this._borderRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					.commonStyle()
					.attributeModifier(this._borderRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					.commonStyle()
					.attributeModifier(this._borderRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
						ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item:number) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
						}, (item:number) => item.toString())
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					.commonStyle()
					.attributeModifier(this._borderScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item:number) => {
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
					.attributeModifier(this._borderSideBarContainerModifier)
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					.commonStyle()
					.attributeModifier(this._borderStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
					ForEach([1, 2, 3], (item: string) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
					}, (item:number) => item.toString())
				}
					.indicator(true)
					.backgroundColor(Color.White)
					.commonStyle()
					.attributeModifier(this._borderSwiperModifier)
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
					.attributeModifier(this._borderTabsModifier)
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
						.attributeModifier(this._borderTabContentModifier)
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
					}, (item:number) => item.toString())
				}
					.commonStyle()
					.attributeModifier(this._borderWaterFlowModifier)
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
						.attributeModifier(this._borderGridColModifier)
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
						.attributeModifier(this._borderGridItemModifier)
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
						.attributeModifier(this._borderFlowItemModifier)
					}, (item:number) => item.toString())
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
							.attributeModifier(this._borderMenuItemModifier)
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
							.attributeModifier(this._borderMenuItemGroupModifier)
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
					.attributeModifier(this._borderCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					.commonStyle()
					.attributeModifier(this._borderCanvasModifier)
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
					.attributeModifier(this._borderFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					.commonStyle()
					.attributeModifier(this._borderHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						.commonStyle()
						.attributeModifier(this._borderSpanModifier)
				}
			}
		}
		.width(this.parentWidth)
		.height(this.parentHeight)
		.backgroundColor(this.parentBackGroundColor)
		.key(this.parentComponentKey)
	}
}