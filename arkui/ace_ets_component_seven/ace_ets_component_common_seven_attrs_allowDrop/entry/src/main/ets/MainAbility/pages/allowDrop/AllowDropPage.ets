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
import udmfType from '@ohos.data.uniformTypeDescriptor';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: BlankAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: CounterAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: DividerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: FlexAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: FormComponentAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: GridAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: GridColAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ListAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: MenuAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: NavigatorAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: NavRouterAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RadioAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RatingAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RowAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: SearchAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: SelectAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: StackAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class StepperModifier implements AttributeModifier<StepperAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: StepperAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: StepperItemAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TabsAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TextAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: WebAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mAllowDrop: UniformDataType[] = this.mAllowDrop;
  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.allowDrop(this.mAllowDrop)
  }
}

@Entry
@Component
struct allowDropPage {
  @State _allowDropAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _allowDropBadgeMod: BadgeModifier = new BadgeModifier()
  @State _allowDropBlankMod: BlankModifier = new BlankModifier()
  @State _allowDropButttonMod: ButtonModifier = new ButtonModifier()
  @State _allowDropCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _allowDropCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _allowDropCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _allowDropColumnMod: ColumnModifier = new ColumnModifier()
  @State _allowDropColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _allowDropCounterMod: CounterModifier = new CounterModifier()
  @State _allowDropDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _allowDropDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _allowDropDividerMod: DividerModifier = new DividerModifier()
  @State _allowDropEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _allowDropFlexMod: FlexModifier = new FlexModifier()
  @State _allowDropFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _allowDropFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _allowDropFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _allowDropGaugeMod: GaugeModifier = new GaugeModifier()
  @State _allowDropGridMod: GridModifier = new GridModifier()
  @State _allowDropGridColMod: GridColModifier = new GridColModifier()
  @State _allowDropGridItemMod: GridItemModifier = new GridItemModifier()
  @State _allowDropGridRowMod: GridRowModifier = new GridRowModifier()
  @State _allowDropHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _allowDropImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _allowDropImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _allowDropImageMod: ImageModifier = new ImageModifier()
  @State _allowDropListMod: ListModifier = new ListModifier()
  @State _allowDropListItemMod: ListItemModifier = new ListItemModifier()
  @State _allowDropListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _allowDropLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _allowDropMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _allowDropMenuMod: MenuModifier = new MenuModifier()
  @State _allowDropMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _allowDropMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _allowDropNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _allowDropNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _allowDropNavigationMod: NavigationModifier = new NavigationModifier()
  @State _allowDropNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _allowDropPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _allowDropPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _allowDropQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _allowDropRadioMod: RadioModifier = new RadioModifier()
  @State _allowDropRatingMod: RatingModifier = new RatingModifier()
  @State _allowDropRefreshMod: RefreshModifier = new RefreshModifier()
  @State _allowDropRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _allowDropRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _allowDropRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _allowDropRichTextMod: RichTextModifier = new RichTextModifier()
  @State _allowDropRowMod: RowModifier = new RowModifier()
  @State _allowDropRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _allowDropScrollMod: ScrollModifier = new ScrollModifier()
  @State _allowDropScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _allowDropSearchMod: SearchModifier = new SearchModifier()
  @State _allowDropSelectMod: SelectModifier = new SelectModifier()
  @State _allowDropSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _allowDropSliderMod: SliderModifier = new SliderModifier()
  @State _allowDropStackMod: StackModifier = new StackModifier()
  @State _allowDropStepperMod: StepperModifier = new StepperModifier()
  @State _allowDropStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _allowDropSwiperMod: SwiperModifier = new SwiperModifier()
  @State _allowDropTabContentMod: TabContentModifier = new TabContentModifier()
  @State _allowDropTabsMod: TabsModifier = new TabsModifier()
  @State _allowDropTextMod: TextModifier = new TextModifier()
  @State _allowDropTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _allowDropTextClockMod: TextClockModifier = new TextClockModifier()
  @State _allowDropTextInputMod: TextInputModifier = new TextInputModifier()
  @State _allowDropTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _allowDropTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _allowDropTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _allowDropToggleMod: ToggleModifier = new ToggleModifier()
  @State _allowDropUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _allowDropWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _allowDropWebMod: WebModifier = new WebModifier()
  @State _allowDropXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? router.getParams()['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? router.getParams()['view']['parentHeight'] : 0
  @State columns: number = router.getParams() ? router.getParams()['view']['columns'] : 0
  @State gutter: number = router.getParams() ? router.getParams()['view']['gutter'] : 0
  @State parentComponentKey: string = router.getParams() ? router.getParams()['view']['parentComponentKey'] : ''

  onPageShow() {
    console.info('22222 translate page show called ')
    attrsManager.registerDataChange(value => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.allowDrop))
      this._allowDropAlphabetIndexerMod.mAllowDrop =  value.allowDrop
      this._allowDropBadgeMod.mAllowDrop =  value.allowDrop
      this._allowDropBlankMod.mAllowDrop =  value.allowDrop
      this._allowDropButttonMod.mAllowDrop =  value.allowDrop
      this._allowDropCalendarPickerMod.mAllowDrop =  value.allowDrop
      this._allowDropCheckboxMod.mAllowDrop =  value.allowDrop
      this._allowDropCheckboxGroupMod.mAllowDrop =  value.allowDrop
      this._allowDropColumnMod.mAllowDrop =  value.allowDrop
      this._allowDropColumnSplitMod.mAllowDrop =  value.allowDrop
      this._allowDropCounterMod.mAllowDrop =  value.allowDrop
      this._allowDropDataPanelMod.mAllowDrop =  value.allowDrop
      this._allowDropDatePickerMod.mAllowDrop =  value.allowDrop
      this._allowDropDividerMod.mAllowDrop =  value.allowDrop
      this._allowDropEffectComponentMod.mAllowDrop =  value.allowDrop
      this._allowDropFlexMod.mAllowDrop =  value.allowDrop
      this._allowDropFlowItemMod.mAllowDrop =  value.allowDrop
      this._allowDropFormComponentMod.mAllowDrop =  value.allowDrop
      this._allowDropFormLinkMod.mAllowDrop =  value.allowDrop
      this._allowDropGaugeMod.mAllowDrop =  value.allowDrop
      this._allowDropGridMod.mAllowDrop =  value.allowDrop
      this._allowDropGridColMod.mAllowDrop =  value.allowDrop
      this._allowDropGridItemMod.mAllowDrop =  value.allowDrop
      this._allowDropGridRowMod.mAllowDrop =  value.allowDrop
      this._allowDropHyperlinkMod.mAllowDrop =  value.allowDrop
      this._allowDropImageAnimatorMod.mAllowDrop =  value.allowDrop
      this._allowDropImageSpanMod.mAllowDrop =  value.allowDrop
      this._allowDropImageMod.mAllowDrop =  value.allowDrop
      this._allowDropListMod.mAllowDrop =  value.allowDrop
      this._allowDropListItemMod.mAllowDrop =  value.allowDrop
      this._allowDropListItemGroupMod.mAllowDrop =  value.allowDrop
      this._allowDropLoadingProgressMod.mAllowDrop =  value.allowDrop
      this._allowDropMarqueeMod.mAllowDrop =  value.allowDrop
      this._allowDropMenuMod.mAllowDrop =  value.allowDrop
      this._allowDropMenuItemMod.mAllowDrop =  value.allowDrop
      this._allowDropMenuItemGroupMod.mAllowDrop =  value.allowDrop
      this._allowDropNavDestinationMod.mAllowDrop =  value.allowDrop
      this._allowDropNavRouterMod.mAllowDrop =  value.allowDrop
      this._allowDropNavigationMod.mAllowDrop =  value.allowDrop
      this._allowDropNavigatorMod.mAllowDrop =  value.allowDrop
      this._allowDropPatternLockMod.mAllowDrop =  value.allowDrop
      this._allowDropPluginComponentMod.mAllowDrop =  value.allowDrop
      this._allowDropQRCodeMod.mAllowDrop =  value.allowDrop
      this._allowDropRadioMod.mAllowDrop =  value.allowDrop
      this._allowDropRatingMod.mAllowDrop =  value.allowDrop
      this._allowDropRefreshMod.mAllowDrop =  value.allowDrop
      this._allowDropRelativeContainerMod.mAllowDrop =  value.allowDrop
      this._allowDropRemoteWindowMod.mAllowDrop =  value.allowDrop
      this._allowDropRichEditorMod.mAllowDrop =  value.allowDrop
      this._allowDropRichTextMod.mAllowDrop =  value.allowDrop
      this._allowDropRowMod.mAllowDrop =  value.allowDrop
      this._allowDropRowSplitMod.mAllowDrop =  value.allowDrop
      this._allowDropScrollMod.mAllowDrop =  value.allowDrop
      this._allowDropScrollBarMod.mAllowDrop =  value.allowDrop
      this._allowDropSearchMod.mAllowDrop =  value.allowDrop
      this._allowDropSelectMod.mAllowDrop =  value.allowDrop
      this._allowDropSideBarContainerMod.mAllowDrop =  value.allowDrop
      this._allowDropSliderMod.mAllowDrop =  value.allowDrop
      this._allowDropStackMod.mAllowDrop =  value.allowDrop
      this._allowDropStepperMod.mAllowDrop =  value.allowDrop
      this._allowDropStepperItemMod.mAllowDrop =  value.allowDrop
      this._allowDropSwiperMod.mAllowDrop =  value.allowDrop
      this._allowDropTabContentMod.mAllowDrop =  value.allowDrop
      this._allowDropTabsMod.mAllowDrop =  value.allowDrop
      this._allowDropTextMod.mAllowDrop =  value.allowDrop
      this._allowDropTextAreaMod.mAllowDrop =  value.allowDrop
      this._allowDropTextClockMod.mAllowDrop =  value.allowDrop
      this._allowDropTextInputMod.mAllowDrop =  value.allowDrop
      this._allowDropTextPickerMod.mAllowDrop =  value.allowDrop
      this._allowDropTextTimerMod.mAllowDrop =  value.allowDrop
      this._allowDropTimePickerMod.mAllowDrop =  value.allowDrop
      this._allowDropToggleMod.mAllowDrop =  value.allowDrop
      this._allowDropUIExtensionComponentMod.mAllowDrop =  value.allowDrop
      this._allowDropWaterFlowMod.mAllowDrop =  value.allowDrop
      this._allowDropWebMod.mAllowDrop =  value.allowDrop
      this._allowDropXComponentMod.mAllowDrop =  value.allowDrop
  
    })
  }

  @Styles commonStyle(){
    // .allowDrop(this.mAllowDrop)
    .height('100%')
    .gridSpan(1)
    .key(this.componentKey)
  }

  build() {
    GridContainer({ columns: this.columns, gutter: this.gutter, margin: 0 }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle().attributeModifier(this._allowDropButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle().attributeModifier(this._allowDropTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle().attributeModifier(this._allowDropAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._allowDropBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle().attributeModifier(this._allowDropCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle().attributeModifier(this._allowDropCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle().attributeModifier(this._allowDropDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle().attributeModifier(this._allowDropDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle().attributeModifier(this._allowDropDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle().attributeModifier(this._allowDropGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle().attributeModifier(this._allowDropImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle().attributeModifier(this._allowDropImageAnimatorMod)  
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle().attributeModifier(this._allowDropLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle().attributeModifier(this._allowDropMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation() {
          }.commonStyle().attributeModifier(this._allowDropNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
          }.backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._allowDropMenuMod)
        } else if (this.targetView == 'NavRouter') {
          NavRouter() {
            Row() {
              Image($r('app.media.icon'))
            }

            NavDestination() {
              Text('NavDestination').fontSize(10)
            }
          }.commonStyle().attributeModifier(this._allowDropNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle().attributeModifier(this._allowDropQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle().attributeModifier(this._allowDropRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle().attributeModifier(this._allowDropRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle().attributeModifier(this._allowDropScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle().attributeModifier(this._allowDropSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle().attributeModifier(this._allowDropSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle().attributeModifier(this._allowDropSliderMod)
        } else if (this.targetView == 'Stepper') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
          }.commonStyle().attributeModifier(this._allowDropStepperMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle().attributeModifier(this._allowDropTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle().attributeModifier(this._allowDropTextClockMod)
        // } else if (this.targetView == 'TextInput') {
        //   TextInput({ placeholder: 'input your word...' })
        //   .commonStyle.attributeModifier(this._allowDropTextInputMod)()
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle()
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle().attributeModifier(this._allowDropTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle().attributeModifier(this._allowDropTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle().attributeModifier(this._allowDropToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebController() }).commonStyle()
          .attributeModifier(this._allowDropWebMod)
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
          }.commonStyle().attributeModifier(this._allowDropBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle().attributeModifier(this._allowDropColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle().attributeModifier(this._allowDropColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle().attributeModifier(this._allowDropCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle().attributeModifier(this._allowDropFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.commonStyle().attributeModifier(this._allowDropGridRowMod)
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
          .commonStyle().attributeModifier(this._allowDropGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle().height('100%').width('100%').attributeModifier(this._allowDropListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle().attributeModifier(this._allowDropListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle().attributeModifier(this._allowDropListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          Navigator() {
            Text('Go to back page').width('100%').height(20)
          }.commonStyle().backgroundColor(Color.Red).attributeModifier(this._allowDropNavigatorMod)
        } else if (this.targetView == 'Panel') {
          Panel(true) {
            Text('Text')
          }.backgroundColor(Color.Yellow).commonStyle()
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle().attributeModifier(this._allowDropRefreshMod)
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
          }.commonStyle().attributeModifier(this._allowDropRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle().attributeModifier(this._allowDropRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle().attributeModifier(this._allowDropRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, item => item)
            }.width('100%')
          }.scrollBar(BarState.On).commonStyle().attributeModifier(this._allowDropScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item) => {
                Column({ space: 5 }) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.commonStyle().attributeModifier(this._allowDropSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle().attributeModifier(this._allowDropStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: string) => {
              Text('Swiper' + item).width('90%').height(50)
            }, item => item)
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle().attributeModifier(this._allowDropSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle().attributeModifier(this._allowDropTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle().attributeModifier(this._allowDropTabContentMod)
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
            }, item => item)
          }.commonStyle().attributeModifier(this._allowDropWaterFlowMod)
        } else if (this.targetView == 'StepperItem') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
            .backgroundColor(Color.Red)
            .commonStyle().attributeModifier(this._allowDropStepperItemMod)
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
            .commonStyle().attributeModifier(this._allowDropGridColMod)
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
              .commonStyle().attributeModifier(this._allowDropFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, item => item)
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
            .commonStyle().attributeModifier(this._allowDropGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
                .commonStyle().attributeModifier(this._allowDropMenuItemMod)
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
              .commonStyle().attributeModifier(this._allowDropMenuItemGroupMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        }
      }
      .width('100%')
      .height(this.parentHeight)
      .backgroundColor(Color.Pink)
      .key(this.parentComponentKey)
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Yellow)
  }
}