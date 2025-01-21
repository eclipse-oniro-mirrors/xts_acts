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
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: GridAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: LineAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ListAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: NavigatorAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: NavRouterAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class PanelModifier implements AttributeModifier<PanelAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: PanelAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class PathModifier implements AttributeModifier<PathAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: PathAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RectAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RowAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: SpanAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: StackAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class StepperModifier implements AttributeModifier<StepperAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: StepperAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: StepperItemAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TextAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: WebAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mValue: string = 'Test Title'
	options: { align?: Alignment; offset?: { x?: number; y?: number } } = { align: Alignment.Bottom, offset: { x: 1, y: 2 }}

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.overlay(this.mValue, this.options)
	}
}

@Entry
@Component
struct OverlayPage {
	@State _overlayAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _overlayBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _overlayButtonModifier: ButtonModifier = new ButtonModifier()
	@State _overlayBlankModifier: BlankModifier = new BlankModifier()
	@State _overlayCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _overlayCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _overlayCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _overlayCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _overlayCircleModifier: CircleModifier = new CircleModifier()
	@State _overlayColumnModifier: ColumnModifier = new ColumnModifier()
	@State _overlayColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _overlayCounterModifier: CounterModifier = new CounterModifier()
	@State _overlayDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _overlayDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _overlayDividerModifier: DividerModifier = new DividerModifier()
	@State _overlayEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _overlayFlexModifier: FlexModifier = new FlexModifier()
	@State _overlayFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _overlayFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _overlayGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _overlayGridModifier: GridModifier = new GridModifier()
	@State _overlayGridColModifier: GridColModifier = new GridColModifier()
	@State _overlayGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _overlayGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _overlayHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _overlayImageModifier: ImageModifier = new ImageModifier()
	@State _overlayImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _overlayLineModifier: LineModifier = new LineModifier()
	@State _overlayListModifier: ListModifier = new ListModifier()
	@State _overlayListItemModifier: ListItemModifier = new ListItemModifier()
	@State _overlayListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _overlayLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _overlayMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _overlayMenuModifier: MenuModifier = new MenuModifier()
	@State _overlayMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _overlayMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _overlayNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _overlayNavigationModifier: NavigationModifier = new NavigationModifier()
	@State _overlayNavigatorModifier: NavigatorModifier = new NavigatorModifier()
	@State _overlayNavRouterModifier: NavRouterModifier = new NavRouterModifier()
	@State _overlayPanelModifier: PanelModifier = new PanelModifier()
	@State _overlayPathModifier: PathModifier = new PathModifier()
	@State _overlayPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _overlayPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _overlayProgressModifier: ProgressModifier = new ProgressModifier()
	@State _overlayQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _overlayRadioModifier: RadioModifier = new RadioModifier()
	@State _overlayRatingModifier: RatingModifier = new RatingModifier()
	@State _overlayRectModifier: RectModifier = new RectModifier()
	@State _overlayRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _overlayRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _overlayRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _overlayRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _overlayRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _overlayRowModifier: RowModifier = new RowModifier()
	@State _overlayRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _overlayScrollModifier: ScrollModifier = new ScrollModifier()
	@State _overlayScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _overlaySearchModifier: SearchModifier = new SearchModifier()
	@State _overlaySelectModifier: SelectModifier = new SelectModifier()
	@State _overlayShapeModifier: ShapeModifier = new ShapeModifier()
	@State _overlaySideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _overlaySliderModifier: SliderModifier = new SliderModifier()
	@State _overlaySpanModifier: SpanModifier = new SpanModifier()
	@State _overlayStackModifier: StackModifier = new StackModifier()
	@State _overlayStepperModifier: StepperModifier = new StepperModifier()
	@State _overlayStepperItemModifier: StepperItemModifier = new StepperItemModifier()
	@State _overlaySwiperModifier: SwiperModifier = new SwiperModifier()
	@State _overlayTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _overlayTabsModifier: TabsModifier = new TabsModifier()
	@State _overlayTextModifier: TextModifier = new TextModifier()
	@State _overlayTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _overlayTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _overlayTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _overlayTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _overlayTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _overlayTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _overlayToggleModifier: ToggleModifier = new ToggleModifier()
	@State _overlayVideoModifier: VideoModifier = new VideoModifier()
	@State _overlayWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _overlayWebModifier: WebModifier = new WebModifier()
	@State _overlayWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _overlayXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
	@State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
	@State parentWidth: number = router.getParams() ? router.getParams()['view']['parentWidth'] : 0
	@State parentHeight: number = router.getParams() ? router.getParams()['view']['parentHeight'] : 0
	@State columns: number = router.getParams() ? router.getParams()['view']['columns'] : 0
	@State gutter: number = router.getParams() ? router.getParams()['view']['gutter'] : 0
	@State parentBackGroundColor: string = router.getParams() ? router.getParams()['view']['parentBackGroundColor'] : '#FFFF00'
	@State parentComponentKey: string = router.getParams() ? router.getParams()['view']['parentComponentKey'] : ''

	onPageShow() {
		console.info('overlay translate page show called ')
		attrsManager.registerDataChange(value => {
			console.info('overlay [registerDataChange] ' + JSON.stringify(value.overlay))
			this._overlayAlphabetIndexerModifier.mValue = value.overlay.value
		this._overlayAlphabetIndexerModifier.options = value.overlay.options

			this._overlayBadgeModifier.mValue = value.overlay.value
		this._overlayBadgeModifier.options = value.overlay.options

			this._overlayButtonModifier.mValue = value.overlay.value
		this._overlayButtonModifier.options = value.overlay.options

			this._overlayBlankModifier.mValue = value.overlay.value
		this._overlayBlankModifier.options = value.overlay.options

			this._overlayCalendarPickerModifier.mValue = value.overlay.value
		this._overlayCalendarPickerModifier.options = value.overlay.options

			this._overlayCanvasModifier.mValue = value.overlay.value
		this._overlayCanvasModifier.options = value.overlay.options

			this._overlayCheckboxModifier.mValue = value.overlay.value
		this._overlayCheckboxModifier.options = value.overlay.options

			this._overlayCheckboxGroupModifier.mValue = value.overlay.value
		this._overlayCheckboxGroupModifier.options = value.overlay.options

			this._overlayCircleModifier.mValue = value.overlay.value
		this._overlayCircleModifier.options = value.overlay.options

			this._overlayColumnModifier.mValue = value.overlay.value
		this._overlayColumnModifier.options = value.overlay.options

			this._overlayColumnSplitModifier.mValue = value.overlay.value
		this._overlayColumnSplitModifier.options = value.overlay.options

			this._overlayCounterModifier.mValue = value.overlay.value
		this._overlayCounterModifier.options = value.overlay.options

			this._overlayDataPanelModifier.mValue = value.overlay.value
		this._overlayDataPanelModifier.options = value.overlay.options

			this._overlayDatePickerModifier.mValue = value.overlay.value
		this._overlayDatePickerModifier.options = value.overlay.options

			this._overlayDividerModifier.mValue = value.overlay.value
		this._overlayDividerModifier.options = value.overlay.options

			this._overlayEllipseModifier.mValue = value.overlay.value
		this._overlayEllipseModifier.options = value.overlay.options

			this._overlayFlexModifier.mValue = value.overlay.value
		this._overlayFlexModifier.options = value.overlay.options

			this._overlayFlowItemModifier.mValue = value.overlay.value
		this._overlayFlowItemModifier.options = value.overlay.options

			this._overlayFormLinkModifier.mValue = value.overlay.value
		this._overlayFormLinkModifier.options = value.overlay.options

			this._overlayGaugeModifier.mValue = value.overlay.value
		this._overlayGaugeModifier.options = value.overlay.options

			this._overlayGridModifier.mValue = value.overlay.value
		this._overlayGridModifier.options = value.overlay.options

			this._overlayGridColModifier.mValue = value.overlay.value
		this._overlayGridColModifier.options = value.overlay.options

			this._overlayGridItemModifier.mValue = value.overlay.value
		this._overlayGridItemModifier.options = value.overlay.options

			this._overlayGridRowModifier.mValue = value.overlay.value
		this._overlayGridRowModifier.options = value.overlay.options

			this._overlayHyperlinkModifier.mValue = value.overlay.value
		this._overlayHyperlinkModifier.options = value.overlay.options

			this._overlayImageModifier.mValue = value.overlay.value
		this._overlayImageModifier.options = value.overlay.options

			this._overlayImageAnimatorModifier.mValue = value.overlay.value
		this._overlayImageAnimatorModifier.options = value.overlay.options

			this._overlayLineModifier.mValue = value.overlay.value
		this._overlayLineModifier.options = value.overlay.options

			this._overlayListModifier.mValue = value.overlay.value
		this._overlayListModifier.options = value.overlay.options

			this._overlayListItemModifier.mValue = value.overlay.value
		this._overlayListItemModifier.options = value.overlay.options

			this._overlayListItemGroupModifier.mValue = value.overlay.value
		this._overlayListItemGroupModifier.options = value.overlay.options

			this._overlayLoadingProgressModifier.mValue = value.overlay.value
		this._overlayLoadingProgressModifier.options = value.overlay.options

			this._overlayMarqueeModifier.mValue = value.overlay.value
		this._overlayMarqueeModifier.options = value.overlay.options

			this._overlayMenuModifier.mValue = value.overlay.value
		this._overlayMenuModifier.options = value.overlay.options

			this._overlayMenuItemModifier.mValue = value.overlay.value
		this._overlayMenuItemModifier.options = value.overlay.options

			this._overlayMenuItemGroupModifier.mValue = value.overlay.value
		this._overlayMenuItemGroupModifier.options = value.overlay.options

			this._overlayNavDestinationModifier.mValue = value.overlay.value
		this._overlayNavDestinationModifier.options = value.overlay.options

			this._overlayNavigationModifier.mValue = value.overlay.value
		this._overlayNavigationModifier.options = value.overlay.options

			this._overlayNavigatorModifier.mValue = value.overlay.value
		this._overlayNavigatorModifier.options = value.overlay.options

			this._overlayNavRouterModifier.mValue = value.overlay.value
		this._overlayNavRouterModifier.options = value.overlay.options

			this._overlayPanelModifier.mValue = value.overlay.value
		this._overlayPanelModifier.options = value.overlay.options

			this._overlayPathModifier.mValue = value.overlay.value
		this._overlayPathModifier.options = value.overlay.options

			this._overlayPolygonModifier.mValue = value.overlay.value
		this._overlayPolygonModifier.options = value.overlay.options

			this._overlayPolylineModifier.mValue = value.overlay.value
		this._overlayPolylineModifier.options = value.overlay.options

			this._overlayProgressModifier.mValue = value.overlay.value
		this._overlayProgressModifier.options = value.overlay.options

			this._overlayQRCodeModifier.mValue = value.overlay.value
		this._overlayQRCodeModifier.options = value.overlay.options

			this._overlayRadioModifier.mValue = value.overlay.value
		this._overlayRadioModifier.options = value.overlay.options

			this._overlayRatingModifier.mValue = value.overlay.value
		this._overlayRatingModifier.options = value.overlay.options

			this._overlayRectModifier.mValue = value.overlay.value
		this._overlayRectModifier.options = value.overlay.options

			this._overlayRefreshModifier.mValue = value.overlay.value
		this._overlayRefreshModifier.options = value.overlay.options

			this._overlayRelativeContainerModifier.mValue = value.overlay.value
		this._overlayRelativeContainerModifier.options = value.overlay.options

			this._overlayRemoteWindowModifier.mValue = value.overlay.value
		this._overlayRemoteWindowModifier.options = value.overlay.options

			this._overlayRichEditorModifier.mValue = value.overlay.value
		this._overlayRichEditorModifier.options = value.overlay.options

			this._overlayRichTextModifier.mValue = value.overlay.value
		this._overlayRichTextModifier.options = value.overlay.options

			this._overlayRowModifier.mValue = value.overlay.value
		this._overlayRowModifier.options = value.overlay.options

			this._overlayRowSplitModifier.mValue = value.overlay.value
		this._overlayRowSplitModifier.options = value.overlay.options

			this._overlayScrollModifier.mValue = value.overlay.value
		this._overlayScrollModifier.options = value.overlay.options

			this._overlayScrollBarModifier.mValue = value.overlay.value
		this._overlayScrollBarModifier.options = value.overlay.options

			this._overlaySearchModifier.mValue = value.overlay.value
		this._overlaySearchModifier.options = value.overlay.options

			this._overlaySelectModifier.mValue = value.overlay.value
		this._overlaySelectModifier.options = value.overlay.options

			this._overlayShapeModifier.mValue = value.overlay.value
		this._overlayShapeModifier.options = value.overlay.options

			this._overlaySideBarContainerModifier.mValue = value.overlay.value
		this._overlaySideBarContainerModifier.options = value.overlay.options

			this._overlaySliderModifier.mValue = value.overlay.value
		this._overlaySliderModifier.options = value.overlay.options

			this._overlaySpanModifier.mValue = value.overlay.value
		this._overlaySpanModifier.options = value.overlay.options

			this._overlayStackModifier.mValue = value.overlay.value
		this._overlayStackModifier.options = value.overlay.options

			this._overlayStepperModifier.mValue = value.overlay.value
		this._overlayStepperModifier.options = value.overlay.options

			this._overlayStepperItemModifier.mValue = value.overlay.value
		this._overlayStepperItemModifier.options = value.overlay.options

			this._overlaySwiperModifier.mValue = value.overlay.value
		this._overlaySwiperModifier.options = value.overlay.options

			this._overlayTabContentModifier.mValue = value.overlay.value
		this._overlayTabContentModifier.options = value.overlay.options

			this._overlayTabsModifier.mValue = value.overlay.value
		this._overlayTabsModifier.options = value.overlay.options

			this._overlayTextModifier.mValue = value.overlay.value
		this._overlayTextModifier.options = value.overlay.options

			this._overlayTextAreaModifier.mValue = value.overlay.value
		this._overlayTextAreaModifier.options = value.overlay.options

			this._overlayTextClockModifier.mValue = value.overlay.value
		this._overlayTextClockModifier.options = value.overlay.options

			this._overlayTextInputModifier.mValue = value.overlay.value
		this._overlayTextInputModifier.options = value.overlay.options

			this._overlayTextPickerModifier.mValue = value.overlay.value
		this._overlayTextPickerModifier.options = value.overlay.options

			this._overlayTextTimerModifier.mValue = value.overlay.value
		this._overlayTextTimerModifier.options = value.overlay.options

			this._overlayTimePickerModifier.mValue = value.overlay.value
		this._overlayTimePickerModifier.options = value.overlay.options

			this._overlayToggleModifier.mValue = value.overlay.value
		this._overlayToggleModifier.options = value.overlay.options

			this._overlayVideoModifier.mValue = value.overlay.value
		this._overlayVideoModifier.options = value.overlay.options

			this._overlayWaterFlowModifier.mValue = value.overlay.value
		this._overlayWaterFlowModifier.options = value.overlay.options

			this._overlayWebModifier.mValue = value.overlay.value
		this._overlayWebModifier.options = value.overlay.options

			this._overlayWindowSceneModifier.mValue = value.overlay.value
		this._overlayWindowSceneModifier.options = value.overlay.options

			this._overlayXComponentModifier.mValue = value.overlay.value
		this._overlayXComponentModifier.options = value.overlay.options

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
					.attributeModifier(this._overlayAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					.commonStyle()
					.attributeModifier(this._overlayButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._overlayBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					.commonStyle()
					.attributeModifier(this._overlayCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					.commonStyle()
					.attributeModifier(this._overlayCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					.commonStyle()
					.attributeModifier(this._overlayDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					.commonStyle()
					.attributeModifier(this._overlayDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					.commonStyle()
					.attributeModifier(this._overlayDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					.commonStyle()
					.attributeModifier(this._overlayGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					.commonStyle()
					.attributeModifier(this._overlayImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					.commonStyle()
					.attributeModifier(this._overlayImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					.commonStyle()
					.attributeModifier(this._overlayLoadingProgressModifier)
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
					.attributeModifier(this._overlayMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
				Navigation() {
				}
					.commonStyle()
					.attributeModifier(this._overlayNavigationModifier)
			}
			if (this.targetView == 'Menu') {
				Menu() {
					MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._overlayMenuModifier)
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
					.attributeModifier(this._overlayNavRouterModifier)
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					.commonStyle()
					.attributeModifier(this._overlayProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					.commonStyle()
					.attributeModifier(this._overlayQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					.commonStyle()
					.attributeModifier(this._overlayRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					.commonStyle()
					.attributeModifier(this._overlayRatingModifier)
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
					.attributeModifier(this._overlayScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					.commonStyle()
					.attributeModifier(this._overlaySearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					.commonStyle()
					.attributeModifier(this._overlaySelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					.commonStyle()
					.attributeModifier(this._overlaySliderModifier)
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
					.attributeModifier(this._overlayStepperModifier)
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
						.attributeModifier(this._overlayStepperItemModifier)
				}
					.backgroundColor(Color.Yellow)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Text') {
				Text('text1')
					.commonStyle()
					.attributeModifier(this._overlayTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					.commonStyle()
					.attributeModifier(this._overlayTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					.commonStyle()
					.attributeModifier(this._overlayTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					.commonStyle()
					.attributeModifier(this._overlayTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					.commonStyle()
					.attributeModifier(this._overlayTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._overlayTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					.commonStyle()
					.attributeModifier(this._overlayTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					.commonStyle()
					.attributeModifier(this._overlayToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebController() })
					.commonStyle()
					.attributeModifier(this._overlayWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					.commonStyle()
					.attributeModifier(this._overlayCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					.commonStyle()
					.attributeModifier(this._overlayEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					.commonStyle()
					.attributeModifier(this._overlayLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					.commonStyle()
					.attributeModifier(this._overlayPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					.commonStyle()
					.attributeModifier(this._overlayPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					.commonStyle()
					.attributeModifier(this._overlayPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					.commonStyle()
					.attributeModifier(this._overlayRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					.commonStyle()
					.attributeModifier(this._overlayShapeModifier)
			}
			if (this.targetView == 'Badge') {
				Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } }) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					.commonStyle()
					.attributeModifier(this._overlayBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button()
						.width(100)
						.height(50)
				}
					.commonStyle()
					.attributeModifier(this._overlayColumnModifier)
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
					.attributeModifier(this._overlayColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					.commonStyle()
					.attributeModifier(this._overlayCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					.commonStyle()
					.attributeModifier(this._overlayFlexModifier)
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
					.attributeModifier(this._overlayGridRowModifier)
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
					.attributeModifier(this._overlayGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					.commonStyle()
					.attributeModifier(this._overlayListModifier)
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
						.attributeModifier(this._overlayListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						.commonStyle()
						.attributeModifier(this._overlayListItemGroupModifier)
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
					.attributeModifier(this._overlayNavigatorModifier)
			}
			if (this.targetView == 'Panel') {
				Panel(true) {
					Text('Text')
				}
					.backgroundColor(Color.Yellow)
					.commonStyle()
					.attributeModifier(this._overlayPanelModifier)
			}
			if (this.targetView == 'Refresh') {
				Refresh({ refreshing: true }) {
					Text('123')
				}
					.commonStyle()
					.attributeModifier(this._overlayRefreshModifier)
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
					.attributeModifier(this._overlayRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					.commonStyle()
					.attributeModifier(this._overlayRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					.commonStyle()
					.attributeModifier(this._overlayRowSplitModifier)
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
					.attributeModifier(this._overlayScrollModifier)
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
					.attributeModifier(this._overlaySideBarContainerModifier)
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					.commonStyle()
					.attributeModifier(this._overlayStackModifier)
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
					.attributeModifier(this._overlaySwiperModifier)
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
					.attributeModifier(this._overlayTabsModifier)
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
						.attributeModifier(this._overlayTabContentModifier)
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
					.attributeModifier(this._overlayWaterFlowModifier)
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
						.attributeModifier(this._overlayGridColModifier)
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
						.attributeModifier(this._overlayGridItemModifier)
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
						.attributeModifier(this._overlayFlowItemModifier)
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
							.attributeModifier(this._overlayMenuItemModifier)
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
							.attributeModifier(this._overlayMenuItemGroupModifier)
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
					.attributeModifier(this._overlayCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					.commonStyle()
					.attributeModifier(this._overlayCanvasModifier)
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
					.attributeModifier(this._overlayFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					.commonStyle()
					.attributeModifier(this._overlayHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						.commonStyle()
						.attributeModifier(this._overlaySpanModifier)
				}
			}
		}
		.width(this.parentWidth)
		.height(this.parentHeight)
		.backgroundColor(this.parentBackGroundColor || '#FFFF00')
		.key(this.parentComponentKey)
	}
}