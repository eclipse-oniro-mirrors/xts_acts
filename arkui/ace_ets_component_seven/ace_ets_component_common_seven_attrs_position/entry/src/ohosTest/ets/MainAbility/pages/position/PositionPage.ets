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

import { ListItemGroupView } from '../../view/position/ListItemGroupView';
import { FlowItemView } from '../../view/position/FlowItemView';
import { StepperItemView } from '../../view/position/StepperItemView';
import { StepperView } from '../../view/position/StepperView';
import { NavRouterView } from '../../view/position/NavRouterView';
import { WaterFlowView } from '../../view/position/WaterFlowView';
import { TabsView } from '../../view/position/TabsView';
import { AlphabetIndexerView } from '../../view/position/AlphabetIndexerView';
import { NavigationView } from '../../view/position/NavigationView';
import attrsManager from '../../common/AttrsManager';
import router from '@ohos.router'

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: NavigatorAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: NavRouterAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class StepperModifier implements AttributeModifier<StepperAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: StepperAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: StepperItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}

@Entry
@Component
struct PositionPage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling'
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B']
  //Use for Scroll,Grid,DataPanel.
  public valueArr: number[] = [5, 10, 10, 7, 9, 10, 10, 10, 10]
  @State _position: Position = { x: 1, y: 1 };
  @State _positionAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _positionBadgeMod: BadgeModifier = new BadgeModifier()
  //Blank Component is not found on build
  @State _positionBlankMod: BlankModifier = new BlankModifier()
  @State _positionButtonMod: ButtonModifier = new ButtonModifier()
  //CalendarPicker Component is not found on build
  @State _positionCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _positionCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _positionCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _positionColumnMod: ColumnModifier = new ColumnModifier()
  @State _positionColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _positionCounterMod: CounterModifier = new CounterModifier()
  @State _positionDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _positionDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _positionDividerMod: DividerModifier = new DividerModifier()
  //EffectComponent Component is not found on build
  @State _positionEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _positionFlexMod: FlexModifier = new FlexModifier()
  @State _positionFlowItemMod: FlowItemModifier = new FlowItemModifier()
  //FormComponent Component is not found on build
  @State _positionFormComponentMod: FormComponentModifier = new FormComponentModifier()
  //FormLink Component is not found on build
  @State _positionFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _positionGaugeMod: GaugeModifier = new GaugeModifier()
  @State _positionGridMod: GridModifier = new GridModifier()
  @State _positionGridColMod: GridColModifier = new GridColModifier()
  @State _positionGridItemMod: GridItemModifier = new GridItemModifier()
  @State _positionGridRowMod: GridRowModifier = new GridRowModifier()
  //Hyperlink Component is not found on build
  @State _positionHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _positionImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  //ImageSpan Component is not found on build
  @State _positionImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _positionImageMod: ImageModifier = new ImageModifier()
  @State _positionListMod: ListModifier = new ListModifier()
  @State _positionListItemMod: ListItemModifier = new ListItemModifier()
  //ListItemGroup Component is not found on build
  @State _positionListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _positionLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _positionMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _positionMenuMod: MenuModifier = new MenuModifier()
  @State _positionMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _positionMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  //NavDestination Component is not found on build
  @State _positionNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _positionNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _positionNavigationMod: NavigationModifier = new NavigationModifier()
  @State _positionNavigatorMod: NavigatorModifier = new NavigatorModifier()
  //PatternLock Component is not found on build
  @State _positionPatternLockMod: PatternLockModifier = new PatternLockModifier()
  //PluginComponent Component is not found on build
  @State _positionPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  //QRCodeAttribute Component is not found on build
  @State _positionQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _positionRadioMod: RadioModifier = new RadioModifier()
  @State _positionRatingMod: RatingModifier = new RatingModifier()
  @State _positionRefreshMod: RefreshModifier = new RefreshModifier()
  @State _positionRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  //RemoteWindow Component is not found on build
  @State _positionRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  //RichEditor Component is not found on build
  @State _positionRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _positionRichTextMod: RichTextModifier = new RichTextModifier()
  @State _positionRowMod: RowModifier = new RowModifier()
  @State _positionRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _positionScrollMod: ScrollModifier = new ScrollModifier()
  @State _positionScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _positionSearchMod: SearchModifier = new SearchModifier()
  @State _positionSelectMod: SelectModifier = new SelectModifier()
  @State _positionSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _positionSliderMod: SliderModifier = new SliderModifier()
  @State _positionStackMod: StackModifier = new StackModifier()
  @State _positionStepperMod: StepperModifier = new StepperModifier()
  @State _positionStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _positionSwiperMod: SwiperModifier = new SwiperModifier()
  @State _positionTabContentMod: TabContentModifier = new TabContentModifier()
  @State _positionTabsMod: TabsModifier = new TabsModifier()
  @State _positionTextMod: TextModifier = new TextModifier()
  @State _positionTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _positionTextClockMod: TextClockModifier = new TextClockModifier()
  @State _positionTextInputMod: TextInputModifier = new TextInputModifier()
  @State _positionTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _positionTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _positionTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _positionToggleMod: ToggleModifier = new ToggleModifier()
  //UIExtensionComponent Component is not found on build
  @State _positionUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _positionWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _positionWebMod: WebModifier = new WebModifier()
  //XComponent Component is not found on build
  @State _positionXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
  @State parentBackGroundColor: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentBackGroundColor'] : ''
  @State BackGroundColor: string = router.getParams() ? (router.getParams() as ESObject)['view']['BackGroundColor'] : ''
  @State parentComponentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentComponentKey'] : ''
  @State columns: number = router.getParams() ? (router.getParams() as ESObject)['view']['columns'] : 0
  @State gutter: number = router.getParams() ? (router.getParams() as ESObject)['view']['gutter'] : 0


  onPageShow() {
    console.info('[positionPage] page show called ')
    //Register data change call back.
    attrsManager.registerDataChange((value:ESObject) => {
      console.info('[registerDataChange] value' + value)
      this._positionAlphabetIndexerMod.mPosition = value
      this._positionBadgeMod.mPosition = value
      this._positionBlankMod.mPosition = value
      this._positionButtonMod.mPosition = value
      this._positionCalendarPickerMod.mPosition = value
      this._positionCheckboxMod.mPosition = value
      this._positionCheckboxGroupMod.mPosition = value
      this._positionColumnMod.mPosition = value
      this._positionColumnSplitMod.mPosition = value
      this._positionCounterMod.mPosition = value
      this._positionDataPanelMod.mPosition = value
      this._positionDatePickerMod.mPosition = value
      this._positionDividerMod.mPosition = value
      this._positionEffectComponentMod.mPosition = value
      this._positionFlexMod.mPosition = value
      this._positionFlowItemMod.mPosition = value
      this._positionFormComponentMod.mPosition = value
      this._positionFormLinkMod.mPosition = value
      this._positionGaugeMod.mPosition = value
      this._positionGridMod.mPosition = value
      this._positionGridColMod.mPosition = value
      this._positionGridItemMod.mPosition = value
      this._positionGridRowMod.mPosition = value
      this._positionHyperlinkMod.mPosition = value
      this._positionImageAnimatorMod.mPosition = value
      this._positionImageSpanMod.mPosition = value
      this._positionImageMod.mPosition = value
      this._positionListMod.mPosition = value
      this._positionListItemMod.mPosition = value
      this._positionListItemGroupMod.mPosition = value
      this._positionLoadingProgressMod.mPosition = value
      this._positionMarqueeMod.mPosition = value
      this._positionMenuMod.mPosition = value
      this._positionMenuItemMod.mPosition = value
      this._positionMenuItemGroupMod.mPosition = value
      this._positionNavDestinationMod.mPosition = value
      this._positionNavRouterMod.mPosition = value
      this._positionNavigationMod.mPosition = value
      this._positionNavigatorMod.mPosition = value
      this._positionPatternLockMod.mPosition = value
      this._positionPluginComponentMod.mPosition = value
      this._positionQRCodeMod.mPosition = value
      this._positionRadioMod.mPosition = value
      this._positionRatingMod.mPosition = value
      this._positionRefreshMod.mPosition = value
      this._positionRelativeContainerMod.mPosition = value
      this._positionRemoteWindowMod.mPosition = value
      this._positionRichEditorMod.mPosition = value
      this._positionRichTextMod.mPosition = value
      this._positionRowMod.mPosition = value
      this._positionRowSplitMod.mPosition = value
      this._positionScrollMod.mPosition = value
      this._positionScrollBarMod.mPosition = value
      this._positionSearchMod.mPosition = value
      this._positionSelectMod.mPosition = value
      this._positionSideBarContainerMod.mPosition = value
      this._positionSliderMod.mPosition = value
      this._positionStackMod.mPosition = value
      this._positionStepperMod.mPosition = value
      this._positionStepperItemMod.mPosition = value
      this._positionSwiperMod.mPosition = value
      this._positionTabContentMod.mPosition = value
      this._positionTabsMod.mPosition = value
      this._positionTextMod.mPosition = value
      this._positionTextAreaMod.mPosition = value
      this._positionTextClockMod.mPosition = value
      this._positionTextInputMod.mPosition = value
      this._positionTextPickerMod.mPosition = value
      this._positionTextTimerMod.mPosition = value
      this._positionTimePickerMod.mPosition = value
      this._positionToggleMod.mPosition = value
      this._positionUIExtensionComponentMod.mPosition = value
      this._positionWaterFlowMod.mPosition = value
      this._positionWebMod.mPosition = value
      this._positionXComponentMod.mPosition = value
    })
  }

  @Styles commonStyle(){
    // .position(this._position)
    .key(this.componentKey)
  }

  build() {
    GridContainer({ columns: this.columns, gutter: this.gutter, margin: 0 }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle().attributeModifier(this._positionButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle().attributeModifier(this._positionTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle().attributeModifier(this._positionAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._positionBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle().attributeModifier(this._positionCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle().attributeModifier(this._positionCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle().attributeModifier(this._positionDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle().attributeModifier(this._positionDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle().attributeModifier(this._positionDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle().attributeModifier(this._positionGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle().attributeModifier(this._positionImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle().attributeModifier(this._positionImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle().attributeModifier(this._positionLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle().attributeModifier(this._positionMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation() {
          }.commonStyle().attributeModifier(this._positionNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
          }.backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._positionMenuMod)
        } else if (this.targetView == 'NavRouter') {
          NavRouter() {
            Row() {
              Image($r('app.media.icon'))
            }
            NavDestination() {
              Text('NavDestination').fontSize(10)
            }
          }.commonStyle().attributeModifier(this._positionNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle().attributeModifier(this._positionQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle().attributeModifier(this._positionRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle().attributeModifier(this._positionRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle().attributeModifier(this._positionScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle().attributeModifier(this._positionSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle().attributeModifier(this._positionSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle().attributeModifier(this._positionSliderMod)
        } else if (this.targetView == 'Stepper') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
          }.commonStyle().attributeModifier(this._positionStepperMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle().attributeModifier(this._positionTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle().attributeModifier(this._positionTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle().attributeModifier(this._positionTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle().attributeModifier(this._positionTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle().attributeModifier(this._positionTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle().attributeModifier(this._positionToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebController() })
          .commonStyle().attributeModifier(this._positionWebMod)
        } else if (this.targetView == 'Circle') {
          Circle().commonStyle()
        } else if (this.targetView == 'Ellipse') {
          Ellipse().commonStyle()
        } else if (this.targetView == 'Line') {
          Line()
            .commonStyle()
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline().commonStyle()
        } else if (this.targetView == 'Polygon') {
          Polygon().commonStyle()
        } else if (this.targetView == 'Path') {
          Path().commonStyle()
        } else if (this.targetView == 'Rect') {
          Rect().commonStyle()
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }.commonStyle()
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          }) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.commonStyle().attributeModifier(this._positionBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle().attributeModifier(this._positionColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle().attributeModifier(this._positionColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle().attributeModifier(this._positionCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle().attributeModifier(this._positionFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color:Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.commonStyle().attributeModifier(this._positionGridRowMod)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], () => {
              ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                GridItem() {
                  Text(day).backgroundColor(Color.White)
                    .width('100%').height('100%').textAlign(TextAlign.Center)
                }
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .commonStyle().attributeModifier(this._positionGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle().height('100%').width('100%').attributeModifier(this._positionListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle().attributeModifier(this._positionListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle().attributeModifier(this._positionListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          Navigator() {
            Text('Go to back page').width('100%').height(20)
          }.commonStyle().backgroundColor(Color.Red).attributeModifier(this._positionNavigatorMod)
        } else if (this.targetView == 'Panel') {
          Panel(true) {
            Text('Text')
          }.backgroundColor(Color.Yellow).commonStyle()
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle().attributeModifier(this._positionRefreshMod)
        } else if (this.targetView == 'RelativeContainer') {
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
          }.commonStyle().attributeModifier(this._positionRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle().attributeModifier(this._positionRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle().attributeModifier(this._positionRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item:number) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, (item:number) => item.toString())
            }.width('100%')
          }.scrollBar(BarState.On).commonStyle().attributeModifier(this._positionScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item:number) => {
                Column({ space: 5 }) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.commonStyle().attributeModifier(this._positionSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle().attributeModifier(this._positionStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: string) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item:number) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle().attributeModifier(this._positionSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle().attributeModifier(this._positionTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle().attributeModifier(this._positionTabContentMod)
          }.width('100%').height('100%')
        } else if (this.targetView == 'WaterFlow') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
            }, (item:number) => item.toString())
          }.commonStyle().attributeModifier(this._positionWaterFlowMod)
        } else if (this.targetView == 'StepperItem') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
            .backgroundColor(Color.Red)
            .commonStyle().attributeModifier(this._positionStepperItemMod)
          }
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle().attributeModifier(this._positionGridColMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
              .commonStyle().attributeModifier(this._positionFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, (item:number) => item.toString())
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('4')
                .backgroundColor(0xFAEEE0)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }.rowStart(1).rowEnd(4)
            .commonStyle().attributeModifier(this._positionGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
                .commonStyle().attributeModifier(this._positionMenuItemMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'MenuItemGroup') {
          Row() {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              }
              .commonStyle().attributeModifier(this._positionMenuItemGroupMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
      }}
      .width('100%')
      .height(this.parentHeight)
      .backgroundColor(Color.Pink)
      .key(this.parentComponentKey)
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Yellow)
  }
}
